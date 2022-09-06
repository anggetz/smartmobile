import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart/models/config_api.dart';
import 'package:smart/models/model_blok.dart';
import 'package:smart/models/model_user.dart';
import 'package:smart/services/service_auth.dart';
import 'package:smart/services/service_blok.dart';
import 'package:smart/services/service_group_location.dart';
import 'package:smart/models/auth.dart';
import 'package:smart/constants/app_constants.dart' as AppConstant;
import 'package:smart/models/model_group_location.dart';
import 'package:smart/utils/helpers/readconfig.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);


  @override
  _RegisterForm createState() => _RegisterForm();
}

class _RegisterForm extends State<RegisterForm> {
  // Initial Selected Value
  TextEditingController textFieldEmail = TextEditingController();
  TextEditingController textFieldUsername = TextEditingController();
  TextEditingController textFieldPassword = TextEditingController();
  TextEditingController textFieldConfirmPassword = TextEditingController();

  ModelUser user = ModelUser();

  List<ModelGroupLocation> dataGroupLocation = [];
  List<ModelBlok> dataBloks = [];

  final _formKey = GlobalKey<FormState>();
  ConfigApi api = ConfigApi();

  @override
  void initState() {
    super.initState();

      getConfiguration().then((value) => {
        setState(() {
          this.api = value.api;
          ServiceGroupLocation().get().then((value) => {

          this.dataGroupLocation = value
        });
      })
    });


    user.addListener(() {
      ServiceBlok().getByGroupLocation(user.groupLocationId!).then((value) => {
        setState(() {
          user.blokId = null;
          dataBloks = value;
        })
      });
    }, ['groupLocationId']);

    textFieldEmail.addListener(() {
      setState(() {
        user.email = textFieldEmail.value.text;
      });
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child:
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) {
                                return 'Lingkungan Menetap';
                              }
                              return null;
                            },
                            isExpanded: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Lingkungan Menetap',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            value: user.groupLocationId,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: dataGroupLocation.map((e)
                            {
                              return new DropdownMenuItem(child: new Text(e.name), value: e.id);
                            }
                            ).toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                user.groupLocationId = newValue!;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) {
                                return 'Blok Rumah Required';
                              }
                              return null;
                            },
                            isExpanded: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Blok Rumah',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            value: user.blokId,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: dataBloks.map((e)
                            {
                              return new DropdownMenuItem(child: new Text(e.name), value: e.id);
                            }
                            ).toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                user.blokId = newValue!;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email Required';
                              }
                              return null;
                            },
                            controller: textFieldEmail,
                            onChanged: (value) {
                              setState(() {
                                user.email = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username Required';
                              }
                              return null;
                            },
                            controller: textFieldUsername,
                            onChanged: (value) {
                                setState(() {
                                  user.username = value;
                                });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password Required';
                              }

                              if (value != user.confirmPassword) {
                                return 'Password tidak sama dengan confirm password';
                              }
                              return null;
                            },
                            controller: textFieldPassword,
                            onChanged: (value) {
                              setState(() {
                                user.password = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm Password Required';
                              }

                              if (value != user.password) {
                                return 'Confirm Password tidak sama dengan password';
                              }

                              return null;
                            },
                            controller: textFieldConfirmPassword,
                            onChanged: (value) {
                              setState(() {
                                user.confirmPassword = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),


                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {

                                        ServiceAuth(this.api).Register(user).then((value) => {
                                          Fluttertoast.showToast(
                                            msg: "user berhasil di registrasi",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.lightGreen,
                                            textColor: Colors.white70,
                                            fontSize: 16.0
                                          ),
                                          Navigator.pushNamed(context, '/')
                                        });
                                      }
                                    },
                                    child: Text('Submit'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}