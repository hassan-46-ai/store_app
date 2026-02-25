import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/login/cubit/product_cubit.dart';
import 'package:store/features/login/cubit/product_state.dart';
import 'features/login/widgets/product_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ProductCubit(Dio())..getProducts();
      },
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<ProductCubit>(context);

          return Scaffold(
            body: Builder(
              builder: (context) {
                if (state is LoadingProductState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorProductState) {
                  return Center(
                    child: Text(state.errMsg),
                  );
                } else if (state is SuccessProductState) {
                  if (state.products.isEmpty) {
                    return const Center(
                      child: Text('No items to display'),
                    );
                  }

                  return SingleChildScrollView(
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
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1607082349566-187342175e2f",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Popular Merchandise",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GridView.builder(
                          physics:
                          const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(16),
                          itemCount: state.products.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) {
                            final product =
                            state.products[index];

                            return ProductCard(
                              productname:
                              product.title ?? 'T-shirt',
                              productprice:
                              product.price ?? 25,
                              productdetails:
                              product.description ?? '',
                              productpic: product.imgurl ??
                                  "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          );
        },
      ),
    );
  }
}