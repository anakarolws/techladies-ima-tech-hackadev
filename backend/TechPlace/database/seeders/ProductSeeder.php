<?php

namespace Database\Seeders;

// use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {        // Produtos para Smarphones
        DB::table('products')->insert([
            'name' => "iPhone 14 Pro Max",
            'description' => "Sistema Operacional iOS 16 Tela Tamanho: 6,7. Material: Super Retina XDR OLED Resolução: 2796 x 1290 pixels a 460 ppi Conectividade 5G Wi-Fi EDGE Bluetooth WAP Capacidade 128 GB.",
            'price' => 8488.89,
            'category' => 'Smartphone',
            'profile'=> 'Produto de alta qualidade para entusiastas de smartphones.',
            'image'=> '/storage/products/smartphones/01.webp',
        ]);
    }  
}
{    
        DB::table('products')->insert([
            'name' => "iPhone 13 (128GB)",
            'description' => "Sistema Operacional iOS 15 Tela Tamanho: 6,1. Material: Super Retina XDR Resolução: 2532 x 1170 pixels a 460 ppp Conectividade 5G Wi-Fi EDGE Bluetooth WAP Capacidade 128GB.",
            'price' => 4525.09,
            'category' => 'Smartphone',
            'profile'=> 'Um dos melhores smartphones da Apple.',
            'image'=> '/storage/products/smartphones/02.webp',
    ]);
}  
 // Produtos para Smarttv
{    
        DB::table('products')->insert([
            'name'=> "Samsung QLED 4K",
            'description'=> "QLED, 4K, 43, 04 Entradas HDMI, 02 Entradas USB, Controle remoto único Solar Cell branco e 60 Hz de Frequência. Vídeo Tecnologia: Qled Resolução: 4K Tamanho da Tela: 43, Conexões Wi-Fi 5 Bluetooh Sim (BT 5.2)",
            'price'=> 3084.49,
            'category'=> "Smart TV",
            'profile'=> "Uma Smart TV com qualidade de imagem excepcional.",
            'image'=> '/storage/products/smarttv/01.webp',
            ]);
  }
  {    
    DB::table('products')->insert([
        'name'=> "TV 4K Samsung",
        'description'=> "Crystal UHD Resolução: 4K (3.840 x 2.160) Tamanho da Tela: 75 Tizen™ Smart TV Conexões Bluetooth Portas de Entrada e Saída 03 Entradas HDMI 02 Entradas USB 01.",
        'price'=> 5521.35,
        'category'=> "Smart TV",
        'profile'=> "TV 4K com recursos inteligentes para entretenimento de alta qualidade.",
        'image'=> '/storage/products/smarttv/02.webp',
        ]);
}
 // Produtos para Eletroeletronicos
{    
    DB::table('products')->insert([
        'name'=> "Rotulador Eletrônico",
        'description'=> "O rotulador eletrônico ideal para seus negócios! Com impressão em alta resolução para códigos de barras mais nítidos, logotipos e gráficos detalhados.",
        'price'=> 558.97,
        'category'=> "Eletrônicos",
        'profile'=> "Perfeito para uso domestico ou profissional",
        'image'=> '/storage/products/eletroeletronicos/01.webp',
        ]);
}
{    
    DB::table('products')->insert([
        'name'=> "Repelente Eletrônico",
        'description'=> "Ecológico, o Repelente Eletrônico Bivolt para Insetos e Roedores Branco da Key West é ideal para repelir pernilongos, ratos e até mesmo morcegos.",
        'price'=> 69.49,
        'category'=> "Eletrônicos",
        'profile'=> "Mantenha insetos e roedores afastados de forma eficaz.",
        'image'=> '/storage/products/eletroeletronicos/08.webp',
        ]);
}
 // Produtos para Infomática

{   DB::table('products')->insert([
    'name'=> "Nvidia Tesla 16GB",
    'description'=> "Placa de vídeo Nvidia Tesla P100. Com esta placa, seu PC te garante imagens incríveis de jogos e alto desempenhno.",
    'price'=> 4010.00,
    'category'=> "Informática",
    'profile'=> "Placa de vídeo poderosa para jogos e computação de alto desempenho.",
    'image'=> '/storage/products/informatica/01.webp',
    ]);
  }
    { DB::table('products')->insert([
    'name'=> "Tablet Samsung Galaxy",
    'description'=> "Samsung Galaxy Tab S9 Ultra, além da S Pen inclusa, que ela sua criatividade, agora também acompanha uma capa teclado para mais produtividade. Equipado com Processador Octa-core.",
    'price'=> 11499.00,
    'category'=> "Informática",
    'profile'=> "Um tablet versátil para produtividade e entretenimento.",
    'image'=> '/storage/products/informatica/02.webp',
    ]);
  }
   // Produtos para Casa Inteligente

    {DB::table('products')->insert([
    'name'=> "Sensor Inteligente",
    'description'=> "Sensor de presença inteligentes Wi-Fi são ideais para aplicações em ambientes residenciais ou comerciais. Fornece reconhecimento de presença e movimento.",
    'price'=> 76.64,
    'category'=> "Casa Inteligente",
    'profile'=> "Aprimore a segurança e automação em sua casa ou empresa.",
    'image'=> '/storage/products/casainteligente/01.webp',
    ]);
  }
    {DB::table('products')->insert([
    'name'=> "Video Porteiro Inteligente",
    'description'=> "Com o vídeo porteiro inteligente Wi-Fi SE220 é possível atender visitas via aplicativo, de onde estiver. O SE220 câmera com imagem HD, visão noturna e detecção de movimento.",
    'price'=> 289.89,
    'category'=> "Casa Inteligente",
    'profile'=> "Mantenha sua casa segura e atenda visitantes remotamente.",
    'image'=> '/storage/products/casainteligente/02.webp',
    ]);
  }
  

