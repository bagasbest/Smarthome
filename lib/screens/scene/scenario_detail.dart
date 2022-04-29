import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScenarioDetail extends StatefulWidget {
  final String scenario;
  const ScenarioDetail({
    Key? key,
    required this.scenario,
  }) : super(key: key);

  @override
  State<ScenarioDetail> createState() => _ScenarioDetailState();
}

class _ScenarioDetailState extends State<ScenarioDetail> {
  bool isTemperatureOn = false;
  bool isLDROn = false;
  bool isUltrasonicOn = false;

  @override
  void initState() {
    super.initState();
    checkTask();
  }

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
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.scenario,
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
              Text(
                'Kondisi',
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
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/icon_awesome_fan.svg',
                          color: Colors.blue,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Suhu ruangan 25°C',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/icon_material_lightbulb_outline.svg',
                          color: Colors.blue,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Jika kondisi ruangan gelap',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/person_walking.svg',
                          color: Colors.blue,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Jika ada pergerakan orang\nmasuk ruangan',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Melaksanakan Tugas',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/icon_awesome_fan.svg',
                                  color: Colors.blue,
                                  height: 40,
                                  width: 40,
                                ),
                                Switch(
                                  value: isTemperatureOn,
                                  onChanged: (value) async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setBool(
                                        't+${widget.scenario}', value);
                                    setState(() {
                                      isTemperatureOn = value;
                                    });
                                  },
                                  activeTrackColor: Colors.blueAccent,
                                  activeColor: Colors.blue,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Sensor Suhu',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/icon_material_lightbulb_outline.svg',
                                  color: Colors.blue,
                                  height: 40,
                                  width: 40,
                                ),
                                Switch(
                                  value: isLDROn,
                                  onChanged: (value) async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setBool(
                                        'l+${widget.scenario}', value);
                                    setState(() {
                                      isLDROn = value;
                                    });
                                  },
                                  activeTrackColor: Colors.blueAccent,
                                  activeColor: Colors.blue,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Sensor LDR',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/led_lamp.svg',
                            color: Colors.blue,
                            height: 55,
                            width: 55,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Sensor Ultrasonik',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: isUltrasonicOn,
                        onChanged: (value) async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('u+${widget.scenario}', value);
                          setState(() {
                            isUltrasonicOn = value;
                          });
                        },
                        activeTrackColor: Colors.blueAccent,
                        activeColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkTask() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isTemperatureOn = prefs.getBool('t+${widget.scenario}') ?? false;
    isLDROn = prefs.getBool('l+${widget.scenario}') ?? false;
    isUltrasonicOn = prefs.getBool('u+${widget.scenario}') ?? false;
    setState(() {});
  }
}
