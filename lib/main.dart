import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile/widgets/restart_widget.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('crdenticals');
  await Hive.openBox('settings');
  OpenAI.apiKey = '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';

  runApp(const RestartWidget(child: App()));
}
