abstract class SocialStates{}
class SocialInitialState extends SocialStates{}
class SocialGetUserLoadingState extends SocialStates{}
class SocialGetUserSuccessState extends SocialStates{}
class SocialGetUserErrorState extends SocialStates{
  final String error;
  SocialGetUserErrorState(this.error);
}


class SocialChangeBottomNavState extends SocialStates{}

class SocialNewPostState extends SocialStates{}




class SocialGetProfileImageSuccessState extends SocialStates{}

class SocialGetProfileImageErrorState extends SocialStates{}

class SocialGetCoverImageSuccessState extends SocialStates{}

class SocialGetCoverImageErrorState extends SocialStates{}

class SocialUploadCoverImageSuccessState extends SocialStates{}

class SocialUploadCoverImageErrorState extends SocialStates{}

class SocialUploadProfileImageSuccessState extends SocialStates{}

class SocialUploadProfileImageErrorState extends SocialStates{}

class SocialUserUpdateLoadingState extends SocialStates{}
class SocialUserUpdateErrorState extends SocialStates{}

//create post
class SocialCreatePostLoadingState extends SocialStates{}
class SocialCreatePostErrorState extends SocialStates{}
class SocialCreatePostSuccessState extends SocialStates{}

class SocialGetPostImageSuccessState extends SocialStates{}

class SocialGetPostImageErrorState extends SocialStates{}

class SocialRemovePostImageState extends SocialStates{}

class SocialGetPostsLoadingState extends SocialStates{}
class SocialGetPostsSuccessState extends SocialStates{}
class SocialGetPostsErrorState extends SocialStates{
  final String error;
  SocialGetPostsErrorState(this.error);
}


class SocialLikePostErrorState extends SocialStates{
  final String error;
  SocialLikePostErrorState(this.error);

}
class SocialLikePostSuccessState extends SocialStates{}

class SocialCommentPostErrorState extends SocialStates{
  final String error;
  SocialCommentPostErrorState(this.error);

}
class SocialCommentPostSuccessState extends SocialStates{}



class SocialGetALLUsersLoadingState extends SocialStates{}
class SocialGetAllUsersSuccessState extends SocialStates{}
class SocialGetAllUsersErrorState extends SocialStates{
  final String error;
  SocialGetAllUsersErrorState(this.error);
}

//chat
class SocialSendMessageSuccessState extends SocialStates{}
class SocialSendMessageErrorState extends SocialStates{}

class SocialGetMessagesSuccessState extends SocialStates{}
