import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/home/data/models/product_model.dart';
import 'package:store/features/login/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState>
{
  ProductCubit(this.dio): super(InitialProductState());

  final Dio dio;
  List<ProductModel> products=[];
  Future<void> getProducts()async
  {
    emit
      (LoadingProductState());
    try {
      final res=await dio.get('https://dummyjson.com/products');
     if(res.statusCode==200)
     {
       products=[];
       for (var product in res.data["products"]) {
         products.add(ProductModel.fromJson(product));
       }
       emit(SuccessProductState(products: products));

     }
     else 
      {
        emit(ErrorProductState(errMsg: 'Error status code '));
      }
    } on Exception catch (e) {
      emit(ErrorProductState(errMsg: e.toString()));
    }
  }

}