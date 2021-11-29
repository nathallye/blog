class Post < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId

  validates :title, :author, :body, presence: true

  has_many :comments, dependent: :destroy #has_many :comments = um post tem vários commentários; dependent: :destroy = se apagar um post, apagar todos os comentários associados a este

  friendly_id :title, use: :slugged #slugged = É necessário que seja criado uma coluna slugged na tabela posts no BD para armazenar essa url
  # podemos criar parando o servidos, em seguida no terminal rodar o comando: rails g migration add_slug_column_to_posts slug:string

  pg_search_scope :search, 
    against: %i[title author body] #:search = Titulo do buscador; against: %i[title author body = contra quais campos do banco de dados vamos utilizar para fazer essa busca (nesse caso é titulo, autor e no corpo do texto); documentação: https://github.com/Casecommons/pg_search
    #associated_against: { comments: %i[body] } #associated_agaist: = busca em registros associados (nesse caso vai ser no corpo do texto dos comentários)
end
