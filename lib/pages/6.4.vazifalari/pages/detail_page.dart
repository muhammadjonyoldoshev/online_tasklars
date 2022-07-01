import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/pages/home_page.dart';
import '../service/db_service.dart';

class HomeAssignmentTwo extends StatefulWidget {
  static const String id = '/home_assignment_four';

  const HomeAssignmentTwo({Key? key}) : super(key: key);

  @override
  State<HomeAssignmentTwo> createState() => _HomeAssignmentTwoState();
}

class _HomeAssignmentTwoState extends State<HomeAssignmentTwo> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();


  void _doLogin(){
    var box =  Hive.box('login_two');
    String? name = userNameController.text.trim() ;
    String? password = passwordController.text.trim() ;
    String? email = emailController.text.trim() ;
    String? number = numberController.text.trim();
    DBService().storeUser('name', name);
    DBService().storeUser('password', password);
    DBService().storeUser('email', email);
    DBService().storeUser('number', number);
    print('${DBService().getUser('name')} was saved successfully');
    print('${DBService().getUser('password')} was saved successfully');
    print('${DBService().getUser('email')} was saved successfully');
    print('${DBService().getUser('number')} was saved successfully');
  }


  void goToLoginPage(){
    Navigator.pushReplacementNamed(context, HomePage.id);
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
                children: const [
                  Text(
                    'Create\nAccount',
                    style: TextStyle(fontSize: 28, color: Colors.white,),textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  eachItemField(controller:userNameController,text: 'UserName',icon:Icons.person),
                  eachItemField(controller:emailController,text: 'E-mail',icon:Icons.email),
                  eachItemField(controller:numberController,text: 'Phone Number',icon:Icons.phone),
                  eachItemField(controller:passwordController,text: 'Password',icon:Icons.password),
                  const SizedBox(height: 30,),
                  InkWell(
                    onTap: _doLogin,
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
              const SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have a account? ",
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                  TextButton(
                    onPressed: goToLoginPage,
                    child: const Text(
                      'Sign Up',
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
  Widget eachItemField({required TextEditingController controller,required IconData icon, required String text}){
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child:     TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10),
          prefixIconConstraints:
          const BoxConstraints(minWidth: 23, maxHeight: 20),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: text,
          hintStyle: const TextStyle(color: Colors.white70, fontSize: 15),
          prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(icon,color: Colors.white54,)
          ),
        ),
      ),
    );
  }
}