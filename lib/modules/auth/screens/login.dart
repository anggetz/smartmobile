import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart/models/config_api.dart';
import 'package:smart/models/model_user.dart';
import 'package:smart/modules/auth/screens/register_form.dart';
import 'package:smart/services/service_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart/utils/helpers/readconfig.dart';

class Login extends StatefulWidget {


  Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}


class _Login extends State<Login> {
  TextEditingController textFieldUsername = TextEditingController();
  TextEditingController textFieldPassword = TextEditingController();

  ModelUser user = ModelUser();
  ConfigApi api = ConfigApi();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getConfiguration().then((value) => {
      setState(() => {
        this.api = value.api
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Image(
                          image: AssetImage('assets/images/user.png'),
                          width: 150.0,
                        ),
                      ),
                      TextFormField(
                        controller: textFieldUsername,
                        onChanged: (value) => {
                          user.username = value
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Username',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          controller: textFieldPassword,
                          onChanged: (value) => {
                            user.password = value
                          },
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {

                                  ServiceAuth(this.api).
                                      Login(user.username, user.password).then((value) => {
                                        Navigator.pushNamed(context, '/home')
                                  });

                                },
                                child: Text('Masuk'),
                              ),
                            ],
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40.0),
                        child: Column(
                          children: [
                            new RichText(
                              text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: 'Belum terdaftar? ',
                                      style: new TextStyle(color: Colors.black),
                                    ),
                                    new TextSpan(
                                      text: 'Daftar sini',
                                      style: new TextStyle(color: Colors.blue),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(context, '/register-form');
                                        },
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}