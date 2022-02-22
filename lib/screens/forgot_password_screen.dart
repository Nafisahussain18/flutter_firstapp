import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailPhoneController = TextEditingController();

  @override
  void initState() {
    emailPhoneController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFDFDFD),
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Text(
                "Forgot Password",
                style: TextStyle(color: Color(0xff747474), fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
              child: TextField(
                controller: emailPhoneController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  hintText: "Enter Email ID / Phone Number",
                  hintStyle: TextStyle(color: Color(0xff939393)),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff808080)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: validateForgotPasswordField()
                    ? () {
                        print("Aya");
                      }
                    : null,
                child: const Text("Submit")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back To Login"))
          ],
        ),
      ),
    );
  }

  bool validateForgotPasswordField() {
    if (emailPhoneController.text.isEmpty) {
      return false;
    } else {
      setState(() {});
      return true;
    }
  }
}
