import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otlob_task/providers/category_provider.dart';
import 'package:otlob_task/widgets/list_of_resturants.dart';
import 'package:otlob_task/widgets/shared_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(size * 0.05),
              bottomLeft: Radius.circular(size * 0.05),
            ),
          ),
          backgroundColor: HexColor('#FFC501'),
          centerTitle: true,
          elevation: 0.0,
          title: normalText(
            text: 'الرئيسية',
            fontFamily: 'Tajawal',
            color: HexColor('#46200B'),
            fontSize: size * 0.07,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        drawer: Drawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 33),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        normalText(
                            fontWeight: FontWeight.bold,
                            color: HexColor(
                              ('#46200B'),
                            ),
                            fontSize: size * 0.07,
                            text: 'مرحبا'),
                        normalText(
                            fontWeight: FontWeight.bold,
                            color: HexColor(
                              ('#46200B'),
                            ),
                            fontSize: size * 0.07,
                            text: 'عن ماذا تبحث؟'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.25,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.red),
                              ),
                              onPressed: () {
                                setState(() {
                                  curIndex = 0;
                                });
                              },
                              child: normalText(
                                text: 'الجميع',
                                color: Colors.red,
                                fontSize: size * 0.05,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          FutureBuilder(
                              future: Provider.of<CategoryProvider>(
                                context,
                              ).getCategory(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting &&
                                    !snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Container(
                                    height: height * 0.045,
                                    width: width * 0.671,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: width * 0.03,
                                        );
                                      },
                                      itemCount: snapshot.data.ret.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, catIndex) {
                                        return Container(
                                          width: width * 0.25,
                                          height: height * 0.045,
                                          child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              side:
                                                  BorderSide(color: Colors.red),
                                            ),
                                            onPressed: () {

                                              setState(() {
                                                curIndex = catIndex + 1;
                                              });
                                            },
                                            child: normalText(
                                              text: snapshot
                                                  .data.ret[catIndex].name,
                                              color: Colors.red,
                                              fontSize: size * 0.05,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.026,
                    ),
                    Container(
                        height: height * 0.56,
                        width: width,
                        child: ListOfResturants(curIndex)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
