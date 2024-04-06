# real_estate_futureup_copy


## Mods:
-In *home_desktop_page.dart*:
  - Added a new filter named "Favourites"
  - In funtion "isFiltered" I added an extra condition to check if the "house" is saved in Favourites
  - I wrapped the Column containing the house ads into a SingleChildScrollView with the scrollDirection horizontal , in order to be able to scroll the ad if the app width is too small

-In *custom_button.dart*:
  - Added a new optional parameter named "borderColor" , defaul set to Colors.white
  - //Added this in order for the buttons to be more visible on a white background color (see Item Detail Page)

-In *house_ad_widget_desk*:
  - Changer the main Column crossAxisAlignment to ``` CrossAxisAlignment.center ```
  - Changed the height and width of the container to 800x600 to fit most of the screens
  - Changed the borderRadius to 220 in order to have a more aesthetic ad image
  - and  "fit: BoxFit.fitWidth"

-In *item_detail_page_desk*:
  - ADDED "fit: BoxFit.fitWidth" in CarouselSlider -> items
  - In both of "CustomButtonWidget" I added "borderColor: Colors.black"
  - ADDED
```
CarouselOptions(
                      height: screenHeight*0.7,
                      aspectRatio: 4/3,
                      viewportFraction: 0.5,
                      enlargeCenterPage: true,
                      initialPage: widget.imgPathIndex // in order to show the image coresponding to the AD when clicking on it
                    )
```
