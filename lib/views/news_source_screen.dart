import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/models/artical_model.dart';
import 'package:kabar/services/news_api_service.dart';
import 'package:kabar/views/home_page.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:kabar/views/widgets/CustomLoginButton.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import '../models/news_model.dart';

class NewsSourceScreen extends StatefulWidget {
  const NewsSourceScreen({super.key});

  @override
  State<NewsSourceScreen> createState() => _NewsSourceScreenState();
}

class _NewsSourceScreenState extends State<NewsSourceScreen> {
  final TextEditingController newsSearchController = TextEditingController();
  List<NewsModel> cards = [];
  List<ArticleModel> articlesCard = [];
  bool isLoading = true;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 14,
          right: 14,
          bottom: 24,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: isPortrait ? size.height - 40 : size.height * 1.3,
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Spacer(),
                  Text(
                    AppConstants.nssHeadingTxt,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              TextField(
                controller: newsSearchController,
                decoration: InputDecoration(
                  hintText: AppConstants.ctrHintTxt,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: articlesCard.length,
                        itemBuilder: (context, index) {
                          final c = articlesCard[index];
                          return Cards(
                            id: c.id,
                            imagePath: CustomImagesPath.nssCnbcImage,
                            title: c.name,
                            isSelected: c.isSelected,
                            onPressed: () {
                              setState(() {
                                c.isSelected = !c.isSelected;
                              });
                            },
                          );
                        },
                      ),
              ),
              Container(
                height: size.height * 0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0xff000000).withAlpha(5),
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomLoginButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),

                          ),
                        );
                      },
                      buttonTitle: AppConstants.hsNextBtnTxt,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String id;
  final String imagePath;
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  const Cards({
    super.key,
    required this.id,
    required this.imagePath,
    required this.title,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppTheme.darkModeWhite
            : AppTheme.blackColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppTheme.darkModeWhite
                    : AppTheme.blackColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: CircleAvatar(
                radius: 52,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(imagePath, width: 90, height: 90),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.primaryColor),
                ),
                child: Text(
                  isSelected
                      ? AppConstants.nssFollowingTxt
                      : AppConstants.nssFollowTxt,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: isSelected ? Colors.white : AppTheme.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}