import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/models/riview_model.dart';
import 'package:google_fonts/google_fonts.dart';

class RiviewCard extends StatelessWidget {
  final RiviewModel riview;
  const RiviewCard(this.riview, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                riview.name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.star,
                size: 20,
                color: Colors.orange,
              ),
              Text('4/5'),
            ],
          ),
          Text(
            riview.teks,
          ),
        ],
      ),
    );
  }
}
