import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/model_view/theme_provider.dart';
import 'package:kabar/views/leatest_news_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:kabar/views/trending_screen.dart';
import 'package:kabar/views/widgets/custom_news_list.dart';
import 'package:kabar/views/widgets/custom_trending_list.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import '../model_view/article_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchHomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleViewModel>().fetchArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final articleVM = context.watch<ArticleViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
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
              SizedBox(height: 12),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrendingScreen(),
                        ),
                      );
                    },
                    child: Text(
                      AppConstants.hpsSeeAllTxt,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              if (articleVM.isLoading)
                const CircularProgressIndicator()
              else if (articleVM.articles.isEmpty)
                const Text("No articles found")
              else ...[
                CustomTrendingList(
                  articlesCard: articleVM.articles,
                  themeProvider: themeProvider,
                  imagePath: articleVM.articles.first.urlToImage,
                  title: articleVM.articles.first.title,
                  name: articleVM.articles.first.name,
                ),
              ],

              SizedBox(height: 12),
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LatestNewsScreen(),));
                    },
                    child: Text(
                      AppConstants.hpsSeeAllTxt,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              if (articleVM.articles.length > 2)
                CustomNewsList(
                  articlesCard: articleVM.articles,
                  themeProvider: themeProvider,
                  imagePath: articleVM.articles[2].urlToImage,
                  title: articleVM.articles[2].title,
                  name: articleVM.articles[2].name,
                ),

              if (articleVM.articles.length > 3)
                CustomNewsList(
                  articlesCard: articleVM.articles,
                  themeProvider: themeProvider,
                  imagePath: articleVM.articles[3].urlToImage,
                  title: articleVM.articles[3].title,
                  name: articleVM.articles[3].name,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
