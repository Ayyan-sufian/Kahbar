import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/model_view/article_view_model.dart';
import 'package:kabar/model_view/theme_provider.dart';
import 'package:kabar/views/widgets/custom_news_list.dart';
import 'package:provider/provider.dart';

class LatestNewsScreen extends StatefulWidget {
  const LatestNewsScreen({super.key});

  @override
  State<LatestNewsScreen> createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final articleVM = context.watch<ArticleViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Text(
                  AppConstants.hpsLatestTxt,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_outlined),
                ),
              ],
            ),
            if (articleVM.isLoading)
              Center(child: CircularProgressIndicator())
            else if (articleVM.articles.isEmpty)
              Text(
                AppConstants.hpsNoArticleTxt,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: articleVM.articles.length,
                  itemBuilder: (context, index) {
                    return CustomNewsList(
                      articlesCard: articleVM.articles,
                      themeProvider: themeProvider,
                      imagePath: articleVM.articles[index].urlToImage,
                      title: articleVM.articles[index].title,
                      name: articleVM.articles[index].name,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
