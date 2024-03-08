import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/theme/theme_helper.dart';
import 'package:cibweb/core/utlis/image_constant.dart';
import 'package:cibweb/core/widgets/custom_image_view.dart';
import 'package:cibweb/core/widgets/custom_search_view.dart';
import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/category_model.dart/category_model.dart';
import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/product_model/product_model.dart';
import 'package:cibweb/features/foods_screens/data/model/restaurant_response_model/restaurant_response_model.dart';
import 'package:cibweb/features/foods_screens/data/repo/restaurant_repo_implimentation.dart';
import 'package:cibweb/features/foods_screens/view/food_home_page/widgets/buttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:cibweb/core/theme/app_decoration.dart';
import 'widgets/food_component_item_widget.dart';

// ignore: must_be_immutable
class FoodHomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  // shouldFocusSearch=false detha bch maysautilich ll search w ykharjli code direct
  bool shouldFocusSearch = false;

  RestaurantResponseModel? restaurantResponseModel;
  FoodHomeScreen(this.restaurantResponseModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            _buildStoreBackground(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    _categoryTitleBar(context),
                    const SizedBox(height: 12),
                    _categoryItemBuilder(context, restaurantResponseModel),
                    const SizedBox(height: 19),
                    _buildProductComponent(context, restaurantResponseModel!),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottumBar(),
      ),
    );
  }

  Widget _buildStoreBackground(BuildContext context) {
    return SizedBox(
      height: 248,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgStoreBackground,
            height: 248,
            width: double.maxFinite,
            radius: BorderRadiusStyle.roundedBorder32,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: _buildStoreContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreContent() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 21),
      //  decoration: AppDecoration.gradientLightBlueToWhiteA,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 29),
          const SizedBox(height: 28),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hey Customer, ",
                      style: theme.textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: "Good Afternoon!",
                      style: CustomTextStyles.titleMediumff1e1d1d,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomSearchView(
              controller: searchController,
              autofocus: false,
              hintText: "Search dishes",
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryTitleBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Categories",
            style: theme.textTheme.titleLarge,
          ),
          Text(
            "See All",
            style: CustomTextStyles.bodyLargeBluegray900,
          ),
        ],
      ),
    );
  }

  Widget _categoryItemBuilder(
      BuildContext context, RestaurantResponseModel? restRespMod) {
    List<CategoryModel>? categories =
        RestaurantRepoImplementation().getCategoriesData(restRespMod!);
    // print(categories);

    // ignore: no_leading_underscores_for_local_identifiers
    Widget _categoryitem(BuildContext context, CategoryModel categoryModel) {
      return Container(
        width: 135,
        margin: const EdgeInsets.only(right: 7),
        padding: const EdgeInsets.all(8),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder32,
        ),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: AppDecoration.fillblueGray.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder22,
              ),
              child: CustomImageView(
                imagePath: categoryModel.imageUrl,
                height: 44,
                width: 44,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              child: Text(
                categoryModel.categoryName ?? "Category",
                style: CustomTextStyles.titleMediumGray90001,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories!.length,
          (index) => _categoryitem(context, categories[index]),
        ),
      ),
    );
  }

  Widget _buildProductComponent(
      BuildContext context, RestaurantResponseModel restRespMod) {
    List<ProductModel>? products =
        RestaurantRepoImplementation().getProductData(restRespMod);
    //print(products);y
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Text(
              "All (${products?.length ?? 0})",
              style: CustomTextStyles.titleLargeGray90001,
            ),
          ),
        ),
        const SizedBox(height: 11),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 5),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 210,
              crossAxisCount: 2,
              mainAxisSpacing: 19,
              crossAxisSpacing: 19,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products?.length ?? 0,
            itemBuilder: (context, index) {
              return FoodcomponentItemWidget(product: products?[index]);
            },
          ),
        ),
      ],
    );
  }
}
