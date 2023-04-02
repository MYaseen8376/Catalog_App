import 'package:flutter/material.dart';
import 'package:flutter_loginpage/core/store.dart';
import 'package:flutter_loginpage/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl2.bold.make(),
      ),
      body: Column(
        children: [_Cartlist().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.accentColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buying Not Supported yet.".text.make(),
                ));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.accentColor)),
              child: "Buy".text.center.white.xl2.make().w24(context))
        ],
      ),
    );
  }
}

class _Cartlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () => RemoveMutation(_cart.items[index])),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
