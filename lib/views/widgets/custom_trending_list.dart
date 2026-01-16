import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/model_view/theme_provider.dart';
import 'package:kabar/models/artical_model.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomTrendingList extends StatelessWidget {
  const CustomTrendingList({
    super.key,
    required this.articlesCard,
    required this.themeProvider,
    required this.imagePath,
    required this.title,
    required this.name,
  });

  final List<ArticleModel> articlesCard;
  final ThemeProvider themeProvider;
  final String imagePath;
  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.network(
            imagePath ?? 'https://via.placeholder.com/150',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/img/place_holder.png');
            },
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: SvgPicture.asset(CustomImagesPath.nssCnbcImage),
            ),
            SizedBox(width: 5),
            Text(
              name,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: themeProvider.isDark(context)
                    ? AppTheme.greyColor
                    : AppTheme.blackColor,
              ),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_outlined)),
          ],
        ),
      ],
    );
  }
}
