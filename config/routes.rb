Rails.application.routes.draw do
  root 'posts#index'
  # Faz com que rota inicial da aplicação seja a page index (app/views/posts/index.html.erb), ou seja, a lista dos posts.
  resources :posts do 
  # Unico, pois utilizamos o scaffold para criar as rotas
  # depois será necessário criar uma para os comentários uma rota só e criaremos manualmente
    get :search, on: :collection #add rota para busca do tipo collection
  end

  resources :comments, only: %i[create] #rota de comentários, limitada a ação(action) de criação(create) - para não termos todas as rotas disponiveis, por questões ded segurança
end
