import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:flutter_application_2/Auth/ui/loginPage.dart';
import 'package:flutter_application_2/Auth/ui/reset_password_page.dart';
import 'package:flutter_application_2/Auth/ui/widgets/custom_textField.dart';
import 'package:flutter_application_2/global_widgets/custom_button.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:provider/provider.dart';

class Register_Page extends StatelessWidget {
  static final routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo1.png',
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      'Sign Up Now',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: Text(
                      'Please fill the deatails and create account',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ),
                CustomTextfield('FirstName', provider.firstName),
                CustomTextfield('LastName', provider.lastName),
                CustomTextfield('Country', provider.country),
                CustomTextfield('city', provider.city),
                CustomTextfield('Email', provider.emailController),
                CustomTextfield('Password', provider.passwordController),
                GestureDetector(
                  onTap: () {
                    RouteHelper.routeHelper
                        .goToPage(ResetPasswordPage.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password must be at least 6 charater',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                CustomButton(provider.register, 'Register'),
                GestureDetector(
                  onTap: () {
                    RouteHelper.routeHelper.goToPage(Login_Page.routeName);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: Text(
                      'Already have an account? Log in!',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      'Or connect with',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('assets/images/facebook.png'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Image.asset('assets/images/twitter.png'),
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Image.asset('assets/images/google.png'),
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
