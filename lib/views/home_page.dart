import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/model_view/theme_provider.dart';
import 'package:kabar/models/artical_model.dart';
import 'package:kabar/services/news_api_service.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchHomeController = TextEditingController();

  List<ArticleModel> articlesCard = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadArticles();
  }

  Future<void> loadArticles() async {
    try {
      final response = await NewsApiService().getArticles();
      final List articlesList = response.data['articles'];
      setState(() {
        articlesCard = articlesList
            .map((json) => ArticleModel.fromJson(json))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching news: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                  width: 150,
                  child: SvgPicture.asset(CustomImagesPath.appLogoImage),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none),
                ),
              ],
            ),
            SizedBox(
              height: 48,
              child: TextField(
                controller: searchHomeController,
                decoration: InputDecoration(
                  hintText: AppConstants.ctrHintTxt,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: themeProvider.isDark(context)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(CustomImagesPath.hpsMenuImage),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppConstants.hpsTrendingTxt,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: themeProvider.isDark(context)
                        ? AppTheme.greyColor
                        : AppTheme.blackColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppConstants.hpsSeeAllTxt,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(
                      articlesCard.first.urlToImage ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    articlesCard.first.title ?? '',
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
                        articlesCard.first.name,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: themeProvider.isDark(context)
                              ? AppTheme.greyColor
                              : AppTheme.blackColor,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppConstants.hpsLatestTxt,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: themeProvider.isDark(context)
                        ? AppTheme.greyColor
                        : AppTheme.blackColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppConstants.hpsSeeAllTxt,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Image.network(articlesCard.first.urlToImage),
              title: Text(articlesCard[2].title,style: Theme.of(context).textTheme.bodyMedium ,maxLines: 2,),
              subtitle:  Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: SvgPicture.asset(CustomImagesPath.nssCnbcImage),
                  ),
                  SizedBox(width: 5),
                  Text(
                    articlesCard[2].name,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: themeProvider.isDark(context)
                          ? AppTheme.greyColor
                          : AppTheme.blackColor,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
