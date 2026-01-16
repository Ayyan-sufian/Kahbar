import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/model_view/theme_bloc/theme_bloc.dart';
import 'package:kabar/views/theme/app_theme.dart' show AppTheme;
import 'package:kabar/views/topics_screen.dart';
import 'package:kabar/views/widgets/CustomLoginButton.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final TextEditingController searchController = TextEditingController();
  Country? selectedCountry;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        AppConstants.ctrHeadingTxt,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppTheme.darkModeWhite
                              : AppTheme.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        favorite: const ['PK', 'IN', 'US', 'GB'],
                        onSelect: (Country country) {
                          setState(() {
                            selectedCountry = country;
                            searchController.text =
                                '${selectedCountry!.flagEmoji} +${selectedCountry!.phoneCode}  ${selectedCountry!.name}';
                          });
                        },
                      );
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: AppConstants.ctrHintTxt,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? AppTheme.darkModeWhite
                                  : AppTheme.blackColor,                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

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
                                builder: (context) => TopicsScreen(),
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
