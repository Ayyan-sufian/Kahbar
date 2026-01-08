import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/views/counter_screen.dart';
import 'package:kabar/views/widgets/CustomLoginButtom.dart';
import 'package:svg_flutter/svg.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
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
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.3,),
                SvgPicture.asset(CustomImagesPath.appLogoImage),
                SizedBox(height: 65,),
                Text(AppConstants.congratulationTxt,style: Theme.of(context).textTheme.headlineMedium,),
                SizedBox(height: 8,),
                Text(AppConstants.congratulationContentTxt,style: Theme.of(context).textTheme.bodyMedium,),
                Spacer(),
                CustomLoginButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CounterScreen(),));
                }, buttonTitle: AppConstants.csGoHomeTxt),
                SizedBox(height: 24 ,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
