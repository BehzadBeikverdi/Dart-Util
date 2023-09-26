import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

String replaceFarsiNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }

  return input;
}

String replaceEnglishNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < farsi.length; i++) {
    input = input.replaceAll(farsi[i], english[i]);
  }

  return input;
}

launchURL(String url) async {
  final uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  } catch(e) {
    print("There isn't a url!");
  }

}

deleteCacheDir() async {
  final cacheDir = await getTemporaryDirectory();

  if (cacheDir.existsSync()) {
    cacheDir.deleteSync(recursive: true);
    print("_deleteCacheDir");
  }

}

 deleteAppDir() async {
  final appDir = await getApplicationSupportDirectory();

  if(appDir.existsSync()){
    appDir.deleteSync(recursive: true);
    print("_deleteAppDir");
  }
}

 deleteFile(File file) async {
  try {
    await file.delete();
  } catch (e) {
    return 0;
  }
}



fileSize(File file) {
  final bytes = file.readAsBytesSync().lengthInBytes;
  final kb = bytes / 1024;
  final mb = kb / 1024;

  print("$mb MB");
  return mb;
}

  String splitByLength(String text) {
    if(text.length == 9) {
      return "${text.substring(0, 3)}/${text.substring(3, 6)}/${text.substring(6, 9)}";
    }
    if(text.length == 8) {
      return "${text.substring(0, 2)}/${text.substring(2, 5)}/${text.substring(5, 8)}";
    }
    if(text.length == 7) {
      return "${text.substring(0, 1)}/${text.substring(1, 4)}/${text.substring(4, 7)}";
    }
    else {
      return text;
    }
  }

String getCapitalizedName(String name) {
  final names = name.split(' ');
  String finalName = '';
  for (var n in names) {
    n.trim();
    if (n.isNotEmpty) {
      finalName += '${n[0].toUpperCase()}${n.substring(1)} ';
    }
  }
  return finalName.trim();
}

String removeWhiteSpace(String name) {
  print(name.replaceAll(new RegExp(r"\s+"), ""));
  return name.replaceAll(new RegExp(r"\s+"), "");
}

getFileSize(File file) {
  int sizeInBytes = file.lengthSync();
  double sizeInMb = sizeInBytes / (1024 * 1024);
  return sizeInMb;
}

String capitalize(String text) {
  return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
}

String capitalizeByWord(String text) {
  if (text.trim().isEmpty) {
    return '';
  }
  return text.split(' ')
      .map((element) =>
  "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
      .join(" ");
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
