class CommentsController < ApplicationController
  def create
    #binding.pry #quando chegar nesse momento a aplicação vai parar e mostrar no terminal o que ta acontecendo
    comment = Comment.create!(comments_params) #salvar o comentário e aceitar os seguintes parametros/campos(), o create! serve para caso acontecer algo de errado, o usuário vai ver uma tela de erro

    redirect_to comment.post, notice: "Comentário enviado!"
    #redirect_to comment.post = redirencionar o usuário para o post (comment.post) depois da criação do comentário
    #notice: = mostrar a mensagem de "Comentário enviado!" - usar o help flash para exibir essa mensagem nas views
  end

  private #metodo privado 

  def comments_params
    params.require(:comment).permit(:post_id, :author, :body) #permit = permitir esses campos; o :post_id é um campo escondido no formulário que vai servir para linkar o comentário a seu post
  end
end