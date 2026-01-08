import 'package:brainbox_ai/Services/ChatService/ChatService.dart';
import 'package:brainbox_ai/Services/ChatService/IChatService.dart';
import 'package:brainbox_ai/app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<IChatService>(ChatService());
  
  runApp(const MyApp());
}
