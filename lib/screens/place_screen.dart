import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otlob_task/providers/item_Provider.dart';
import 'package:otlob_task/widgets/shared_widget.dart';
import 'package:provider/provider.dart';

class PlaceScreen extends StatelessWidget {
  final int restId;

  final String name;
  final String type;
  final String location;
  final String open;
  final String close;
  final String image;
  final String delivery;

  PlaceScreen(
      {this.restId,
      this.name,
      this.image,
      this.delivery,
      this.type,
      this.location,
      this.open,
      this.close});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: height * 0.3,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ),
              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(
                      color: Colors.black,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                        image: NetworkImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: height * 0.02,
                    right: width * 0.13,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        normalText(
                          fontFamily: 'Tajawal',
                          text: name,
                          color: Colors.white,
                          fontSize: size * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                        RatingBar.builder(
                          initialRating: 5,
                          maxRating: 5,
                          minRating: 0,
                          itemSize: size * 0.045,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 37, right: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        normalText(
                          text: type,
                          fontSize: size * 0.052,
                          color: HexColor('#46200B'),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: HexColor('#EF2823'),
                            ),
                            Row(
                              children: [
                                normalText(
                                    color: HexColor('#787878'),
                                    fontSize: size * 0.05,
                                    text: location),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Divider(
                          height: height * 0.01,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: HexColor('#0DBF00'),
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            Row(
                              children: [
                                normalText(
                                  text: 'مفتوح',
                                  fontSize: size * 0.05,
                                  color: HexColor('#0DBF00'),
                                ),
                                normalText(
                                  text: ' - من ${open} الي  ${close}',
                                  fontSize: size * 0.04,
                                  color: HexColor('#575757'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bus_alert,
                              color: HexColor('#AEAEAE'),
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            normalText(
                                color: HexColor('#787878'),
                                fontSize: size * 0.05,
                                text: delivery),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Divider(
                          height: height * 0.01,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        normalText(
                          text: 'الأصناف',
                          fontSize: size * 0.08,
                          color: HexColor(
                            '#46200B',
                          ),
                        ),
                        FutureBuilder(
                            future: Provider.of<ItemProvider>(context)
                                .getItems(id: restId + 1, langu: 'ar'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting &&
                                  !snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return Container(
                                height: height * 0.45,
                                child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: height * 0.00084,
                                      crossAxisSpacing: width * 0.02,
                                      mainAxisSpacing: height * 0.01,
                                    ),
                                    itemCount: 3,
                                    itemBuilder: (ctx, index) => Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 192,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  child: Image.network(
                                                    snapshot.data.ret[index]
                                                        .productImage,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    normalText(
                                                      fontFamily: 'Tajawal',
                                                      text: snapshot
                                                          .data
                                                          .ret[index]
                                                          .productName,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: HexColor(
                                                        '#46200B',
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        normalText(
                                                          text: snapshot
                                                              .data
                                                              .ret[index]
                                                              .productPrice,
                                                          color: HexColor(
                                                            '#787878',
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .add_shopping_cart_outlined,
                                                          color: HexColor(
                                                              '#EF2823'),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
