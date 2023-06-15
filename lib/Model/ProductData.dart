class SingleProductModel {
  final String productImage;
  final String productModel;
  final String productName;
  final double productOldPrice;
  final double productPrice;
  final String productFourImage;
  final String productSecondImage;
  final String productThirdImage;
  SingleProductModel(
      {required this.productName,
        required this.productModel,
        required this.productPrice,
        required this.productOldPrice,
        required this.productImage,
        required this.productFourImage,
        required this.productThirdImage,
        required this.productSecondImage});
}
