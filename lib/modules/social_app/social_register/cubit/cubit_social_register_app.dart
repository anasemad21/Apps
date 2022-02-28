import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/social_app/social_user_model.dart';
import 'package:project/modules/social_app/social_register/cubit/statess_social_register_app.dart';
import 'package:project/shared/network/end_point.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());
  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);

      userCreate(email: email,
          Uid: value.user!.uid,
          name: name,
          phone: phone,
      );
      //emit(SocialRegisterSuccessState());
    }).catchError((error) {
      print('error is that in social register cubit');
      print(error.toString());
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String Uid,
    required String name,
    required String phone,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      Uid: Uid,
      image: 'https://image.freepik.com/free-photo/beauty-smiling-sport-child-boy-showing-his-biceps_155003-1808.jpg',
      cover: 'https://image.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19744.jpg',
      bio:'Write Your bio....',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(Uid)
        .set(model.toMap())
        .then((value) {
          emit(SocialCreateUserSuccessState());
    })
        .catchError((error) {
      print('error is that in social createUser cubit');
      print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void ChangeRegisterPasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(SocialChangeRegisterPasswordVisibilityState());
  }
}
