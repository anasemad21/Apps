import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/social_app/cubit/cubit.dart';
import 'package:project/layout/social_app/cubit/statess.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/styles/icon_broken.dart';

class NewPostScreen extends StatelessWidget {
  var textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,stata){},
      builder: (context,state){
        return Scaffold(
          appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
            child:
            defaultAppBar(
              context: context,
              tittle: 'Create post',
              actions:[
                defultTextButton(
                  function: () {
                    if(SocialCubit.get(context).postImage==null){
                      SocialCubit.get(context).createPost(text: textController.text,
                      dateTime: now.toString(),);
                    }else{
                      SocialCubit.get(context).uploadPostImage(text: textController.text,
                      dateTime: now.toString(),);
                    }
                  },
                  text: 'post',
                ),
                SizedBox(width: 20.0,),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                  SizedBox(height: 10.0,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage('https://image.freepik.com/free-vector/beautiful-christmas-background-with-realistic-3d-branches-ornaments_69286-311.jpg'),
                    ),
                    SizedBox(width:15.0,),
                    Expanded(
                      child: Text('Anas Emad',
                        style: TextStyle(
                          height: 1.4,
                        ),),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind...',
                    border: InputBorder.none,
                  ),),
                ),
                SizedBox(height: 20.0,),
                if(SocialCubit.get(context).postImage!=null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                        Container(
                          height: 140.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0,),
                            image: DecorationImage(
                              image: FileImage(SocialCubit.get(context).postImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      IconButton(
                        onPressed: () {
                          SocialCubit.get(context).removePostImage();
                        },
                        icon: CircleAvatar(
                          radius: 20.0,
                          child: Icon(
                            Icons.close,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 20.0,),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(onPressed: (){
                        SocialCubit.get(context).getPostImage();
                      },
                          child: Row(
                            children: [
                              Icon(
                                IconBroken.Image,
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                'add photo',
                              ),
                            ],
                          ),),
                    ),
                    Expanded(
                      child: TextButton(onPressed: (){},
                              child: Text(
                              '# tags',
                                   ),
                        ),
                           ),
                  ],
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
