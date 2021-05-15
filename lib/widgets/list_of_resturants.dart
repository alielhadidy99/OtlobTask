import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otlob_task/providers/resturant_provider.dart';
import 'package:otlob_task/screens/place_screen.dart';
import 'package:otlob_task/widgets/shared_widget.dart';
import 'package:provider/provider.dart';

class ListOfResturants extends StatelessWidget {
  final int id;

  ListOfResturants(this.id);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: Provider.of<ResturantsProvider>(
          context,
        ).getResturants(id: id, langu: 'ar'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: height * 0.56,
              width: width,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: height * 0.06,
                    color: Colors.grey,
                  );
                },
                itemCount: snapshot.data.ret.length,
                itemBuilder: (context, restIndex) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                    restId: restIndex,
                                    name: snapshot.data.ret[restIndex].restName,
                                    location: snapshot
                                        .data.ret[restIndex].restLocation,
                                    image: snapshot.data.ret[restIndex].restImg,
                                    type: snapshot.data.ret[restIndex].restType,
                                    open: snapshot.data.ret[restIndex].open,
                                    rate: snapshot.data.ret[restIndex].rate.toDouble(),
                                    close: snapshot.data.ret[restIndex].close,
                                    delivery:
                                        snapshot.data.ret[restIndex].delivery ==
                                                1
                                            ? 'متاح التوصيل'
                                            : "لا يوجد توصيل",
                                  )));
                    },
                    child: Container(
                      width: width,
                      child: Row(
                        children: [
                          Container(
                            height: height * 0.3,
                            width: width * 0.295,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      snapshot.data.ret[restIndex].restImg,
                                    ))),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Container(
                            width: width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  normalText(
                                    fontFamily: 'Tajawal',
                                    text: snapshot.data.ret[restIndex].restName,
                                    fontSize: size * 0.06,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Container(
                                    child: RatingBar.builder(
                                      initialRating:snapshot.data.ret[restIndex].rate,
                                      maxRating: 5,
                                      minRating: 0,
                                      itemSize: size * 0.04,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  normalText(
                                    text: snapshot.data.ret[restIndex].restType,
                                    color: HexColor('#787878'),
                                    fontSize: size * 0.041,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: HexColor('#AEAEAE'),
                                      ),
                                      normalText(
                                          color: HexColor('#787878'),
                                          text: snapshot
                                              .data.ret[restIndex].restLocation,
                                          fontSize: size * 0.035),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.directions_car_rounded,
                                        color: HexColor('#AEAEAE'),
                                      ),
                                      SizedBox(
                                        width: width * 0.004,
                                      ),
                                      normalText(
                                          color: HexColor('#787878'),
                                          text: snapshot.data.ret[restIndex]
                                                      .delivery ==
                                                  1
                                              ? 'متاح التوصيل'
                                              : "لا يوجد توصيل",
                                          fontSize: size * 0.035),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
