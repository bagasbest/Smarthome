import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthome/homepage.dart';
import 'package:smarthome/screens/scene/scenario_detail.dart';

class GridViewWidget extends StatefulWidget {
  final int totalScenario;
  final List<String> scenario;

  const GridViewWidget({
    Key? key,
    required this.totalScenario,
    required this.scenario,
  }) : super(key: key);

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(widget.totalScenario, (index) {
          return Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        String scenarioName = widget.scenario[index];

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ScenarioDetail(scenario: scenarioName),
                          ),
                        );
                      },
                      child: Text(
                        widget.scenario[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        deleteScenarioByIndex(index);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/delete_gray.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<void> deleteScenarioByIndex(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int totalScenario = widget.totalScenario - 1;
    prefs.setInt('total', totalScenario);

    List<String> newScenario = [];
    newScenario.addAll(widget.scenario);

    newScenario.removeAt(index);
    for (int i = 0; i < totalScenario; i++) {
      prefs.setString(i.toString(), newScenario[i]);
    }

    final snackBar = SnackBar(
      content: const Text('Sukses menghapus skenario'),
      action: SnackBarAction(
        label: 'Oke',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    setState(() {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homepage()),
    );
  }
}
