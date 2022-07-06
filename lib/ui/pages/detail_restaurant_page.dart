import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/cubit/riview_cubit.dart';
import 'package:flutter_application_findeat/models/resto_model.dart';
import 'package:flutter_application_findeat/models/riview_model.dart';
import 'package:flutter_application_findeat/ui/pages/create_riview_page.dart';
import 'package:flutter_application_findeat/ui/pages/menu_page.dart';
import 'package:flutter_application_findeat/ui/widget/riview_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/src/provider.dart';

class DetailRestaurantPage extends StatefulWidget {
  final RestoModel resto;
  const DetailRestaurantPage(this.resto, {Key? key}) : super(key: key);

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng center = LatLng(-6.9720999, 107.6364436);
  LatLng _lastMapPosition = center;

  MapType _currentMapType = MapType.normal;
  void initState() {
    // TODO: implement initState
    context.read<RiviewCubit>().fetchCourse(widget.resto.id);
    super.initState();
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    Widget riview(List<RiviewModel> riview) {
      return Column(
        children:
            riview.map((RiviewModel riview) => RiviewCard(riview)).toList(),
      );
    }

    Widget _showDialogMenu() {
      return Dialog(
        child: Container(
          child: Image.network(widget.resto.imageMenuUrl),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffEEEDDE),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: Text(
              widget.resto.name,
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.network(
                      widget.resto.imageUrl,
                      width: 98,
                      height: 100,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_sharp),
                            Text(
                              widget.resto.alamat,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.alarm),
                            Text(
                              '10 am - 10 pm ',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money_rounded),
                            Text(
                              'Rp100.000-200.000',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Maps',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
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
                        child: GoogleMap(
                          initialCameraPosition:
                              const CameraPosition(target: center, zoom: 20.0),
                          mapType: _currentMapType,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const MenuAllPage()),
                        child: Text(
                          'See All Menus >>',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Menu',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
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
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                              widget.resto.imageMenuUrl,
                            )),
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Riview',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              BlocConsumer<RiviewCubit, RiviewState>(
                listener: (context, state) {
                  if (state is RiviewFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RiviewSuccess) {
                    return riview(state.riviews);
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xff203239),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Get.to(CreateRiviewPage(widget.resto));
                      },
                      child: Text(
                        'Add Riview',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
