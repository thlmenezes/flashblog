# ![](https://cdn.emojidex.com/emoji/px64/Ruby.png?1465787635) Ruby

# [🍝](https://www.ruby-lang.org/pt/) Fontes

> "Já leu a documentação [![](https://cdn.emojidex.com/emoji/px32/Ruby.png?1465787635)](https://docs.ruby-lang.org/en/)?"<br/>
> Fábio Akita

# 👺 Matz

![](https://upload.wikimedia.org/wikipedia/commons/7/76/Yukihiro_Matsumoto.JPG)

# 🍲 "... tudo que há de bom"

>  "A liberdade do LISP com a expressividade do SmallTalk"<br/>
> [Fabio Akita](https://youtu.be/oEorhw5r2Do?t=1906)

# 🏛️ Pilares

- 😘 Multiparadigma
- 🤩 Interpretada
- 🎩 Sintaxe elegante
  - 💡 *Convention Over Configuration*

# 🕴️ Gerenciadores de versão

- [rvm](http://rvm.io) - Ruby Version Manager
- [asdf](https://github.com/asdf-vm/asdf)


# 🍞 Bread 'n Butter

```ruby
puts 4 ** 10 # exponenciação
var = gets.chomp
=begin
! not, && and, || or
=end
```

[chomp](https://docs.ruby-lang.org/en/2.6.0/String.html#method-i-chomp), [operadores](https://www.tutorialspoint.com/ruby/ruby_operators.htm)


# 🛠 Methods?

```ruby
3.class
4.methods
# Porque as `?` e `!`?
# => Convenção
```

# 🧵 Strings

```ruby
Thales = "oito"
$nome = :Thales # variável global
puts "#{$nome}" # interpolação
```

# [🔣](https://docs.ruby-lang.org/en/2.7.0/Symbol.html) :Símbolos

- Objeto imutável, nunca desalocado
- Economizam memória
- `Symbol != object_id`

# 🔣 :na_prática

- Usamos aos montes no Rails <br/>Perfomance executando Hashes
- São identificadores, [Leia mais](https://stackoverflow.com/questions/16621073/when-to-use-symbols-instead-of-strings-in-ruby#answers)

# 🧱 Bloco

```ruby
{ código cercado por chaves }
do puts "Também é bloco" end
# bloco pode receber argumentos
5.times { |vez| puts vez }
```

# 🚦 Condicionais

```ruby
# Condicionais antes ou depois?
puts "É verdade que: 1 é menor que 2?" if 1 < 2
# Operador Ternário
puts a > 2 ? "sim" : "não é"
```

# 🎮 Expressões de controle

- elsif ~~else if, elif~~
- unless ~~if not~~
- ~~switch~~ case
- until
- [Leia mais](https://ruby-doc.org/core-2.7.1/doc/syntax/control_expressions_rdoc.html)

# 🍱 Arrays

```ruby
array = [1,1.0,"vinte"]
array << "Fagner"
# => [1, 1.0, "vinte", "Fagner"]
```

# ♿ Acesso

```ruby
array.at(20)
# => nil
array.fetch(20)
# => IndexError
array.fetch(20,"oopsie")
# => "oopsie"
```

# 🍴 `for`

- 🙄 TL;DR Você não precisa dele
- [Leia mais](https://github.com/rubocop-hq/ruby-style-guide#no-for-loops)

# 🦼 Iterando

```ruby
livros.each { |livro|
    puts livro
}
livros.each do |livro|
    puts livro
end
livros.each do |l| puts l end
```

# 🔗 Encadeamento

```ruby
poema.lines.reverse.join
```

# 🤔 Reflexão

> "It's not good enough just to get your code to work, your code has to be something that you love to work in"<br/>[Robert Martin](https://youtu.be/oEorhw5r2Do?t=4389)

# 🦾 Exercite-se

Tutorial interativo [Try Ruby](https://try.ruby-lang.org)<br/>Complete [The Koans](http://www.rubykoans.com)