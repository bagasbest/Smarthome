import 'package:flutter/material.dart';

class Scenario extends StatefulWidget {
  const Scenario({Key? key}) : super(key: key);

  @override
  State<Scenario> createState() => _ScenarioState();
}

class _ScenarioState extends State<Scenario> {
  var scenarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Skenario',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Skenario',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      TextField(
                        controller: scenarioController,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          hintText: 'Input Skenario',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.grey[200],
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
