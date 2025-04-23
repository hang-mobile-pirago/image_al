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
      appBar: AppBar(
        title: Text('APP ME'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.isLoading
                ? CircularProgressIndicator()
                : controller.genImageFile != null
                    ? Image.file(controller.genImageFile!,
                        key: ValueKey(
                          DateTime.now(),
                        ))
                    : Icon(Icons.abc_outlined),
            SizedBox(height: 20),
            BBSTextField(
              controller: controller.prompt,
              onChange: (txt) => controller.setPrompt(txt),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.sizeOf(context).width,
              height: 42,
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  textStyle: WidgetStateProperty.all(TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => controller.getImage(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.sizeOf(context).width,
              height: 42,
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  textStyle: WidgetStateProperty.all(TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  'Download',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
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
