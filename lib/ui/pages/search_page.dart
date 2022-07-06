import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/ui/pages/home_page.dart';
import 'package:flutter_application_findeat/ui/pages/resto/popular_resto_bubat.dart';
import 'package:flutter_application_findeat/ui/pages/resto/popular_resto_dago.dart';
import 'package:flutter_application_findeat/ui/pages/resto/popular_resto_lembang.dart';
import 'package:flutter_application_findeat/ui/pages/resto/popular_resto_lengkong.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEDDE),
      appBar: AppBar(
        backgroundColor: Color(0xffEEEDDE),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Riau',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.black,
              size: 35,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select a popular localities in bandung',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const HomePage()),
                        child: Text(
                          'Riau',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const PopularRestoLembangPage()),
                        child: Text(
                          'Lembang',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const PopularRestoDagoPage()),
                        child: Text(
                          'Dago',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const PopularRestoLengkongPage()),
                        child: Text(
                          'Lengkong',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const PopularRestoBuahBatuPage()),
                        child: Text(
                          'Bauh Batu',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
      ),
    );
  }
}
