<?php
namespace App\Http\Controllers;

use App\UserDocuments;
use Gate;
use Datatables;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Session;
use Carbon\Carbon;
use App\Models\User;
use App\Models\Task;
use App\Models\Client;
use App\Models\Setting;
use App\Models\Status;
use App\Models\Lead;
use App\Models\Role;
use App\Models\Department;
use Illuminate\Http\Request;
use App\Http\Requests\User\UpdateUserRequest;
use App\Http\Requests\User\StoreUserRequest;
use Illuminate\Support\Facades\Redis;
use Ramsey\Uuid\Uuid;

class UsersController extends Controller
{
    protected $users;
    protected $roles;

    public function __construct()
    {
        $this->middleware('user.create', ['only' => ['create']]);
        $this->middleware('is.demo', ['only' => ['update', 'destroy']]);
    }

    /**
     * @return mixed
     */
    public function index()
    {
        $statuses = Status::whereIn('id', [21,22])->get();
        return view('users.index',compact('statuses'))->withUsers(User::all());
    }

    public function calendarUsers()
    {
        if (!auth()->user()->can('absence-view')) {
            session()->flash('flash_message_warning', __('You do not have permission to view this page'));
            return redirect()->back();
        }
        return User::with(['department', 'absences' =>  function ($q) {
            return $q->whereBetween('start_at', [today()->subWeeks(2)->startOfDay(), today()->addWeeks(4)->endOfDay()])
                ->orWhereBetween('end_at', [today()->subWeeks(2)->startOfDay(), today()->addWeeks(4)->endOfDay()]);
        }
        ])->get();
    }

    public function users()
    {
        return User::with(['department'])->get();
    }

    public function anyData()
    {
        $users = User::join('statuses as s','s.id','=','users.status_id')
            ->select([ 'users.external_id', 'users.name', 'users.email', 'users.primary_number','users.employee_number','users.branch','s.title as status','users.id as id']);
        return Datatables::of($users)
            ->addColumn('namelink', '<a href="{{ route("users.show",[$external_id]) }}">{{$name}}</a>')
            ->addColumn('view', function ($user) {
                return '<a href="' . route("users.show", $user->external_id) . '" class="btn btn-link">' . __('View') .'</a>';
            })
            ->addColumn('edit', function ($user) {
                return '<a href="' . route("users.edit", $user->external_id) . '" class="btn btn-link">' . __('Edit') .'</a>';
            })
            ->addColumn('documents', function ($user) {
                return '<a href="#" class="btn btn-link">' . __('View Documents') .'</a>';
            })
            /*  ->addColumn('documents', function ($user) {
                  return '<a href="' . route("users.documents", $user->external_id) . '" class="btn btn-link">' . __('View Documents') .'</a>';
              })*/
//            ->addColumn('delete', function ($user) {
//                return '<button type="button" class="btn btn-link" data-client_id="' . $user->external_id . '" onClick="openModal(\'' . $user->external_id . '\')" id="myBtn">' . __('Delete') .'</button>';
//            })
            ->rawColumns(['namelink','view', 'edit', 'delete','documents'])
            ->make(true);
    }

    /**
     * Json for Data tables
     * @param $id
     * @return mixed
     */
    public function taskData($id)
    {
        $tasks = Task::with(['status', 'client'])->select(
            ['id', 'external_id', 'title', 'created_at', 'deadline', 'user_assigned_id', 'client_id', 'status_id','description']
        )
            ->where('user_assigned_id', $id)->get();
        return Datatables::of($tasks)
            ->addColumn('titlelink', '<a href="{{ route("tasks.show",[$external_id]) }}">{{$title}}</a>')
            ->editColumn('created_at', function ($tasks) {
                return $tasks->created_at ? with(new Carbon($tasks->created_at))
                    ->format(carbonDate()) : '';
            })
            ->editColumn('deadline', function ($tasks) {
                return $tasks->deadline ? with(new Carbon($tasks->deadline))
                    ->format(carbonDate()) : '';
            })
            ->editColumn('status_id', function ($tasks) {
                return '<span class="label label-success" style="background-color:' . $tasks->status->color . '"> ' .$tasks->status->title . '</span>';
            })
            ->editColumn('client_id', function ($tasks) {
                return $tasks->client->primaryContact->name;
            })
            ->editColumn('description', function ($tasks) {
                return strip_tags($tasks->description);
            })
            ->rawColumns(['titlelink','status_id'])
            ->make(true);
    }

    /**
     * Json for Data tables
     * @param $id
     * @return mixed
     */
    public function leadData($id)
    {
        $leads = Lead::with(['status', 'client'])->select(
            ['id', 'external_id', 'title', 'created_at', 'deadline', 'user_assigned_id', 'client_id', 'status_id']
        )
            ->where('user_assigned_id', $id)->get();
        return Datatables::of($leads)
            ->addColumn('titlelink', '<a href="{{ route("leads.show",[$external_id]) }}">{{$title}}</a>')
            ->editColumn('created_at', function ($leads) {
                return $leads->created_at ? with(new Carbon($leads->created_at))
                    ->format(carbonDate()) : '';
            })
            ->editColumn('deadline', function ($leads) {
                return $leads->deadline ? with(new Carbon($leads->deadline))
                    ->format(carbonDate()) : '';
            })
            ->editColumn('status_id', function ($leads) {
                return '<span class="label label-success" style="background-color:' . $leads->status->color . '"> ' .
                    $leads->status->title . '</span>';
            })
            ->editColumn('client_id', function ($tasks) {
                return $tasks->client->primaryContact->name;
            })
            ->rawColumns(['titlelink','status_id'])
            ->make(true);
    }

    /**
     * Json for Data tables
     * @param $id
     * @return mixed
     */
    public function clientData($id)
    {
        $clients = Client::select(['external_id', 'company_name', 'address'])->where('user_id', $id);
        return Datatables::of($clients)
            ->addColumn('clientlink', function ($clients) {
                return '<a href="' . route('clients.show', $clients->external_id) . '">' . $clients->company_name . '</a>';
            })
            ->editColumn('created_at', function ($clients) {
                return $clients->created_at ? with(new Carbon($clients->created_at))
                    ->format(carbonDate()) : '';
            })
            ->rawColumns(['clientlink'])
            ->make(true);
    }


    /**
     * @return mixed
     */
    public function create()
    {
        return view('users.create')
            ->withRoles($this->allRoles()->pluck('display_name', 'id'))
            ->withDepartments(Department::pluck('name', 'id'))
            ->withStatus(Status::whereIn('id',[21,22])->pluck('title', 'id'));
    }

    /**
     * @param StoreUserRequest $userRequest
     * @return mixed
     */
    public function store(StoreUserRequest $request)
    {
        $input = $request->all();
        $email = $request->email;
        $document = $request->file('document');
        $rules = [];

        if(User::where('email',$email)->exists()){
            return redirect()->back()->with('error','Email Exists');
        }

        /* for($i=0; $i< count($request->file('document'));$i++) {
             if($i > 0){
                 $rules["document.{$i}"] = 'required';
             }
         }*/
        $path = null;
        $filename = null;
        $image_name = null;
        if ($request->hasFile('img')) {

            /* $file = $request->file('img');
             $extension = $file->getClientOriginalExtension(); // getting image extension
             $filename = time().'.'.$extension;
             $file->move('uploads/', $filename);*/

            $image      = $request->file('img');
            $image_name = time() . '.' . $image->extension();
            Storage::disk('public')->putFileAs('profile/',$image,$image_name);
            /* $project->invoice = 'invoice/'.$image_name;*/

        }

        $user = new User();
        $user->name = $request->name;
        $user->external_id = Uuid::uuid4()->toString();
        $user->email = $request->email;
        $user->address = $request->address;
        $user->primary_number = $request->primary_number;
        $user->secondary_number = $request->secondary_number;
        $user->password = bcrypt($request->password);
        $user->branch = $request->branch;
        $user->employee_number = $request->employee_number;
        $user->image_path = $image_name;
        $user->status_id = $request->status_id;
        $user->language = $request->language == "dk" ?: "en";
        $user->save();
        $user->roles()->attach($request->roles);
        $user->department()->attach($request->departments);
        $user->save();

        $validator = Validator::make($request->all(), $rules);

        if ($validator->passes()) {
            if(isset($input['document'])) {
                for ($i = 0; $i < count($input['document']); $i++) {

                    /*$file = $document[$i];
                    $extension = $file->getClientOriginalExtension(); // getting file extension
                    $filename = time() . '.' . $extension;
                    $file->move('documents/', $filename);

                    UserDocuments::create(['document' => $filename, 'user_id' => $user->id]);*/

                    $file = $document[$i];
                    $file_name = time() . '.' . $file->extension();
                    Storage::disk('public')->putFileAs('documents/'.$user->id .'/',$file,$file_name);
                    UserDocuments::create(['document' => $file_name, 'user_id' => $user->id]);

                }
            }
        }

        Session::flash('flash_message', __('User successfully added'));
        return redirect()->route('users.index');
    }

    /**
     * @param $external_id
     * @return mixed
     */
    public function show($external_id)
    {
        /** @var User $user */
        $user = $this->findByExternalId($external_id);
        return view('users.show')
            ->withUser($user)
            ->withCompanyname(Setting::first()->company)
            ->with('task_statistics', $user->totalOpenAndClosedTasks($external_id))
            ->with('lead_statistics', $user->totalOpenAndClosedLeads($external_id))
            ->with('lead_statuses', Status::typeOfLead()->get())
            ->with('task_statuses', Status::typeOfTask()->get());
    }


    /**
     * @param $external_id
     * @return mixed
     */
    public function edit($external_id)
    {
        return view('users.edit')
        ->withRoles($this->allRoles()->pluck('display_name', 'id'))
            ->withUser($this->findByExternalId($external_id))
            ->withStatus(Status::whereIn('id',[21,22])->pluck('title', 'id'))
            ->withDepartments(Department::pluck('name', 'id'));
    }

    /**
     * @param $external_id
     * @param UpdateUserRequest $request
     * @return mixed
     */
    public function update($external_id, UpdateUserRequest $request)
    {
        $user = $this->findByExternalId($external_id);
        $password = bcrypt($request->password);
        $role = $request->roles;
        $department = $request->departments;
        

        if( !auth()->user()->canChangePasswordOn($user) ) {
            unset($request['password']);
        }


        if ($request->hasFile('img')) {
            // $companyname = Setting::first()->external_id;
            // $file =  $request->file('image_path');

            // $filename = str_random(8) . '_' . $file->getClientOriginalName() ;

            // $path = Storage::put($companyname, $file);
            $image      = $request->file('img');
            $image_name = time() . '.' . $image->extension();
            Storage::disk('public')->putFileAs('profile/',$image,$image_name);

            if ($request->password == "") {
                $input =  array_replace($request->except('password'), ['image_path'=>"$image_name"]);
            } else {
                $input =  array_replace($request->all(), ['image_path'=>"$image_name", 'password'=>"$password"]);
            }
        } else {
            if ($request->password == "") {
                $input =  array_replace($request->except('password'));
            } else {
                $input =  array_replace($request->all(), ['password'=>"$password"]);
            }
        }
        $rules = array();
        $document = array();
        
        $validator = Validator::make($request->all(), $rules);

        if ($validator->passes()) {
            if(isset($input['document'])) {
                for ($i = 0; $i < count($input['document']); $i++) {

                    $document = $input['document']; 
                    $file = $document[$i];
                    $file_name = time() . '.' . $file->extension();
                    Storage::disk('public')->putFileAs('documents/'.$user->id .'/',$file,$file_name);
                    UserDocuments::create(['document' => $file_name, 'user_id' => $user->id]);

                }
            }
        }

        $owners = User::whereHas('roles', function ($q) {
            $q->where('name', Role::OWNER_ROLE);
        })->get();

        $user->fill($input)->save();
        $role = $user->roles->first();
        if ($role && $role->name == Role::OWNER_ROLE && $owners->count() <= 1) {
            Session()->flash('flash_message_warning', __('Not able to change owner role, please choose a new owner first'));
        } else {
            if(auth()->user()->canChangeRole() ) {
                $user->roles()->sync([$request->roles]);
            }
        }
        $user->department()->sync([$department]);
        $statuses = $request->status_id;
        $user->status_id = $statuses;
        $user->save();

        Session()->flash('flash_message', __('User successfully updated'));
        return redirect()->route('users.index');
    }

    /**
     * @param $external_id
     * @return mixed
     */
    public function destroy(Request $request, $external_id)
    {
        $user = $this->findByExternalId($external_id);

        if ($user->hasRole('owner')) {
            return Session()->flash('flash_message_warning', __('Not allowed to delete super admin'));
        }

        if ($request->tasks == "move_all_tasks" && $request->task_user != "") {
            $user->moveTasks($request->task_user);
        }
        if ($request->leads == "move_all_leads" && $request->lead_user != "") {
            $user->moveLeads($request->lead_user);
        }
        if ($request->clients == "move_all_clients" && $request->client_user != "") {
            $user->moveClients($request->client_user);
        }

        try {
            $user->delete();
            Session()->flash('flash_message', __('User successfully deleted'));
        } catch (\Illuminate\Database\QueryException $e) {
            Session()->flash('flash_message_warning', __('User can NOT have, leads, clients, or tasks assigned when deleted'));
        }

        return redirect()->route('users.index');
    }

    /**
     * @param $external_id
     * @return mixed
     */
    public function findByExternalId($external_id)
    {
        return User::whereExternalId($external_id)->firstOrFail();
    }
    /**
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    private function allRoles()
    {
        if (auth()->user()->roles->first()->name == Role::OWNER_ROLE) {
            return Role::all('display_name', 'id', 'name', 'external_id')->sortBy('display_name');
        }

        return Role::all('display_name', 'id', 'name', 'external_id')->filter(function ($value, $key) {
            return $value->name != "owner";
        })->sortBy('display_name');
    }


    public function userDocuments(Request $request){

        $email = $request->email;
       $user = User::where('email',$email)->first();
       if($user){
           $documents = UserDocuments::where('user_id',$user->id);
           $data = array();
           if($documents->exists()){
               $data = $documents->get();
               foreach($data as $link){
                    $url[] = asset("storage/documents/$user->id/$link->document"); 
               }
           
               return response()->json(['status' => 1,'documents' => $url]);
           }
           else{
               return response()->json(['status' => 2]);
           }
       }

    }

}
