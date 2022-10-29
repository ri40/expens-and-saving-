import 'package:flutter/material.dart';
import 'package:rimah/page/expens.dart';
import 'package:rimah/page/saving.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Expense'),
                Tab(text: 'Saving'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ExpensePage(),
              SavingPage(),
            ],
          )));
}
