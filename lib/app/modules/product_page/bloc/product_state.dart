part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState(
      {this.status = GlobalSatus.initial, this.product, this.message});

  final GlobalSatus status;
  final List<Product>? product;
  final String? message;

  ProductState copyWith(
      {GlobalSatus? satus, List<Product>? product, String? message}) {
    return ProductState(
        status: satus ?? status,
        product: product ?? this.product,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [status, product, message];
}
