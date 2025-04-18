import 'package:bai1/app/home_controller.dart';
import 'package:bai1/share/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({super.key}) : super(controller: HomeController());

  @override
  Widget builderChild(BuildContext context) {
    // TODO: implement builderChild
    throw UnimplementedError();
  }

  @override
  Widget builderProvider(BuildContext context, HomeController controller) {
    return Scaffold(
      appBar: AppBar(title: Text('APPME'),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Hello', style: TextStyle(color: Colors.black),),
            /*TextField(
              controller: controller.prompt,
              onChanged: (value) => controller.setPrompt(value),
            ),*/
          ],
        ),
      ),
    );
  }

  @override
  void initState(BuildContext context, HomeController? controller) {
    // TODO: implement initState
  }
}
