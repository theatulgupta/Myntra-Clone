import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myntra_clone/SalePosters.dart';
import 'package:myntra_clone/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 70,
              width: context.screenWidth,
              decoration: const BoxDecoration(
                  color: Vx.gray200,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.shutterstock.com/image-vector/black-friday-typography-banner-modern-260nw-2025362600.jpg"))),
            ).py16(),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    width: context.screenWidth,
                    decoration: BoxDecoration(
                        color: Vx.gray200,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(postersUrl[index]))),
                  );
                },
                itemCount: postersUrl.length,
              ),
            ),
            25.heightBox,
            const Divider(
              thickness: 3,
              color: Vx.gray200,
            ),
            8.heightBox,
            "FEATURED BRANDS".text.subtitle2(context).bold.make().px16(),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: context.screenWidth * .6,
                    decoration: BoxDecoration(
                        color: Vx.gray200,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(postersUrl[index]))),
                    child: Stack(
                      children: [],
                    ),
                  ).pOnly(right: 8, top: 12);
                },
                itemCount: postersUrl.length,
              ),
            ).pOnly(left: 16),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.screenWidth * .85,
      child: ListView(
        children: [
          const DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.category_rounded),
            title: "Shop by Categories".text.subtitle1(context).bold.make(),
          ).py8(),
          const Divider(
            thickness: .5,
          ),
          ListTile(
            leading: const Icon(LineIcons.boxOpen),
            title: "Orders".text.size(16).make(),
          ).py8(),
          const Divider(
            thickness: .5,
          ),
          "FAQs".text.make().pOnly(top: 16, left: 74, bottom: 8),
          "CONTACT US".text.make().pOnly(top: 16, left: 74, bottom: 8),
          "LEGAL".text.make().pOnly(top: 16, left: 74, bottom: 8),
        ],
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/fashion.jpg"), fit: BoxFit.fill),
      ),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Vx.white),
                child: const Icon(
                  CupertinoIcons.person,
                  size: 60.0,
                ).p8(),
              ),
              10.heightBox,
              Row(
                children: [
                  "Log In".text.size(18).color(Vx.white).bold.make(),
                  10.widthBox,
                  "•".text.extraBold.color(Vx.white).make().pOnly(top: 8),
                  10.widthBox,
                  "Sign Up".text.size(18).color(Vx.white).bold.make(),
                  const Align(
                    widthFactor: 4.2,
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.arrow_right_rounded,
                      color: Vx.white,
                      size: 30,
                    ),
                  )
                ],
              )
            ],
          ).pOnly(top: 30, left: 20, bottom: 10),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: "Myntra".text.color(Vx.black).make(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, MyntraRoutes.cartRoute);
                },
                icon: const Icon(CupertinoIcons.search)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyntraRoutes.notificationsRoute);
                },
                icon: const Icon(CupertinoIcons.bell)),
            IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, MyntraRoutes.cartRoute);
                },
                icon: const Icon(CupertinoIcons.heart)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyntraRoutes.cartRoute);
                },
                icon: const Icon(CupertinoIcons.bag)),
          ],
        )
      ],
    );
  }
}
