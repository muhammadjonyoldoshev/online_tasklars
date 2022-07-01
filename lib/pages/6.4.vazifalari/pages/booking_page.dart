import 'package:flutter/material.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/models/user_model_two.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/pages/result_page.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/service/data_base_service.dart';


class BookingPage extends StatefulWidget {
  static const String id = '/booking_page';

  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void doLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    UserTwo user = UserTwo(email: email, password: password);
    DBServiceTwo().storeUser(user);
    print('${DBServiceTwo().getUser().email} saved successfully');
    print('${DBServiceTwo().getUser().password} saved successfully');
  }

  void goBack() {
    Navigator.pushNamed(context, ResultPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff077f7b),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 30, bottom: 60),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/ronaldo.jpeg',
                      ),
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 70, right: 35, left: 35),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _itemsEachField(
                            controller: emailController,
                            text: 'Email',
                            title: 'Email'),
                        _itemsEachField(
                            controller: passwordController,
                            text: 'Password',
                            title: 'Password'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xff077f7b),
                      onPressed: doLogin,
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'OR',
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 100,
                        ),
                        InkWell(
                            child: Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 48,
                            )),
                        SizedBox(
                          width: 45,
                        ),
                        InkWell(
                          child: Image(
                            fit: BoxFit.cover,
                            height: 45,
                            width: 45,
                            image: AssetImage(
                              'assets/images/twitter.png',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        InkWell(
                          child: Image(
                            fit: BoxFit.cover,
                            height: 45,
                            width: 45,
                            image: AssetImage(
                              'assets/images/instagram.png',
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                            onPressed: goBack,
                            child: const Text(
                              'SignUp',
                              style: TextStyle(fontSize: 17),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
  Widget _itemsEachField(
      {required String text,
        required TextEditingController controller,
        required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                hintText: text,
                hintStyle: const TextStyle(fontSize: 15)),
          )
        ],
      ),
    );
  }
}