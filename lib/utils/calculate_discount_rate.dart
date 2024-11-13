
double calculateDiscountRate(double actualPrice, double currentPrice) {
  if (actualPrice <= 0) {
    throw ArgumentError("Actual price must be greater than zero.");
  }

  double discount = ((actualPrice - currentPrice) / actualPrice) * 100;
  return discount;
}
