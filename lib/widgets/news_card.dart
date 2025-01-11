// widgets/news_card.dart
import 'package:disaster_management/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../usermainpage/news_detail_page.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String location;

  const NewsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewsDeatilPage()));
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            children: [
              // Image with loading and error handling
              Image.network(
                ImageUrl + imageUrl,
                width: 110,
                height: 110,
              ),
              SizedBox(width: 10),
              Expanded(
                // Allow better text wrapping
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      description,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_city, color: Colors.red),
                        SizedBox(width: 8.w),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
