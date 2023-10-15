import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:get/get.dart';

import '../amplifyconfiguration.dart';

Future<void> configureAmplify() async {
  try {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugin(authPlugin);

    await Amplify.configure(amplifyconfig);
  } catch (e) {
    print('Failed to configure Amplify: $e');
    throw e; // Add this line
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginData _loginData;
  late SignupData _signupData;
  bool _isSignedIn = false;

  Future<String> _onLogin(LoginData data) async {
    try {
      var session = await Amplify.Auth.fetchAuthSession();
      if (session.isSignedIn) {
        await Amplify.Auth.signOut();
      }

      // Now sign in the user
      final res = await Amplify.Auth.signIn(
        username: data.name,
        password: data.password,
      );

      _loginData = data;
      _isSignedIn = res.isSignedIn;
      return "";
    } on AuthException catch (e) {
      return '${e.message} - ${e.recoverySuggestion}';
    }
  }

  Future<String> _onRecoverPassword(BuildContext context, String email) async {
    try {
      final res = await Amplify.Auth.resetPassword(username: email);

      if (res.nextStep.updateStep == 'CONFIRM_RESET_PASSWORD_WITH_CODE') {
        Get.toNamed(
          '/confirm-reset',
          arguments: LoginData(name: email, password: ''),
        );
      }
      return "";
    } on AuthException catch (e) {
      return '${e.message} - ${e.recoverySuggestion}';
    }
  }

  Future<String> _onSignup(SignupData data) async {
    try {
      String? name = data.name;
      String? password = data.password;

      if (name == null || password == null) {
        return 'Username and password must not be null';
      }

      await Amplify.Auth.signUp(
        username: name,
        password: password,
        options: CognitoSignUpOptions(userAttributes: {
          CognitoUserAttributeKey.email: name,
        }),
      );

      _signupData = data;

      return "";
    } on AuthException catch (e) {
      return '${e.message} - ${e.recoverySuggestion}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: '떠나볼래',
      onLogin: _onLogin,
      onRecoverPassword: (String email) => _onRecoverPassword(context, email),
      onSignup: _onSignup,
      theme: LoginTheme(
        primaryColor: Color.fromRGBO(253, 159, 40, 1), // #fd9f28
      ),
      onSubmitAnimationCompleted: () {
        print(_isSignedIn ? _loginData : _signupData);
        Get.offAndToNamed(
          _isSignedIn ? '/main' : '/confirm',
          arguments: _isSignedIn ? _loginData : _signupData,
        );
      },
    );
  }
}
