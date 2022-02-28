import 'package:flutter/material.dart';
import 'package:project/models/messenger_model/messenger_model.dart';


class MessengerScreen extends StatelessWidget {
  List<MessengerModel>users=[
    MessengerModel (
      Row: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent-mrs2-2.xx.fbcdn.net/v/t1.6435-9/124686399_3488115654636100_7993384065345407916_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=4_GTk3lYqGAAX8z9P0f&_nc_ht=scontent-mrs2-2.xx&oh=d07be3f3890047559635969e395a7051&oe=616AD6EC'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ali mohamed megoo',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hello Anosh My name is ali mohamed Hussien From Elwara2',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0,),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '0.2:00 pm',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    MessengerModel(Row: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t39.30808-6/225683583_1179218502583407_5938161885417296090_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=sgf-lO5fZFMAX_vRPIY&_nc_oc=AQnXRsjpePwNKmRPZ6vhEdX84FNfi3_8FrDH9bdvBHZHXNYKEH18sTVvQMN_vdQHacs&_nc_ht=scontent.faly3-1.fna&oh=5d0fc76ad1a4792886bb6c021acab6d0&oe=614D00E9'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed Abu Obaida',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'اي عامل اي واخبارك اي '
                          'خلصت الكورس ولا لسه؟؟',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.2:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),),
    MessengerModel(Row:Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/117309124_3522298714488821_6999362931836988925_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Nz9tPi5VuBoAX96P9B0&_nc_ht=scontent.faly3-1.fna&oh=a0298fb1b4e2430074542420105f1625&oe=616DE575'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hazem Sayed',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'ازيك يا بيه عامل ايه واخبارك ايه؟',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.2:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ), ),
    MessengerModel(Row:Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-1/p200x200/102432327_1440126792864744_7071376281874044398_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_ohc=GL5LPf_TvYIAX9AAO0t&_nc_ht=scontent.faly3-1.fna&oh=6556832caac5bc3f95f6bba9673e8896&oe=616B7D3C'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mostafa Ahmed Radian',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'How are U bro and Your brother ziad i need to meet you soon man!!',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.5:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ), ),
    MessengerModel(Row:Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/232144146_3083877705229323_7769859354330206767_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=EUAmj--O1gAAX-UvWSI&_nc_ht=scontent.faly3-1.fna&oh=a09e43e5233c7dc5463d2acd1fa7bab7&oe=616E03C2'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tarek idress',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'اي اخبارك واخبار سوريا وحلويات سوريا',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.6:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ), ),
    MessengerModel (
      Row: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent-mrs2-2.xx.fbcdn.net/v/t1.6435-9/124686399_3488115654636100_7993384065345407916_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=4_GTk3lYqGAAX8z9P0f&_nc_ht=scontent-mrs2-2.xx&oh=d07be3f3890047559635969e395a7051&oe=616AD6EC'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ali mohamed megoo',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hello Anosh My name is ali mohamed Hussien From Elwara2',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0,),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '0.2:00 pm',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    MessengerModel(Row: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t39.30808-6/225683583_1179218502583407_5938161885417296090_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=sgf-lO5fZFMAX_vRPIY&_nc_oc=AQnXRsjpePwNKmRPZ6vhEdX84FNfi3_8FrDH9bdvBHZHXNYKEH18sTVvQMN_vdQHacs&_nc_ht=scontent.faly3-1.fna&oh=5d0fc76ad1a4792886bb6c021acab6d0&oe=614D00E9'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed Abu Obaida',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'اي عامل اي واخبارك اي '
                          'خلصت الكورس ولا لسه؟؟',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.2:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),),
    MessengerModel(Row:Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/117309124_3522298714488821_6999362931836988925_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Nz9tPi5VuBoAX96P9B0&_nc_ht=scontent.faly3-1.fna&oh=a0298fb1b4e2430074542420105f1625&oe=616DE575'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hazem Sayed',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'ازيك يا بيه عامل ايه واخبارك ايه؟',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.2:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ), ),
    MessengerModel(Row:Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-1/p200x200/102432327_1440126792864744_7071376281874044398_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_ohc=GL5LPf_TvYIAX9AAO0t&_nc_ht=scontent.faly3-1.fna&oh=6556832caac5bc3f95f6bba9673e8896&oe=616B7D3C'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mostafa Ahmed Radian',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'How are U bro and Your brother ziad i need to meet you soon man!!',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.5:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ), ),
    MessengerModel(Row:Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/232144146_3083877705229323_7769859354330206767_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=EUAmj--O1gAAX-UvWSI&_nc_ht=scontent.faly3-1.fna&oh=a09e43e5233c7dc5463d2acd1fa7bab7&oe=616E03C2'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tarek idress',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'اي اخبارك واخبار سوريا وحلويات سوريا',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.6:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ), ),
    MessengerModel (
      Row: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent-mrs2-2.xx.fbcdn.net/v/t1.6435-9/124686399_3488115654636100_7993384065345407916_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=4_GTk3lYqGAAX8z9P0f&_nc_ht=scontent-mrs2-2.xx&oh=d07be3f3890047559635969e395a7051&oe=616AD6EC'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ali mohamed megoo',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hello Anosh My name is ali mohamed Hussien From Elwara2',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0,),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '0.2:00 pm',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    MessengerModel(Row: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t39.30808-6/225683583_1179218502583407_5938161885417296090_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=sgf-lO5fZFMAX_vRPIY&_nc_oc=AQnXRsjpePwNKmRPZ6vhEdX84FNfi3_8FrDH9bdvBHZHXNYKEH18sTVvQMN_vdQHacs&_nc_ht=scontent.faly3-1.fna&oh=5d0fc76ad1a4792886bb6c021acab6d0&oe=614D00E9'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed Abu Obaida',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'اي عامل اي واخبارك اي '
                          'خلصت الكورس ولا لسه؟؟',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.2:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),),
    MessengerModel(Row:Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/117309124_3522298714488821_6999362931836988925_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Nz9tPi5VuBoAX96P9B0&_nc_ht=scontent.faly3-1.fna&oh=a0298fb1b4e2430074542420105f1625&oe=616DE575'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hazem Sayed',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'ازيك يا بيه عامل ايه واخبارك ايه؟',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.2:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ), ),
    MessengerModel(Row:Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-1/p200x200/102432327_1440126792864744_7071376281874044398_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_ohc=GL5LPf_TvYIAX9AAO0t&_nc_ht=scontent.faly3-1.fna&oh=6556832caac5bc3f95f6bba9673e8896&oe=616B7D3C'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mostafa Ahmed Radian',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'How are U bro and Your brother ziad i need to meet you soon man!!',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.5:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ), ),
    MessengerModel(Row:Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/232144146_3083877705229323_7769859354330206767_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=EUAmj--O1gAAX-UvWSI&_nc_ht=scontent.faly3-1.fna&oh=a09e43e5233c7dc5463d2acd1fa7bab7&oe=616E03C2'),
            ),
            // CircleAvatar(
            //   radius: 9.0,
            //   backgroundColor: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tarek idress',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'اي اخبارك واخبار سوريا وحلويات سوريا',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '0.6:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ), ),
  ];
  List<StoryModel>persons=
  [
    StoryModel(Container:Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/74440337_1751294131671274_4583411724731809792_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=grPSiNoWaZIAX83bJoe&tn=eb6gaPziwfRBFCmv&_nc_ht=scontent.faly3-1.fna&oh=23e9199c51e7418ab203232da81f46b4&oe=616AF72A'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Anas Emad Anoosh',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ), ),
    StoryModel(Container: Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/124686399_3488115654636100_7993384065345407916_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=v26chtWQhh8AX8kYmIt&_nc_ht=scontent.faly3-1.fna&oh=d2f09f0a07b81d904ecb3f4519f53622&oe=616ECB6C'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Ali Mohamed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container:  Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/102432327_1440126792864744_7071376281874044398_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=GL5LPf_TvYIAX9AAO0t&_nc_ht=scontent.faly3-1.fna&oh=72763ba803e44afd37c8d55e3eb8a610&oe=616EBAFB'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Mostafa Ahmed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container: Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/117309124_3522298714488821_6999362931836988925_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Nz9tPi5VuBoAX96P9B0&_nc_ht=scontent.faly3-1.fna&oh=a0298fb1b4e2430074542420105f1625&oe=616DE575'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Hazem Sayed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container: Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/238263643_1965128840313819_4933171971038912767_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=SutPuoPHRwAAX-oOA9b&_nc_ht=scontent.faly3-1.fna&oh=844bc841179f83db2a629abe9025e162&oe=616ED6E7'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Mohamed idress',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container:Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/74440337_1751294131671274_4583411724731809792_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=grPSiNoWaZIAX83bJoe&tn=eb6gaPziwfRBFCmv&_nc_ht=scontent.faly3-1.fna&oh=23e9199c51e7418ab203232da81f46b4&oe=616AF72A'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Anas Emad Anoosh',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ), ),
    StoryModel(Container: Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/124686399_3488115654636100_7993384065345407916_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=v26chtWQhh8AX8kYmIt&_nc_ht=scontent.faly3-1.fna&oh=d2f09f0a07b81d904ecb3f4519f53622&oe=616ECB6C'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Ali Mohamed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container:  Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/102432327_1440126792864744_7071376281874044398_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=GL5LPf_TvYIAX9AAO0t&_nc_ht=scontent.faly3-1.fna&oh=72763ba803e44afd37c8d55e3eb8a610&oe=616EBAFB'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Mostafa Ahmed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container: Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/117309124_3522298714488821_6999362931836988925_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Nz9tPi5VuBoAX96P9B0&_nc_ht=scontent.faly3-1.fna&oh=a0298fb1b4e2430074542420105f1625&oe=616DE575'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Hazem Sayed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container: Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/238263643_1965128840313819_4933171971038912767_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=SutPuoPHRwAAX-oOA9b&_nc_ht=scontent.faly3-1.fna&oh=844bc841179f83db2a629abe9025e162&oe=616ED6E7'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Mohamed idress',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container:Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/74440337_1751294131671274_4583411724731809792_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=grPSiNoWaZIAX83bJoe&tn=eb6gaPziwfRBFCmv&_nc_ht=scontent.faly3-1.fna&oh=23e9199c51e7418ab203232da81f46b4&oe=616AF72A'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Anas Emad Anoosh',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ), ),
    StoryModel(Container: Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/124686399_3488115654636100_7993384065345407916_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=v26chtWQhh8AX8kYmIt&_nc_ht=scontent.faly3-1.fna&oh=d2f09f0a07b81d904ecb3f4519f53622&oe=616ECB6C'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Ali Mohamed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container:  Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/102432327_1440126792864744_7071376281874044398_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=GL5LPf_TvYIAX9AAO0t&_nc_ht=scontent.faly3-1.fna&oh=72763ba803e44afd37c8d55e3eb8a610&oe=616EBAFB'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Mostafa Ahmed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container: Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/117309124_3522298714488821_6999362931836988925_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Nz9tPi5VuBoAX96P9B0&_nc_ht=scontent.faly3-1.fna&oh=a0298fb1b4e2430074542420105f1625&oe=616DE575'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Hazem Sayed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
    StoryModel(Container: Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/238263643_1965128840313819_4933171971038912767_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=SutPuoPHRwAAX-oOA9b&_nc_ht=scontent.faly3-1.fna&oh=844bc841179f83db2a629abe9025e162&oe=616ED6E7'),
              ),
              // CircleAvatar(
              //   radius: 9.0,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Mohamed idress',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    ),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/74440337_1751294131671274_4583411724731809792_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=0sQlwZd1Sh4AX8BncS6&tn=eb6gaPziwfRBFCmv&_nc_ht=scontent.faly3-1.fna&oh=390d322d37d469577163d84d6b916f32&oe=616AF72A'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection:Axis.horizontal,
                  itemBuilder: (context,index)=>StoryItem(persons[index]),
                  separatorBuilder: (context,index)=>SizedBox(width: 20.0,),
                  itemCount:persons.length,
                ),
              ),
              SizedBox(height: 20.0,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index)=>ChatItem(users[index]),
                separatorBuilder: (context,index)=> SizedBox(height: 20.0,),
                itemCount: users.length,),
            ],

          ),
        ),
      ),
    );
  }

  Widget ChatItem(MessengerModel row)
  {
    return  row.Row;
  }

  Widget StoryItem(StoryModel contaner)
  {
    return contaner.Container;
  }

}
