import 'package:ecommerce/model/eletronicos.dart';
import 'package:ecommerce/model/smart_phone.dart';
import 'package:ecommerce/model/smart_tv.dart';

class TodasCategorias {
  List<Eletronicos> listaEletronicos;
  List<SmartPhone> listaSmartphones;
  List<SmartTv> listaSmartTvs;

  TodasCategorias(this.listaEletronicos, this.listaSmartphones, this.listaSmartTvs);

  List<dynamic> getTodosProdutos() {
    return [...listaEletronicos, ...listaSmartphones, ...listaSmartTvs];
  }

  
}