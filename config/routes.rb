Rails.application.routes.draw do
  root 'posts#index'
  # Faz com que rota inicial da aplicação seja a page index (app/views/posts/index.html.erb), ou seja, a lista dos posts.
  resources :posts
  # Unico, pois utilizamos o scaffold para criar as rotas
  # depois será necessário criar uma para os comentários uma rota só e criaremos manualmente
end
