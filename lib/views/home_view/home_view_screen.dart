import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/constants.dart';
import 'package:sugar_mill_app/views/home_view/home_view_model.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';

import '../../router.router.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  // Helper function to create a button with an image and text
  Widget _buildImageButton({
    required String imagePath,
    required String buttonText,
    required Function onPressed,
  }) {
    return Material(
      color: Colors.white,
      elevation: 8,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Material(
          color: Colors.white,
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                height: 120,
                width: 300,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    buttonText,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.greenAccent.shade700,
        appBar: AppBar(
          leading: const Icon(Icons.factory_outlined),
          title: const AutoSizeText(
            'Venkateshwara Power Project',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Logout'),
                      content: Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            model.logout(context); // Close the dialog
                          },
                          child: Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                  getHeight(context) / 10.5), // Set the preferred height
              child: model.empList.isNotEmpty
                  ? Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  "Welcome, ${model.empname}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: model.checkinList.isNotEmpty
                                    ? AutoSizeText(
                                        "Last ${model.checkvalue == "IN" ? "Check-In" : "Check-Out"} at ${DateFormat('dd MMM yyyy, hh:mm a').format(DateTime.tryParse(model.time ?? "") ?? DateTime.now())}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        model.checkvalue != "IN"
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      enableDrag: true,
                                      isDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Center(
                                                child: Text(
                                                  DateFormat('hh:mm:ss a')
                                                      .format(DateTime.now()),
                                                  style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  DateFormat('dd MMM, yyyy')
                                                      .format(DateTime.now()),
                                                  style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10.0),
                                              MaterialButton(
                                                onPressed: () {
                                                  model.checkin(context);
                                                  // Close the bottom sheet
                                                },
                                                minWidth:
                                                    150.0, // Set the custom width
                                                height:
                                                    48.0, // Set the button height
                                                color: Colors
                                                    .green, // Set the button color
                                                textColor: Colors
                                                    .white, // Set the text color
                                                child: const AutoSizeText(
                                                  "Check In",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  minWidth: getWidth(context) / 20,
                                  height: getHeight(context) / 25,
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  child: const AutoSizeText(
                                    "Check In ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      enableDrag: false,
                                      isDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(builder:
                                            (BuildContext context,
                                                StateSetter setState) {
                                          return Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    DateFormat('hh:mm:ss a')
                                                        .format(DateTime.now()),
                                                    style: const TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    DateFormat('dd MMM, yyyy')
                                                        .format(DateTime.now()),
                                                    style: const TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10.0),
                                                MaterialButton(
                                                  onPressed: () {
                                                    model.checkout(context);
                                                  },
                                                  minWidth:
                                                      150.0, // Set the custom width
                                                  height:
                                                      48.0, // Set the button height
                                                  color: Colors
                                                      .redAccent, // Set the button color
                                                  textColor: Colors
                                                      .white, // Set the text color
                                                  child: const AutoSizeText(
                                                    "Check Out",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                      },
                                    );
                                  },
                                  minWidth: getWidth(context) /
                                      20, // Set the custom width
                                  height: getHeight(context) /
                                      25, // Set the button height
                                  color:
                                      Colors.redAccent, // Set the button color
                                  textColor: Colors.white, // Set the text color
                                  child: const AutoSizeText(
                                    "Check Out",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    )
                  : const Center(
                      child: Text(
                          'There is no any employee is available at this user'),
                    )),
        ),
        body: fullScreenLoader(
          loader: model.isBusy,
          context: context,
          child: WillPopScope(
            onWillPop: _onWillPop,
            child: SingleChildScrollView(
              child: Hero(
                  tag: "TITLE",
                  child: model.empList.isNotEmpty
                      ? Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath: 'assets/images/farmer.jpg',
                                        buttonText: 'New Farmer',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.addFarmerScreen,
                                            arguments:
                                                const AddFarmerScreenArguments(
                                                    farmerid: ""),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/farmer_list.jpg',
                                        buttonText: 'Farmer List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.listFarmersScreen,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/cane_registration.jpeg',
                                        buttonText: 'New Cane Registration',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.addCaneScreen,
                                            arguments:
                                                const AddCaneScreenArguments(
                                                    caneId: ""),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/cane_list.jpg',
                                        buttonText: 'Cane Master List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.listCaneScreen,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/agri_developement.jpg',
                                        buttonText: 'New Cane Development',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.addAgriScreen,
                                            arguments:
                                                const AddAgriScreenArguments(
                                                    agriId: ""),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/agri_list.jpg',
                                        buttonText: 'Cane Development List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.listAgriScreen,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/crop_sampling.jpg',
                                        buttonText: 'New Crop Sampling',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.addCropSamplingScreen,
                                            arguments:
                                                const AddCropSamplingScreenArguments(
                                                    samplingId: ""),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/crop_sample_list.jpg',
                                        buttonText: 'Crop Sampling List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.listSamplingScreen,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/trip_sheet.webp',
                                        buttonText: 'New Trip Sheet',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.addTripsheetScreen,
                                            arguments:
                                                const AddTripsheetScreenArguments(
                                                    tripId: ""),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/trip_list.jpg',
                                        buttonText: 'Trip Sheet List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.tripsheetMaster,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container()),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initialise(context),
    );
  }
}
