import 'package:flutter/material.dart';
import 'package:kabar/views/news_source_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:kabar/views/widgets/CustomLoginButton.dart';
import 'package:provider/provider.dart';

import '../helpers/constants.dart';
import '../model_view/theme_provider.dart';
import '../models/chips_model.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  final TextEditingController topicController = TextEditingController();

  List<ChipModel> chips = [
    ChipModel(id: 1, name: AppConstants.tpsNationalTxt, isSelected: false),
    ChipModel(id: 2, name: AppConstants.tpsInternationalTxt, isSelected: false),
    ChipModel(id: 3, name: AppConstants.tpsSportTxt, isSelected: false),
    ChipModel(id: 4, name: AppConstants.tpsLifestyleTxt, isSelected: false),
    ChipModel(id: 5, name: AppConstants.tpsBusinessTxt, isSelected: false),
    ChipModel(id: 6, name: AppConstants.tpsHealthTxt, isSelected: false),
    ChipModel(id: 7, name: AppConstants.tpsFashionTxt, isSelected: false),
    ChipModel(id: 8, name: AppConstants.tpsTechnologyTxt, isSelected: false),
    ChipModel(id: 9, name: AppConstants.tpsScienceTxt, isSelected: false),
    ChipModel(id: 10, name: AppConstants.tpsArtTxt, isSelected: false),
    ChipModel(id: 11, name: AppConstants.tpsPoliticsTxt, isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
          child: Column(
            children: [
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
                    AppConstants.tpsHeadingTxt,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                      color: themeProvider.isDark(context)
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                ],
              ),

              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                 children: List.generate(chips.length, (index) {
                    return Chips(id: chips[index].id,
                        title: chips[index].name,
                        isSelected: chips[index].isSelected,
                        onTap: (){
                      setState(() {
                        chips[index].isSelected = !chips[index].isSelected;
                      });
                        });
                  },)
              ),

              Spacer(),
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
                            builder: (context) =>
                               NewsSourceScreen()
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

class Chips extends StatelessWidget {
  final int id;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const Chips({
    super.key,
    required this.id,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.primaryColor),
          ),
          child: Text(
            title,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium!
                .copyWith(
              color: isSelected
                  ? Colors.white
                  : AppTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

