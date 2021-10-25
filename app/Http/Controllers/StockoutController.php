<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\StockOut;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use View;
use Yajra\DataTables\Facades\DataTables;
use Ramsey\Uuid\Uuid;
use Carbon\Carbon;

class StockoutController extends Controller
{
    public function index()
    {
        
        return view('stock_out.index')
        ->withproducts(Product::pluck('name', 'external_id'));
    }

    public function stockInList(Request $request){
        $stockin = StockOut::join('users as u','u.id','=','stock_outs.stockout_by')
        ->join('products as p','p.external_id','=','stock_outs.product_id')
        ->select(
            'stock_outs.id', 
            'stock_outs.product_id', 
            'stock_outs.description', 
            'stock_outs.quantity', 
            'stock_outs.price', 
            'stock_outs.stockout_by',
            'u.name as received_byname', 
            'stock_outs.created_at',
            'p.name as product_name');
            
            if ($request->get('date_from') != null && $request->get('date_to') != null) {
            $from = $request->get('date_from');
            $to = $request->get('date_to');
            $stockin->whereBetween('stock_outs.created_at', [$from,$to]);
        }
        //dd($stockin);
        
        return Datatables::of($stockin)
        ->editColumn('created_at',function($stockin){
        return Carbon::parse($stockin->created_at)->format('d-m-y h:i:s');
        })
            ->make(true);
            
    }
    public function stockOutSubmit(Request $request,$external_id = null){
       
          
            if($external_id) {
            $stocks_out = StockOut::whereExternalId($external_id)->firstOrFail();
          } else {
            
            foreach($request->product_code as $key=>$pc)
            {
                $stocks_out = StockOut::make();
                $stocks_out->external_id = Uuid::uuid4()->toString();
                $stocks_out->product_id = $pc;
                $stocks_out->description = $request->product_desc[$key];
                $stocks_out->quantity = $request->product_qty[$key];
                $stocks_out->price = $request->product_price[$key];
                $stocks_out->stockout_by = Auth::id();
                $stocks_out->save();
            }
          }
     
        // $stocks_in->product_id = $request->product_name;
        // $stocks_in->description = $request->description;
        // $stocks_in->quantity = $request->quantity;
        // $stocks_in->price = $request->price;
        // $stocks_in->received_from = $request->received_from;
        // $stocks_in->received_by = Auth::id();
        // $stocks_in->save();

          
        echo json_encode(['success' => true]);

    }

    
}
