import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConditonalLDR extends StatefulWidget {
  const ConditonalLDR({Key? key}) : super(key: key);

  @override
  State<ConditonalLDR> createState() => _ConditonalLDRState();
}

class _ConditonalLDRState extends State<ConditonalLDR> {
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
                'Sensor LDR',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 30,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/lightbulb_outline.svg',
                              color: Colors.blue,
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Jika kondisi ruangan cerah',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.grey,
                        )
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
