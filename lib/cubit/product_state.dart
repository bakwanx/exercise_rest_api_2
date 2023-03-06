part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitialState extends ProductState {}

class DataProductLoadedState extends ProductState {
  List<ProductModel> productModel;

  DataProductLoadedState(this.productModel);
}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  String message;

  ErrorProductState(this.message);
}
