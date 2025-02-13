import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final String brand;
  final String title;
  final String details;
  final String validUntil;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback ontap;

  const CouponCard({
    required this.brand,
    required this.title,
    required this.details,
    required this.validUntil,
    required this.backgroundColor,
    required this.icon,
    required this.ontap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  icon,
                  size: 50,
                  color: Colors.green[700],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brand,
                        style: TextStyle(
                          color: Colors.green[700],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        details,
                        style: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 120,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: backgroundColor,
                ),
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: ontap,
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 107,
          child: Container(
            height: 15,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              color: Colors.grey[200],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 107,
          child: Container(
            height: 15,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Colors.grey[200],
            ),
          ),
        ),
      ],
    );
  }
}
