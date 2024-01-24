

sealed class KTString{

  static const String findSport = "findSport";
  static const String languages = "languages";
  static const String changeLanguage = "changeLanguage";
  static const String signUp = "signUp";
  static const String firsName = "firsName";
  static const String lastName = "lastName";
  static const String phoneNumber = "phoneNumber";
  static const String password = "password";
  static const String prePassword = "prePassword";
  static const String save = "save";
  static const String enterFirstName = "enterFirstName";
  static const String enterLastName = "enterLastName";
  static const String enterPassword = "enterPassword";
  static const String enterPrePassword = "enterPrePassword";
  static const String addressMapAddress = "addressMapAddress";
  static const String newAdd = "newAdd";
  static const String title = "title";
  static const String description = "description";
  static const String enterProductTitle = "enterProductTitle";
  static const String enterDescription = "enterDescription";
  static const String changeLocation = "changeLocation";
  static const String addressByLocation = "addressByLocation";
  static const String russia = "russia";
  static const String uzb = "uzb";
  static const String uzbKrill = "uzbKrill";
  static const String successful = "successful";

  static const String checkData = "checkData";
  static const String somethingError = "somethingError";
  static const String passwordMessage = "passwordMessage";
  static const String confirmMessage = "confirmMessage";
  static const String nameMessage = "nameMessage";
  static const String familyMessage = "familyMessage";
  static const String phoneMessage = "phoneMessage";
}


enum CategoryEnum{
  uzbek(KTString.uzb),
  uzbekirill(KTString.uzbKrill),
  rassiya(KTString.russia);
  const CategoryEnum(this.text);
  final String text;
}