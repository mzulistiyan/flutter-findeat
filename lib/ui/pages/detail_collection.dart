import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/cubit/resto_cubit.dart';
import 'package:flutter_application_findeat/models/resto_model.dart';
import 'package:flutter_application_findeat/ui/pages/collection_page.dart';
import 'package:flutter_application_findeat/ui/widget/resto_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class DetailCollectionPage extends StatefulWidget {
  const DetailCollectionPage({Key? key}) : super(key: key);

  @override
  State<DetailCollectionPage> createState() => _DetailCollectionPageState();
}

class _DetailCollectionPageState extends State<DetailCollectionPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<RestoCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listResto(List<RestoModel> resto) {
      return Container(
        child: GridView.count(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          crossAxisSpacing: 1,
          children: resto.map((RestoModel resto) {
            return RestoCard(resto);
          }).toList(),
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
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Popular Restaurant In Bandung',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
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
                    return listResto(state.resto);
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
