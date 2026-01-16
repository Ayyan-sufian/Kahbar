import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/model_view/theme_bloc/theme_bloc.dart';
import 'package:kabar/models/artical_model.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomNewsList extends StatelessWidget {
  const CustomNewsList({
    super.key,
    required this.articlesCard,
    required this.imagePath,
    required this.title,
    required this.name,
  });

  final List<ArticleModel> articlesCard;
  final String imagePath;
  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imagePath ?? '',
                height: 130,
                width: 100,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/img/place_holder.png")),
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        child: SvgPicture.asset(CustomImagesPath.nssCnbcImage),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          name ?? '',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppTheme.darkModeWhite
                                : AppTheme.blackColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }
}
