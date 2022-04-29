import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthome/homepage.dart';
import 'package:smarthome/screens/profile.dart';
import 'package:smarthome/utils/drawer.dart';
import 'package:smarthome/utils/grid_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTemperatureOn = false;
  bool isLightsOn = false;
  bool isPersonWalkingOn = false;
  int totalScenario = 0;
  List<String> scenario = [];

  @override
  void initState() {
    super.initState();
    getScenario();
  }

  getScenario() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    totalScenario = prefs.getInt('total') ?? 0;

    for (int i = 0; i < totalScenario; i++) {
      String? data = prefs.getString(i.toString());

      if (data != '0') {
        scenario.add(data!);
      }
    }

    setState(() {});
  }

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
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1577880216142-8549e9488dad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                ),
              )),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SKENARIO',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Delete All',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {
                          _showConfirmDeleteDialog();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/delete.svg',
                          color: Colors.blue,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              (totalScenario == 0)
                  ? Center(
                      child: Text(
                        'Tidak ada skenario',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    )
                  : GridViewWidget(
                      totalScenario: totalScenario,
                      scenario: scenario,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showConfirmDeleteDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Menghapus Skenario'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Apakah anda yakin ingin menghapus seluruh skenario ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('YA'),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.clear();
                Navigator.of(context).pop();

                final snackBar = SnackBar(
                  content: const Text('Sukses menghapus skenario'),
                  action: SnackBarAction(
                    label: 'Oke',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {});
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
            ),
            TextButton(
              child: const Text('TIDAK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String showDateTimeNow() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);
    return formattedDate;
  }
}
