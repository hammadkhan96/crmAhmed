<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\StockIn;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use View;
use Yajra\DataTables\Facades\DataTables;
use Ramsey\Uuid\Uuid;

class StocksController extends Controller
{
    public function index()
    {
        
        return view('stock_In.index')
        ->withproducts(Product::pluck('name', 'external_id'));
    }

    public function stockInList(Request $request){
        $stockins = StockIn::join('users as u','u.id','=','stock_ins.received_by')
        ->join('products as p','p.external_id','=','stock_ins.product_id')
        ->select('stock_ins.id', 'stock_ins.product_id', 'stock_ins.external_id','stock_ins.description', 'stock_ins.quantity', 'stock_ins.price', 'stock_ins.received_from','u.name as received_byname', 'stock_ins.created_at','p.name as product_name');
            
        if ($request->get('date_from') != null && $request->get('date_to') != null) {
        $from = $request->get('date_from');
        $to = $request->get('date_to');
        $stockins->whereBetween('stock_ins.created_at', [$from,$to]);
        }
        
        return Datatables::of($stockins)
        ->editColumn('created_at',function($stockins){
        return Carbon::parse($stockins->created_at)->format('d-m-y h:i:s');
        })->addColumn('deleteroute',function($stockins){
            //dd('"'.route('products.destroy',$stockins->product_id)).'"';
            return route('deletestock',$stockins->external_id);
            })
        ->toJson();
            
    }
    public function stockInSubmit(Request $request,$external_id = null){
        
        if($external_id) {
        $stocks_in = StockIn::whereExternalId($external_id)->firstOrFail();
        } else {
            $stocks_in = StockIn::make();
            $stocks_in->external_id = Uuid::uuid4()->toString();
        }
     
        $stocks_in->product_id = $request->product_name;
        $stocks_in->description = $request->description;
        $stocks_in->quantity = $request->quantity;
        $stocks_in->price = $request->price;
        $stocks_in->received_from = $request->received_from;
        $stocks_in->received_by = Auth::id();
        $stocks_in->save();

          
        Session()->flash('flash_message', __('Stock-In Added Successfully'));
        return redirect()->back();

    }
    public function stockinCreator(Request $request, $external_id = null)
    {
      
        //if (!auth()->user()->can('product-create')) {
            // session()->flash('flash_message_warning', __('You do not have sufficient privileges for this action'));
            // return redirect()->back();
        //}
        // $view = View::make('stock_in._creatorModal');
        if($external_id) {
            $stocks = StockIn::where('external_id',$external_id)->firstOrFail();
        } else {
            $stocks = null;
        }
       
        echo json_encode($stocks);
        // return view('stock_In.index')
        // ->withproducts(Product::pluck('name', 'external_id'))->with($stocks);
        
    }
    public function deletestock($id)
    {
       // if (!auth()->user()->can('product-delete')) {
        // session()->flash('flash_message_warning', __('You do not have sufficient privileges for this action'));
        // return redirect()->back();
        // }
        $data=StockIn::where('external_id',$id)->delete();
        echo json_encode(['success' => true]);
        //return redirect()->back();
    }

    
}
