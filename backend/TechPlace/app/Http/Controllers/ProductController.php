<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function form()
    {
        return view('cadastra_produto');
    }

    public function front()
    {
        return view('front_products');
    }

    public function create(Request $request)
    {
        $product = new Product($request->all());

        if ($request->hasFile('file')) {
            $extensao = $request->file('file')->extension();
            
            // storePubliclyAs armazena o arquivo temporario na pasta informada
            // na área pública: pasta "public" do projeto
            $nomeArquivo = uniqid();
            $path = $request->file('file')->storePubliclyAs('public/products/' .  strtolower(preg_replace('/[^\w-]/', '', iconv('UTF-8','ASCII//TRANSLIT', $product->category))), "$nomeArquivo." . $extensao);
            $product->profile = str_replace('/storage/', '', Storage::url($path));
        }

        if ($product->save() === true) {
            return response()->json($product, 201);
        }
        return response()->json(["error" => "Erro ao cadastrar"], 400);
    }

    public function getProduct(int $id)
    {
        $product = Product::find($id);
        return response()->json($product);
    }


    public function getCategory(Request $request){
         // se tem: ?category=valor
         $category = $request->input('category');

         // se tem: ?name=valor
         $name = $request->input('name');
 
         if ($category) {
             $products = Product::where('category', $category)->get();
         } elseif ($name) {
             $products = Product::where('name', $name)->get();
         } else {
             $products = Product::all();
         }
 
         return response()->json($products);
    }

    public function getAll(Request $request)
    {
        $busca = $request->input('search');
        $order = $request->input('order');

        if ($busca) {
            $products = Product::where('title', 'like', "%$busca%")
                               ->orWhere('description', 'like', "%$busca%")
                               ->orWhere('category', 'like', "%$busca%")                               
                               ;
        } else {
            // faz o mesmo que Product::all() -> porém não traz ainda os resultados
            $products = Product::where(1, '=', 1);
        }

        if ($order) {
            // valor: {campo}:{ordenacao}
            // orderValues[0] = {campo}
            // orderValues[1] = {ordenacao}
            // desestruturação usando list()
            [$campo, $ordenacao] = explode(':', $order);
            $products->orderBy($campo, $ordenacao);
        }

        return response()->json($products->get());
    }

    public function update(int $id, Request $request)
    {
        // Conceito do PUT em Rest, é substituir
        $product = Product::findOrFail($id);

        // Estamos preenchendo o que veio da request
        // no produtos que selecionamos pelo ID
        $product->fill($request->all());

        if ($product->save()) {
            return response()->json($product, 202);
        }
        return response('Erro ao atualizar', 400);
    }

    public function delete(int $id)
    {
        // Conceito do PUT em Rest, é subistituir
        $product = Product::findOrFail($id);
        $product->delete();
        return response('Produto excluído', 204);
    }
    public function uploadProfile(int $id, Request $request)
    {
        $product = Product::findOrFail($id);
        // Para encontrar a imagem, rodar:
        // php artisan storage:link

        // se há um arquivo no campo "profile"
        if ($request->hasFile('profile')) {
            // .png | .jpg | .jpeg 
            $extensao = $request->file('profile')->extension();
            
            // storePubliclyAs armazena o arquivo temporario na pasta informada
            // na área pública: pasta "public" do projeto
            $nomeArquivo = uniqid();
            $path = $request->file('profile')->storePubliclyAs('public/products/' .  strtolower(preg_replace('/[^\w-]/', '', iconv('UTF-8','ASCII//TRANSLIT', $product->category))), "$nomeArquivo." . $extensao);
            $product->profile = str_replace('/storage/', '', Storage::url($path));
            $product->save();
            
            // respondemos com um link
            return response()->json([
                'url' => Storage::url($path)
            ]);
        }

        return response('Erro ao salvar a imagem', 400);
    }
}