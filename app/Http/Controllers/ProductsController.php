<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Repositories\Money\Money;
use Illuminate\Http\Request;
use View;
use Ramsey\Uuid\Uuid;

class ProductsController extends Controller
{
  public function allProducts()
  {
    return Product::all(['number','name', 'description','joint_width', 'visible_surface', 'profile_height', 'total_width', 'surface', 'movement_capacity', 'load_capacity', 'external_id', 'price', 'default_type']);
  }

  public function index()
  {
      return view('products.index')->withProducts(Product::all());
  }

  public function update(Request $request, $external_id = null)
  {
    if (!auth()->user()->can('product-edit')) {
      session()->flash('flash_message_warning', __('You do not have sufficient privileges for this action'));
      return redirect()->back();
    }

    if($external_id) {
      $product = Product::whereExternalId($external_id)->firstOrFail();
    } else {
      $product = Product::make();
      $product->external_id = Uuid::uuid4()->toString();
    }

    $product->name = $request->name;
    $product->description = $request->description;
    $product->default_type = $request->type;
    $product->price = $request->price;
    $product->number = $request->product_number;
    $product->joint_width = $request->joint;
    $product->visible_surface = $request->visible;
    $product->profile_height = $request->profile;
    $product->total_width = $request->totalWidth;
    $product->surface = $request->surface;
    $product->movement_capacity = $request->movement;
    $product->load_capacity = $request->loadCapacity;
    
    $product->save();

    return redirect()->back();
  }

  public function productCreator(Request $request, $external_id = null)
  {
      if (!auth()->user()->can('product-create')) {
        session()->flash('flash_message_warning', __('You do not have sufficient privileges for this action'));
        return redirect()->back();
      }
      $view = View::make('products._creatorModal');
      if($external_id) {
        $product = Product::whereExternalId($external_id)->firstOrFail();
      } else {
        $product = null;
      }
      return $view
          ->withProduct($product);
  }

  public function destroy(Product $product)
  {
    if (!auth()->user()->can('product-delete')) {
      session()->flash('flash_message_warning', __('You do not have sufficient privileges for this action'));
      return redirect()->back();
    }

    $product->forceDelete();

    return redirect()->back();
  }

}
