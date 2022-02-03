import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff008080),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
              
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                  ),
                  Image.asset('assets/images/flutter-buguer.png'),
                  const SizedBox(
                    height: 60,
                  ),
                  VakinhaButton(
                    label: 'ACESSAR',
                    width: context.widthTransformer(reducedBy: 40),
                    height: 35,
                    onPressed: () {
                      Get.toNamed('/auth/login');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
