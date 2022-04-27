import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:smarthome/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTemperatureOn = false;
  bool isLightsOn = false;
  bool isPersonWalkingOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => DrawerNavigation(),
            color: Colors.grey,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: SvgPicture.asset(
              'assets/icons/icon_feather_bell.svg',
              color: Colors.grey,
              height: 30,
              width: 30,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 30,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                showDateTimeNow(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Smart Home System',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'DEVICES',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
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
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  onChanged: (value) {
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
                              'Temperature',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '20°C',
                              style: TextStyle(
                                color: Colors.grey,
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
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  value: isLightsOn,
                                  onChanged: (value) {
                                    setState(() {
                                      isLightsOn = value;
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
                              'Lights',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Living Room',
                              style: TextStyle(
                                color: Colors.grey,
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
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/person_walking.svg',
                        color: Colors.blue,
                        height: 80,
                        width: 60,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Person Walking',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Detected',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Switch(
                        value: isPersonWalkingOn,
                        onChanged: (value) {
                          setState(() {
                            isPersonWalkingOn = value;
                          });
                        },
                        activeTrackColor: Colors.blueAccent,
                        activeColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'SKENARIO',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String showDateTimeNow() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);
    return formattedDate;
  }
}
