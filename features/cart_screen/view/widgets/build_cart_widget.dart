import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/utlis/image_constant.dart';
import 'package:cibweb/core/widgets/custom_icon_button.dart';
import 'package:cibweb/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class BuildCartWidget extends StatelessWidget {
  const BuildCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List metoPay = [
      {
        "image": ImageConstant.imgCash,
        "label": "Cash",
      },
      {
        "image": ImageConstant.imgCib,
        "label": "Cib",
      },
      {
        "image": ImageConstant.imgElDahabia,
        "label": "ElDahabia",
      },
    ];
    double containerheight = 90;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Payment Infos",
              style: CustomTextStyles.bodyMediumBluegray300,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: containerheight,
          margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 222, 222, 238)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                "Payment\nMethod",
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumBluegray300,
              ),
              Container(
                  // left = 12 + metoPay margin(8) => 20; left 0 +20 => 20
                  margin: const EdgeInsets.only(right: 12, left: 20),
                  color: const Color.fromARGB(255, 222, 222, 238),
                  height: 20,
                  width: 1),


              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemCount: metoPay.length,
                  itemBuilder: (context, index) => IconAndtextItemWidget(
                      imagePath: metoPay[index]["image"],
                      subtitle: metoPay[index]["label"]),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: containerheight,
          margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 222, 222, 238)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                "Share\nPayment",
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumBluegray300,
              ),
              Container(
                  // left = 12 + metoPay margin(8) => 20; left 0 +20 => 20
                  margin: const EdgeInsets.only(right: 12, left: 20),
                  color: const Color.fromARGB(255, 222, 222, 238),
                  height: 20,
                  width: 1),
              Expanded(
                  child: Center(
                      child: Text(
                'Add Person',
                style: theme.textTheme.bodyMedium!.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: appTheme.lightBlue400,
                    decorationThickness: 1.5,
                    decorationStyle: TextDecorationStyle.solid,
                    letterSpacing: 1,
                    color: appTheme.lightBlue400,
                    fontWeight: FontWeight.bold),
              ))),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: containerheight,
          margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 222, 222, 238)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                "Delivery\nAdress",
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumBluegray300,
              ),
              Container(
                  // left = 12 + metoPay margin(8) => 20; left 0 +20 => 20
                  margin: const EdgeInsets.only(right: 12, left: 20),
                  color: const Color.fromARGB(255, 222, 222, 238),
                  height: 20,
                  width: 1),
              Expanded(
                  child: Center(
                      child: Text(
                'Add Delevery Adress',
                style: theme.textTheme.bodyMedium!.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: appTheme.lightBlue400,
                    decorationThickness: 1.5,
                    decorationStyle: TextDecorationStyle.solid,
                    letterSpacing: 1,
                    color: appTheme.lightBlue400,
                    fontWeight: FontWeight.bold),
              ))),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: containerheight,
          margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 222, 222, 238)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                "Use\nCoupon",
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumBluegray300,
              ),
              Container(
                  // left = 12 + metoPay margin(8) => 20; left 0 +20 => 20
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  color: const Color.fromARGB(255, 222, 222, 238),
                  height: 20,
                  width: 1),
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Entrer Coupon',
                    labelStyle: theme.textTheme.bodyMedium!.copyWith(
                        decorationColor: appTheme.blueGray90001,
                        decorationThickness: 1.5,
                        letterSpacing: 1),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 222, 222, 238)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 222, 222, 238)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              CustomIconButton(
                decoration: BoxDecoration(
                    color: appTheme.lightBlue400,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                width: 70,
                height: 55,
                child: Center(
                  child: Text(
                    "Use",
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: appTheme.blueGray50),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class IconAndtextItemWidget extends StatelessWidget {
  final String subtitle;
  final String imagePath;
  const IconAndtextItemWidget({
    Key? key,
    required this.subtitle,
    required this.imagePath,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 48,
            width: 48,
            decoration: AppDecoration.fillblueGray.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder24,
            ),
            child: CustomImageView(
              margin: const EdgeInsets.all(10),
              imagePath: imagePath,
            ),
          ),
          //const SizedBox(height: 2),
          Text(
            subtitle,
            style: CustomTextStyles.bodyMediumBluegray300,
          ),
        ],
      ),
    );
  }
}
