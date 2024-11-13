import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoading()) {
    on<FetchProductEvent>(_mapFetchProductToState);
    on<ToggleProductOpenEvent>(_mapToggleProductOpenToState);
  }

  Future<void> _mapFetchProductToState(
      FetchProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final response = await http.get(
        Uri.parse(
            ApiConstants.productApi.replaceAll('PID', event.productId.toString())),
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        // Access the "data" key before parsing
        if (json['data'] != null && json['data'] is Map<String, dynamic>) {
          debugPrint("RESPONSE ${event.productId}");

          // Ensure each field exists and is of the correct type
          final product = Product.fromJson(json);
          emit(ProductLoaded(product));
        } else {
          emit(ProductError());
        }
      } else {
        emit(ProductError());
      }
    } catch (e) {
      debugPrint("ERROR ${e.toString()}");
      emit(ProductError());
    }
  }
  void _mapToggleProductOpenToState(
    ToggleProductOpenEvent event, Emitter<ProductState> emit) {
  if (state is ProductLoaded) {
    final currentState = state as ProductLoaded;
    emit(ProductLoaded(currentState.product, isOpen: event.isOpen));
  }
}
}
