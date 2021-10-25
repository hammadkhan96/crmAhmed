<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Client;
use App\Models\Status;
use App\Models\Project;
use App\Models\Integration;
use App\Models\Document;
use App\Services\Storage\GetStorageProvider;
use Illuminate\Http\Request;
use Datatables;
use Carbon\Carbon;
use App\Http\Requests\Project\StoreProjectRequest;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Ramsey\Uuid\Uuid;
use App\Repositories\FilesystemIntegration\FilesystemIntegration;

class ProjectsController extends Controller
{
    const CREATED = 'created';
    const UPDATED_STATUS = 'updated_status';
    const UPDATED_TIME = 'updated_time';
    const UPDATED_ASSIGN = 'updated_assign';
    const UPDATED_DEADLINE = 'updated_deadline';

    public function indexData(Request $request)
    {

      $projects = Project::join('statuses as s','projects.status_id','=','s.id')
          ->join('clients as c','c.id','=','projects.client_id')
          ->join('users as u','u.id','=','projects.user_assigned_id')
          ->join('users as ui','ui.id','=','projects.user_created_id')
          ->leftjoin('statuses as si','si.id','=','projects.qoutation_status')
          ->leftjoin('statuses as is','is.id','=','projects.invoice_status')
          ->select(['projects.external_id', 'projects.title', 'projects.created_at as created_at', 'projects.deadline as deadline', 'u.name as user_assigned', 's.title as status', 'projects.client_id','projects.description','c.company_name as client','ui.name as created_by','projects.location as location','projects.qoutation_date as qoutation_date','projects.invoice_date as invoice_date','projects.invoice as pi','projects.qoutation as q','si.title as qoutation_status','is.title as invoice_status']
          );
        if ($request->get('date_from') != null && $request->get('date_to') != null) {
            $from = $request->get('date_from');
            $to = $request->get('date_to');
            $projects->whereBetween('projects.created_at', [$from,$to]);
        }

        return Datatables::of($projects)
            ->addColumn('titlelink', '<a href="{{ route("projects.show",[$external_id]) }}">{{$title}}</a>')
            ->editColumn('description', function ($projects) {
                return strip_tags($projects->description);
            })
            ->editColumn('created_at', function ($projects) {
                return Carbon::parse($projects->created_at)->format('y-m-d H:i:s');
            })
            ->editColumn('deadline', function ($projects) {
                return Carbon::parse($projects->deadline)->format('y-m-d');
            })
            ->editColumn('qoutation_date', function ($projects) {
                if($projects->qoutation_date == "0000-00-00"){
                    return '';
                }
                else{
                    return Carbon::parse($projects->qoutation_date)->format('y-m-d');
                }
               
            })
            ->editColumn('invoice_date', function ($projects) {
                if($projects->invoice_date == "0000-00-00"){
                    return '';
                }
                else{
                    return Carbon::parse($projects->invoice_date)->format('y-m-d');
                }
               
            })
           ->addColumn('qoutation',function($projects){
               if($projects->q != null){    
                $url=asset("storage/$projects->q"); 
                return '<a href="'.$url. '" class="btn btn-link">' . __('View') .'</a>';
               }
               else{
                   return '' ;
               }
              
           })
            ->addColumn('invoice',function($projects){
                if($projects->pi != null){    
                    $url=asset("storage/$projects->pi"); 
                    return '<a href="'.$url. '" class="btn btn-link">' . __('View') .'</a>';
                   }
                   else{
                       return '' ;
                   }
            })
            ->addColumn('view', function ($projects) {
                return '<a href="' . route("projects.show", $projects->external_id) . '" class="btn btn-link">' . __('View') .'</a>'
                . '<a data-toggle="modal" data-id="'. route('projects.destroy',$projects->external_id) . '" data-title="'. $projects->title . '" data-target="#deletion" class="btn btn-link">' . __('Delete') .'</a>';
            })
            ->rawColumns(['titlelink','qoutation','invoice','view', 'status_id'])
            ->make(true);
    }

    public function index()
    {   $invoice_status = Status::where('source_type','Invoice')->where('title','!=','All')->get();
      
        return view('projects.index',compact('invoice_status'))
        ->withStatuses(Status::typeOfProject()->get());
    }

    public function destroy(Project $project, Request $request)
    {
        $deleteTasks = $request->delete_tasks ? true : false;
        if($project->tasks && $deleteTasks) {
            $project->tasks()->delete();
        } else {
            $project->tasks()->update(['project_id' => null]);
        }
        
        $project->delete();
        
        Session()->flash('flash_message', __('Project deleted'));
        return redirect()->back();
    }


    /**
     * @param StoreTaskRequest $request
     * @return mixed
     */
    public function store(Request $request)
    {
        $names = [
            'description' => 'Description',
            'title' => 'Title',
            'user_assigned_id' => 'User',
            'deadline' => 'Deadline',
            'status_id' => 'Status',
            'location' => 'Location',
            'client_external_id' => 'Client',

        ];

        $messages = [
            'required' => ':attribute is Required.',
            'integer' => ':attribute must be an Integer.',
            'numeric' => ':attribute must be a Number.',
            'string' => ':attribute must be a string.',

        ];

        $rules = [
            'description' => ['string', 'required'],
            'title' => ['string', 'required'],
            'deadline' => ['required'],
            'location' => ['string'],
            'status_id' => ['required'],
            'user_assigned_id' => ['required','numeric'],
            'client_external_id' => ['required'],

        ];

        $validate = Validator::make($request->all(), $rules, $messages);

        $validate->setAttributeNames($names);

        if ($validate->fails()) {
            return redirect()->back()->with(['errors' => $validate->errors()]);
        }



        if ($request->client_external_id) {
            $client = Client::whereExternalId($request->client_external_id);
        }

        if(!$client) {
            Session()->flash('flash_message', __('Could not find client'));
            return redirect()->back();
        }

       $project = new Project();
       $project->title = $request->title;
       $project->description = $request->description;
       $project->user_assigned_id = $request->user_assigned_id;
       $project->deadline = Carbon::parse($request->deadline);
       $project->status_id =  $request->status_id;
       $project->user_created_id = auth()->id();
       $project->external_id = Uuid::uuid4()->toString();
       $project->client_id =  $client ? $client->id : null;
       $project->location =  $request->location;
       $project->qoutation_date =  $request->quotation_date;
       $project->invoice_date =  $request->invoice_date;
       $project->invoice_status =  $request->invoice_status;
       $project->qoutation_status =  $request->qoutation_status;


       if($request->hasFile('invoice')) {
           $image      = $request->file('invoice');
           $image_name = time() . '.' . $image->extension();
           Storage::disk('public')->putFileAs('invoice/',$image,$image_name);
           $project->invoice = 'invoice/'.$image_name;
       }
        if($request->hasFile('qoutation')) {
            $image      = $request->file('qoutation');
            $image_name = time() . '.' . $image->extension();
            Storage::disk('public')->putFileAs('qoutation/',$image,$image_name);
            $project->qoutation = 'qoutation/'.$image_name;
        }
        $project->save();


        $insertedExternalId = $project->external_id;

        Session()->flash('flash_message', __('Project successfully added'));
        event(new \App\Events\ProjectAction($project, self::CREATED));


        //Hack to make dropzone js work, as it only called with AJAX and not form submit
       // return response()->json(['project_external_id' => $project->external_id]);
        return redirect()->route('projects.index');
    }

    private function upload($image, $project)
    {
        if (!auth()->user()->can('task-upload-files')) {
            session()->flash('flash_message_warning', __('You do not have permission to upload images'));
            return redirect()->route('tasks.show', $project->external_id);
        }
        $file = $image;
        $filename = str_random(8) . '_' . $file->getClientOriginalName();
        $fileOrginal = $file->getClientOriginalName();

        $size = $file->getClientSize();
        $mbsize = $size / 1048576;
        $totaltsize = substr($mbsize, 0, 4);

        if ($totaltsize > 15) {
            Session::flash('flash_message', __('File Size cannot be bigger than 15MB'));
            return redirect()->back();
        }

        $folder = $project->external_id;
        $fileSystem = GetStorageProvider::getStorage();
        $fileData = $fileSystem->upload($folder, $filename, $file);

        Document::create([
            'external_id' => Uuid::uuid4()->toString(),
            'path' => $fileData['file_path'],
            'size' => $totaltsize,
            'original_filename' => $fileOrginal,
            'source_id' => $project->id,
            'source_type' => Project::class,
            'mime' => $file->getClientMimeType(),
            'integration_id' => isset($fileData['id']) ? $fileData['id'] : null,
            'integration_type' => get_class($fileSystem)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return mixed
     */
    public function create($client_external_id = null)
    {
        $client =  Client::whereExternalId($client_external_id);
        $invoice_status = Status::where('source_type','Invoice')->where('title','!=','All')->get();

        return view('projects.create',compact('invoice_status'))
            ->withUsers(User::with(['department'])->get()->pluck('nameAndDepartmentEagerLoading', 'id'))
            ->withClients(Client::pluck('company_name', 'external_id'))
            ->withClient($client ?: null)
            ->withStatuses(Status::typeOfProject()->pluck('title', 'id'))
            ->withQoutationstatuses(Status::typeOfInvoice()->pluck('title', 'id'))
            ->withInvoicestatuses(Status::typeOfInvoice()->pluck('title', 'id'))
            ->with('filesystem_integration', Integration::whereApiType('file')->first());
    }

    public function show(Project $project)
    {
        $tasks = $project->tasks->count();
        if ($tasks === 0) {
            $completionPercentage = 0;
        } else {
            $completedTasks = $project->tasks()->whereHas('status', function ($q) {
                $q->where('title', 'closed');
            })->count();
            $completionPercentage = round($completedTasks / $tasks * 100);
        }



        $collaborators = collect();

        $collaborators->push($project->assignee);
        foreach ($project->tasks as $task) {
            $collaborators->push($task->user);
        }


        return view('projects.show')
            ->withProject($project)
            ->withStatuses(Status::typeOfTask()->get())
            ->withTasks($project->tasks)
            ->withCompletionPercentage($completionPercentage)
            ->withCollaborators($collaborators->unique())
            ->withUsers(User::with(['department'])->get()->pluck('nameAndDepartmentEagerLoading', 'id'))
            ->withFiles($project->documents)
            ->with('filesystem_integration', Integration::whereApiType('file')->first());
        ;
    }

    public function updateStatus($external_id, Request $request)
    {
        if (!auth()->user()->can('task-update-status')) {
            session()->flash('flash_message_warning', __('You do not have permission to change task status'));
            return redirect()->route('tasks.show', $external_id);
        }
        $input = $request->all();
        if ($request->ajax() && isset($input["statusExternalId"])) {
            $input["status_id"] = Status::whereExternalId($input["statusExternalId"])->first()->id;
        }
        $project = $this->findByExternalId($external_id);
        $project->fill($input)->save();

        event(new \App\Events\ProjectAction($project, self::UPDATED_STATUS));
        Session()->flash('flash_message', __('Task status is updated'));

        return redirect()->back();
    }

    public function updateAssign($external_id, Request $request)
    {
        $project = Project::with('assignee')->whereExternalId($external_id)->first();

        $user_assigned_id= $request->user_assigned_id;

        $project->user_assigned_id = $user_assigned_id;
        $project->save();

        event(new \App\Events\ProjectAction($project, self::UPDATED_ASSIGN));

        Session()->flash('flash_message', __('New user is assigned'));
        return redirect()->back();
    }

    /**
     * Update the follow up date (Deadline)
     * @param UpdateLeadFollowUpRequest $request
     * @param $external_id
     * @return mixed
     */
    public function updateDeadline(Request $request, $external_id)
    {
        if (!auth()->user()->can('task-update-deadline')) {
            session()->flash('flash_message_warning', __('You do not have permission to change task deadline'));
            return redirect()->route('tasks.show', $external_id);
        }
        $project = $this->findByExternalId($external_id);
        $input = $request->all();
        $input = $request =
            ['deadline' => $request->deadline_date . " " . $request->deadline_time . ":00"];
        $project->fill($input)->save();
        event(new \App\Events\ProjectAction($project, self::UPDATED_DEADLINE));
        Session()->flash('flash_message', __('New deadline is set'));
        return redirect()->back();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function findByExternalId($external_id)
    {
        return Project::whereExternalId($external_id)->firstOrFail();
    }

    public function download(Request $request){
        return Storage::download($request->filePath);
    }
}

