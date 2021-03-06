import 'package:dotted_border/dotted_border.dart';
import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/custom_address_textfield.dart';
import 'package:finalprojectflutter/Widget/custom_textfield_addproduct.dart';
import 'package:finalprojectflutter/Widget/extend_app_bar.dart';
import 'package:finalprojectflutter/Widget/tag_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AddProductProvider>(
      builder: (cnx, provider, x) {
        return Scaffold(
          backgroundColor: Color(0xFFF6F9FF),
          appBar: AppBar(
            centerTitle: true,
            bottom: CustomAppBar(),
            backgroundColor: Color(0xFF33907C),
            title: Text(
              'Add Product',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  width: double.infinity,
                  height: 190.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  provider.pickNewImage();
                                },
                                child: provider.file == null
                                    ? provider.imageUrl == null
                                        ? DottedBorder(
                                            borderType: BorderType.RRect,
                                            radius: Radius.circular(12),
                                            dashPattern: [3, 3],
                                            color: Colors.grey,
                                            strokeWidth: 2,
                                            child: Container(
                                              width: 140.w,
                                              height: 105.h,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 15.h,
                                                  ),
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.grey,
                                                    size: 30,
                                                  ),
                                                  Text(
                                                    'Add photos',
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Colors.grey),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text(
                                                    '1600 x 1200 for hi res',
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(
                                            alignment: Alignment.center,
                                            width: 150.w,
                                            height: 128.h,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image(
                                                    image: NetworkImage(
                                                        provider.imageUrl),
                                                    width: 140.w,
                                                    height: 108.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 29,
                                                    height: 29,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: Colors.black54),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                      size: 19,
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        bottom: 30.h),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                    : Container(
                                        alignment: Alignment.center,
                                        width: 150.w,
                                        height: 128.h,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image(
                                                image: FileImage(provider.file),
                                                width: 140.w,
                                                height: 108.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 29,
                                                height: 29,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.black54),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 19,
                                                ),
                                                margin: EdgeInsets.only(
                                                    bottom: 30.h),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Max 4 photo per product',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  color: Colors.white,
                  child: Form(
                    key: provider.CreatProductFormKey,
                    child: Column(
                      children: [
                        CustomTextfieldAddress(
                          validationFun: provider.nullValidator,
                          controller: provider.nameController,
                          labelText: 'Product Name',
                        ),
                        CustomTextfieldAddress(
                          validationFun: provider.nullValidator,
                          controller: provider.CategoryController,
                          labelText: 'Category Product',
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 15.h),
                                child: Text(
                                  '\$',
                                  style: TextStyle(fontSize: 16.sp),
                                )),
                            CustomTextfieldProduct(
                              validationFun: provider.nullValidator,
                              controller: provider.priceController,
                              labelText: 'Price',
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 15.h),
                                child: Text(
                                  '\$',
                                  style: TextStyle(fontSize: 16.sp),
                                )),
                            CustomTextfieldProduct(
                              validationFun: provider.nullValidator,
                              controller: provider.OfferpriceController,
                              labelText: 'Offer Price',
                            ),
                          ],
                        ),
                        Container(
                          height: 60.h,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          child: TextFormField(
                              validator: provider.nullValidator,
                              controller: provider.LocationController,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.sp),
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.map_outlined,
                                    color: Colors.grey,
                                  ),
                                  errorStyle: TextStyle(fontSize: 14.sp),
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[400]),
                                  ),
                                  label: Text('Location Details'))),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          child: TextFormField(
                              validator: provider.nullValidator,
                              controller: provider.descriptionController,
                              maxLines: 4,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.sp),
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  errorStyle: TextStyle(fontSize: 14.sp),
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[400]),
                                  ),
                                  label: Text('Product Description'))),
                        ),
                        CustomTextfieldAddress(
                          validationFun: provider.nullValidator,
                          controller: provider.ConditionController,
                          labelText: 'Condition',
                        ),
                        CustomTextfieldAddress(
                          validationFun: provider.nullValidator,
                          controller: provider.PriceTypeController,
                          labelText: 'Price Type',
                        ),
                        TagTextfield(
                          provider: provider.AdditionalDetailsController,
                          Title: 'Additional Details',
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        InkWell(
                          onTap: () {
                            if (provider.CreatProductValidate()) {
                              provider.addProduct();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
                            color: Colors.white,
                            child: CustomButtoncart(
                              title: 'Add Product',
                              titleColor: Colors.white,
                              backgroudColor: Color(0xFF33907C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
