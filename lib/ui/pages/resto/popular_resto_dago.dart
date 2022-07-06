import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/cubit/resto_cubit.dart';
import 'package:flutter_application_findeat/models/resto_model.dart';
import 'package:flutter_application_findeat/ui/pages/collection_page.dart';
import 'package:flutter_application_findeat/ui/widget/resto_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class PopularRestoDagoPage extends StatefulWidget {
  const PopularRestoDagoPage({Key? key}) : super(key: key);

  @override
  State<PopularRestoDagoPage> createState() => _PopularRestoDagoPageState();
}

class _PopularRestoDagoPageState extends State<PopularRestoDagoPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<RestoCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget collectionResto() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/gambar_1.png',
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/gambar_2.png',
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/gambar_3.png',
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/gambar_4.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget popularResto(List<RestoModel> resto) {
      return Container(
        height: 200,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                resto.map((RestoModel resto) => RestoCard(resto)).toList(),
          ),
        ),
      );
    }

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
              'Dago',
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
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Collections',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(const CollectionPage()),
                    child: Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              collectionResto(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Popular restaurant',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              BlocConsumer<RestoCubit, RestoState>(
                listener: (context, state) {
                  if (state is RestoFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RestoSuccess) {
                    return popularResto(state.resto);
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
