import 'package:ecommerce/model/casa_inteligente.dart';
import 'package:ecommerce/model/eletronicos.dart';
import 'package:ecommerce/model/informatica.dart';
import 'package:ecommerce/model/smart_phone.dart';
import 'package:ecommerce/model/smart_tv.dart';

class TodasCategorias {
  List<Eletronicos> listaEletronicos;
  List<SmartPhone> listaSmartphones;
  List<SmartTv> listaSmartTvs;
  List<Informatica> listaInformatica;
  List<CasaInteligente> listaCasaInteligente;

  TodasCategorias(
      this.listaEletronicos, this.listaSmartphones, this.listaSmartTvs, this.listaInformatica, this.listaCasaInteligente);

  List<dynamic> getTodosProdutos() {
    return [...listaEletronicos, ...listaSmartphones, ...listaSmartTvs, ...listaInformatica, ...listaCasaInteligente];
  }
}
