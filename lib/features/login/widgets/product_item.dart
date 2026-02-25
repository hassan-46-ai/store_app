import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.productname, required this.productprice, required this.productdetails, required this.productpic}) : super(key: key);
final String productname;
final String productdetails;
final num productprice;
final String productpic;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16)),
              child: Image.network(
               productpic ,
                fit: BoxFit.cover,
                width: double.infinity,

              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              productname,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              productdetails.substring(0,50),
              style: TextStyle(),
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "\$ $productprice",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}