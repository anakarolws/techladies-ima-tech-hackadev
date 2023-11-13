<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// procura por uma tabela chamada: products
class Product extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'title',
        'description',
        'price',
        'category',
        'profile',
     ];

    //  public function profile(): Attribute
    //  {
    //      return Attribute::make(
    //          get: fn(string $value) => url($value)
    //      );
    //  }

    protected $appends = ['link'];

    protected function link(): Attribute
    {
        return new Attribute(
            get: fn () => url($this->profile),
        );
    }
 }