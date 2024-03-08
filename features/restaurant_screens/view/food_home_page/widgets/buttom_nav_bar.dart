import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/widgets/custom_icon_button.dart';
import 'package:cibweb/features/cart_screen/view/cart_screen.dart';
import 'package:cibweb/features/foods_screens/model_view/cart_food/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottumBar extends StatelessWidget {
  const CustomBottumBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Visibility(
          visible: state.orderItems.isNotEmpty,
          child: Container(
            height: 67,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedTopBorder32,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomNavItem(
                    label: state.orderItems.length.toString(), text: 'Items'),
                CustomIconButton(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.circleBorder24,
                      border: Border.all(color: appTheme.lightBlue)),
                  bkColor: appTheme.blueGray50,
                  child: Icon(
                    Icons.shopping_cart_checkout_outlined,
                    color: appTheme.lightBlue,
                  ),
                ),
                CustomNavItem(label: state.billTotla.toString(), text: 'Total'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomNavItem extends StatelessWidget {
  final String? label;
  final String? text;

  const CustomNavItem({this.label, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text ?? "text",
          style: CustomTextStyles.bodyMediumBluegray300,
        ),
        Text(
          label ?? 'label',
          style: CustomTextStyles.titleMediumff1e1d1d,
        ),
      ],
    );
  }
}
