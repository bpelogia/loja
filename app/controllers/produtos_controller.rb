class ProdutosController < ApplicationController
  
  def index
    @produtos_por_nome = Produto.order(:nome).limit 5
    @produtos_por_preco = Produto.order(:preco).limit 2
  end
  
  def create
    #o '.permit!' indica a permissão de todos os atributos
    #valores = params.require(:produto).permit!
    valores = params.require(:produto).permit(:nome, :descricao, :quantidade, :preco)
    produto = Produto.create valores
  end
  
end
