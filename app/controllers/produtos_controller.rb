class ProdutosController < ApplicationController
  
  def index
    @produtos_por_nome = Produto.order(:nome).limit 5
    @produtos_por_preco = Produto.order(:preco).limit 2
  end
  
  def new 
    @produto = Produto.new
    renderiza_new
  end
  
  def create
    #o '.permit!' indica a permissão de todos os atributos
    #valores = params.require(:produto).permit!
    valores = params.require(:produto).permit(:nome, :descricao, :quantidade, :preco, :departamento_id)
    @produto = Produto.new valores
    if @produto.save
        flash[:notice] = "Produto salvo com sucesso!"
        redirect_to root_url
    else
        renderiza_new
    end
  end
  
  def edit
    id = params[:id]
    @produto = Produto.find(id)
    renderiza_new
  end
  
  def update
    id = params[:id]
    @produto = Produto.find(id)
    valores = params.require(:produto).permit(:nome, :descricao, :quantidade, :preco, :departamento_id)
    if @produto.update valores
      flash[:notice] = "Produto atualizado com sucesso"
      redirect_to root_url
    else
      renderiza_new
    end
  end
  
  def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_path
  end
  
  def busca
    @nome = params[:nome]
    @produtos = Produto.where "nome like ?", "%#{@nome}%"
  end
  
  private
  
  def rederiza_new
    @departamentos = Departamento.all
    render :new
  end
  
end
