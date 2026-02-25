import 'package:flutter/material.dart';

import 'features/login/widgets/product_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search merchandise...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1607082349566-187342175e2f"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),



            const SizedBox(height: 10),

            // SizedBox(
            //   height: 50,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     children: const [
            //       CategoryChip(title: "T-Shirts"),
            //       CategoryChip(title: "Hoodies"),
            //       CategoryChip(title: "Caps"),
            //       CategoryChip(title: "Shoes"),
            //       CategoryChip(title: "Accessories"),
            //     ],
            //   ),
            // ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Popular Merchandise",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: 6,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return const ProductCard(productname: 'T-shirt',productprice: 25,productdetails: '',productpic: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class CategoryChip extends StatelessWidget {
//   final String title;
//
//   const CategoryChip({Key? key, required this.title})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: Chip(
//         label: Text(title),
//         backgroundColor: Colors.grey[200],
//       ),
//     );
//   }
// }
