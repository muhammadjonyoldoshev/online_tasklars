import 'package:flutter/material.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/pages/detail_page.dart';
import '../service/db_service.dart';


class HomePage extends StatefulWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void doLogin(){
    String? name = nameController.text.trim();
    String? password = passwordController.text.trim();
    DBService().storeUser('loginName', name);
    DBService().storeUser('loginPassword', password);
    print('password: ${DBService().getUser('loginPassword')} saved successfully');
    print('password: ${DBService().getUser('loginName')} saved successfully');
  }

  void goToSignUp(){
    Navigator.pushReplacementNamed(context, HomeAssignmentTwo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191c39),
      body: Container(
        margin: const EdgeInsets.only(top: 180, left: 30, right: 30, bottom: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: const Image(
                      width: 50,
                      height: 50,
                      image: AssetImage('assets/images/ronaldo.jpeg'),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  TextField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 10),
                      prefixIconConstraints:
                      BoxConstraints(minWidth: 23, maxHeight: 20),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      hintText: 'User Name',
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.person,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      prefixIconConstraints:
                      BoxConstraints(minWidth: 23, maxHeight: 20),
                      contentPadding: EdgeInsets.only(top: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.key,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: doLogin,
                    child: const CircleAvatar(
                      radius: 35,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have a account? ",
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                  TextButton(
                    onPressed: goToSignUp,
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}