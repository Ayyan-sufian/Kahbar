import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/model_view/acticle_bloc/articles_bloc.dart';
import 'package:kabar/views/widgets/custom_trending_list.dart';
import 'package:provider/provider.dart';


class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticleLoaded) {
            final articleBloc = state.articles;

            return Padding(
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
                        AppConstants.hpsTrendingTxt,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert_outlined),
                      ),
                    ],
                  ),
                  if (state is ArticleLoading)
                    Center(child: CircularProgressIndicator())
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: articleBloc.length,
                        itemBuilder: (_, index) {
                          return CustomTrendingList(
                            articlesCard: articleBloc,
                            imagePath: articleBloc[index].urlToImage,
                            title: articleBloc[index].title,
                            name: articleBloc[index].name,
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          }
          return Text(
            AppConstants.hpsNoArticleTxt,
            style: Theme.of(context).textTheme.bodyMedium,
          );
        },
      ),
    );
  }
}
