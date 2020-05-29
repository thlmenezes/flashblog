# ![](https://cdn.emojidex.com/emoji/px64/Ruby.png?1465787635) Ruby

# # Hash

```ruby
# { Chave R Valor }
aluno = {nome: 'Thales', cpf: '101010'}
# => {:nome => 'Thales', :cpf => '101010'}
aluno[:nome] # O(1)
# => 'Thales'
```

# 🎲 Dados

```ruby
aluno[:departamento] = 'CIC'
aluno.delete(:departamento)
# => 'CIC'
aluno[:departamento]
# => nil
```

# 🦼 Iterando

```ruby
aluno.values
# => ['Thales','101010']
aluno.keys
# => [:nome, :cpf]
aluno.each {|a| puts a}
```

[each](https://docs.ruby-lang.org/en/2.6.0/Hash.html#method-i-each)

# 💾 Default

```ruby
aluno['Zigfrido']
# => nil
aluno.default = 'jojo'
aluno['Godofreda']
# => 'jojo'
```

# 👷🚧 Construtor

```ruby
dicio = Hash.new {0}
dicio['Epaminondas']
# => 0
```

# 🧱 Funções

```ruby
def nome! (argumentos,a2,a3)
    #CODE
    return
end
```

# λ Lambda

```ruby
succ = lambda { |x| x + 1 }
succ.call(2)
# => != ->
Hash Rocket {key => value}
Dash Rocket succ = ->(x){ x+1 }
```

# 🏛️ POO

- Encapsulamento
- Abstração
- Herança
- ~~Polimorfismo~~

# 🛠 Era uma vez ...

- Procedural
  - Variáveis e Funções

# 🪆 Encapsulamento

```
Objetos
│      Variáveis ~> Propriedades
└─     Funções   ~> Métodos
```

# ⚛️ Abstração

Usar algo sem entender como funciona<br/>Na prática, a dependência diminui

# 👤 User

```ruby
class User
  @@user_count = 0
  def initialize name = ""
      # construtor        variáveis
      @username = name  # ├─ instância
      @@user_count += 1 # └─ classe
  end
```

# 

```ruby
#[...]
  def self.count
    @@user_count
  end
```

# 

```ruby
#[...]
  def get_name 
    @username
  end
  
  def set_name! name
    @username = name
  end
```

#

```ruby
#[...] Getter & Setter
  def username # <User>.username
    @username
  end
  # <User>.username = "novo nome"
  def username=(name)
    @username = name
  end
```

[attr_writer :var](https://docs.ruby-lang.org/en/2.6.0/Module.html#method-i-attr_writer), [attr_reader :var](https://docs.ruby-lang.org/en/2.6.0/Module.html#method-i-attr_reader) e [attr_accessor :var](https://docs.ruby-lang.org/en/2.6.0/Module.html#method-i-attr_accessor)

# 👨‍👦 Herança

Encapsular código repetido entre objetos

# 🕴️ Administrador

```ruby
class Administrator < User
	def infinite
		"power"
    end
end
```

# ☺️ Obrigado

![](https://media.giphy.com/media/3o6Zt6KHxJTbXCnSvu/giphy.gif)