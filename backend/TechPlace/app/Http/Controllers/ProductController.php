<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index()
    {
        $items = Product::all();
        return view('products.index', compact('items'));
    }

    public function create()
    {
        return view('products.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|max:255',
            'description' => 'required',
            'price' => 'required',
            'category' => 'required',
        ]);

        $product = Product::create($request->all());
        
        // Handle File Upload
        if($request->hasFile('profile')){
            // .png | .jpg | .jpeg 
            $extensao = $request->file('profile')->extension();
            
            // storePubliclyAs armazena o arquivo temporario na pasta informada
            // na área pública: pasta "public" do projeto
            $nomeArquivo = uniqid();
            $path = $request->file('profile')->storePubliclyAs('public/products', "$nomeArquivo." . $extensao);
            $product->profile = Storage::url($path);
            $product->save();
        }

        return redirect()->route('products.index')
        ->with('success', 'Produto criado com sucesso.');
    }

    public function edit($id)
    {
        $item = Product::find($id);
        return view('products.edit', compact('item'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required|max:255',
            'description' => 'required',
            'price' => 'required',
            'category' => 'required',
        ]);
        $post = Product::find($id);
        $post->update($request->all());
        return redirect()->route('products.index')
        ->with('success', 'Produto atualizado com sucesso.');
    }

    public function destroy($id)
    {
        $item = Product::find($id);
        $item->delete();
        return redirect()->route('products.index')
        ->with('success', 'Produto excluido com sucesso');
    }
}