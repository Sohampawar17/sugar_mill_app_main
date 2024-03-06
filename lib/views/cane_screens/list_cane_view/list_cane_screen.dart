import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/views/cane_screens/list_cane_view/list_cane_model.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';
import '../../../router.router.dart';
import '../../../widgets/cdrop_down_widget.dart';

class ListCaneScreen extends StatelessWidget {
  const ListCaneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListCaneModel>.reactive(
      viewModelBuilder: () => ListCaneModel(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const AutoSizeText('Cane Master'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.addCaneScreen,
                      arguments: const AddCaneScreenArguments(caneId: ""),
                    );
                  },
                  child: const AutoSizeText('+Add Cane Master')),
            )
          ],
        ),
        body: fullScreenLoader(
          child: RefreshIndicator(
            onRefresh: model.refresh,
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
                            child: CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                isExpanded: true,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Season',
                                ),
                                hint: const Text('Select Season'),
                                items: model.seasonlist.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: AutoSizeText(val),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  model.seasoncontroller.text = value ?? "";
                                  model.filterListByNameAndVillage(
                                      season: value);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ), Expanded(
                            child: TextField(
                              // controller: model.villageController,
                              onChanged: (value) {
                                model.idcontroller.text = value;
                                model.filterListByNameAndVillage(
                                    village: value);
                              },
                              decoration: const InputDecoration(
                                labelText: 'Route',
            
                                // prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
            
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                model.namecontroller.text = value;
                                model.filterListByNameAndVillage(
                                    name: value);
                              },
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                // prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
            
                          const SizedBox(width: 5.0)
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey,
                  child: const ListTile(
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AutoSizeText(
                          'Village/route',
                          maxLines: 2,
                          style: TextStyle(color: Colors.white),
                        ),
                       AutoSizeText(
                          'Crop Variety',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    leading:AutoSizeText(
                      'Plot Number',
                       overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                    title: AutoSizeText(
                      'Name',
                      style: TextStyle(color: Colors.white),
                      minFontSize: 8,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                         Expanded(
                          child: AutoSizeText(
                            'Survey Number',
                              overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            'Plantation Date',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                       
                         
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                model.caneList.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: model.canefilterList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ListTile(
                                tileColor: model.getTileColor(
                                    model.canefilterList[index].plantationStatus),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    AutoSizeText(
                                      model.canefilterList[index].routeName ?? '',
                                      maxLines: 2,
                                    ),
                                    AutoSizeText(
                                      model.canefilterList[index]
                                              .cropVariety ??
                                          '',
                                    ),
                                  ],
                                ),
                                leading:AutoSizeText(
                                  model.canefilterList[index]
                                      .name.toString(),
                                      minFontSize: 20,
                                ),
                               
                                title: AutoSizeText(
                                  model.canefilterList[index].growerName ?? '', maxLines: 2,minFontSize: 10,
                                ),
                                subtitle: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      model.canefilterList[index].surveyNumber.toString(),maxLines: 2,
                                    ),
                               const SizedBox(width: 15),
                                    AutoSizeText(DateFormat('dd-MM-yyyy').format(DateTime.parse(model.canefilterList[index].plantattionRatooningDate ??
                                        '')),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  model.onRowClick(
                                      context, model.canefilterList[index]);
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
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("You haven't created a Cane Master yet"),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.addCaneScreen,
                                  arguments:
                                      const AddCaneScreenArguments(caneId: ""),
                                );
                              },
                              child: const Text('Create a  Cane Master')),
                        ],
                      )
              ],
            ),
          ),
          context: context,
          loader: model.isBusy,
        ),
      ),
    );
  }
}
