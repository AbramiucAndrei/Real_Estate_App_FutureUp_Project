import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../models/house_model.dart';
import '../../../../utils/common/constants.dart';
import 'item_detail_page_desk.dart';

class HouseAdWidget extends StatefulWidget {
  final House house;
  final int imgPathIndex;

  const HouseAdWidget({Key? key, required this.house, required this.imgPathIndex}) : super(key: key);

  @override
  State<HouseAdWidget> createState() => _HouseAdWidgetState();
}

class _HouseAdWidgetState extends State<HouseAdWidget> {
  late House house;

  @override
  void initState() {
    house = widget.house;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formatedPrice = NumberFormat("##,###,###", "en_INR");

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () async {
        House received = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(
              house: house,
              imgPathIndex: widget.imgPathIndex,
            ),
          ),
        );
        setState(() {
          house = received;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            //height: (screenHeight*0.7) < 600 ? 600 : screenHeight * 0.7,
            //width: (screenWidth * 0.7) < 800 ? 800 : screenWidth* 0.7,
            //height: 600,
            //height: (screenHeight*0.7),
            //width: 800,
            //width: (screenWidth*0.7),
            height: 600,
            width: 800,
            padding: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(220.0),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  Constants.imageList[widget.imgPathIndex],
                ),
              ),
            ),
            child: GestureDetector(
              onTap: (){
                HapticFeedback.mediumImpact(); //<uses-permission android:name="android.permission.VIBRATE" />
                setState(() {
                  house.isFavorite = !house.isFavorite;
                });
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: ColorConstant.kWhiteColor,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Icon(
                    house.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: house.isFavorite ? Colors.redAccent : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(

            padding: const EdgeInsets.only(
              top: 4,
              left: 8,
            ),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "\$${formatedPrice.format(house.price)}",
                  style: GoogleFonts.notoSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  house.address,
                  style: GoogleFonts.notoSans(
                    fontSize: 15,
                    color: ColorConstant.kGreyColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 16,
            ),
            child: Text(
              "${house.bedrooms} bedroom${house.bedrooms > 1 ? 's':''} / ${house.bathrooms} bathrooms / ${house.squareMeters} ft\u00B2",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
