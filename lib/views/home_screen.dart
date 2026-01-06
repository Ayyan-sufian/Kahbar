import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/views/login_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<dynamic> slider = [
    CustomImagesPath.slider1Image,
    CustomImagesPath.slider2Image,
    CustomImagesPath.slider3Image,
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
    final size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
           maxHeight: isPortrait ? size.height : size.height * 1.3,
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height* 0.7,
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
                      height: size.height* 0.7,
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
                      AppConstants.loremIpsumHeadingTxt,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      AppConstants.loremIpsumContentTxt,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Spacer(),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
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
                                ? AppTheme.primaryColor
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
                        AppConstants.hsBackBtnTxt ,style: TextStyle(color: Colors.grey),
                      ),
                    ) : SizedBox(),
                    SizedBox(width: 8,),
                    ElevatedButton(
                      onPressed: () {
                        _nextSlide();
                      },
                      child: Text(
                        _currentIndex == slider.length - 1
                            ? AppConstants.hsGetStartedBtnTxt
                            : AppConstants.hsNextBtnTxt,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
