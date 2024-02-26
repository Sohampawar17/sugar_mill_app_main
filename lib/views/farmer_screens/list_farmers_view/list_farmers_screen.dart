import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/constants.dart';
import 'package:sugar_mill_app/views/farmer_screens/list_farmers_view/list_farmers_model.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';

import '../../../router.router.dart';

class ListFarmersScreen extends StatelessWidget {
  const ListFarmersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListFarmersModel>.reactive(
      viewModelBuilder: () => ListFarmersModel(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const AutoSizeText('Farmer List'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.addFarmerScreen,
                      arguments: const AddFarmerScreenArguments(farmerid: ""),
                    );
                  },
                  child: const AutoSizeText('+Add Farmer')),
            )
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
                          child: TextField(
                            // controller: model.villageController,
                            onChanged: (value) {
                              model.villageController.text = value;
                              model.filterListByNameAndVillage(village: value);
                            },
                            decoration: const InputDecoration(
                              labelText: 'Village',
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: getWidth(context) / 1.6,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {
                                    model.nameController.text = value;
                                    model.filterListByNameAndVillage(
                                        name: value);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                width: getWidth(context) / 4,
                                child: TextField(
                                  // controller: model.villageController,
                                  onChanged: (value) {
                                    model.villageController.text = value;
                                    model.filterList(
                                        value, "existing_supplier_code");
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Vendor Code',

                                    // prefixIcon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5.0),
                            ],
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
                    'Village',
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white), // Set text color to white
                  ),
                  leading: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AutoSizeText(
                          'Circle Office',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white), // Set text color to white
                        ),
                        AutoSizeText(
                          'WorkFlow Status',
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white, // Set text color to white
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white), // Set text color to white
                  ),
                  subtitle: Text(
                    'Vendor Code',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white), // Set text color to white
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              model.farmresList.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        itemCount: model.filteredList.length,
                        itemBuilder: (context, index) {
                          Logger().i(model
                              .filteredList[index].existingSupplierCode
                              .toString());
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ListTile(
                              tileColor: model
                                          .filteredList[index].workflowState ==
                                      "New"
                                  ? const Color(0xFFD3E8FD)
                                  : model.filteredList[index].workflowState ==
                                          "Approved"
                                      ? const Color(0xFFEAF5EE)
                                      : const Color(0xFFFFF5F5),
                              trailing: AutoSizeText(
                                model.filteredList[index].village ?? '',
                                maxLines: 2,
                              ),
                              leading: SizedBox(
                                width: getWidth(context) / 5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    AutoSizeText(
                                      model.filteredList[index].circleOffice ??
                                          '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    AutoSizeText(
                                      model.filteredList[index].workflowState ??
                                          '',
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text(
                                model.filteredList[index].supplierName ?? '',
                                style: const TextStyle(fontSize: 15),
                              ),
                              subtitle: Text(
                                model.filteredList[index]
                                        .existingSupplierCode ??
                                    '',
                                style: const TextStyle(fontSize: 13),
                              ),
                              onTap: () {
                                // Handle row click here
                                // _onRowClick(context, filteredList[index]);
                                model.onRowClick(
                                    context, model.filteredList[index]);
                              },
                            ),
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
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('No Farmer List found Status Pending.'),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.addFarmerScreen,
                                  arguments: const AddFarmerScreenArguments(
                                      farmerid: ""),
                                );
                              },
                              child: const Text('Create a Farmer')),
                        ],
                      ),
                    )
            ],
          ),
          context: context,
          loader: model.isBusy,
        ),

        // body: fullScreenLoader(
        //   context: context,
        //   loader: model.isBusy,
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: TextField(
        //           onChanged: model.filterList,
        //           decoration: const InputDecoration(
        //             labelText: 'Search',
        //             prefixIcon: Icon(Icons.search),
        //           ),
        //         ),
        //       ),
        //       Expanded(
        //         child: ListView.separated(
        //           itemCount: model.filteredList.length,
        //           itemBuilder: (context, index) {
        //             return ListTile(
        //               leading: SizedBox(
        //                 width: 120,
        //                 child: AutoSizeText(
        //                   model.filteredList[index].village ?? '',
        //                   maxLines: 2,
        //                 ),
        //               ),
        //               title: Text(
        //                 model.filteredList[index].supplierName ?? '',
        //                 style: const TextStyle(fontSize: 11),
        //               ),
        //               subtitle: Text(
        //                 model.filteredList[index].name ?? '',
        //                 style: const TextStyle(fontSize: 8),
        //               ),
        //               onTap: () {
        //                 // Handle row click here
        //                 // _onRowClick(context, filteredList[index]);
        //                 model.onRowClick(context, model.filteredList[index]);
        //               },
        //             );
        //           },
        //           separatorBuilder: (context, index) {
        //             return const Divider();
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
