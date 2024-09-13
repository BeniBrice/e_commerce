import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/common/widgets/back_button.dart';
import 'package:e_commerce/common/widgets/custom_button.dart';
import 'package:e_commerce/common/widgets/email_textfield.dart';
import 'package:e_commerce/common/widgets/password_field.dart';
import 'package:e_commerce/src/auth/controller/auth_notifier.dart';
import 'package:e_commerce/src/auth/model/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kolors.kWhite,
        leading: AppBackButton(
          onTap: () => context.go('/home'),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 160.h,
          ),
          Text(
            'Brice app Fashion ',
            textAlign: TextAlign.center,
            style: appStyle(
              24,
              Kolors.kPrimary,
              FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Hi welcome back. You have been missed ',
            textAlign: TextAlign.center,
            style: appStyle(
              13,
              Kolors.kGray,
              FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
                  hintText: 'user name',
                  controller: _userNameController,
                  prefixIcon: const Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                    color: Kolors.kGray,
                  ),
                  keyboardType: TextInputType.name,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                PasswordField(
                  controller: _passwordController,
                  focusNode: _passwordNode,
                  radius: 25,
                ),
                SizedBox(
                  height: 20.h,
                ),
                context.watch<AuthNotifier>().isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Kolors.kPrimary,
                        ),
                      )
                    : CustomButton(
                        onTap: () {
                          LoginModel loginModel = LoginModel(
                            password: _passwordController.text,
                            username: _userNameController.text,
                          );
                          String data = loginModelToJson(loginModel);
                          print(data);
                          context.read<AuthNotifier>().loginFunc(data, context);
                        },
                        text: 'Login',
                        btnWidth: ScreenUtil().screenWidth,
                        btnHieght: 40,
                        radius: 25,
                      )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 130.h,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 110,
            ),
            child: GestureDetector(
              onTap: () {
                context.push('/register');
              },
              child: Text(
                'Do not have account please Register',
                style: appStyle(
                  12,
                  Colors.blue,
                  FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
