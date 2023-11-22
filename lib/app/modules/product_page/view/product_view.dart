import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokosebelah/app/modules/product_page/bloc/product_bloc.dart';
import 'package:tokosebelah/utils/constans.dart';

class ProductView extends StatelessWidget {
  static const routeName = "/product";
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state.status == GlobalSatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == GlobalSatus.success) {
          return ListView.builder(
              itemCount: state.product?.length,
              itemBuilder: (context, index) {
                return Wrap(
                  children: state.product![index].images!
                      .map((e) => Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(e))),
                          ))
                      .toList(),
                );
              });
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      }),
    );
  }
}
