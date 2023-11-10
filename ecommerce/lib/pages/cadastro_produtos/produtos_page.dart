import 'package:flutter/material.dart';

import 'package:ecommerce/controller/produtos_controller.dart';
import 'package:ecommerce/widgets/priceWidget.dart';
import 'package:ecommerce/repository/produtos_repository_impl.dart';
import 'package:image_picker/image_picker.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  String produtos = "Produtos";
  String? title;
  String? description;
  double? price;
  String? category;
  String? profile;
  var produtosController = ProdutoController(ProdutosRepositoryImpl());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastrar Produto',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Container(
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
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () async {
                          // Lógica para selecionar a imagem
                          final pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedFile != null) {
                            setState(() {
                              profile = pickedFile.path;
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.purple, // Cor do texto
                        ),
                        child: Text('Selecionar Imagem'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Imagem"),
                        readOnly: true,
                        controller: TextEditingController(text: profile),
                      ),
                      SizedBox(height: 10),

                      //inclusão e validação de cadastro
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: Size(120, 50),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await produtosController.fetchProdutosPost(
                                title!,
                                description!,
                                price!,
                                category!,
                                profile,
                              );
                              setState(() {
                                produtosController.fetchProdutosList();
                              });
                            }
                          },
                          child: const Text('Cadastrar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //espaço para grid
              Expanded(
                child: FutureBuilder(
                  future: produtosController.fetchProdutosList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.78,
                        ),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 8),
                                    child: Text(
                                      snapshot.data![index].title,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 0),
                                    child: Image.network(
                                      snapshot.data![index].profile,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 8),
                                    child: PriceWidget(
                                          price: snapshot.data![index].price,
                                          color:
                                              Color.fromARGB(255, 66, 66, 66),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 8),
                                    child: Text(
                                      '${snapshot.data![index].category}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 66, 66, 66),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/detalheproduto',
                                        arguments: {
                                          'title': snapshot.data![index].title,
                                          'description':
                                              snapshot.data![index].description,
                                          'price': snapshot.data![index].price,
                                          'category':
                                              snapshot.data![index].category,
                                          'image': snapshot.data![index].profile
                                        },
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.purple),
                                      minimumSize:
                                          MaterialStateProperty.all<Size>(Size( 70, 30)),
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)),
                                          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize:10)),
                                          
                                    ),
                                    child: const Text('Detalhes'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
