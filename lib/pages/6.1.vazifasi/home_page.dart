import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
class HomePage extends StatefulWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    print('Running on ${webBrowserInfo.userAgent}');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green.shade900,
      body:  Center(
        child: GestureDetector(
          onTap: _deviceInfo,
          child: const Text(
            "Click",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
