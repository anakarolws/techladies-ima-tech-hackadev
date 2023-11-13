import 'package:flutter/material.dart';

import 'package:ecommerce/controller/produtos_controller.dart';
import 'package:ecommerce/repository/produtos_repository_impl.dart';
import 'package:image_picker/image_picker.dart';

class AlterarProdutoPage extends StatefulWidget {
  final int? produtoId;
  const AlterarProdutoPage({Key? key, this.produtoId}) : super(key: key);

  @override
  _AlterarProdutoPageState createState() => _AlterarProdutoPageState();
}

class _AlterarProdutoPageState extends State<AlterarProdutoPage> {
  String produtos = "Produtos";
  String? title;
  String? description;
  double? price;
  String? category;
  String? profile;
  XFile? arquivoImagem;

  var produtosController = ProdutoController(ProdutosRepositoryImpl());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var produtosController = ProdutoController(ProdutosRepositoryImpl());

    var produto = produtosController.buscarProduto(widget.produtoId);
    print(widget.produtoId);




    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alterar Produto',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              //espaço para formulário
              SizedBox(
                width: 500,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //validar nome do produto
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Nome do produto"),
                        onChanged: (newTitle) {
                          setState(() {
                            title = newTitle;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O valor não pode ser vazio';
                          }
                          return null;
                        },
                      ),

                      //validar preço
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Preço"),
                        onChanged: (valor) {
                          setState(() {
                            price = double.parse(valor);
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O valor não pode ser vazio';
                          }
                          return null;
                        },
                      ),

                      //validar descrição
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Descrição"),
                        onChanged: (newDescription) {
                          setState(() {
                            description = newDescription;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O valor não pode ser vazio';
                          }
                          return null;
                        },
                      ),

                      //validar seleção de categoria
                      DropdownButtonFormField<String>(
                        value: category,
                        onChanged: (newCategory) {
                          setState(() {
                            category = newCategory!;
                          });
                        },
                        items: <String>[
                          'Casa Inteligente',
                          'Informática',
                          'Smartphone',
                          'Smart TV',
                          'Eletrônicos'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O valor não pode ser vazio';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () async {
                          // Lógica para selecionar a imagem
                          final pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedFile != null) {
                            setState(() {
                              profile = pickedFile.path;
                              arquivoImagem = pickedFile;
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.purple, // Cor do texto
                        ),
                        child: const Text('Selecionar Imagem'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Imagem"),
                        readOnly: true,
                        controller: TextEditingController(text: profile),
                      ),
                      const SizedBox(height: 10),

                      //inclusão e validação de cadastro
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size(120, 50),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await produtosController.fetchProdutosPost(
                                title!,
                                description!,
                                price!,
                                category!,
                                profile!,
                                arquivoImagem!,
                              );
                              setState(() {
                                produtosController.fetchProdutosList();
                              });
                            }
                          },
                          child: const Text('Alterar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
