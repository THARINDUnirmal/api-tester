import 'package:api_tester/api/api_services.dart';
import 'package:api_tester/models/product_model.dart';
import 'package:flutter/material.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});
  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  final ApiServices apiService = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<ProductModel>>(
          future: apiService.getAllData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No products found"));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  ProductModel product = snapshot.data![index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey[200],
                    ),
                    child: ListTile(
                      title: Text(product.title.toString()),
                      subtitle: Text("\$${product.price}"),
                      leading: Image.network(
                        product.image.toString(),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
