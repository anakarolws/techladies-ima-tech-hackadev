import 'package:ecommerce/model/eletronicos.dart';
import 'package:ecommerce/model/smart_phone.dart';
import 'package:ecommerce/model/smart_tv.dart';
import 'package:ecommerce/model/todas_categorias.dart';

List<SmartPhone> smartphones = [
  SmartPhone(
      title: "IPhone",
      description: "O melhor do Iphone",
      price: 6000.00,
      discount: 30,
      image: "assets/img/category/smartphones/01.webp"),
  SmartPhone(
      title: "IPhone",
      description: "Iphone e você",
      price: 5000.00,
      discount: 20,
      image: "assets/img/category/smartphones/02.webp"),
  SmartPhone(
      title: "Xiaomi",
      description: "O melhor do Xiaomi",
      price: 2000.00,
      discount: 10,
      image: "assets/img/category/smartphones/03.webp"),
  SmartPhone(
      title: "Xiaomi",
      description: "Mais barato e melhor",
      price: 2500.00,
      discount: 15,
      image: "assets/img/category/smartphones/04.webp"),
 
];

List<SmartTv> smartTv = [
  SmartTv(
      title: "Smart TV top 1",
      description: "Qualidade na sua imagem",
      price: 5000.00,
      discount: 30,
      image: "assets/img/category/smarttv/01.webp"),
  SmartTv(
      title: "Smart TV top 2",
      description: "Qualidade e momentos incríveis",
      price: 3000.00,
      discount: 20,
      image: "assets/img/category/smarttv/02.webp"),
  SmartTv(
      title: "Smart TV top 3",
      description: "O que há de melhor, experimente",
      price: 8000.00,
      discount: 10,
      image: "assets/img/category/smarttv/03.webp"),
  SmartTv(
      title: "Smart TV top 4",
      description: "Garantia de momentos felizes",
      price: 6500.00,
      discount: 15,
      image: "assets/img/category/smarttv/04.webp"),
 
];

List<Eletronicos> eletronicos = [
  Eletronicos(
      title: "Fone de Ouvido",
      description: "Fone sem fio ",
      price: 60.00,
      discount: 30,
      image: "assets/img/category/eletroeletronicos/fone01.webp"),
  Eletronicos(
      title: "Fone Gamer",
      description: "Fone gamer",
      price: 120.00,
      discount: 20,
      image: "assets/img/category/eletroeletronicos/fone02.webp"),
  Eletronicos(
      title: "Fone Bluetooth",
      description: "Bateria longa duração",
      price: 80.00,
      discount: 10,
      image: "assets/img/category/eletroeletronicos/fone03.webp"),
  Eletronicos(
      title: "Fone Esportivo",
      description: "A prova d'água",
      price: 80.00,
      discount: 10,
      image: "assets/img/category/eletroeletronicos/fone04.webp"),
 
];

var todasCategorias = TodasCategorias(eletronicos, smartphones, smartTv);
