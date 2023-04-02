import 'package:flutter/material.dart';
import 'package:flutter_loginpage/home_widgtes/add_to_cart.dart';
import 'package:flutter_loginpage/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red400.make(),
            AddtoCart(catalog: catalog).wh(130, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(children: [
                    catalog.name.text.xl4
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "Amet laboris enim proident ullamco aute ea cillum est. Amet deserunt reprehenderit do ipsum ea reprehenderit laborum sint Lorem id eiusmod. Lorem occaecat id labore culpa qui quis labore do tempor anim ullamco velit do. Velit officia dolor mollit consequat enim mollit."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16(),
                  ]).py64()),
            ))
          ],
        ),
      ),
    );
  }
}
