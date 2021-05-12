import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otlob_task/bloc/login_cubit.dart';
import 'package:otlob_task/bloc/login_states.dart';
import 'package:otlob_task/screens/home_screen.dart';
import 'package:otlob_task/widgets/login_widgets.dart';
import 'package:otlob_task/widgets/shared_widget.dart';

class LoginScreen extends StatelessWidget {
  var phone = TextEditingController();

  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status == 200) {
            final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.loginModel.message,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      }, builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 65, left: 16, right: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: height * 0.290,
                          width: width * 0.4,
                          child: Image.asset(
                            'assets/images/splash_screen/logo.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      normalText(
                        text: 'تسجيل الدخول',
                        fontFamily: 'Tajawal',
                        fontSize: size * 0.06,
                        color: HexColor('#46200B'),
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      defaultFormTextField(

                        hintText: 'رقم الهاتف',
                        controller: phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Phone must not ba empty';
                          }
                          return null;
                        },
                        radius: size * 0.045,
                        backgroungColor: Color.fromRGBO(174, 198, 50, 0.25),
                        hintColor: HexColor('#46200B').withOpacity(0.6),
                        hintSize: size * 0.05,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      defaultFormTextField(
                        radius: size * 0.045,
                        backgroungColor: Color.fromRGBO(174, 198, 50, 0.25),
                        hintSize: size * 0.05,
                        iconColor: HexColor('#46200B'),
                        hintColor: HexColor('#46200B').withOpacity(0.6),
                        hintText: 'كلمه المرور',
                        controller: password,
                        isPassword: LoginCubit.get(context).isPassword,
                        suffix: LoginCubit.get(context).suffix,
                        suffixFunction: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'password must not ba empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              size * 0.045,
                            ),
                            color: Color.fromRGBO(174, 198, 50, 1),
                          ),
                          width: width * 0.4,
                          height: height * 0.07,
                          child: ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                            builder: (context) => MaterialButton(
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    mobile: phone.text.trim(),
                                    password: password.text.trim(),
                                  );
                                }
                              },
                              child: normalText(
                                text: 'دخول',
                                color: Colors.white,
                                fontSize: size * 0.06,
                              ),
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
        );
      }),
    );
  }
}
