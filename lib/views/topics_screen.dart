import 'package:flutter/material.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:kabar/views/widgets/CustomLoginButtom.dart';
import 'package:provider/provider.dart';

import '../helpers/constants.dart';
import '../model_view/theme_provider.dart';
import '../models/chips_moldel.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  final TextEditingController topicController = TextEditingController();

  List<ChipModel> chips = [
    ChipModel(id: 1, name: 'TEST', isSelected: false),
    ChipModel(id: 2, name: 'TE sdfndhfshfos ST', isSelected: false),
    ChipModel(id: 3, name: 'TEdhfsfisjafuwsiofjoljfohfuhrfio ifjoierfwefeohrfewrhf rfheroigegue rgegioeST', isSelected: false),
    ChipModel(id: 4, name: 'TEST', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final size = MediaQuery.of(context).size;
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
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: themeProvider.isDark(context)
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              InkWell(
                onTap: () {},
                child: AbsorbPointer(
                  absorbing: true,
                  child: TextField(
                    controller: topicController,
                    decoration: InputDecoration(
                      hintText: AppConstants.ctrHintTxt,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: themeProvider.isDark(context)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Wrap(
                children: [
                 Chips(id: chips[0].id, title: chips[0].name, isSelected: chips[0].isSelected, onTap: () {
                   setState(() {
                     chips[0].isSelected = !chips[0].isSelected; // toggle
                   });
                 },),
                  Chips(id: chips[1].id, title: chips[1].name, isSelected: chips[1].isSelected, onTap: () {
                   setState(() {
                     chips[1].isSelected = !chips[1].isSelected; // toggle
                   });
                 },),
                  Chips(id: chips[2].id, title: chips[2].name, isSelected: chips[2].isSelected, onTap: () {
                   setState(() {
                     chips[2].isSelected = !chips[2].isSelected; // toggle
                   });
                 },),
                  Chips(id: chips[3].id, title: chips[3].name, isSelected: chips[3].isSelected, onTap: () {
                   setState(() {
                     chips[3].isSelected = !chips[3].isSelected; // toggle
                   });
                 },),
                ],
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
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         CongratulationsScreen(),
                        //   ),
                        // );
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
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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

