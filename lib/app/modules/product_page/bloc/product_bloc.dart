import 'package:api_repository/models/product_models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokosebelah/utils/constans.dart';
import 'package:users_repository/users_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required UsersRespository usersRespository})
      : _usersRespository = usersRespository,
        super(const ProductState()) {
    on<ProductEvent>(getProduct);
  }

  final UsersRespository _usersRespository;

  Future<void> getProduct(
      ProductEvent event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(satus: GlobalSatus.loading));
      final dataProduct = await _usersRespository.fetchProdcut();

      emit(state.copyWith(
          product: dataProduct.products, satus: GlobalSatus.success));
    } catch (e) {
      emit(state.copyWith(satus: GlobalSatus.failure, message: e.toString()));
    }
  }
}
