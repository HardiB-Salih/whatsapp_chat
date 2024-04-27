import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/models/user_model.dart';
import '../../../common/widgets/custom_icon_button.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key,  required this.user});

  final UserModel user;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              const Icon(Icons.arrow_back),
              Hero(
                tag: 'profile',
                child: Container(
                  width: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(user.profileImageUrl),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.username, style: const TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 3),
            const Text('Last seen 2min ago', style: TextStyle(fontSize: 12,),)
          ],
        ),
        actions: [
          CustomIconButton(onPressed: () {}, icon: Icons.video_call, iconColor: Colors.white,),
          CustomIconButton(onPressed: () {}, icon: Icons.call, iconColor: Colors.white),
          CustomIconButton(onPressed: () {}, icon: Icons.more_vert, iconColor: Colors.white),
        ],
      ),
    );
  }
}
