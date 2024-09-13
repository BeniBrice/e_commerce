// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:e_commerce/common/services/storage.dart';
import 'package:e_commerce/common/utils/environment.dart';
import 'package:e_commerce/common/utils/kstrings.dart';
import 'package:e_commerce/common/widgets/error_modal.dart';
import 'package:e_commerce/src/auth/model/auth_token_model.dart';
import 'package:e_commerce/src/auth/model/profile_model.dart';
import 'package:e_commerce/src/entrypoint/controller/bottom_tab_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AuthNotifier with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void registrationFunc(String data, BuildContext context) async {
    setIsLoading();
    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/users/');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: data,
      );
      if (response.statusCode == 201) {
        setIsLoading();
        context.pop();
      } else if (response.statusCode == 400) {
        setIsLoading();
        var data = jsonDecode(response.body);
        showErrorPopup(
          context,
          data['password'][0],
          null,
          null,
        );
      } else {
        print('that is the response status code ==>> ${response.statusCode}');
        print(
            'that is the response data retrieve from the internet ${response.body}');
      }
    } catch (e) {
      setIsLoading();
      // ignore: use_build_context_synchronously
      showErrorPopup(
        context,
        AppText.kErrorLogin,
        null,
        null,
      );
    }
  }

  void loginFunc(String data, BuildContext context) async {
    setIsLoading();

    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/token/login');

      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        String accessToken = accessTokenModelFromJson(response.body).authToken;

        Storage().setString('accessToken', accessToken);
        getUser(accessToken, context);
        setIsLoading();
        // ignore: use_build_context_synchronously
      } else {
        print(response.statusCode);
        setIsLoading();
      }
    } catch (e) {
      setIsLoading();
      // ignore: use_build_context_synchronously
      showErrorPopup(
        context,
        e.toString(),
        null,
        null,
      );
    }
  }

  void getUser(String accessToken, BuildContext context) async {
    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/users/me/');

      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $accessToken',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);

        /// get user information

        ///add our access token to local starage
        Storage().setString(accessToken, response.body);
        setIsLoading();

        context.read<TabIndexNotifier>().setIndex = 0;
        context.go('/home');
      } else {
        print(response.body);
        setIsLoading();
      }
    } catch (e) {
      setIsLoading();
      // ignore: use_build_context_synchronously
      showErrorPopup(
        context,
        e.toString(),
        null,
        null,
      );
    }
  }

  ProfileModel? profileModel() {
    ProfileModel? model;
    String? accessToken = Storage().getString('accessToken');
    if (accessToken != null && accessToken.isNotEmpty) {
      String? data = Storage().getString(accessToken);
      if (data != null) {
        model = profileModelFromJson(data);
      }
    }
    return model;
  }
}
