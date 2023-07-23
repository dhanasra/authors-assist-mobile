import 'package:mobile/network/models/template.dart';

import 'network/models/user.dart';

class Global {

  static User? user;

  static List<Template> templates = [];
  static List<String> categories = [];

  static List<Template> getTemplates(String category){
    return templates.where((element) => element.category==category).toList();
  }

}