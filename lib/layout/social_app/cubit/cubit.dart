import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/layout/social_app/cubit/statess.dart';
import 'package:project/models/social_app/creat_post_model.dart';
import 'package:project/models/social_app/message_model.dart';
import 'package:project/models/social_app/social_user_model.dart';
import 'package:project/modules/social_app/chats/chats_screen.dart';
import 'package:project/modules/social_app/feeds/feeds_screen.dart';
import 'package:project/modules/social_app/new_post/new_post_screen.dart';
import 'package:project/modules/social_app/settings/settings_screen.dart';
import 'package:project/modules/social_app/users/users_screen.dart';
import 'package:project/shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  SocialUserModel? model;

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(Uid).get().then((value) {
      print(value.data());
      model = SocialUserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print("Here error hee!!!");
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    FeedScreen(),
    ChatScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingScreen(),
  ];
  List<String> tittles = [
    'Home',
    'Chats',
    'Posts',
    'Users',
    'Settings',
  ];
  void ChangeBottomNav(int index) {
    if (index == 1) getUsers();
    if (index == 2)
      emit(SocialNewPostState());
    else {
      currentIndex = index;
      emit(
        SocialChangeBottomNavState(),
      );
    }
  }

  File? profileImage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    final PickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (PickedFile != null) {
      profileImage = File(PickedFile.path);
    } else {
      print("There is No Image to Select");
    }
  }

  File? coverImage;
  Future<void> getCoverImage() async {
    final PickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (PickedFile != null) {
      coverImage = File(PickedFile.path);
      emit(
        SocialGetCoverImageSuccessState(),
      );
    } else {
      print("There is No Image to Select");
      emit(
        SocialGetCoverImageErrorState(),
      );
    }
  }

  void uploadImageProfile({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(
      SocialUserUpdateLoadingState(),
    );
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(
        //   SocialUploadProfileImageSuccessState(),
        // );
        print(value);
        userUpdate(
          name: name,
          bio: bio,
          phone: phone,
          image: value,
        );
      }).catchError((error) {
        emit(
          SocialUploadProfileImageErrorState(),
        );
      });
    }).catchError((error) {
      emit(
        SocialUploadProfileImageErrorState(),
      );
    });
  }

  void uploadImageCover({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(
      SocialUserUpdateLoadingState(),
    );
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(
        //   SocialUploadCoverImageSuccessState(),
        // );
        print(value);
        userUpdate(
          phone: phone,
          bio: bio,
          name: name,
          cover: value,
        );
      }).catchError((error) {
        emit(
          SocialUploadCoverImageErrorState(),
        );
      });
    }).catchError((error) {
      emit(
        SocialUploadCoverImageErrorState(),
      );
    });
  }

//   void userUpdateImages({
//     required String name,
//     required String phone,
//     required String bio,
// }) {
//     emit(SocialUserUpdateLoadingState());
//     if(coverImage!=null){
//       uploadImageCover();
//     }else if(profileImage!=null){
//       uploadImageProfile();
//     }else if(coverImage!=null &&profileImage!=null){
//
//     }
//     else{
//       userUpdate(phone: phone,
//       name: name,
//       bio: bio,);
//     }
//   }

  void userUpdate({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    SocialUserModel Usermodel = SocialUserModel(
      name: name,
      phone: phone,
      image: image ?? model!.image,
      cover: cover ?? model!.cover,
      Uid: model!.Uid,
      email: model!.email,
      bio: bio,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(Usermodel.Uid)
        .update(Usermodel.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(
        SocialUserUpdateErrorState(),
      );
    });
  }

  File? postImage;
  Future<void> getPostImage() async {
    final PickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (PickedFile != null) {
      postImage = File(PickedFile.path);
      emit(
        SocialGetPostImageSuccessState(),
      );
    } else {
      print("There is No Image to Select");
      emit(
        SocialGetPostImageErrorState(),
      );
    }
  }

  void removePostImage() {
    postImage = null;
    emit(
      SocialRemovePostImageState(),
    );
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(
      SocialCreatePostLoadingState(),
    );
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(
        //   SocialUploadCoverImageSuccessState(),
        // );
        print(value);
        createPost(
          dateTime: dateTime,
          text: text,
          postImage: value,
        );
      }).catchError((error) {
        emit(
          SocialCreatePostErrorState(),
        );
      });
    }).catchError((error) {
      emit(
        SocialCreatePostErrorState(),
      );
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(
      SocialCreatePostLoadingState(),
    );
    PostModel Usermodel = PostModel(
      name: model!.name,
      image: model!.image,
      Uid: model!.Uid,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(Usermodel.toMap())
        .then((value) {
      emit(
        SocialCreatePostSuccessState(),
      );
    }).catchError((error) {
      emit(
        SocialCreatePostErrorState(),
      );
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];
  List<int> comments = [];
  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        // element.reference.collection('comments').get().then((value) {
        //   print('comments:');
        //   print(value.docs.length);
        //   comments.add(value.docs.length);
        //   //postsId.add(element.id);
        //   //posts.add(PostModel.fromJson(element.data()));
        // }).catchError((error){print('commentserror');
        // print(error.toString());});
        element.reference.collection('likes').get().then((value) {
          print("likes:");
          print(value.docs.length);
          likes.add(value.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).catchError((error) {
          print('likeerror');
          print(error.toString());
        });
        //postsId.add(element.id);
        //posts.add(PostModel.fromJson(element.data()));
      });

      emit(
        SocialGetPostsSuccessState(),
      );
    }).catchError((error) {
      emit(
        SocialGetPostsErrorState(error.toString()),
      );
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(model!.Uid)
        .set({
      'like': true,
    }).then((value) {
      emit(
        SocialLikePostSuccessState(),
      );
    }).catchError((error) {
      emit(SocialLikePostErrorState(
        error.toString(),
      ));
    });
  }

  void commentPost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(model!.Uid)
        .set({
      'comments': true,
    }).then((value) {
      emit(
        SocialCommentPostSuccessState(),
      );
    }).catchError((error) {
      emit(SocialCommentPostErrorState(
        error.toString(),
      ));
    });
  }

  List<SocialUserModel> users = [];
  void getUsers() {
    if (users.length == 0)
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['Uid'] != model!.Uid)
          users.add(SocialUserModel.fromJson(element.data()));
        });
        emit(SocialGetAllUsersSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(
          SocialGetAllUsersErrorState(error.toString()),
        );
      });
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel modelMessage = MessageModel(
      dateTime: dateTime,
      senderId: model!.Uid,
      text: text,
      receiverId: receiverId,
    );

    //set my chat
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.Uid)
        .collection('chats')
        .doc(receiverId)
        .collection('message')
        .add(modelMessage.toMap())
        .then((value) {
          emit(SocialSendMessageSuccessState(),);
    })
        .catchError((error) {
          print("error in send message");
      emit(SocialSendMessageErrorState(),);
    });


//set receiver chat
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(model!.Uid)
        .collection('message')
        .add(modelMessage.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState(),);
    })
        .catchError((error) {
      print("error in send message");
      emit(SocialSendMessageErrorState(),);
    });
  }


  List <MessageModel> messages=[];
  void getMessages({
     required String receiverId,
}){
    FirebaseFirestore.instance
        .collection('users').doc(model!.Uid)
        .collection('chats').doc(receiverId).collection('message').orderBy('dateTime')
        .snapshots().listen((event)
    {    messages=[];
          event.docs.forEach((element)
          {
            messages.add(MessageModel.fromJson(element.data()));

          });
          emit(SocialGetMessagesSuccessState(),);

    });

  }

}
