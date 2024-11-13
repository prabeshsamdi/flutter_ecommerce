import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProductEvent extends ProductEvent {
  final String productId;

  FetchProductEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class ToggleProductOpenEvent extends ProductEvent {
  final bool isOpen;

  ToggleProductOpenEvent(this.isOpen);

  @override
  List<Object?> get props => [isOpen];
}