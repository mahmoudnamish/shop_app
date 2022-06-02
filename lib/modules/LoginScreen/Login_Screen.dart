
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Shared/Components/Component.dart';
import 'package:shop_app/modules/LoginScreen/Cubit/cubit_login.dart';

import '../../Layout/Shope_Layout.dart';
import '../../Network/local/Cach_Helper.dart';
import '../register/register_screen.dart';
import 'Cubit/states_login.dart';

class LoginScreen extends StatelessWidget {
  var emailcontroler = TextEditingController();
  var passworedcontroler = TextEditingController();
  var valdiatorKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CountCubit(),
      child: BlocConsumer<CountCubit,CountStates>(
                 listener: (context, state) {
                 if (state is SuccesStates) {
                 if (state.loginmodele.status!) {
              CachHelper.saveData(
                      key: 'token', value: state.loginmodele.data!.token)
                  .then((value) {
                Navigator.pushAndRemoveUntil(
                    (context),
                    MaterialPageRoute(builder: (context) => ShopeHomeScreen()),
                    (route) => true);
              });
            } else {
              Showtoast(
                  masage: state.loginmodele.message!, state: tostestate.error);
            }
          }
        },
        builder: (context, state) {
          var Cubit = CountCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: valdiatorKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black),
                          ),
                          Text('login to browse our hot offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.grey, fontSize: 20)),
                          SizedBox(height: 30),
                          DefultTextFormField(
                              text: 'Email',
                              prefux: Icons.email,
                              type: TextInputType.emailAddress,
                              controle: emailcontroler,
                              valaditor: (value) {
                                if (value.isEmpty) {
                                  return 'please enter the Email';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          DefultTextFormField(
                              text: 'Passswored',
                              prefux: Icons.lock,
                              textScure: Cubit.textScure,
                              onsubmitted: (String value) {
                                if (valdiatorKey.currentState!.validate()) {
                                  Cubit.userlogin(
                                      email: emailcontroler.text,
                                      passwored: passworedcontroler.text);
                                }
                              },
                              suficepress: () {
                                Cubit.TextSecure();
                              },
                              sufex: Cubit.icon,
                              type: TextInputType.visiblePassword,
                              controle: passworedcontroler,
                              valaditor: (value) {
                                if (value.isEmpty) {
                                  return 'please enter the Passwored';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoadingStates,
                            builder: (context) => DefultBottom(
                                width: double.infinity,
                                background: Colors.orangeAccent,
                                onpresse: () {
                                  if (valdiatorKey.currentState!.validate()) {
                                    Cubit.userlogin(
                                        email: emailcontroler.text,
                                        passwored: passworedcontroler.text);
                                  }
                                },
                                text: 'login',
                                isUpperCase: true),
                            fallback: (context) => Center(
                                child: CircularProgressIndicator(
                              color: Colors.orangeAccent,
                            )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account ?'),
                              SizedBox(
                                width: 15,
                              ),
                              DefultTextButtom(
                                  function: () {
                                    Navigator.push(
                                        (context),
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisreScreen()));
                                  },
                                  text: 'RegisterNow')
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
