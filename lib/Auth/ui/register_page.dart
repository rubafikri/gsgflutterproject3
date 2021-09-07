import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/helpers/auth_helper.dart';
import 'package:flutter_application_2/Auth/models/country_model.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:flutter_application_2/Auth/ui/widgets/custom_textField.dart';
import 'package:flutter_application_2/global_widgets/custom_button.dart';

import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  static final routeName = 'register';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      body: Consumer<AuthProvider>(
        builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      provider.selectFile();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffFA4C60)),
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.grey,
                      ),
                      height: 200,
                      width: 200,
                      child: provider.file == null
                          ? Icon(Icons.person_add)
                          : Container(
                              width: 190.0,
                              height: 190.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(provider.file)))),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 20,
                    ),
                  ),
                ),
                CustomTextfield('FirstName', provider.firstNameController),
                CustomTextfield('LastName', provider.lastNameController),
                CustomTextfield('Email', provider.emailController),
                CustomTextfield('Password', provider.passwordController),
                provider.countries == null
                    ? Container()
                    : Container(
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(
                          left: 33,
                          right: 30,
                          top: 10,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: Color(0xffFA4C60)),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButton<CountryModel>(
                          dropdownColor: Colors.black,
                          isExpanded: true,
                          underline: Container(),
                          value: provider.selectedCountry,
                          onChanged: (x) {
                            provider.selectCountry(x);
                          },
                          items: provider.countries.map((e) {
                            return DropdownMenuItem<CountryModel>(
                              child: Text(
                                e.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              value: e,
                            );
                          }).toList(),
                        ),
                      ),
                provider.countries == null
                    ? Container()
                    : Container(
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(
                          left: 33,
                          right: 30,
                          top: 10,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: Color(0xffFA4C60)),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButton<dynamic>(
                          dropdownColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          isExpanded: true,
                          underline: Container(),
                          value: provider.selectedCity,
                          onChanged: (x) {
                            provider.selectCity(x);
                          },
                          items: provider.cities.map((e) {
                            return DropdownMenuItem<dynamic>(
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.white),
                              ),
                              value: e,
                            );
                          }).toList(),
                        ),
                      ),
                CustomButton(provider.register, 'Register', 0xff2B2B2B),
              ],
            ),
          );
        },
      ),
    );
  }
}
