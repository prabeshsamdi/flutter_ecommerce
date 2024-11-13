import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/bloc/product_bloc.dart';
import 'package:flutter_ecommerce/bloc/product_event.dart';
import 'package:flutter_ecommerce/common/generic_snackbar.dart';

import '../common/generic_text.dart';
import 'product_detail_view.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: BlocProvider(
          create: (context) =>
              ProductBloc()..add(FetchProductEvent(widget.productId)),
          child: const ProductDetailView(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(
                      const Size(200.0, 50.0)), // Set width and height
                  backgroundColor: WidgetStateProperty.all(
                      Colors.red), // Set background color
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(.0), // Set border radius
                    ),
                  ),
                ),
                onPressed: () async {
                  GenericSnackBar.show(
                      context: context,
                      title: "Product Added in Cart Successfully",
                      subtitle:
                          "Thanks for adding  hope you will buy it .... ");
                },
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_checkout_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      GenericText(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                          text: 'Add To Cart'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
