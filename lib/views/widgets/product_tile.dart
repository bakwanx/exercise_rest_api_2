import 'package:exercise_rest_api_2/views/detail_product_screen.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../utils/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;

  const ProductTile({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProductScreen(
              productModel: productModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                productModel.thumbnail.toString(),
                width: 84,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title as String,
                    style: textStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        productModel.rating.toString(),
                        style: textStyle.copyWith(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "\$ ${productModel.price}",
                    style: textStyle.copyWith(fontWeight: bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
