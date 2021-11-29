class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.order(created_at: :desc) # order(created_at: :desc) = ordenar os posts de acordo com a ordem decrescente de criação
  end

  def search
    @posts = Post.search(search_params[:q]) #esse método retorna uma coleção de posts, baseado no que o usuário buscou (search = esse nome da busca foi definido em model post.rb - ele virou um método da class post)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments.order(created_at: :desc) #ler todos comentários que conseguimos acessar em @post.comments, pois os comentários pertecem a um post(id)
    # order(created_at: :desc) = ordenar os comentários de acordo com a ordem decrescente de criação
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save #se salvar os posts
        format.html { redirect_to @post, notice: t(".notice") }
        format.json { render :show, status: :created, location: @post }
      else #se não salvar
        flash.now[:alert] = @post.errors.full_messages.to_sentence #flash.now[:alert] = Exibir uma mensagem de alerta (é necessário usar .now quando em seguida temos um render e não um redirect_to); 
        # @post = Instancia do banco de dados; 
        # .errors = Rach com varias informações sobre o erro; 
        # .full_messages = Retorna um array com todos os erros que ele encontrou; 
        # .to_sentence = Transforma tudo em uma frase.
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "O post foi atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "O post foi removido com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :author, :body)
    end

    def search_params
      params.permit(:q)
    end
end
