import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:flutter_application_2/Auth/ui/register_page.dart';
import 'package:flutter_application_2/Auth/ui/reset_password_page.dart';
import 'package:flutter_application_2/Auth/ui/widgets/custom_textField.dart';
import 'package:flutter_application_2/global_widgets/custom_button.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static final routeName = 'login';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      body: Consumer<AuthProvider>(
        builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10, top: 20),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Login with your account',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 20,
                    ),
                  ),
                ),
                CustomTextfield('Email', provider.emailController),
                CustomTextfield('Password', provider.passwordController),
                GestureDetector(
                  onTap: () {
                    RouteHelper.routeHelper
                        .goToPage(ResetPasswordPage.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Forget Password?',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Color(0xffFA4C60)),
                    ),
                  ),
                ),
                CustomButton(provider.login, 'Login', 0xff2B2B2B),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Do not have an account! ',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        RouteHelper.routeHelper
                            .goToPage(RegisterPage.routeName);
                      },
                      child: Container(
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Color(0xffFA4C60)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
