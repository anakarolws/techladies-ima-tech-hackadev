<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class BookController extends Controller
{
    public function index()
    {
        $items = Product::all();
        return response()->json($items);
    }
}
