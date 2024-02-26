import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';

import '../../../constants.dart';
import '../../../router.router.dart';
import '../../../widgets/cdrop_down_widget.dart';
import 'add_tripsheet_list_model.dart';

class TripsheetMaster extends StatelessWidget {
  const TripsheetMaster({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListTripsheet>.reactive(
      viewModelBuilder: () => ListTripsheet(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const AutoSizeText('Trip Sheet List'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.addTripsheetScreen,
                    arguments: const AddTripsheetScreenArguments(tripId: ""),
                  );
                },
                child: const AutoSizeText('+Add Trip Sheet')),
          ],
        ),
        body: fullScreenLoader(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: getWidth(context) / 4,
                                      child: TextField(
                                        // controller: model.villageController,
                                        onChanged: (value) {
                                          model.idcontroller.text = value;
                                          model.filterList(
                                              "name", int.parse(value));
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'ID',
                                          prefixIcon: Icon(Icons.search),
                                          // prefixIcon: Icon(Icons.search),
                                        ),
                                      ),
                                    ),
                                    // child: TextField(
                                    //   onChanged: (value) {
                                    //     model.idcontroller.text = value;
                                    //     model.filterList(
                                    //         "name", int.parse(value));
                                    //   },
                                    //   decoration: const InputDecoration(
                                    //       labelText: 'Id',
                                    //       icon: Icon(Icons.search)),
                                    // ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                        // controller: model.villageController,
                                        onChanged: (value) {
                                          model.namecontroller.text = value;
                                          model.filterListByNameAndVillage(
                                              village: value);
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Village',
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  SizedBox(
                                    width: getWidth(context) / 4,
                                    child: TextField(
                                      // controller: model.villageController,
                                      onChanged: (value) {
                                        model.namecontroller.text = value;
                                        model.filterListByNameAndVillage(
                                            transName: value);
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Transporter',

                                        // prefixIcon: Icon(Icons.search),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: CdropDown(
                                      dropdownButton:
                                          DropdownButtonFormField<String>(
                                        isExpanded: true,
                                        // Replace null with the selected value if needed
                                        decoration: const InputDecoration(
                                          labelText: 'Season',
                                        ),
                                        hint: const Text('Select Season'),
                                        items: model.seasonlist.map((val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          model.namecontroller.text =
                                              value ?? "";
                                          model.filterListByNameAndVillage(
                                              season: value);
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: const ListTile(
                      trailing: AutoSizeText(
                        "Circle Office",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14), // Set text color to white
                      ),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              'ID',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white, // Set text color to white
                              ),
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              'Village',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        'Transporter Name',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white), // Set text color to white
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'Farmer Name',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white), // Set text color to white
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                model.triSheetList.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: model.tripSheetFilter.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: ListTile(
                                  tileColor: const Color(0xFFD3E8FD),
                                  trailing: AutoSizeText(
                                    model.tripSheetFilter[index].circleOffice ??
                                        '',
                                    maxLines: 2,
                                  ),
                                  leading: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: AutoSizeText(
                                          model.tripSheetFilter[index].name
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: AutoSizeText(
                                          model.tripSheetFilter[index]
                                                  .fieldVillage ??
                                              '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    model.tripSheetFilter[index]
                                            .transporterName ??
                                        '',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          maxLines: 2,
                                          model.tripSheetFilter[index]
                                                  .farmerName ??
                                              '',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    model.onRowClick(
                                        context, model.tripSheetFilter[index]);
                                  },
                                )
                                // ListTile(
                                //   // tileColor: model.getTileColor(
                                //   //     model.canefilterList[index].plantationStatus),
                                //   trailing: AutoSizeText(
                                //     model.canefilterList[index].area ?? '',
                                //     maxLines: 2,
                                //   ),
                                //   leading: SizedBox(
                                //     width: getWidth(context) / 5,
                                //     child: Column(
                                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //       children: [
                                //         AutoSizeText(
                                //           model.canefilterList[index].circleOffice ??
                                //               '',
                                //           maxLines: 1,
                                //           overflow: TextOverflow.ellipsis,
                                //         ),
                                //         AutoSizeText(
                                //           model.canefilterList[index]
                                //                   .plantationStatus ??
                                //               '',
                                //           maxLines: 2,
                                //           style: const TextStyle(
                                //             fontSize: 8,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                //   title: Text(
                                //     model.canefilterList[index].growerName ?? '',
                                //     style: const TextStyle(fontSize: 11),
                                //   ),
                                //   subtitle: Row(
                                //     children: [
                                //       Text(
                                //         model.canefilterList[index].name.toString(),
                                //         style: const TextStyle(fontSize: 8),
                                //       ),
                                //       const SizedBox(
                                //         width: 35,
                                //       ),
                                //       Text(
                                //         model.canefilterList[index]
                                //                 .plantattionRatooningDate ??
                                //             '',
                                //         style: const TextStyle(fontSize: 8),
                                //       ),
                                //     ],
                                //   ),
                                //   onTap: () {
                                //     // Handle row click here
                                //     // _onRowClick(context, filteredList[index]);
                                //     model.onRowClick(
                                //         context, model.canefilterList[index]);
                                //   },
                                // ),
                                );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: Colors.white, // Color of the line
                              thickness: 0, // Thickness of the line
                            );
                          },
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("You haven't created a Trip Sheet yet"),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.addTripsheetScreen,
                                  arguments: const AddTripsheetScreenArguments(
                                      tripId: ""),
                                );
                              },
                              child: const Text('Create a Trip Sheet')),
                        ],
                      )
              ],
            ),
            loader: model.isBusy,
            context: context),
      ),
    );
  }
}
