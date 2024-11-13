import 'package:equatable/equatable.dart';
import '../models/product_model.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;
  final bool isOpen; // Add this line

  ProductLoaded(this.product, {this.isOpen = false}); // Initialize with default value

  @override
  List<Object?> get props => [product, isOpen]; // Include isOpen in props
}

class ProductError extends ProductState {}

class ProductOpenState extends ProductState {
  final bool isOpen;

  ProductOpenState(this.isOpen);

  @override
  List<Object?> get props => [isOpen];
}