import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

@RoutePage()
class OtpScreen extends StatefulWidget {
  final String contact;
  final bool isPhone;
  const OtpScreen({super.key, required this.contact, required this.isPhone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String currentPin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Verification code',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We have sent OTP code verification to your ${widget.isPhone ? 'mobile no' : 'email'}',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(widget.contact, style: TextStyle(fontWeight: FontWeight.bold)),

            SizedBox(height: 30),
            PinCodeTextField(
              appContext: context,
              length: 4,
              onChanged: (value) => setState(() => currentPin = value),
              onCompleted: (value) {
                // khi nhập đủ 4 số — validate / submit
                print('Completed: $value');
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                fieldHeight: 60,
                fieldWidth: 60,
                activeFillColor: Colors.grey.shade200,
                selectedFillColor: Colors.grey.shade200,
                inactiveFillColor: Colors.grey.shade200,
                activeColor: Colors.grey,
                inactiveColor: Colors.grey,
                selectedColor: Colors.grey,
              ),
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
            ),

            Spacer(),
            ElevatedButton(
              onPressed: currentPin.length == 4
                  ? () {
                      // gọi API verify hoặc pop
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('OTP: $currentPin')),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
