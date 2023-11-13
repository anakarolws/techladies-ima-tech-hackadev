<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <title>Produtos</title>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-warning">
    <div class="container-fluid">
      <a class="navbar-brand h1" href="">Produtos</a>
      <div class="justify-end ">
        <div class="col ">
          <a class="btn btn-sm btn-success" href={{ route('products.create') }}>Adicionar produto</a>
        </div>
      </div>
    </div>
  </nav>
  <div class="container mt-5">
    <div class="row">
      @foreach ($items as $item)
      <div class="col-sm-4 mb-4">
        <div class="card">
            <div class="card-header">
              <h5 class="card-title">{{ $item->title }}</h5>
            </div>
            <img src="{{ asset($item->profile) }}" class="card-img-top" alt="product image">
            <div class="card-body">
              <p class="card-text">{{ $item->description }}</p>
              <p class="card-text"><strong>Preço: </strong>R$ {{ number_format($item->price, 2, ',', '.') }}</p>
            </div>
            <div class="card-footer">
              <div class="row">
                <div class="col-sm">
                  <a href="{{ route('products.edit', $item->id) }}" class="btn btn-primary btn-sm">Edit</a>
                </div>
                <div class="col-sm">
                    <form action="{{ route('products.destroy', $item->id) }}" method="post" onsubmit="return processDelete(this)">
                      @csrf
                      @method('DELETE')
                      <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      @endforeach
    </div>
  </div>

  <script>
    function processDelete(form) {
      if (!confirm("Deseja realmente excluir?")) {
        return false;
      }
      return true;
    }
  </script>
</body>
</html>