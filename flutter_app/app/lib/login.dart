import 'package:flutter/material.dart';
import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_utils/at_logger.dart';

import '/UI/input_field.dart';
import '/landing.dart';
import 'service/client_sdk_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  //StateFullWidget
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  String? atSign;
  ClientSdkService clientSDKInstance = ClientSdkService.getInstance();
  AtClientPreference? atClientPreference;
  final AtSignLogger _logger = AtSignLogger('Plugin example app');
  final ROOT_DOMAIN = 'root.atsign.org';
  final prodAPIKey = '400b-806u-bzez-z42z-6a3p'; // Fake API key

  Future<void> call() async {
    await clientSDKInstance
        .getAtClientPreference()
        .then((AtClientPreference? value) => atClientPreference = value);
  }

  @override
  void initState() {
    call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlueAccent,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              heightFactor: 0.5,
              widthFactor: 0.5,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                color: const Color.fromRGBO(255, 255, 255, 0.4),
                child: Container(
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 400,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                        elevation: 10.0,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "./lib/assets/images/security.png",
                            width: 80,
                            height: 80,
                          ),
                        )),
                    Form(
                      child: InputField(
                          //Calling inputField class
                          const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          "Username"),
                    ),
                    Form(
                      child: InputField(
                          const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          "Password"),
                    ),
                    Container(
                        width: 150,
                        child: TextButton(
                          onPressed: () async {
                            Onboarding(
                              context: context,
                              atClientPreference: atClientPreference!,
                              domain: ROOT_DOMAIN,
                              appColor: const Color(0xFFF05E3E),
                              onboard: (Map<String?, AtClientService> value,
                                  String? atsign) {
                                atSign = atsign;
                                clientSDKInstance.atsign = atsign!;
                                clientSDKInstance.atClientServiceMap = value;
                                clientSDKInstance.atClientServiceInstance =
                                    value[atsign];
                                _logger.finer('Successfully onboarded $atsign');
                              },
                              onError: (Object? error) {
                                _logger
                                    .severe('Onboarding throws $error error');
                              },
                              nextScreen: DemoDashboard(title: "Cypher AI"),
                              appAPIKey: prodAPIKey,
                              rootEnvironment: RootEnvironment.Production,
                            );
                          },
                          child: const Text("Login",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        )
                        // child: RaisedButton(
                        //   //Raised Button
                        //   onPressed: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) =>
                        //             const DemoDashboard(title: 'CypherAI')));
                        //   },
                        //   color: Colors.indigo,
                        //   textColor: Colors.white,
                        //   child: const Text(
                        //     "Login",
                        //     style: TextStyle(fontSize: 20.0),
                        //   ),
                        //   shape: const RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.all(
                        //       Radius.circular(10.0),
                        //     ),
                        //   ),
                        // ),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
