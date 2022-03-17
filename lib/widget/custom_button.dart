import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  ElevatedButton build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        primary: const Color(0xFFA1333C),
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        // shape: StadiumBorder(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
