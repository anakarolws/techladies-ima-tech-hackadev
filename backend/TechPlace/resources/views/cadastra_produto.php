<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Produtos</title>

    <style>
        
        /* Estilo para o formulário */
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #E5DDE6;
        }

        /* Estilo para os rótulos */
        label {
            display: block;
            margin-bottom: 5px;
        }

        /* Estilo para os campos de entrada */
        input[type="text"],
        input[type="number"],
        input[type="file"] {
            width: 95%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Estilo para o botão */
        button[type="submit"] {
            background-color: purple;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
         /* Estilo para a imagem */
         .center-image {
            text-align: center;
        }
        h1 {
            text-align: center;
            color: purple;
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: 50px;
        }
    </style>
</head>
<body>
    <h1>Tech Place</h1>
    </div>
    <form action="/api/products" method="post" enctype="multipart/form-data">
        <div>
            <label>Nome:</label>
            <input type="text" name="name">
        </div>
        <div>
            <label>Descrição:</label>
            <input type="text" name="description">
        </div>
        <div>
            <label>Categoria:</label>
            <input type="text" name="category">
        </div>
        <div>
            <label>Preço:</label>
            <input type="number" step=".01" name="price">
        </div>
        <div>
            <label>Imagem:</label>
            <input type="file" name="profile">
        </div>
        <button type="submit">Cadastrar</button>
    </form>
</body>
</html>
