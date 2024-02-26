import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/views/login_view/login_view_model.dart';

import '../../router.router.dart';
import '../../widgets/full_screen_loader.dart';

class LoginViewScreen extends StatefulWidget {
  const LoginViewScreen({super.key});

  @override
  State<LoginViewScreen> createState() => _LoginViewScreenState();
}

class _LoginViewScreenState extends State<LoginViewScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onViewModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            Navigator.popAndPushNamed(context, Routes.loginViewScreen);
            // Close the entire app.
            SystemNavigator.pop();

            // Return true to allow the back button press.
            return true;
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors
                      .lightBlue.shade200, // Change the gradient colors as needed
                  Colors.indigoAccent,
                  Colors.lightBlueAccent.shade100,
                ],
              ),
            ),
            child: fullScreenLoader(
              context: context,
              loader: model.isloading,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  25,
                  100,
                  25,
                  0,
                ),
                child: AutofillGroup(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape
                                .circle, // Makes the container and the image circular
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                                10.0), // Padding around the image
                            child: Image.asset(
                              'assets/images/logo.png', // Replace 'your_image.png' with your actual asset image path
                              width: 100, // Set width as per your requirement
                              height: 100, // Set height as per your requirement
                            ),
                          ),
                        ),
                        const AutoSizeText(
                          'Log in to your Account',
                          minFontSize: 26,
                          maxFontSize: double.infinity,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const AutoSizeText(
                          minFontSize: 15,
                          maxFontSize: double.infinity,
                          'Welcome back! Please Enter Your Details',
                          style: TextStyle(color: Colors.white), // Text color
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15, 32, 15, 15),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 8,
                                  color: Color(0x1917171C),
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  32, 32, 32, 32),
                              child: Form(
                                key: model.formGlobalKey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                        padding: const EdgeInsets.only(
                                            left: 5.0,
                                            right: 5.0,
                                            top: 15,
                                            bottom: 0),
                                        child: TextFormField(
                                          controller: model.usernameController,
                                          focusNode: model.focusNode,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: 'Username',
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            prefixIcon: const Icon(Icons
                                                .person), // Icon for the username field
                                          ),
                                          autofillHints: const [
                                            AutofillHints.username
                                          ],
                                          onEditingComplete: () {
                                            TextInput.finishAutofillContext();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          validator: (value) =>
                                              model.validateUsername(value),
                                        ),
                                      ),
                                      const SizedBox(height: 16.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0,
                                            right: 5.0,
                                            top: 15,
                                            bottom: 0),
                                        //padding: EdgeInsets.symmetric(horizontal: 15),
                                        child: TextFormField(
                                          controller: model.passwordController,
                                          obscureText: model.obscurePassword,
                                          decoration: InputDecoration(
                                            labelText: 'Password',
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            prefixIcon: const Icon(Icons
                                                .password), // Icon for the password field
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  model.obscurePassword =
                                                      !model.obscurePassword;
                                                });
                                              },
                                              child: Icon(
                                                model.obscurePassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              ),
                                            ),
                                          ),
                                          autofillHints: const [
                                            AutofillHints.password
                                          ],
                                          onEditingComplete: () {
                                            TextInput.finishAutofillContext();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          validator: (value) =>
                                              model.validatePassword(value),
                                        ),
                                      ),
                                      const SizedBox(height: 16.0),
                                      SizedBox(
                                        height: 70,
                                        width: 600,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty
                                                  .all<Color>(Colors
                                                      .blue), // Set the background color to blue
                                            ),
                                            onPressed: () {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                              if (model
                                                  .formGlobalKey.currentState!
                                                  .validate()) {
                                                model.formGlobalKey.currentState!
                                                    .save();
                                                model.loginwithUsernamePassword(
                                                    context);
                                              }
                                            },
                                            child: const Text(
                                              'Login',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () async {
                              Uri url = Uri.parse('https://erpdata.in/');
                              // Convert Uri to String

                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: const AutoSizeText(
                              'Developed By © QuantBit Technologies Pvt. Ltd ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
