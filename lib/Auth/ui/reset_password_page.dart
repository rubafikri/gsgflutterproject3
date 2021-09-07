import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:flutter_application_2/Auth/ui/widgets/custom_textField.dart';
import 'package:flutter_application_2/global_widgets/custom_button.dart';

import 'package:provider/provider.dart';

class ResetPasswordPage extends StatelessWidget {
  static final routeName = 'reset';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, x) {
          return Column(
            children: [
              CustomTextfield('Email', provider.emailController),
              // CustomButton(provider.resetPassword, 'Reset Password'),
            ],
          );
        },
      ),
    );
  }
}
