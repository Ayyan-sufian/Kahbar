import 'package:flutter/material.dart';
import 'package:kabar/model_view/theme_provider.dart';
import 'package:kabar/views/login_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<dynamic> slider = [
    "assets/img/silder1.png",
    "assets/img/slider2.png",
    "assets/img/silder3.png",
  ];

  int get isLast => slider.length - 1;

  void _nextSlide() {
    if (_currentIndex < slider.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  void _backSlide() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size,
            width: double.infinity,
            child: PageView.builder(
              itemCount: slider.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  slider[index],
                  height: size,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  "Lorem Ipsum is simply dummyc",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 120),

                Row(
                  children: [
                    Row(
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          height: 14,
                          width: 14,
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _currentIndex == index
                                ? AppTheme.lightTheme.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),

                    _currentIndex > 0 ? TextButton(
                      onPressed: () {
                        _backSlide();
                      },
                      child: Text(
                       "Back" ,style: TextStyle(color: Colors.grey),
                      ),
                    ) : SizedBox(),
                    SizedBox(width: 8,),
                    ElevatedButton(
                      onPressed: () {
                        _nextSlide();
                      },
                      child: Text(
                        _currentIndex == slider.length - 1
                            ? "Get Started"
                            : "Next",
                      ),
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
