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
    {        // Produtos para Smartphone
        DB::table('products')->insert([
            'title' => "iPhone 14 Pro Max",
            'description' => "Sistema Operacional iOS 16 Tela Tamanho: 6,7. Material: Super Retina XDR OLED Resolução: 2796 x 1290 pixels a 460 ppi Conectividade 5G Wi-Fi EDGE Bluetooth WAP Capacidade 128 GB.",
            'price' => 8488.89,
            'category' => 'Smartphone',
            'profile' => '/storage/products/smartphone/01.webp',
        ]);
        DB::table('products')->insert([
            'title' => "iPhone 13 (128GB)",
            'description' => "Sistema Operacional iOS 15 Tela Tamanho: 6,1. Material: Super Retina XDR Resolução: 2532 x 1170 pixels a 460 ppp Conectividade 5G Wi-Fi EDGE Bluetooth WAP Capacidade 128GB.",
            'price' => 4525.09,
            'category' => 'Smartphone',
            'profile' => '/storage/products/smartphone/02.webp',
        ]);

        // Produtos para Smarttv

        DB::table('products')->insert([
            'title' => "Samsung QLED 4K",
            'description' => "QLED, 4K, 43, 04 Entradas HDMI, 02 Entradas USB, Controle remoto único Solar Cell branco e 60 Hz de Frequência. Vídeo Tecnologia: Qled Resolução: 4K Tamanho da Tela: 43, Conexões Wi-Fi 5 Bluetooh Sim (BT 5.2)",
            'price' => 3084.49,
            'category' => "Smart TV",
            'profile' => '/storage/products/smarttv/01.webp',
        ]);

        DB::table('products')->insert([
            'title' => "TV 4K Samsung",
            'description' => "Crystal UHD Resolução: 4K (3.840 x 2.160) Tamanho da Tela: 75 Tizen™ Smart TV Conexões Bluetooth Portas de Entrada e Saída 03 Entradas HDMI 02 Entradas USB 01.",
            'price' => 5521.35,
            'category' => "Smart TV",
            'profile' => '/storage/products/smarttv/02.webp',
        ]);

        // Produtos para eletronicos

        DB::table('products')->insert([
            'title' => "Rotulador Eletrônico",
            'description' => "O rotulador eletrônico ideal para seus negócios! Com impressão em alta resolução para códigos de barras mais nítidos, logotipos e gráficos detalhados.",
            'price' => 558.97,
            'category' => "Eletrônicos",
            'profile' => '/storage/products/eletronicos/01.webp',
        ]);

        DB::table('products')->insert([
            'title' => "Repelente Eletrônico",
            'description' => "Ecológico, o Repelente Eletrônico Bivolt para Insetos e Roedores Branco da Key West é ideal para repelir pernilongos, ratos e até mesmo morcegos.",
            'price' => 69.49,
            'category' => "Eletrônicos",
            'profile' => '/storage/products/eletronicos/08.webp',
        ]);

        // Produtos para Infomática


        DB::table('products')->insert([
            'title' => "Nvidia Tesla 16GB",
            'description' => "Placa de vídeo Nvidia Tesla P100. Com esta placa, seu PC te garante imagens incríveis de jogos e alto desempenhno.",
            'price' => 4010.00,
            'category' => "Informática",
            'profile' => '/storage/products/informatica/01.webp',
        ]);

        DB::table('products')->insert([
            'title' => "Tablet Samsung Galaxy",
            'description' => "Samsung Galaxy Tab S9 Ultra, além da S Pen inclusa, que ela sua criatividade, agora também acompanha uma capa teclado para mais produtividade. Equipado com Processador Octa-core.",
            'price' => 11499.00,
            'category' => "Informática",
            'profile' => '/storage/products/informatica/02.webp',
        ]);

        // Produtos para Casa Inteligente


        DB::table('products')->insert([
            'title' => "Sensor Inteligente",
            'description' => "Sensor de presença inteligentes Wi-Fi são ideais para aplicações em ambientes residenciais ou comerciais. Fornece reconhecimento de presença e movimento.",
            'price' => 76.64,
            'category' => "Casa Inteligente",
            'profile' => '/storage/products/casainteligente/01.webp',
        ]);

        DB::table('products')->insert([
            'title' => "Porteiro Inteligente",
            'description' => "Com o vídeo porteiro inteligente Wi-Fi SE220 é possível atender visitas via aplicativo, de onde estiver. O SE220 câmera com imagem HD, visão noturna e detecção de movimento.",
            'price' => 289.89,
            'category' => "Casa Inteligente",
            'profile' => '/storage/products/casainteligente/02.webp',
        ]);
    }
}
