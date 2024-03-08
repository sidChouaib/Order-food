import 'package:cibweb/features/foods_screens/data/model/order_model/order_model.dart';
import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/product_model/product_model.dart';
import 'package:cibweb/features/foods_screens/model_view/cart_food/cart_bloc.dart';
import 'package:cibweb/features/foods_screens/model_view/counter_food/counter_bloc.dart';
import 'package:cibweb/features/foods_screens/view/food_details/widgets/ingridents_item_widget.dart';
import 'package:cibweb/features/foods_screens/view/food_details/widgets/size_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/utlis/image_constant.dart';
import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/widgets/custom_button.dart';
import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/widgets/custom_image_view.dart';
import 'package:cibweb/core/widgets/custom_icon_button.dart';
import 'package:cibweb/core/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailScreen extends StatelessWidget {
  final ProductModel? product;
  const FoodDetailScreen({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CounterBloc>().add(ResetEvent());
    double widthIcon = 30;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _buildFoodimage(context),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFoodName(context),
                          const SizedBox(height: 12),
                          _buildreviewIformation(context),
                          const SizedBox(height: 12),
                          _buildSizeInformation(context),
                          const SizedBox(height: 12),
                          Text(
                            "ingredients".toUpperCase(),
                            style: CustomTextStyles.bodyMediumBluegray900,
                          ),
                          const SizedBox(height: 12),
                          _buildIngredientText(context),
                          const SizedBox(height: 12),
                          Text(
                            "Optionel".toUpperCase(),
                            style: CustomTextStyles.bodyMediumBluegray300,
                          ),
                          const SizedBox(height: 12),
                          _buildIngredientIcon(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _addToCartWidget(context, widthIcon)
        ],
      ),
    );
  }

  /// Section Widget of Food Image
  Widget _buildFoodimage(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 20),
      decoration: AppDecoration.fillLightBlue.copyWith(
        color: appTheme.lightBlue400.withOpacity(0.45),
      ),
      child: Stack(
        children: [
          CustomImageView(
            height: double.maxFinite,
            width: double.maxFinite,
            imagePath: product?.foodImageUrl,
            alignment: Alignment.bottomCenter,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomAppBar(
              leadingWidth: 45,
              leading: CustomIconButton(
                  onTap: () => Navigator.pop(context),
                  height: 45,
                  width: 45,
                  decoration: IconButtonStyleHelper.fillWhiteA,
                  child:
                      Icon(Icons.arrow_back_ios, color: appTheme.lightBlue400)),
              actions: [
                CustomIconButton(
                    height: 45,
                    width: 45,
                    decoration: IconButtonStyleHelper.fillWhiteA,
                    child: IconButton(
                      icon: Icon(Icons.favorite_border,
                          color: appTheme.lightBlue400),
                      onPressed: null,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget of Food Name
  Widget _buildFoodName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product?.name ?? "Food Name",
          style: theme.textTheme.titleLarge,
        ),
      ],
    );
  }

  /// Section Widget of Review Iformation
  Widget _buildreviewIformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 64),
      child: Row(
        children: [
          SizedBox(
            width: 53,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  color: appTheme.lightBlue400,
                  imagePath: ImageConstant.imgStar1,
                  height: 20,
                  width: 20,
                  radius: BorderRadius.circular(
                    1,
                  ),
                ),
                Text(
                  "${product?.foodRate}",
                  style: CustomTextStyles.titleMediumGray90001,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 50,
          ),
          SizedBox(
            width: 63,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  color: appTheme.lightBlue400,
                  imagePath: ImageConstant.imgSettings,
                  height: 16,
                  width: 23,
                ),
                Text(
                  "Free",
                  style: CustomTextStyles.bodyMediumBluegray600,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 50,
          ),
          SizedBox(
            width: 73,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  color: appTheme.lightBlue400,
                  imagePath: ImageConstant.imgClock,
                  height: 20,
                  width: 20,
                ),
                Text(
                  "${product?.time}",
                  style: CustomTextStyles.bodyMediumBluegray600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget of Size Iformation
  Widget _buildSizeInformation(BuildContext context) {
    List<String>? sizes = product?.size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Select Size:".toUpperCase(),
          style: CustomTextStyles.bodyMediumBluegray300,
        ),
        const SizedBox(width: 15), // Add some space between the label and sizes
        if (sizes != null)
          Expanded(
            child: Row(
              children: sizes.map((productSize) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SizeItemFoodWidget(productSize: productSize),
                );
              }).toList(),
            ),
          ),
        if (sizes == null || sizes.isEmpty)
          Text(
            "No data",
            style: CustomTextStyles.bodyMediumBluegray300,
          ),
      ],
    );
  }

  /// Section Widget Ingredient
  Widget _buildIngredientIcon(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 73,
        crossAxisCount: 5,
        mainAxisSpacing: 19,
        crossAxisSpacing: 19,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const IngridentstextItemWidget();
      },
    );
  }

  Widget _addToCartWidget(BuildContext context, double widthIcon) {
    //BlocBuilder  listens to a specified Bloc(CounterBloc) and rebuilds itself whenever the state of that Bloc changes.
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Container(
          decoration: AppDecoration.shadow.copyWith(
            color: const Color.fromARGB(255, 247, 247, 247),
            borderRadius: BorderRadiusStyle.roundedTopBorder32,
          ),
          padding: const EdgeInsets.all(24),
          height: 180,
          child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Center(
                          child: Text("${product?.price} \$",
                              style: CustomTextStyles.titleLargeGray90001)),
                    ),
                    Container(
                      width: 125,
                      height: 48,
                      padding: const EdgeInsets.all(8),
                      decoration: AppDecoration.fillblueGray.copyWith(
                          color: appTheme.blueGray90001,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      child: Row(
                        children: [
                          CustomIconButton(
                            width: widthIcon,
                            height: widthIcon,
                            bkColor: appTheme.whiteA700.withOpacity(.45),
                            child:
                                Icon(Icons.remove, color: appTheme.whiteA700),
                            onTap: () {
                              context
                                  .read<CounterBloc>()
                                  .add(DecreamentEvent());
                            },
                          ),
                          const Spacer(),
                          Text(
                            //call the value of counter from CounterChangedState and print it in UI
                            state is CounterChangedState
                                ? state.counter.toString()
                                : '1',
                            style: CustomTextStyles.titleMediumWihte,
                          ),
                          const Spacer(),
                          CustomIconButton(
                            width: widthIcon,
                            height: widthIcon,
                            bkColor: appTheme.whiteA700.withOpacity(.45),
                            child: Icon(Icons.add, color: appTheme.whiteA700),
                            onTap: () {
                              context
                                  .read<CounterBloc>()
                                  .add(IncreamentEvent());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  onTap: () {
                    OrderItem orderItem = OrderItem(
                        product: product!,
                        quantity: (state as CounterChangedState).counter);

                    bool orderExists = (context.read<CartBloc>().state)
                        .orderItems
                        .any((existingOrder) =>
                            existingOrder.product == orderItem.product);

                    if (!orderExists) {
                      // Dispatch the AddToCartEvent only if the order doesn't exist
                      context
                          .read<CartBloc>()
                          .add(AddToCartEvent(orderItem: orderItem));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('This item is added in the cart.'),
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      // Handle the case where the order already exists, e.g., show a message
                      // You can replace this with your desired logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('This item is already in the cart.'),
                        ),
                      );
                    }
                  },
                  height: 62,
                  width: double.maxFinite,
                  bkColor: appTheme.lightBlue400,
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: CustomTextStyles.titleLargeWhite,
                    ),
                  ),
                ),
              ]),
        );
      },
    );
  }

  /// Section Widget Ingredient
  Widget _buildIngredientText(BuildContext context) {
    List<String>? ingredients = product?.ingredients;
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 40,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ingredients?.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: AppDecoration.fillblueGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder15,
            ),
            child: Container(
              decoration: AppDecoration.fillblueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder15,
              ),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  ingredients![index],
                  style: CustomTextStyles.bodyMediumBluegray300,
                ),
              ),
            ),
          );
        });
  }
}
