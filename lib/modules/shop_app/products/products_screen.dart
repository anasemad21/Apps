import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/shop_app/cubit/cubit.dart';
import 'package:project/layout/shop_app/cubit/statess.dart';
import 'package:project/models/shop_app/categories_model.dart';
import 'package:project/models/shop_app/home_model.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if(state is  ShopSuccessFavouritesState)
          {
            if(!state.model.status)
              {
                showToast(text: state.model.message, state: ToastState.Error,);
              }
          }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null && ShopCubit.get(context).categoriesModel !=null,
          builder: (context) => productBuilder(ShopCubit.get(context).homeModel!,ShopCubit.get(context).categoriesModel!,context,),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget productBuilder(HomeModel model,CategoriesModel categoriesModel,context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model.data.banners
                  .map(
                    (e) => Image(
                      image: NetworkImage('${e.image}'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(
                  seconds: 3,
                ),
                autoPlayAnimationDuration: Duration(
                  seconds: 1,
                ),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 100.0,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>buildCategoryItem(categoriesModel.data.data[index],),
                        separatorBuilder: (context,index)=>SizedBox(width: 10.0,),
                        itemCount: categoriesModel.data.data.length,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 2.1,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  model.data.products.length,
                  (index) => buildGridProduct(model.data.products[index],context),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildGridProduct(ProductModel product,context) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    product.image,
                  ),
                  width: double.infinity,
                  height: 200.0,
                ),
                if (product.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${product.Price.round()}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: defultcolor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (product.discount != 0)
                        Text(
                          '${product.oldPrice.round()}',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                          onPressed: (){
                            ShopCubit.get(context).changeFavourites(product.id);
                            print("here:${(ShopCubit.get(context).favourites![product.id])}");

                          },
                          icon: CircleAvatar(
                            backgroundColor: ShopCubit.get(context).changeFaveColor(product.id) ? defultcolor: Colors.grey,
                            radius: 15.0,
                            child: Icon(
                              Icons.favorite_border,
                              size: 14.0 ,
                              color: Colors.white,
                            ),
                          ),
                      )

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildCategoryItem(DataModel model)=>Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(model.image),
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        width: 100.0,
        color: Colors.black.withOpacity(0.8,),
        child: Text(
          model.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,

          ),
        ),
      ),
    ],
  );
}
