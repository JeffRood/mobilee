import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
 final Function addProduct;
 final Function deleteProduct;
  final Function updateProduct;
final List<Map<String,dynamic>> products;
 ProductsAdminPage(this.addProduct, this.updateProduct, this.deleteProduct, this.products);

Widget _buildSideDrawer(BuildContext context) {
  return Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose')

            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Add Product Page'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/products');
              },
            ),
          ],
        ),
      );
}
  @override
  Widget build(BuildContext context) {
    return _productIndex(context);
  }

  Widget _productIndex(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Manage Product'),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
            icon: Icon(Icons.add),
            text: 'Create Product',),
            Tab(
            icon: Icon(Icons.sd_card),
            text: 'My Products',),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          ProductEditPage(addProduct: addProduct),
          ProductListPage(products, updateProduct)
        ],
      )
    ),);
  }
}
