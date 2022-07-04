import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/models/resto_model.dart';
import 'package:flutter_application_findeat/ui/pages/detail_restaurant_page.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class RestoCard extends StatelessWidget {
  final RestoModel resto;
  const RestoCard(this.resto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailRestaurantPage(resto)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 200,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 100,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          resto.imageUrl,
                          width: 80,
                          height: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          child: Text(
                            resto.name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
