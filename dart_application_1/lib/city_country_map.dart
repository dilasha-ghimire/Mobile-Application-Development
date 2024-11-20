import 'dart:io';

void main() {
  Map cityCountry = <String, String>{};

  cityCountry["New York"] = "USA";
  cityCountry["London"] = "UK";
  cityCountry["Paris"] = "France";
  cityCountry["Tokyo"] = "Japan";
  cityCountry["Sydney"] = "Australia";

  cityCountry.forEach((city, country) {
    print("$city is in $country");
  });

  print("Enter a city: ");
  String? search = stdin.readLineSync();
  if (search != null) {
    search = search.trim(); // to avoid errors (eg. extra spaces)
    if (cityCountry.containsKey(search)) {
      print("$search is in ${cityCountry[search]}");
    }
    else {
      print("$search is not in the list");
    }
  }
}
