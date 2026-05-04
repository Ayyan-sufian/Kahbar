class AppConstants{
  /// This is forgot screen Strings
  static const String forgotPasswordTxt = "Forgot Password ?";
  static const String forgotPasswordContentTxt =  "Don’t worry! it happens. Please enter the\naddress associated with your account.";
  static const String fPEmailTxt =  "Email*";
  static const String fPSubmitTxt =  'Submit';
  /// Home screen Strings
  static const String loremIpsumHeadingTxt = "Lorem Ipsum is simply dummyc";
  static const String loremIpsumContentTxt = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  static const String hsBackBtnTxt = "Back";
  static const String hsGetStartedBtnTxt = "Get started";
  static const String hsNextBtnTxt = "Next";
  /// Login screen Strings
  static const String lgHelloTxt = "Hello";
  static const String lgAgainTxt = "Again?";
  static const String lgContentTxt = "Welcome back you’ve\nbeen missed";
  static const String lgInvalidEmailTxt = "Invalid Email";
  static const String lgInvalidPassTxt = "Invalid password";
  static const String lgPassTxt = "Password*";
  static const String lgRememberTxt = "Remember me";
  static const String lgLoginTxt = "Login";
  static const String lgSignUpTxt = "Sign up";
  static const String lgContinueWithTxt = "Or continue with";
  static const String lgFacebookTxt = "FaceBook";
  static const String lgGoogleTxt = "Google";
  static const String lgHaveNoAccTxt = "Don't have account ?";

  /// SignUp screen
  static const String suHelloTxt = "Hello!";
  static const String suContentTxt = "Signup to get Started";
  static const String suNameTxt = "Name*";
  static const String suConfirmPassTxt = "Confirm Password*";
  static const String suAlreadyHaveAccTxt = "Already have account ?";
  static const String suPassNotSameTxt = "Password is not same";

  /// Verification screen
  static const String vsOtpTxt = "OTP Verification";
  static const String vsContentTxt = "Enter the OTP sent to ";
  static const String vsResendTxt = "Resend";
  static const String vsResendCodeTxt = "Resend code in ";

  /// Congratulations screen
  static const String congratulationTxt = "Congratulations!";
  static const String congratulationContentTxt = "Your account is ready to use";
  static const String csGoHomeTxt = "Go to Homepage";

  /// Country screen
  static const String ctrHeadingTxt = "Select your Country";
  static const String ctrHintTxt = "Search";

  /// Topics screen
  static const String tpsHeadingTxt = "Select your Topics";
  static const String tpsNationalTxt = "National";
  static const String tpsInternationalTxt = "International";
  static const String tpsSportTxt = "Sport";
  static const String tpsLifestyleTxt = "Lifestyle";
  static const String tpsBusinessTxt = "Business";
  static const String tpsHealthTxt = "Health";
  static const String tpsFashionTxt = "Fashion";
  static const String tpsTechnologyTxt = "Technology";
  static const String tpsScienceTxt = "Science";
  static const String tpsArtTxt = "Art";
  static const String tpsPoliticsTxt = "Politics";

  /// Rest pass screen
  static const String rpsHeadingTxt = "Reset Password";
  static const String rpsNewPassTxt = "New Password";
  static const String rpsConfirmNewPassTxt = "Confirm new Password";
  static const String rpsBtnTxt = "Submit";

  /// News Source screen
  static const String nssHeadingTxt = "Choose your News Sources";
  static const String nssFollowTxt = "Follow";
  static const String nssFollowingTxt = "Following";
  static const String nssBccTxt = "BCC";
  static const String nssCnbcTxt = "CNBC";
  static const String nssCnnTxt = "CNN";

  /// Home Page
  static const String hpsTrendingTxt = "Trending";
  static const String hpsSeeAllTxt = "See all";
  static const String hpsLatestTxt = "Latest";
  static const String hpsNoArticleTxt = "No Articles";
}
class CustomImagesPath{
  static const String appLogoImage= "assets/img/logo.svg";
  /// home screen img
  static const String slider1Image= "assets/img/slider1.png";
  static const String slider2Image= "assets/img/slider2.png";
  static const String slider3Image= "assets/img/slider3.png";
  /// Login screen img
  static const String lgFacebookImage = "facebook.svg";
  static const String lgGoogleImage = "google.svg";

  /// News source screen img
  static const String nssBccImage = "assets/img/bcc_logo.svg";
  static const String nssCnnImage = "assets/img/cnn.svg";
  static const String nssCnbcImage = "assets/img/cbnc.svg";

  /// Home Page
  static const String hpsMenuImage = "assets/img/menu.svg";
}

class Endpoints{
  static const String apiKey = "c440e5e558544b739cf4f6546604c475";
  static const String baseUrl = "https://newsapi.org/v2";
  static const String getNewsApiPath = "/top-headlines/sources";
  static const String articleApiPath = "/top-headlines";
}