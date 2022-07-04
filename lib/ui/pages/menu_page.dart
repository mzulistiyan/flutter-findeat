import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuAllPage extends StatelessWidget {
  const MenuAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEDDE),
      appBar: AppBar(
        backgroundColor: Color(0xffEEEDDE),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Collections',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.person,
              size: 25,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return _showDialogMenu();
                        },
                      ),
                    },
                    child: Container(
                      width: 160,
                      height: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/gambar_banner_1.png'),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return _showDialogMenu2();
                        },
                      ),
                    },
                    child: Container(
                      width: 160,
                      height: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/gambar_banner_2.png'),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
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

  Widget _showDialogMenu() {
    return Dialog(
      child: Container(
        child: Image.asset('assets/images/gambar_banner_1.png'),
      ),
    );
  }

  Widget _showDialogMenu2() {
    return Dialog(
      child: Container(
        child: Image.asset('assets/images/gambar_banner_2.png'),
      ),
    );
  }
}
