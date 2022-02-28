import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/layout/social_app/cubit/cubit.dart';
import 'package:project/layout/social_app/cubit/statess.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).model;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;
        nameController.text = userModel!.name!;
        phoneController.text = userModel.phone!;
        bioController.text = userModel.bio!;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: defaultAppBar(
              context: context,
              tittle: 'Edit Profile',
              actions: [
                defultTextButton(
                  function: () {
                    SocialCubit.get(context).userUpdate(
                        name: nameController.text,
                        phone: phoneController.text,
                        bio: bioController.text);
                  },
                  text: 'Update',
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is SocialUserUpdateLoadingState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              if (coverImage == null)
                                Container(
                                  height: 140.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        '${userModel.cover}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              if (coverImage != null)
                                Container(
                                  height: 140.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                    image: DecorationImage(
                                      image: FileImage(coverImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              IconButton(
                                onPressed: () {
                                  SocialCubit.get(context).getCoverImage();
                                },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            if (profileImage == null)
                              CircleAvatar(
                                radius: 64.0,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage:
                                      NetworkImage('${userModel.image}'),
                                ),
                              ),
                            if (profileImage != null)
                              CircleAvatar(
                                radius: 64.0,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage:
                                      NetworkImage('${userModel.image}'),
                                ),
                              ),
                            IconButton(
                              onPressed: () {
                                SocialCubit.get(context).getProfileImage();
                              },
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (SocialCubit.get(context).profileImage != null ||
                      SocialCubit.get(context).coverImage != null)
                    Row(
                      children: [
                        if (SocialCubit.get(context).profileImage != null)
                          Expanded(
                              child: Column(
                            children: [
                              defultButton(
                                function: () {
                                  SocialCubit.get(context).uploadImageProfile(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    bio: bioController.text,
                                  );
                                },
                                text: 'Upload profile ',
                              ),
                              if (state is SocialUserUpdateLoadingState)
                                SizedBox(
                                  height: 5.0,
                                ),
                              if (state is SocialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                            ],
                          )),
                        SizedBox(
                          width: 5.0,
                        ),
                        if (SocialCubit.get(context).coverImage != null)
                          Expanded(
                              child: Column(
                            children: [
                              defultButton(
                                function: () {
                                  SocialCubit.get(context).uploadImageCover(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    bio: bioController.text,
                                  );
                                },
                                text: 'Upload cover',
                              ),
                              if (state is SocialUserUpdateLoadingState)
                                SizedBox(
                                  height: 5.0,
                                ),
                              if (state is SocialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                            ],
                          )),
                      ],
                    ),
                  if (SocialCubit.get(context).profileImage != null ||
                      SocialCubit.get(context).coverImage != null)
                    SizedBox(
                      height: 20.0,
                    ),
                  defultTextFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    label: 'Name',
                    prefix: IconBroken.User,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'name must not be empty!!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defultTextFormField(
                    controller: bioController,
                    type: TextInputType.text,
                    label: 'Bio',
                    prefix: IconBroken.Info_Circle,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Bio must not be empty!!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defultTextFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    label: 'Phone',
                    prefix: IconBroken.Call,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Number must not be empty!!';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
