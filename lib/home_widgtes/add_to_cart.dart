import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/core/store.dart';
import 'package:flutter_loginpage/models/cart.dart';
import 'package:flutter_loginpage/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
  AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(context.theme.buttonColor),
            shape: MaterialStatePropertyAll(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
