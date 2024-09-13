import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/common/widgets/back_button.dart';
import 'package:e_commerce/common/widgets/custom_button.dart';
import 'package:e_commerce/common/widgets/email_textfield.dart';
import 'package:e_commerce/common/widgets/password_field.dart';
import 'package:e_commerce/src/auth/controller/auth_notifier.dart';
import 'package:e_commerce/src/auth/model/registration_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
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
        leading: const AppBackButton(),
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
                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
                  hintText: 'Email',
                  controller: _emailController,
                  prefixIcon: const Icon(
                    CupertinoIcons.mail,
                    size: 20,
                    color: Kolors.kGray,
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                          RegistrationModel registrationModel =
                              RegistrationModel(
                            username: _userNameController.text,
                            password: _passwordController.text,
                            email: _emailController.text,
                          );
                          String data =
                              registrationModelToJson(registrationModel);
                          context
                              .read<AuthNotifier>()
                              .registrationFunc(data, context);
                        },
                        text: 'Sign up',
                        btnWidth: ScreenUtil().screenWidth,
                        btnHieght: 40,
                        radius: 25,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
