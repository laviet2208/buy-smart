import 'package:flutter/material.dart';
import '../../../../data/finaldata.dart';
import '../../../../data/otherdata/Tool.dart';
import '../../../../data/voucherData/Voucher.dart';

class voucher_img_item extends StatelessWidget {
  final Voucher voucher;
  const voucher_img_item({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 30;
    double height = width/(500/250);
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: width,
        height: width/(500/250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // màu của shadow
              spreadRadius: 5, // bán kính của shadow
              blurRadius: 7, // độ mờ của shadow
              offset: Offset(0, 3), // vị trí của shadow
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/image/decor/vouchergift.png'),
              ),
            ),

            Positioned(
              top: height/4 + 5,
              right: 10,
              bottom: 10,
              left: width/5,
              child: Container(
                decoration: BoxDecoration(

                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        voucher.eventName,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'muli',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: width/25,
                        ),
                      ),
                    ),

                    SizedBox(height: 5,),

                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        voucher.maxSale == 0 ? (finaldata.mainLang.vouchercontent1  + getStringNumber(voucher.Money) + finaldata.mainLang.vouchercontent2) : (finaldata.mainLang.vouchercontent1  + voucher.Money.toStringAsFixed(0) + '% discount promo code for all products, buy now!'),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'muli',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: width/30,
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: finaldata.mainLang.Timelimit,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width / 30,
                                  fontFamily: 'muli',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: getDayTimeString(voucher.endTime),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width / 30,
                                  fontFamily: 'muli',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              voucher.id,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width/30,
                              ),
                            ),

                            SizedBox(width: 10,),

                            GestureDetector(
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Icon(
                                  Icons.copy,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
