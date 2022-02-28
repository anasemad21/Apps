import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/layout/shop_app/cubit/cubit.dart';
import 'package:project/models/shop_app/favourites_model.dart';
import 'package:project/modules/news_app/web_view/web_view_screen.dart';
import 'package:project/shared/cubit/cubit_todo_app.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:project/shared/styles/icon_broken.dart';

Widget defultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function function,
  required String text,
  bool isUpperCase = true,
  double radius = 0.0,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
    );

Widget defultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  IconData? surfix,
  Function(String)? onSubmit,
  GestureTapCallback? onTap,
  FormFieldValidator<String>? onChange,
  required FormFieldValidator<String>? validate,
  //required  Function validate ,
  Function? suffixonpressed,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onTap: onTap,
      onChanged: onChange,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: surfix != null
            ? IconButton(
                onPressed: () {
                  suffixonpressed!();
                },
                icon: Icon(
                  surfix,
                ))
            : null,
      ),
    );

Widget buildtaskitem(Map items, context) => Dismissible(
      key: Key(items['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDatabase(
          id: items['id'],
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.blue,
              child: Text(
                '${items['time']}',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${items['title']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${items['data']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
                onPressed: () {
                  AppCubit.get(context).updateDatabase(
                    status: 'done',
                    id: items['id'],
                  );
                }),
            IconButton(
                icon: Icon(
                  Icons.archive,
                  color: Colors.black45,
                ),
                onPressed: () {
                  AppCubit.get(context).updateDatabase(
                    status: 'archived',
                    id: items['id'],
                  );
                }),
          ],
        ),
      ),
    );

Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildtaskitem(tasks[index], context),
        separatorBuilder: (context, index) => Divider(),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet!!! Please enter some tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

Widget ArticleItem(article, context) => InkWell(
      onTap: () {
        navigatTo(
          context,
          WebViewScreen(article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                image: DecorationImage(
                  image: '${article['urlToImage']}' != 'null'
                      ? NetworkImage('${article['urlToImage']}')
                      : NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.grey[300],
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => ArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

void navigatTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigatAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

void showToast({
  required String? text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: ChooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { Success, Error, Warning }

Color ChooseToastColor(ToastState state) {
  var color;
  switch (state) {
    case ToastState.Success:
      color = Colors.green;
      break;

    case ToastState.Error:
      color = Colors.red;
      break;

    case ToastState.Warning:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildListProduct(
  model,
  context, {
  bool isOldPrice = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    model!.image,
                  ),
                  width: 120.0,
                  height: 120.0,
                ),
                if (model.discount != 0 && isOldPrice)
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
            SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: defultcolor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          //print("model::${model}");
                          //print("cout::${ShopCubit.get(context).favouritesModel!.data.data![1]}");
                          ShopCubit.get(context).changeFavourites(model.id);
                          //print("here:${(ShopCubit.get(context).favourites![product.id])}");
                        },
                        icon: CircleAvatar(
                          backgroundColor:
                              ShopCubit.get(context).changeFaveColor(model.id)
                                  ? defultcolor
                                  : Colors.grey,
                          radius: 15.0,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

Widget defaultAppBar({
  required BuildContext context,
  String? tittle,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          IconBroken.Arrow___Left_2,
        ),
      ),
      titleSpacing: 5.0,
      title: Text(
        tittle!,
      ),
      actions: actions,
    );

// ImageProvider checkImage({
//   required profileImage;
//   required userModel;
// }){
//   // if (profileImage == null) {
//   //   var userModel;
//   //   NetworkImage('${userModel.image}');
//   // } else {
//   //   FileImage(profileImage);
//   // }
//   var userModel;
//   profileImage==null ? NetworkImage('${userModel.image}'): FileImage(profileImage);
// }

bool checkImage(profileImage) {
  if (profileImage == null)
    return true;
  else
    return false;
}
