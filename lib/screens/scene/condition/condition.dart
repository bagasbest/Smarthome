import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarthome/screens/scene/condition/condition_temperature.dart';
import 'package:smarthome/screens/scene/condition/condition_ultrasonic.dart';

import 'conditional_ldr.dart';

class Condition extends StatefulWidget {
  const Condition({Key? key}) : super(key: key);

  @override
  State<Condition> createState() => _ConditionState();
}

class _ConditionState extends State<Condition> {
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
        child: Container(
          margin: EdgeInsets.only(
            top: 30,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              Text(
                'Kondisi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Add Sensor',
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ConditionTemperature()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                'Sensor Suhu',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SvgPicture.asset(
                                'assets/icons/icon_awesome_fan.svg',
                                color: Colors.blue,
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ConditonalLDR()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                'Sensor LDR',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SvgPicture.asset(
                                'assets/icons/icon_material_lightbulb_outline.svg',
                                color: Colors.blue,
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
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
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConditionUltrasonic()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          'Sensor Ultrasonik',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SvgPicture.asset(
                          'assets/icons/led_lamp.svg',
                          color: Colors.blue,
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
