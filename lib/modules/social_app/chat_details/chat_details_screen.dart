import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/social_app/cubit/cubit.dart';
import 'package:project/layout/social_app/cubit/statess.dart';
import 'package:project/models/social_app/social_user_model.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:project/shared/styles/icon_broken.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel? UserModel;
  ChatDetailsScreen({
    required this.UserModel,
  });
  var messageController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder:(BuildContext context)
        {
          SocialCubit.get(context).getMessages(receiverId: UserModel!.Uid!,);
          return BlocConsumer<SocialCubit,SocialStates>(
            listener: (context,state){},
            builder: (context,state){
              return Scaffold(
                appBar: AppBar(
                  titleSpacing: 0.0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          UserModel!.image!,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        UserModel!.name!,
                      ),
                    ],
                  ),
                ),
                body: ConditionalBuilder(
                    condition: SocialCubit.get(context).messages.length>0,
                    builder: (context)=>Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index)
                        {
                          var messagge=SocialCubit.get(context).messages[index];
                          if(SocialCubit.get(context).model!.Uid==messagge.senderId)
                            return Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: defultcolor.withOpacity(0.2,),
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(10.0,),
                                    topStart: Radius.circular(10.0,),
                                    topEnd: Radius.circular(10.0,),
                                  ),

                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 10.0,
                                ),
                                child: Text(
                                  messagge.text!,
                                ),
                              ),
                            );
                          return Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomEnd: Radius.circular(10.0,),
                                    topStart: Radius.circular(10.0,),
                                    topEnd: Radius.circular(10.0,),
                                  ),

                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 10.0,
                                ),
                                child: Text(
                                  messagge.text!,
                                ),
                              ),
                            );


                        },
                              separatorBuilder: (context,index)=>SizedBox(
                                height: 15.0,
                              ),

                              itemCount: SocialCubit.get(context).messages.length,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey[300]!,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0,),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller:messageController ,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Type your message here....',

                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50.0,
                                  color: defultcolor,
                                  child: MaterialButton(
                                    onPressed: (){
                                      print('message:');
                                      print(messageController.text);
                                      SocialCubit.get(context).sendMessage(
                                        receiverId: UserModel!.Uid!,
                                        dateTime: DateTime.now().toString(),
                                        text: messageController.text,
                                      );
                                    },
                                    minWidth: 1.0,
                                    child: Icon(
                                      IconBroken.Send,
                                      size: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    fallback: (context)=>Center(child: CircularProgressIndicator()),),
              );
            },
          );
        },
    );
  }
}
