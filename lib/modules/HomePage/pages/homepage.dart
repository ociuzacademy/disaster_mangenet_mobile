import 'package:disaster_management/modules/HomePage/models/newsmodel.dart';
import 'package:disaster_management/modules/HomePage/services/newsservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/news_card.dart';
import '../../collectioncamp/Pages/disaster_alert.dart';
import '../../donation_payment_page/Page/payment_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<Map<String, String>>> fetchNews() async {
    // Simulate a delay for fetching news
    await Future.delayed(const Duration(seconds: 2));

    // Example news data
    return [
      {
        'imageUrl':
            'https://images.hindustantimes.com/Images/Popup/2013/4/19_04_13-metro4.jpg',
        'title': 'Earthquake Detected',
        'description':
            'Earthquake Detected! Please take immediate safety precautions.',
        'location': 'Kozhikode',
      },
      {
        'imageUrl':
            'https://img.etimg.com/thumb/width-1200,height-1200,imgsize-26702,resizemode-75,msid-112589231/news/india/imd-predicts-heavy-rains-in-kerala-issues-orange-alert.jpg',
        'title': 'Heavy Rain',
        'description':
            'Heavy Rain Detected! Please take immediate safety precautions.',
        'location': 'Thiruvananthapuram',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                    child: Image.network(
                      'https://www.pointsoflight.org/wp-content/uploads/2023/07/dreamstime_xxl_70706629-1060x705.jpg',
                      width: double.infinity,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Donate Fund',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Your generous donation helps us provide essential resources and services to those in need. Every contribution makes a difference.',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PaymentOpp(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: Text(
                                'Donate Now',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Disaster Alert News",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            FutureBuilder<NewsModel>(
              future: NewsList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No news available'));
                }

                final newsList = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index) {
                      final news = snapshot.data!.data[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: NewsCard(
                          imageUrl: news.newsPic,
                          title: news.title,
                          description: news.description,
                          location: news.createdAt,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
