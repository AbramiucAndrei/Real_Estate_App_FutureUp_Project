import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:real_estate_futureup_copy/utils/common/constants.dart';
//import 'package:real_estate_futureup/utils/widgets/custom_button.dart';

import '../../../../models/house_model.dart';
import '../../../../utils/common/constants.dart';
import '../../../../utils/widgets/custom_button.dart';
import 'filter_widget_desk.dart';
import 'house_ad_widget_desk.dart';

class HomeDesktopPage extends StatefulWidget {
  const HomeDesktopPage({super.key});

  @override
  State<HomeDesktopPage> createState() => _HomeDesktopPageState();
}

class _HomeDesktopPageState extends State<HomeDesktopPage> {
  final filterList = ['<\$100.000', '1 bedroom', '2 bedrooms', '2 bathrooms','Favourites'];

  String activeFilter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(
                  icon: Icons.menu,
                  onBtnTap: () {
                    print('am apasat');
                  },
                  iconColor: Colors.black,
                  backgroundColor: Colors.white60,
                ),
                Text('Imobiliare\n-desktop-',
                    style: GoogleFonts.manrope(
                        fontSize: 36,
                        color: ColorConstant.kBlackColor,
                        fontWeight: FontWeight.w500
                    )),
                CustomButtonWidget(
                  icon: Icons.refresh,
                  onBtnTap: () {
                    print('tu apesi');
                  },
                  iconColor: Colors.black,
                  backgroundColor: Colors.white60,
                )
              ],
            ),
            const SizedBox(height: 32),
            Text('City',
                style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: ColorConstant.kGreyColor,
                    fontWeight: FontWeight.w300
                )),
            const SizedBox(height: 16),
            Text('Cluj-Napoca',
                style: GoogleFonts.manrope(
                    fontSize: 36,
                    color: ColorConstant.kBlackColor,
                    fontWeight: FontWeight.w700
                )),
            const Divider(color: ColorConstant.kGreyColor, thickness: 0.2),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filterList.length,
                  itemBuilder: (context, index){
                    return FilterWidget(
                        filterTxt: filterList[index],
                        isActive: activeFilter == filterList[index] ? true : false,
                        onBtnTap: (){
                          setState(() {
                            if(activeFilter == filterList[index]){
                              activeFilter = '';
                            }else{
                              activeFilter = filterList[index];
                            }
                          });
                        }
                    );
                  }),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: List.generate(Constants.houseList.length, (index) {
                  House house = Constants.houseList[index];
                  return isFiltered(house.price, house.bedrooms, house.bathrooms, house.isFavorite) ?
                  Padding(padding: const EdgeInsets.only(top: 16),
                      child: HouseAdWidget(
                        house: house,
                        imgPathIndex: index,
                      )) :
                  const SizedBox();
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isFiltered(price, bedrooms, bathrooms, isFavorite) {
    if (activeFilter.isEmpty) return true;
    if (activeFilter.contains('bedroom')) {
      if (activeFilter[0] == '1' && bedrooms == 1) {
        return true;
      } else if (activeFilter[0] == '2' && bedrooms == 2) {
        return true;
      }
    }
    if (activeFilter.contains('bath')) {
      if (activeFilter[0] == '1' && bathrooms == 1) {
        return true;
      } else if (activeFilter[0] == '2' && bathrooms == 2) {
        return true;
      }
    }
    if (activeFilter.contains('\$')) {
      if (price < 100000) {
        return true;
      }
    }

    if(activeFilter.contains('Favourites')){
      if(isFavorite) {
        return true;
      }
    }
    return false;
  }
}
