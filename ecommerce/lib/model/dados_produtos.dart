import 'package:ecommerce/model/casa_inteligente.dart';
import 'package:ecommerce/model/eletronicos.dart';
import 'package:ecommerce/model/informatica.dart';
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

List<Informatica> informatica = [
  Informatica(
      title: "Nvidia Tesla 16GB",
      description: "Placa de vídeo Nvidia Tesla P100. Com esta placa, seu PC te garante imagens incríveis de jogos e alto desempenhno.",
      price: 4010.00,
      discount: 5,
      image: "assets/img/category/informatica/01.webp"),
  Informatica(
      title: "Tablet Samsung Galaxy",
      description: "Samsung Galaxy Tab S9 Ultra, além da S Pen inclusa, que ela sua criatividade, agora também acompanha uma capa teclado para mais produtividade. Equipado com Processador Octa-core Snapdragon 8 Gen 2, equipado com tecnologia Ray Tracing, 12GB RAM, 512GB armazenamento interno, tela de 14.6. Dynamic AMOLED 2X com taxa de atualização de 120Hz, alta gama de cores, recursos de HDR+ e modos de visualização expandidos para maior conforto seja sob baixa luz, ou em ambientes externos.",
      price: 11499.00,
      discount: 5,
      image: "assets/img/category/informatica/02.webp"),
  Informatica(
      title: "Monitor Curvo Samsung 24",
      description: "AMD Radeon FreeSync™ mantém a taxa de atualização do seu monitor e placa e vídeo em sincronia para reduzir a quebra de imagem. Mantenha o foco sem quaisquer interrupções. Mesmo as cenas rápidas têm um aspecto suave e sem interrupções, a taxa de atualização de 75 Hz proporciona cenas mais suaves. Ao jogar um jogo ou ver um vídeo do YouTube o seu conteúdo fica sem lag e sem atrasos.",
      price: 759.00,
      discount: 10,
      image: "assets/img/category/informatica/03.webp"),
  Informatica(
      title: "HD Toshiba 1TB",
      description: " Hd 1tb sata 3 32mb 5700rpm 3,5 dt01aba100v toshibase você está procurando um disco rígido para melhorar o desempenho do seu computador, o toshiba dt01aba100v é o que você precisa. Sendo hdd, sua praticidade e valor econômico em comparação com outros tipos de discos fazem a diferença.este produto possui uma interface sata iii responsável pela transferência de dados com a placa-mãe do seu computador.",
      price: 763.72,
      discount: 10,
      image: "assets/img/category/informatica/04.webp"),
  Informatica(
      title: "Kit com 3 Fans Coolers",
      description: "Melhore o resfriamento do seu gabinete e ganhe desempenho nos jogos com o Kit com 3 Fans Coolers FC120 da DeepCool!",
      price: 397.87,
      discount: 4,
      image: "assets/img/category/informatica/05.webp"),
  Informatica(
      title: "Placa PCI Multilaser Exp",
      description: "Esta placa tem um único chip USB 3.0 controlador de host que permite uma plataforma equipada de PCI Express fazer a interface com dispositivos USB Super-Speed (5 Gbps), High-Speed (480Mbps),Full-Speed (12 Mbps) e Low-Speed (1.5 Mbps), os usuários podem facilmente conectar o seu armazenamento de dados, impressoras, scanners, Hub, Câmeras ou quaisquer outros dispositivos com USB.",
      price: 154.44,
      discount: 3,
      image: "assets/img/category/informatica/06.webp"),
 
];

List<CasaInteligente> casaInteligente = [
  CasaInteligente(
      title: "Sensor De Presenca Inteligente",
      description: "Sensor de presença inteligentes Wi-Fi são ideais para aplicações em ambientes residenciais ou comerciais. Fornece reconhecimento de presença e movimento a uma distância de 6 metros com ângulos de ativação de até 110°. Tem um design compacto e elegante.",
      price: 76.64,
      discount: 8,
      image: "assets/img/category/casainteligente/01.webp"),
  CasaInteligente(
      title: "Video Porteiro Inteligente",
      description: "Com o vídeo porteiro inteligente Wi-Fi SE220 é possível atender visitas via aplicativo, de onde estiver. O SE220 câmera com imagem HD, visão noturna e detecção de movimento. Sua instalação é totalmente livre de fios, já que conta com conexão Wi-Fi e funcionamento via bateria.",
      price: 289.89,
      discount: 2,
      image: "assets/img/category/casainteligente/02.webp"),
  CasaInteligente(
      title: "Sirene de Alarme Inteligente",
      description: "A Sirene de Alarme Inteligente Wi-Fi Multilaser Liv Series é essencial para um sistema de alarme completo. Integrado com a gama Multilaser liv de sensores de presença e abertura. Este produto oferece maior segurança para ambientes residenciais ou comerciais. Funciona com bateria. Este produto opera 100% sem fio. Possui uma instalação plug-and-play e pode ser facilmente configurado através do aplicativo gratuito Multilaser Liv.",
      price: 114.90,
      discount: 1,
      image: "assets/img/category/casainteligente/03.webp"),
  CasaInteligente(
      title: "Câmera Inteligente",
      description: "Resolução Full HD, Infravermelho e Alcance de 10 metros Conexão Wi-Fi, Imagem Full HD, Visão Noturna, Acesso Remoto, Notificação por Movimento, Áudio bidirencional e Gravação com Qualidade Full HD em Cartão Micro SD até 256GB, Inteligência artificial, Visão 360, Auto tracking, Gravação em nuvem.",
      price: 369.94,
      discount: 3,
      image: "assets/img/category/casainteligente/04.webp"),
  CasaInteligente(
      title: "Ralo Click Inteligente",
      description: "O Ralo Click Inteligente de Inox para Banheiro foi desenvolvido para encaixe perfeito em porta grelhas plásticos e metálicos de bitola 100 das principais marcas nacionais. Este produto pode ser utilizado tanto em banheiros e lavabos, como em sacadas e lavanderias.",
      price: 38.90,
      discount: 0,
      image: "assets/img/category/casainteligente/05.webp"),
  CasaInteligente(
      title: "Echo (4ª geração)",
      description: "Smart Speaker Casa Inteligente e Alexa - Branco. Novo visual, novo som ainda melhor Echo proporciona agudos altos, médios dinâmicos e graves profundos que garantem um som de alta qualidade que se adapta ao seu cômodo. Controle músicas apenas com sua voz. Ouça músicas no Amazon Music, Apple Music, Spotify, Deezer e outros ou ainda escute estações de rádios.",
      price: 772.74,
      discount: 10,
      image: "assets/img/category/casainteligente/06.webp"),
 
];


var todasCategorias = TodasCategorias(eletronicos, smartphones, smartTv, informatica, casaInteligente);
