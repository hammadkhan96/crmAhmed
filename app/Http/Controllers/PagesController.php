<?php
namespace App\Http\Controllers;


use App\Models\Absence;
use App\Models\Status;
use App\Models\Client;
use App\Models\Lead;
use App\Models\Project;
use App\Models\SampleData;
use App\Models\Setting;
use App\Models\Task;
use App\Models\User;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use DB;
use Illuminate\Support\Facades\Auth;
use \Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;

class PagesController extends Controller
{
    /**
     * Dashobard view
     * @return mixed
     */
    /*public function dashboard()
    {   $notifications = auth()->user()->unreadNotifications;
        return view('pages.dashboard_new')->with(['notifications' => $notifications]);
    }*/
    public function dashboard()
    {
        $today = today();
        $startDate = today()->subdays(14);
        $period = CarbonPeriod::create($startDate, $today);
        $datasheet = [];

        // Iterate over the period
        foreach ($period as $date) {
            $datasheet[$date->format(carbonDate())] = [];
            $datasheet[$date->format(carbonDate())]["monthly"] = [];
            $datasheet[$date->format(carbonDate())]["monthly"]["tasks"] = 0;
            $datasheet[$date->format(carbonDate())]["monthly"]["leads"] = 0;
        }

        $tasks = Task::whereBetween('created_at', [$startDate, now()])->get();
        $leads = Lead::whereBetween('created_at', [$startDate, now()])->get();
        foreach ($tasks as $task) {
            $datasheet[$task->created_at->format(carbonDate())]["monthly"]["tasks"]++;
        }

        foreach ($leads as $lead) {
            $datasheet[$lead->created_at->format(carbonDate())]["monthly"]["leads"]++;
        }
        if (!auth()->user()->can('absence-view')) {
            $absences = [];
        } else {
            $absences = Absence::with('user')->groupBy('user_id')->where('start_at', '>=', today())->orWhere('end_at', '>', today())->get();
        }
       
        return view('pages.dashboard')
            ->withUsers(User::with(['department'])->get())
            ->withDatasheet($datasheet)
            ->withTotalTasks(Task::count())
            ->withTotalLeads(Lead::count())
            ->withTotalProjects(Project::count())
            ->withTotalClients(Client::count())
            ->withSettings(Setting::first())
            ->withAbsencesToday($absences);
    }

    public function followUps(Request $request){
        $date = Carbon::now();
        $date = $date->toDateString();
        $leads = Lead::join('statuses as s','s.id','=','leads.status_id')->select(['leads.id','leads.external_id','leads.description','leads.title','leads.deadline','s.title as status'])->where('user_assigned_id',Auth::id())->where('status_id','!=',10);
        return Datatables::of($leads)
            ->setRowAttr([
                'class' => function ($leads) use ($date){
                    $deadline = Carbon::parse($leads->deadline)->toDateString();
                    /*dd($deadline,$date);*/
                    if ($deadline == $date) {
                        return 'change';
                    }
                },
            ])
            ->editColumn('description', function ($leads) {
                return strip_tags($leads->description);
            })
            ->editColumn('deadline', function ($leads) {
                return Carbon::parse($leads->deadline)->format("d/m/Y");
            })
            ->make(true);
    }

    public function sampleDataView(){
        $statuses = Status::where('source_type','SampleData')->where('title','!=','All')->get();
    
        return view('sample_data.index',compact('statuses'));
       
    }
    public function sampleData(Request $request){
       
        //$sample_data =  DB::table('sample_data')->select(['id','company','project','contact_person','issue_date','status_id','sample','quantity','created_by','created_at']);
        $sample_data = sampleData::join('statuses as s','s.id','=','sample_data.status_id')
        ->select(['sample_data.id','sample_data.company','sample_data.project','sample_data.contact_person','sample_data.issue_date','sample_data.status_id','sample_data.sample','sample_data.quantity','sample_data.created_by','sample_data.created_at','s.title']);
        if ($status = $request->get('status')) {
            $sample_data->where('sample_data.status_id', $status);
        }

        if ($request->get('date_from') != null && $request->get('date_to') != null) {
            $from = $request->get('date_from');
            $to = $request->get('date_to');
            $sample_data->whereBetween('sample_data.created_at', [$from,$to]);
        }
        return Datatables::of($sample_data)
        ->editColumn('created_at',function($data){
            return Carbon::parse($data->created_at)->format('d-m-y H:i:s');
        })
            ->make(true);
    }
    public function sampleSubmit(Request $request){
        
        $names = [
            'company' => 'Company Name',
            'project' => 'Project',
            'issue_date' => 'Issue Date',
            'contact_person' => 'Contact Person',
            'status_id' => 'Status',
            'sample' => 'Sample',
            'quantity' => 'Quantity',

        ];

        $messages = [
            'required' => ':attribute is Required.',
            'integer' => ':attribute must be an Integer.',
            'numeric' => ':attribute must be a Number.',
            'string' => ':attribute must be a string.',

        ];

        $rules = [
            'company' => ['string', 'required'],
            'project' => ['string', 'required'],
            'issue_date' => ['required'],
            'status_id' => ['required'],
            'contact_person' => ['string', 'required'],
            'sample' => ['string', 'required'],
            'quantity' => ['required','numeric'],

        ];

        $validate = Validator::make($request->all(), $rules, $messages);

        $validate->setAttributeNames($names);

        if ($validate->fails()) {
            return redirect()->back()->with(['errors' => $validate->errors()]);
        }

        $sample = new SampleData();
        $sample->company = $request->company;
        $sample->project = $request->project;
        $sample->contact_person = $request->contact_person;
        $sample->issue_date = $request->issue_date;
        $sample->status_id = $request->status_id;
        $sample->sample = $request->sample;
        $sample->quantity = $request->quantity;
        $sample->created_by = Auth::id();
        $sample->save();

        Session()->flash('flash_message', __('Sample successfully added'));
        return redirect()->back();

    }

    /* public function dashboardNotifications(Request $request){

          $notifications = auth()->user()->unreadNotifications;

          return Datatables::of($notifications)
              ->addColumn('title', '<a href="{{ route("notifications.notification.read") }}">{{$notifications}}</a>')
              ->make('true');
          //return $notifications;
      }*/
}
