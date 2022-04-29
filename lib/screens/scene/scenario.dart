import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Text(
                  'Skenario',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
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
                          onPressed: () {
                            if (scenarioController.text != "") {
                              addScenario();
                              final snackBar = SnackBar(
                                content:
                                    const Text('Berhasil menambahkan skenario'),
                                action: SnackBarAction(
                                  label: 'Oke',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              final snackBar = SnackBar(
                                content: const Text(
                                    'Kolom skenario tidak boleh kosong'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
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
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  addScenario() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int totalScenario = (prefs.getInt('total') ?? 0) + 1;

    prefs.setInt('total', totalScenario);
    prefs.setString((totalScenario - 1).toString(), scenarioController.text);
    scenarioController.text = "";
  }
}
