part of 'widgets.dart';

class BBSTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String? txt)? onChange;

  BBSTextField({this.controller, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'prompt',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black38)),
          child: TextField(
            controller: controller,
            onChanged: (value) => onChange?.call(value),
            decoration: InputDecoration(
              border: InputBorder.none, // removes the underline
              hintText: 'Enter text',
            ),
          ),
        ),
      ],
    );
  }
}
