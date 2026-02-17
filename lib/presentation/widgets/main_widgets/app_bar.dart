import 'package:flutter/material.dart';
import 'package:youtube_clone/core/consts/dimens.dart';
import 'package:youtube_clone/core/consts/strings.dart';
import 'package:youtube_clone/core/extensions/sized_box.dart';
import 'package:youtube_clone/gen/assets.gen.dart';

class CustomTopAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomTopAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      title: Row(
        spacing: AppDimens.paddingSmall,
        children: [
    
          Image.asset(
            Assets.img.youtubeLogo.path,
            width: AppDimens.iconSizeLarge,
            height: AppDimens.iconSizeLarge,
          ),
    
          Text(
            AppString.brandName,
            style: textTheme.labelLarge
          ),
        ],
      ),
      actions: [
        Icon(Icons.tv_outlined),
    
        AppDimens.paddingLarge.width,
    
        Icon(Icons.notifications_outlined),
    
        AppDimens.paddingLarge.width,
    
        Icon(Icons.search),
    
        AppDimens.paddingLarge.width,
    
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 16,
          child: Text('A'),
        ),
    
        AppDimens.paddingSmall.width,
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}