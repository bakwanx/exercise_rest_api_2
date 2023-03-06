import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());

  Future<void> getProduct() async {
    try{
      emit(LoadingProductState());
      await ProductService().getProduct().then((value){
        List<ProductModel> _productModels = value["products"]
            .map<ProductModel>((data) => ProductModel.fromJson(data))
            .toList();
        emit(DataProductLoadedState(_productModels));
      });
    }catch(e){
      print(e.toString());
      emit(ErrorProductState(e.toString()));
    }
  }
}
