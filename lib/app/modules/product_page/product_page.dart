import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokosebelah/app/modules/product_page/bloc/product_bloc.dart';
import 'package:tokosebelah/app/modules/product_page/view/product_view.dart';
import 'package:users_repository/users_repository.dart';

class ProductPage extends StatelessWidget {
  static const routeName = "/product";
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (create) =>
          ProductBloc(usersRespository: context.read<UsersRespository>())..add(ProductEvent()),
      child: const ProductView(),
    );
  }
}
