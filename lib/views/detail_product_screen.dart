import 'package:exercise_rest_api_2/views/buy_success_screen.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../utils/theme.dart';

class DetailProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const DetailProductScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Image.network(
        widget.productModel.images![0],
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }

    Widget body() {
      return Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 22,
          right: 22,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTE: TITLE, RATING, PRICE
            Text(
              widget.productModel.title.toString(),
              style: textStyle.copyWith(
                fontWeight: medium,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
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
                  widget.productModel.rating.toString(),
                  style: textStyle.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "\$ ${widget.productModel.price}",
              style: textStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 6,
              color: Colors.grey,
            ),

            //NOTE: SPECIFICATION & DESCRIPTION
            const SizedBox(
              height: 16,
            ),
            Text(
              "Brand",
              style: textStyle.copyWith(
                fontWeight: bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.productModel.brand.toString(),
              style: textStyle.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(
              height: 16,
            ),
            Text(
              "Category",
              style: textStyle.copyWith(
                fontWeight: bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.productModel.category.toString(),
              style: textStyle.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(
              height: 16,
            ),
            Text(
              "Stok",
              style: textStyle.copyWith(
                fontWeight: bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${widget.productModel.stock} Item",
              style: textStyle.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(
              height: 16,
            ),
            Text(
              "Description",
              style: textStyle.copyWith(
                fontWeight: bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.productModel.description.toString(),
              style: textStyle.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    Widget buyButton() {
      return Container(
        margin: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 36,
        ),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BuySuccessScreen()));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "Beli",
            style: textStyle.copyWith(
              fontWeight: medium,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Produk Detail",
          style: textStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            body(),
            buyButton(),
          ],
        ),
      ),
    );
  }
}
