// usermainpage/payment_page.dart
import 'package:disaster_management/modules/donation_payment_page/services/donation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOpp extends StatefulWidget {
  const PaymentOpp({super.key});

  @override
  _PaymentOppState createState() => _PaymentOppState();
}

class _PaymentOppState extends State<PaymentOpp> {
  String? selectedBank;
  String? selectedPaymentMethod;
  TextEditingController donationcontroller = TextEditingController();
  // Dummy bank data with image paths
  final List<Map<String, String>> banks = [
    {
      'name': 'Google Pay',
      'image': 'assets/images/gpay.jpeg',
    },
    {
      'name': 'Credit/Debit Cards',
      'image': 'assets/images/debit-card.png',
    },
    {
      'name': 'Paypal',
      'image': 'assets/images/paypal.png',
    },
    {
      'name': 'Master Card',
      'image': 'assets/images/mastercard.png',
    },
  ];
  TextEditingController pricecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Set the first bank as the default selected bank
    selectedBank = banks.first['name'];
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // Set this to your design's size
      minTextAdapt: true,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Payment Option",
          style: TextStyle(
            fontSize: 18.sp, // Responsive font size
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20.sp, // Responsive icon size
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: pricecontroller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number, // Numeric keyboard for amount
              decoration: InputDecoration(
                border: InputBorder.none, // Remove border
                hintText: '₹0',
              ),
              style: TextStyle(fontSize: 70.sp), // Responsive text style
            ),
            SizedBox(height: 20.h),
            Spacer(),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.r), // Responsive border radius
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose Your transaction method",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    DropdownButtonFormField<String>(
                      value: selectedBank, // Set the default selected bank
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 12.h),
                      ),
                      items: banks.map((bank) {
                        return DropdownMenuItem<String>(
                          value: bank['name'],
                          child: Row(
                            children: [
                              Image.asset(
                                bank['image']!,
                                width: 30.w,
                                height: 30.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                bank['name']!,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBank = newValue;
                          selectedPaymentMethod =
                              null; // Reset payment method on bank change
                        });
                      },
                    ),
                    SizedBox(height: 20.h),
                    if (selectedBank != null) ...[
                      // Add any additional UI elements based on selectedBank if needed
                    ],
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          final resonse =
                              await Donation(amount: pricecontroller.text);
                          if (resonse.status == "Success") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Donation Completed")),
                            );
                          }
                          // Handle payment confirmation
                          // You can use selectedBank and selectedPaymentMethod here
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          backgroundColor: Colors.red,
                        ),
                        child: Text(
                          'Confirm Payment',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
