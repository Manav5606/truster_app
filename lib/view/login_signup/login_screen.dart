import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/const/color_constants.dart';
import 'package:truster_app/const/theme_const.dart';
import 'package:truster_app/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController controller = LoginController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'Login',
          style: appBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Obx(
          () => Form(
            key: controller.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (controller.userNotFoundError.value)
                  Container(
                    decoration: BoxDecoration(color: red.withOpacity(0.25), borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Wrap(
                        children: [
                          const Text(
                            'We couldn’t find your account. Please check your email address and try again or  if you are new here ',
                            style: errorRedTextStyle,
                          ),
                          InkWell(
                            onTap: (){controller.goToSignUpScreen(false);},
                            child:  Text(
                              'register now',
                              style: errorRedTextStyle.copyWith(decoration: TextDecoration.underline),
                            ),
                          ),
                          const Text(
                            ' if you are new here.',
                            style: errorRedTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 15),
                const Text(
                  'Email Address',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'abc@gmail.com', border: OutlineInputBorder()),
                  controller: controller.emailText,
                  validator: (value) {
                    if (value == '') {
                      return 'Please enter email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Password',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.showPassword.toggle();
                          },
                          icon: Icon(controller.showPassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined))),
                  obscureText: !controller.showPassword.value,
                  controller: controller.passwordText,
                  validator: (value) {
                    if (value == '') {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Use Fingerprint')),
                    TextButton(
                      onPressed: () {controller.goToForgotPassword();},
                      style: ButtonStyle(foregroundColor: MaterialStateProperty.all(grey)),
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    style: buttonStylePrimary,
                    child: controller.loggingIn.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Color(0xFFD2D2D2),
                                    strokeWidth: 2,
                                  )),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Logging In')
                            ],
                          )
                        : const Text('Login'),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {controller.goToSignUpScreen(false);},
                      child: const Text(
                        'Signup',
                        style: TextStyle(color: primary, fontSize: 16),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
