import 'package:ecommerce/model/eletronicos.dart';
import 'package:ecommerce/model/smart_phone.dart';
import 'package:ecommerce/model/smart_tv.dart';
import 'package:ecommerce/model/todas_categorias.dart';

List<SmartPhone> smartphones = [
  SmartPhone(
      title: "IPhone",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 6000.00,
      discount: 30,
      image: "assets/img/category/smartphones/01.webp"),
  SmartPhone(
      title: "IPhone II",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 5000.00,
      discount: 20,
      image: "assets/img/category/smartphones/02.webp"),
  SmartPhone(
      title: "Xiaomi",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 2000.00,
      discount: 10,
      image: "assets/img/category/smartphones/03.webp"),
  SmartPhone(
      title: "Xiaomi II",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 2500.00,
      discount: 15,
      image: "assets/img/category/smartphones/04.webp"),
 
];

List<SmartTv> smartTv = [
  SmartTv(
      title: "Smart TV top 1",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 5000.00,
      discount: 30,
      image: "assets/img/category/smarttv/01.webp"),
  SmartTv(
      title: "Smart TV top 2",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 3000.00,
      discount: 20,
      image: "assets/img/category/smarttv/02.webp"),
  SmartTv(
      title: "Smart TV top 3",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 8000.00,
      discount: 10,
      image: "assets/img/category/smarttv/03.webp"),
  SmartTv(
      title: "Smart TV top 4",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 6500.00,
      discount: 15,
      image: "assets/img/category/smarttv/04.webp"),
 
];

List<Eletronicos> eletronicos = [
  Eletronicos(
      title: "Fone de Ouvido",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 60.00,
      discount: 30,
      image: "assets/img/category/eletroeletronicos/fone01.webp"),
  Eletronicos(
      title: "Fone Gamer",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 120.00,
      discount: 20,
      image: "assets/img/category/eletroeletronicos/fone02.webp"),
  Eletronicos(
      title: "Fone Bluetooth",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 80.00,
      discount: 10,
      image: "assets/img/category/eletroeletronicos/fone03.webp"),
  Eletronicos(
      title: "Fone Esportivo",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Vestibulum sed arcu non odio euismod.",
      price: 80.00,
      discount: 10,
      image: "assets/img/category/eletroeletronicos/fone04.webp"),
 
];

var todasCategorias = TodasCategorias(eletronicos, smartphones, smartTv);
