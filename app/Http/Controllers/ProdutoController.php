<?php

namespace App\Http\Controllers;

use App\Models\Produto;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $prod = Produto::all();

        // $prod = Produto::selectRaw("nome, MIN(preco) as preco")->groupBy('nome')->orderBy('nome')->get();

        /*
        SELECT id, nome, loja, preco, created_at, updated_at
	FROM public.produtos
	WHERE created_at >= (SELECT NOW() - interval '1 month')  AND (nome, preco) IN (SELECT nome, MIN(preco) preco
							FROM produtos
							GROUP BY nome
							ORDER BY nome);
        */



        // $prod = \DB::select("SELECT id, nome, loja, preco, created_at, updated_at
        //             FROM produtos
        //             WHERE created_at >= (SELECT NOW() - interval '1 month')
        //             AND (nome, preco) IN (SELECT nome, MIN(preco) preco
        //                                     FROM produtos
        //                                     GROUP BY nome)
        //             ORDER BY nome"
        // );
        $prod = \DB::select("SELECT id, nome, loja, preco, created_at, updated_at
                    FROM produtos
                    WHERE (nome, preco) IN (SELECT nome, MIN(preco) preco
                                            FROM produtos
                                            GROUP BY nome)
                    ORDER BY nome"
        );

        return [
            "status" => 200,
            "data" => $prod
        ];
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd("chegou aqui...");
        // $request->validate([
        //     'nome' => 'required',
        //     'loja' => 'required',
        //     'preco' => 'required',
        // ]);

        $prod = Produto::create($request->all());

        return [
            "status" => 200,
            "data" => $prod
        ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    // public function show(Produto $produto)
    public function show($nome)
    {
        // $prod = Produto::find($request->all());
        $prods = \DB::select("SELECT id, nome, loja, preco, created_at, updated_at
                    FROM produtos
                    WHERE nome = '$nome'
                    ORDER BY preco
                    LIMIT 3"
        );

        $myProduct = $prods[0];
        $myProduct->loja = [$myProduct->loja];
        $myProduct->preco = [$myProduct->preco];

        foreach ($prods as $key => $itemProd) {
            if ($key != 0) {
                array_push($myProduct->loja, $itemProd->loja);
                array_push($myProduct->preco, $itemProd->preco);
            }
        }

        return [
            "status" => 200,
            "data" => $myProduct
        ];
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    public function edit(Produto $produto)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Produto $produto)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    public function destroy(Produto $produto)
    {
        //
    }
}
