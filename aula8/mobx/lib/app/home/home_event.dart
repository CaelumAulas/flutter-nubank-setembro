class HomeEvent {}

class GetProducts extends HomeEvent {}

class DeleteProduct extends HomeEvent {
  final String idProduto;

  DeleteProduct(this.idProduto);
}
