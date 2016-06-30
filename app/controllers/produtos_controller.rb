class ProdutosController < ApplicationController
  
  def index
    @produtos_por_nome = Produto.order(:nome).limit 5
    @produtos_por_preco = Produto.order(:preco).limit 2
  end
  
  def new 
    @produto = Produto.new
    @departamentos = Departamento.all
  end
  
  def create
    #o '.permit!' indica a permissão de todos os atributos
    #valores = params.require(:produto).permit!
    valores = params.require(:produto).permit(:nome, :descricao, :quantidade, :preco)
    @produto = Produto.new valores
    if @produto.save
        flash[:notice] = "Produto salvo com sucesso!"
        redirect_to root_url
    else
        render :new
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
  
end
