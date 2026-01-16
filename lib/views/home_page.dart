import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/model_view/theme_bloc/theme_bloc.dart';
import 'package:kabar/models/artical_model.dart';
import 'package:kabar/services/news_api_service.dart';
import 'package:kabar/views/leatest_news_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:kabar/views/trending_screen.dart';
import 'package:kabar/views/widgets/custom_news_list.dart';
import 'package:kabar/views/widgets/custom_trending_list.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import '../model_view/acticle_bloc/articles_bloc.dart';

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
      context.read<ArticlesBloc>().add(FetchArticlesEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ArticleError) {
            return Center(child: Text(state.message.toString()));
          }

          if (state is ArticleLoaded) {
            final articleVM = state.articles;

            return Padding(
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
                          child: SvgPicture.asset(
                            CustomImagesPath.appLogoImage,
                          ),
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
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? AppTheme.darkModeWhite
                                  : AppTheme.blackColor,                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              CustomImagesPath.hpsMenuImage,
                            ),
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
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppTheme.darkModeWhite
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

                    if (state is ArticleLoaded)
                      CustomTrendingList(
                        articlesCard: state.articles,
                        imagePath: state.articles.first.urlToImage,
                        title: state.articles.first.title,
                        name: state.articles.first.name,
                      ),

                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppConstants.hpsLatestTxt,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppTheme.darkModeWhite
                                : AppTheme.blackColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LatestNewsScreen(),
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
                    if (state.articles.length > 2)
                      CustomNewsList(
                        articlesCard: articleVM,
                        imagePath: articleVM[2].urlToImage,
                        title: articleVM[2].title,
                        name: articleVM[2].name,
                      ),

                    if (articleVM.length > 3)
                      CustomNewsList(
                        articlesCard: articleVM,
                        imagePath: articleVM[3].urlToImage,
                        title: articleVM[3].title,
                        name: articleVM[3].name,
                      ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
