import 'package:ecommerce/model/casa_inteligente.dart';
import 'package:ecommerce/model/eletronicos.dart';
import 'package:ecommerce/model/informatica.dart';
import 'package:ecommerce/model/smart_phone.dart';
import 'package:ecommerce/model/smart_tv.dart';
import 'package:ecommerce/model/todas_categorias.dart';

List<SmartPhone> smartphones = [
  SmartPhone(
      title: "iPhone 14 Pro Max",
      description: "Sistema Operacional iOS 16 Tela Tamanho: 6,7. Material: Super Retina XDR OLED Resolução: 2796 x 1290 pixels a 460 ppi Conectividade 5G Wi-Fi EDGE Bluetooth WAP Capacidade 128 GB.",
      price: 8488.89,
      discount: 3,
      image: "assets/img/category/smartphones/01.webp"),
  SmartPhone(
      title: "iPhone 13 (128GB) ",
      description: "Sistema Operacional iOS 15 Tela Tamanho: 6,1. Material: Super Retina XDR Resolução: 2532 x 1170 pixels a 460 ppp Conectividade 5G Wi-Fi EDGE Bluetooth WAP Capacidade 128GB.",
      price: 4525.09,
      discount: 2,
      image: "assets/img/category/smartphones/02.webp"),
  SmartPhone(
      title: "Samsung Galaxy M54",
      description: "Smartphone Samsung Galaxy M54 5G (128GB), 8GB, Processador Octa-Core, Até 2 dias de bateria, Câmera Tripla Traseira de 108MP +8MP + 2MP, Selfie de 32MP, Tela Infinita de 6.7 120Hz.",
      price: 1899.00,
      discount: 2,
      image: "assets/img/category/smartphones/03.webp"),
  SmartPhone(
      title: "Samsung Galaxy S21",
      description: "Smartphone Samsung Galaxy S21 FE 5G, 256GB, 8GB RAM, Processador Octa Core última geração, Bateria de 4500mAh, Câmera Tripla Traseira de 12MP + 12MP + 8MP, Selfie de 32MP, Tela Infinita de 6.4 120Hz.",
      price: 3110.00,
      discount: 1,
      image: "assets/img/category/smartphones/04.webp"),
  SmartPhone(
      title: "Samsung Z Flip5",
      description: "Tela dobrável de 6.7 AMOLED Dinâmico 2x (Interno) e 3.4 AMOLED (Externo), 512GB, 8GB de RAM, Câmera Dupla Traseira de 12MP (Dual Pixel, OIS) + 12MP (Ultra Wide), Frontal de 10MP, Bateria de 3700mAh.",
      price: 7999.00,
      discount: 3,
      image: "assets/img/category/smartphones/05.webp"),
  SmartPhone(
      title: "Samsung Z Fold5",
      description: "Tela dobrável de 7.6 AMOLED Dinâmico 2x (Aberto) e 6.2 AMOLED Dinâmico (Fechado), 1TB, 12GB de RAM, Câmera Tripla Traseira de 50MP (Dual Pixel, OIS) + 12MP (Ultra Wide) + 10MP (Telefoto, OIS) Frontal de 4MP e muito mais.",
      price: 13799.00,
      discount: 4,
      image: "assets/img/category/smartphones/06.webp"),
 
];

List<SmartTv> smartTv = [
  SmartTv(
      title: "Samsung QLED 4K",
      description: " QLED, 4K, 43, 04 Entradas HDMI, 02 Entradas USB, Controle remoto único Solar Cell branco e 60 Hz de Frequência. Vídeo Tecnologia: Qled Resolução: 4K Tamanho da Tela: 43, Conexões Wi-Fi 5 Bluetooh Sim (BT 5.2)",
      price: 3084.49,
      discount: 2,
      image: "assets/img/category/smarttv/01.webp"),
  SmartTv(
      title: "TV 4K Samsung",
      description: "Crystal UHD Resolução: 4K (3.840 x 2.160) Tamanho da Tela: 75 Tizen™ Smart TV Conexões Bluetooth Portas de Entrada e Saída 03 Entradas HDMI 02 Entradas USB 01 Entrada de Componente (AV) 01 Ethernet (LAN) 01 Saída de Áudio Digital (Óptica) Anynet+ (HDMI-CEC).",
      price: 5521.35,
      discount: 3,
      image: "assets/img/category/smarttv/02.webp"),
  SmartTv(
      title: "TV 55 LG OLED",
      description: "LG OLED evo. A pioneira há uma década. O que faz da LG OLED evo o auge da marca OLED nº 1 do mundo? Novidades icônicas com formatos atraentes que desafiam sua imaginação. Uma imagem com mais brilho e ousada tão realista que você se sente parte da cena.",
      price: 7955.38,
      discount: 4,
      image: "assets/img/category/smarttv/03.webp"),
  SmartTv(
      title: "TV 55 Samsung UHD",
      description: "Smart TV 55 Samsung UHD 4K 55CU7700 2023, Processador Crystal 4K, Tizen, 60Hz, Preto. Assista os seus conteúdos em uma exclusiva tela sem bordas aparentes, e elimine a confusão de cabos com a solução de canaletas.",
      price: 3125.26,
      discount: 1,
      image: "assets/img/category/smarttv/04.webp"),
  SmartTv(
      title: "TV 65 LG OLED",
      description: " LG OLED evo. Dimensões que desafiam limites. Elegante em todos os sentidos. A LG OLED evo C3 mescla-se ao ambiente com molduras praticamente invisíveis que eliminam os limites da tela.",
      price: 14774.38,
      discount: 6,
      image: "assets/img/category/smarttv/05.webp"),
  SmartTv(
      title: "TV TCL 50 Polegadas",
      description: "A 50RK8600 da TCL é planejada para ser compatível com todos os aplicativos, pois conta com sistema operacional ROKU TV. Além disso, ela tem sistema de áudio Dolby e é possível espelhar o seu celular :).",
      price: 2499.00,
      discount: 1,
      image: "assets/img/category/smarttv/06.webp"),
 
];

List<Eletronicos> eletronicos = [
  Eletronicos(
      title: "Rotulador Eletrônico",
      description: "O rotulador eletrônico ideal para seus negócios! Com impressão em alta resolução para códigos de barras mais nítidos, logotipos e gráficos detalhados. Conecte e crie etiquetas para seu espaço de trabalho usando seu computador.",
      price: 558.97,
      discount: 3,
      image: "assets/img/category/eletroeletronicos/01.webp"),
  Eletronicos(
      title: "Repelente Eletrônico",
      description: " Ecológico, o Repelente Eletrônico Bivolt para Insetos e Roedores Branco da Key West é ideal para repelir pernilongos, ratos e até mesmo morcegos. Produto utiliza uma tecnologia de ultra-som para afastar as visitas indesejadas.",
      price: 69.49,
      discount: 0.5,
      image: "assets/img/category/eletroeletronicos/02.webp"),
  Eletronicos(
      title: "Chuveiro Eletrônico",
      description: "O Chuveiro Eletrônico Smart 7500w 220 Branco da Hydra tem design slim inspirado nas tendências modernas que agregam mais bom gosto à decoração do banheiro.",
      price: 173.99,
      discount: 1,
      image: "assets/img/category/eletroeletronicos/03.webp"),
  Eletronicos(
      title: "Protetor Eletrônico",
      description: " O EPE 1008+ é um protetor eletrônico de 8 tomadas, que garante dupla proteção para os equipamentos eletrônicos, protegendo-os contra surtos de tensão, curto-circuito e sobrecarga. Chave liga/desliga inteligente.",
      price: 59.49,
      discount: 0,
      image: "assets/img/category/eletroeletronicos/04.webp"),
  Eletronicos(
      title: "Cofre Eletrônico",
      description: "Guarde objetos de valor como dinheiro, jóias e documentos no Cofre da Goldentec e fique livre de furtos ou de perdas.",
      price: 449.90,
      discount: 2,
      image: "assets/img/category/eletroeletronicos/05.webp"),
  Eletronicos(
      title: "Aromatizador Eletrônico",
      description: "O Difusor de Aroma Elétrico possui uma tecnologia ultrassônica que fragmenta a solução de água e óleos essenciais em micropartículas finas que difundem ao ar em forma de vapor frio preservando as propriedades dos óleos essenciais.",
      price: 129.90,
      discount: 1,
      image: "assets/img/category/eletroeletronicos/06.webp"),
 
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
      description: "Samsung Galaxy Tab S9 Ultra, além da S Pen inclusa, que ela sua criatividade, agora também acompanha uma capa teclado para mais produtividade. Equipado com Processador Octa-core Snapdragon 8 Gen 2, 12GB RAM, 512GB armazenamento interno, tela de 14.6.",
      price: 11499.00,
      discount: 5,
      image: "assets/img/category/informatica/02.webp"),
  Informatica(
      title: "Monitor Curvo Samsung 24",
      description: "AMD Radeon FreeSync™ mantém a taxa de atualização do seu monitor e placa e vídeo em sincronia. Mesmo as cenas rápidas têm um aspecto suave e sem interrupções, a taxa de atualização de 75 Hz.",
      price: 759.00,
      discount: 10,
      image: "assets/img/category/informatica/03.webp"),
  Informatica(
      title: "HD Toshiba 1TB",
      description: " Hd 1tb sata 3 32mb 5700rpm 3,5 dt01aba100v toshiba se você está procurando um disco rígido para melhorar o desempenho do seu computador, o toshiba dt01aba100v é o que você precisa, sendo hdd.",
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
      description: "Esta placa tem um único chip USB 3.0 controlador de host que permite uma plataforma equipada de PCI Express fazer a interface com dispositivos USB Super-Speed (5 Gbps), High-Speed (480Mbps),Full-Speed (12 Mbps) e Low-Speed (1.5 Mbps).",
      price: 154.44,
      discount: 3,
      image: "assets/img/category/informatica/06.webp"),
 
];

List<CasaInteligente> casaInteligente = [
  CasaInteligente(
      title: "Sensor Inteligente",
      description: "Sensores de presença inteligente Wi-Fi são ideais para aplicações em ambientes residenciais ou comerciais. Fornece reconhecimento de presença e movimento a uma distância de 6 metros com ângulos de ativação de até 110°. Tem um design compacto e elegante.",
      price: 76.64,
      discount: 8,
      image: "assets/img/category/casainteligente/01.webp"),
  CasaInteligente(
      title: "Vídeo Porteiro Inteligente",
      description: "Com o vídeo porteiro inteligente Wi-Fi SE220 é possível atender visitas via aplicativo, de onde estiver. O SE220 câmera com imagem HD, visão noturna e detecção de movimento.",
      price: 289.89,
      discount: 2,
      image: "assets/img/category/casainteligente/02.webp"),
  CasaInteligente(
      title: "Sirene Alarme Inteligente",
      description: "A Sirene de Alarme Inteligente Wi-Fi Multilaser Liv Series é essencial para um sistema de alarme completo. Integrado com a gama Multilaser liv de sensores de presença e abertura.",
      price: 114.90,
      discount: 1,
      image: "assets/img/category/casainteligente/03.webp"),
  CasaInteligente(
      title: "Câmera Inteligente",
      description: "Resolução Full HD, Infravermelho e Alcance de 10 metros Conexão Wi-Fi, Imagem Full HD, Visão Noturna, Acesso Remoto, Notificação por Movimento, Áudio bidirencional e Gravação com Qualidade Full HD, Gravação em nuvem.",
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
      description: "Smart Speaker Casa Inteligente e Alexa - Branco. Novo visual, novo som ainda melhor. Echo proporciona agudos altos, médios dinâmicos e graves profundos que garantem um som de alta qualidade que se adapta ao seu cômodo. Controle músicas apenas com sua voz.",
      price: 772.74,
      discount: 10,
      image: "assets/img/category/casainteligente/06.webp"),
 
];


var todasCategorias = TodasCategorias(eletronicos, smartphones, smartTv, informatica, casaInteligente);
