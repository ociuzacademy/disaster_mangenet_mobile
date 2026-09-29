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
          context,
          MaterialPageRoute(builder: (context) => NewsDeatilPage()),
        );
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
              // Image with constraints
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Image.network(
                  ImageUrl + imageUrl,
                  width: 110.w,
                  height: 110.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.image_not_supported,
                    size: 110.w,
                    color: Colors.grey,
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 110.w,
                      height: 110.h,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes!)
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        const Icon(Icons.location_city, color: Colors.red),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
