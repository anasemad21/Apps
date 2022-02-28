import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/social_app/cubit/cubit.dart';
import 'package:project/layout/social_app/cubit/statess.dart';
import 'package:project/models/social_app/creat_post_model.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:project/shared/styles/icon_broken.dart';

class FeedScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
        condition:SocialCubit.get(context).posts.length>0 && SocialCubit.get(context).model!=null,
          builder:(context)=>SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5.0,
                  margin: EdgeInsets.all(8.0,),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        image:NetworkImage('https://image.freepik.com/free-vector/beautiful-christmas-background-with-realistic-3d-branches-ornaments_69286-311.jpg'),
                        height: 200.0,
                        fit:BoxFit.cover,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'communicate with friends',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=>buildPostItem(SocialCubit.get(context).posts[index],context,index),
                  separatorBuilder: (context,index)=>SizedBox(height: 8.0,),
                  itemCount: SocialCubit.get(context).posts.length,),
                SizedBox(height: 8.0,),
              ],
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }



  Widget buildPostItem(PostModel model,context,index)=> Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(horizontal:8.0,),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('${model.image}'),
              ),
              SizedBox(width:15.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${model.name}',
                          style: TextStyle(
                            height: 1.4,
                          ),),
                        SizedBox(width: 5.0,),
                        Icon(
                          Icons.check_circle,
                          color: defultcolor,
                          size:16.0,
                        ),
                      ],
                    ),
                    Text('${model.dateTime}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width:15.0,),
              IconButton(onPressed: (){}, icon: Icon(
                Icons.more_horiz,
                size: 16.0,
              ),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0,),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Text(
            '${model.text}',
            style:Theme.of(context).textTheme.subtitle1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              top: 5.0,
            ),
            child: Container(
              width: double.infinity,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 6.0,
                    ),
                    child: Container(
                      height:25.0 ,
                      child: MaterialButton(
                        onPressed: (){},
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#software',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: defultcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 6.0,
                    ),
                    child: Container(
                      height:25.0 ,
                      child: MaterialButton(
                        onPressed: (){},
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '#software_flutter_developer',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: defultcolor,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          if(model.postImage!='')
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 15.0,
            ),
            child: Container(
              height: 140.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
                image:DecorationImage(
                  image: NetworkImage(
                    '${model.postImage}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,),
            child: Row(
              children: [
                Expanded(
                  child:InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            size: 16.0,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5.0,),
                          Text(//'lik',
                            '${SocialCubit.get(context).likes[index]}',
                            style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                    onTap: (){
                      print("likes:");
                      print(SocialCubit.get(context).likes[index]);
                      print("index");
                      print(index);
                    },
                  ),
                ),
                Expanded(
                  child:InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            IconBroken.Chat,
                            size: 16.0,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5.0,),
                          Text('com',
                            //'${SocialCubit.get(context).comments[index]}',
                            style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                    onTap: (){
                      // print("comments:");
                      // print(SocialCubit.get(context).comments[index]);
                      // print("index");
                      // print(index);

                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage('${SocialCubit.get(context).model!.image}'),
                      ),
                      SizedBox(width:15.0,),
                      Text('write a comment ...',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                   // SocialCubit.get(context).commentPost(SocialCubit.get(context).postsId[index]);
                  },
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Heart,
                      size: 16.0,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5.0,),
                    Text('Like',
                      style: Theme.of(context).textTheme.caption,),
                  ],
                ),
                onTap: (){
                  SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}