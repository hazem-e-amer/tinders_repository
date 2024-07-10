import '../languages.dart';

class LanguageAr extends BaseLanguage {
  @override
  String get appName => "";

  @override
  String get logIn => "تسجيل دخول";

  @override
  String get logInWithFingerSignature => "أو تسجيل الدخول من خلال البصمة";

  @override
  // TODO: implement decisions
  String get decisions => "القرارات";


  ///TODO Decisions Keys
  @override
  String get decision => "قرار";

  @override
  String get meetingMinuts =>"محضر اجتماع";

  @override
  String get preparatoryDisclousre => "كشف تحضيري";

  @override
  // TODO: implement normal
  String get normal => "عادي";

  @override
  // TODO: implement secret
  String get secret => "سري";

  @override
  String get password => "كلمة المرور";

  @override
  // TODO: implement username
  String get username =>"اسم المستخدم";
}
