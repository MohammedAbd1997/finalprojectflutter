import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/CartScreen/add_new_address.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/extend_app_bar.dart';
import 'package:finalprojectflutter/Widget/product_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF33907C)));
    // TODO: implement build
    return  Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
                centerTitle: true,
                bottom: CustomAppBar(),
                backgroundColor: Color(0xFF33907C),
                title: Text(
                  'My Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        RouterClass.routerClass.pushToSpecificScreenUsingWidget(
                            '/AddAddressScreen');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        width: double.infinity,
                        height: 52.h,
                        child: Text(
                          '+ Add New Address',
                          style: TextStyle(
                              fontSize: 14.sp, color: Color(0xFF4F4F4F)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    ProductCartWidget(),
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 15.h),
                      color: Colors.white,
                      width: double.infinity,
                      height: 183.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                'Price ( 1 item )',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.sp),
                              ),
                              Spacer(),
                              Text(
                                '\$25',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Amount',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18.sp),
                              ),
                              Spacer(),
                              Text(
                                '\$25',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 160.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      color: Colors.white,
                      child: CustomButtoncart(
                        title: 'Add To Cart',
                        titleColor: Colors.white,
                        backgroudColor: Color(0xFF33907C),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}

class AddressCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 25.w, top: 15.h, right: 15.w),
      color: Colors.white,
      width: double.infinity,
      height: 69.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deliver to Tradly Team 75119',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                'Kualalumpur ,Malaysia',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: CustomButtonSeeAll(
              title: 'Change',
              backgroudColor: const Color(0xFF33907C),
              titleColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
