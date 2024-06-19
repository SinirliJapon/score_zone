abstract class Functions {
  static String calculateAge(String? dateOfBirth) {
    String playerAge = "";
    
      try {
        DateTime birthDate = DateTime.parse(dateOfBirth!);
        DateTime today = DateTime.now();
        int age = today.year - birthDate.year;
        if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
          age--;
        }
        playerAge = age.toString();
      } catch (e) {
        playerAge = "Unkown";
      }

    return playerAge;
  }

  static String shortenName(String name) {
    if (name.length <= 20) {
      return name;
    }

    List<String> parts = name.split(' ');

    if (parts.length == 1) {
      return name;
    }

    String shortenedName = '';

    String lastName = parts.last;
    shortenedName += lastName;
    return shortenedName;
  }
}
