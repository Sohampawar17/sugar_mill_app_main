import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';

import '../../../widgets/cdrop_down_widget.dart';
import '../../../widgets/ctext_button.dart';
import 'add_tripsheet_model.dart';

class AddTripsheetScreen extends StatelessWidget {
  final String tripId;
  const AddTripsheetScreen({super.key, required this.tripId});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTripSheetModel>.reactive(
      viewModelBuilder: () => AddTripSheetModel(),
      onViewModelReady: (model) => model.initialise(context, tripId),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: model.isEdit == true
              ? Text(model.tripSheetData.name.toString())
              : const Text('Trip Sheet Form'),
        ),
        body: fullScreenLoader(
            child: SingleChildScrollView(
              child: Form(
                key: model.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: model.tripSheetData.season,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Season *',
                                ),
                                hint: const Text('Select Season'),
                                items: model.season.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  model.setSelectedSeason(context, value);
                                },
                                validator: model.validateSeason,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            //for plant
                            child: CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: model.tripSheetData.branch,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Plant *',
                                ),
                                hint: const Text('Select Plant'),
                                items: model.plantList.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                }).toList(),
                                onChanged: model.setSelectedPlant,
                                validator: model.validatePlant,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.numberWithOptions(signed: true),
                                controller: model.slipnoController,
                                decoration:
                                    const InputDecoration(labelText: 'Slip No *'),
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter a Slip Number'
                                    : null,
                                onChanged: model.setSelectSlipNo,

                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Autocomplete<String>(
                              key: Key(model.tripSheetData.platNoId ?? "05"),
                              initialValue: TextEditingValue(
                                text: model.tripSheetData.platNoId ?? "",
                              ),
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<String>.empty();
                                }
                                return model.plotList
                                    .map((grower) => grower.id ?? "")
                                    .toList()
                                    .where((grower) => grower
                                        .toLowerCase()
                                        .contains(textEditingValue.text
                                            .toLowerCase()));
                              },
                              onSelected: model.setSelectPlotNo,
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Plot Number *',
                                  ),
                                  onChanged: (value) {},
                                  validator: model.validatePlotNo,
                                );
                              },
                              optionsViewBuilder: (BuildContext contpext,
                                  AutocompleteOnSelected<String> onSelected,
                                  Iterable<String> options) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    elevation: 4.0,
                                    child: Container(
                                      constraints:
                                          const BoxConstraints(maxHeight: 200),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: options.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final String option =
                                              options.elementAt(index);
                                          final routeData = model.plotList
                                              .firstWhere((route) =>
                                                  route.id.toString() ==
                                                  option);
                                          return GestureDetector(
                                            onTap: () {
                                              onSelected(option);
                                            },
                                            child: ListTile(
                                              title: Text(option),
                                              subtitle:
                                                  Text(routeData.growerName!),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              optionsMaxHeight: 200,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              key: Key(model.tripSheetData.farmerCode ?? "04"),
                              initialValue: model.selectedfarcode ??
                                  model.tripSheetData.vendorCode,
                              decoration: const InputDecoration(
                                  labelText: 'Farmer Code'),

                              onChanged: model.setSelectFarmerCode,
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              key: Key(
                                  model.tripSheetData.plantationDate ?? "04"),
                              controller: model.plantingDateController,
                              // onTap: () => model.selectDate(context),
                              decoration: const InputDecoration(
                                labelText: 'Plantation Date',
                                hintText: 'Select Plantation Date',
                              ),
                              readOnly: true,
                              onChanged: model.setSelectPlantationDate,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                          readOnly: true,
                          key: Key(model.tripSheetData.farmerName ?? "04"),
                          initialValue: model.tripSheetData.farmerName,
                          decoration:
                              const InputDecoration(labelText: 'Farmer Name'),
                          // validator: (value) => value!.isEmpty
                          //     ? 'Please enter a Farmer Name'
                          //     : null,
                          onChanged: model.setSelectFarmerName),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Expanded(
                            child: TextFormField(
                              key: Key(model.tripSheetData.surveryNo ?? "04"),
                              initialValue: model.tripSheetData.surveryNo,
                              decoration:
                                  const InputDecoration(labelText: 'Survey No'),
                              // validator: (value) => value!.isEmpty
                              //     ? 'Please enter a Survey No'
                              //     : null,
                              onChanged: model.setSelectVillage,
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              key: Key(model.tripSheetData.areaAcre.toString()),
                              initialValue:
                              model.tripSheetData.areaAcre?.toString() ??
                                  "",
                              decoration:
                              const InputDecoration(labelText: 'Area Acre'),
                              // validator: (value) => value!.isEmpty
                              //     ? 'Please enter a Area Acre'
                              //     : null,
                              onChanged: model.setSelectArea,
                              readOnly: true,
                            ),
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              key:
                              Key(model.tripSheetData.fieldVillage ?? "04"),
                              initialValue: model.tripSheetData.fieldVillage,
                              decoration:
                              const InputDecoration(labelText: 'Village'),
                              // validator: (value) => value!.isEmpty
                              //     ? 'Please enter a Village'
                              //     : null,
                              onChanged: model.setSelectVillage,
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              key: Key(model.tripSheetData.caneVariety ?? "04"),
                              initialValue: model.tripSheetData.caneVariety,
                              decoration: const InputDecoration(
                                  labelText: 'Cane Variety'),
                              // validator: (value) => value!.isEmpty
                              //     ? 'Please enter a Cane Variety'
                              //     : null,
                              onChanged: model.setSelectVariety,
                              readOnly: true,
                            ),
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Expanded(
                            child: Autocomplete<String>(
                              key: Key(model.tripSheetData.routeName ?? "02"),
                              initialValue: TextEditingValue(
                                text: model.selectedCaneRoute ?? "",
                              ),
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<String>.empty();
                                }
                                return model.routeList
                                    .map((route) => route.route!)
                                    .toList()
                                    .where((route) => route
                                        .toLowerCase()
                                        .contains(textEditingValue.text
                                            .toLowerCase()));
                              },
                              onSelected: (String routeName) {
                                // Find the corresponding route object
                                final routeData = model.routeList.firstWhere(
                                    (route) => route.route == routeName);
                                model.setSelectedRoute(
                                    routeData); // Pass the route
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  decoration: const InputDecoration(
                                    labelText: 'Route',
                                  ),
                                  onChanged: (String value) {},
                                  // validator: model.validateRote,
                                );
                              },
                              optionsViewBuilder: (BuildContext context,
                                  AutocompleteOnSelected<String> onSelected,
                                  Iterable<String> options) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    elevation: 4.0,
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: 200,
                                      ),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: options.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final String option =
                                              options.elementAt(index);
                                          // Find the corresponding route object
                                          final routeData = model.routeList
                                              .firstWhere((route) =>
                                                  route.route == option);
                                          return GestureDetector(
                                            onTap: () {
                                              onSelected(routeData.route ??
                                                  ""); // Send the name as the selected route
                                            },
                                            child: ListTile(
                                              title: Text(option),
                                              // Display the corresponding name value
                                              subtitle: Text(routeData.name!),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              optionsMaxHeight: 200,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              key: Key(model.tripSheetData.distance.toString()),
                              initialValue:
                                  model.tripSheetData.distance?.toStringAsFixed(0) ??
                                      "",
                              decoration:
                                  const InputDecoration(labelText: 'Distance'),
                              onChanged: model.setSelectedDistance,
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            //for plant
                            child: CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                isExpanded: true,
                                key: Key(model.tripSheetData.burnCane ?? "04"),
                                value: model.tripSheetData.burnCane,
                                decoration: const InputDecoration(
                                  labelText: 'Deduction Type',
                                ),
                                hint: const Text('Select Deduction Type'),
                                items: model.deductionType.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                }).toList(),

                                onChanged: model.setSelectedDeduction,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: TextFormField(
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                              controller: model.deductionController,
                              // onTap: () => model.selectDate(context),
                              decoration: const InputDecoration(
                                labelText: 'Deduction %',
                              ),
                              onChanged: model.setSelectedDeductionAmount,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(signed: true),
                        key: Key(model.tripSheetData.cartno.toString()),
                        initialValue: model.tripSheetData.cartno?.toStringAsFixed(0) ?? "",
                        decoration:
                        const InputDecoration(labelText: 'Cart Number'),
                        // validator: (value) => value!.isEmpty
                        //     ? 'Please enter a Survey No'
                        //     : null,
                        onFieldSubmitted: model.setSelectedCartNo,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Autocomplete<String>(
                              key: Key(
                                  model.tripSheetData.oldTransporterCode ?? "06"),
                              initialValue: TextEditingValue(
                                text: model.tripSheetData.oldTransporterCode ?? "",
                              ),
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<String>.empty();
                                }
                                return model.transportList
                                    .map((grower) => grower.oldNo.toString())
                                    .toList()
                                    .where((grower) => grower
                                        .toLowerCase()
                                        .contains(textEditingValue.text
                                            .toLowerCase()));
                              },
                              onSelected: (String routeName) {
                                // Find the corresponding route object
                                final routeData = model.transportList.firstWhere(
                                        (route) => route.oldNo == routeName);
                                model.setSelectedTransCode(
                                    routeData.oldNo); // Pass the route
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(
 keyboardType: const TextInputType.numberWithOptions(signed: true),
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  decoration: const InputDecoration(
                                    labelText: 'Transporter Code *',
                                  ),
                                  onChanged: (value) {},
                                  validator: model.validateTrans,
                                );
                              },
                              optionsViewBuilder: (BuildContext context,
                                  AutocompleteOnSelected<String> onSelected,
                                  Iterable<String> options) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    elevation: 4.0,
                                    child: Container(
                                      constraints:
                                          const BoxConstraints(maxHeight: 200),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: options.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final String option =
                                              options.elementAt(index);
                                          final routeData = model.transportList
                                              .firstWhere((route) =>
                                                  route.oldNo.toString() ==
                                                  option);
                                          return GestureDetector(
                                            onTap: () {
                                              onSelected(option);
                                            },
                                            child: ListTile(
                                              title: Text(option),
                                              subtitle: Text(
                                                  routeData.transporterName.toString()),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              optionsMaxHeight: 200,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              key: Key(
                                  model.tripSheetData.transporterName ?? "07"),
                              initialValue:
                                  model.tripSheetData.transporterName ?? "",
                              // onTap: () => model.selectDate(context),
                              decoration: const InputDecoration(
                                labelText: 'Transporter Name',
                              ),
                              onChanged: model.setSelectedTransporterName,
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),

                      TextFormField(
                        key: Key(model.tripSheetData.vehicleType ?? "08"),
                        initialValue:
                            model.tripSheetData.vehicleType ?? "",
                        decoration: const InputDecoration(
                          labelText: 'vehicle Type',
                        ),
                        readOnly: true,
                        onChanged: model.setSelectedVType,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Autocomplete<String>(
                              key: Key(
                                  model.tripSheetData.harvesterCodeOld ?? "09"),
                              initialValue: TextEditingValue(
                                text:
                                    model.tripSheetData.harvesterCodeOld ?? "",
                              ),
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<String>.empty();
                                }
                                return model.transportList
                                    .map((grower) => grower.oldNo.toString())
                                    .toList()
                                    .where((grower) => grower
                                        .toLowerCase()
                                        .contains(textEditingValue.text
                                            .toLowerCase()));
                              },
                              onSelected: (String routeName) {
                                // Find the corresponding route object
                                final routeData = model.transportList.firstWhere(
                                        (route) => route.oldNo == routeName);
                                model.setSelectedHarCode(
                                    routeData.oldNo); // Pass the route
                              },

                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(
 keyboardType: const TextInputType.numberWithOptions(signed: true),
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  decoration: const InputDecoration(
                                    labelText: 'Harvester Code',
                                  ),
                                  onChanged: (value) {},

                                );
                              },
                              optionsViewBuilder: (BuildContext context,
                                  AutocompleteOnSelected<String> onSelected,
                                  Iterable<String> options) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    elevation: 4.0,
                                    child: Container(
                                      constraints:
                                          const BoxConstraints(maxHeight: 200),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: options.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final String option =
                                              options.elementAt(index);
                                          final routeData = model.transportList
                                              .firstWhere((route) =>
                                                  route.oldNo.toString() ==
                                                  option);
                                          return GestureDetector(
                                            onTap: () {
                                              onSelected(option);
                                            },
                                            child: ListTile(
                                              title: Text(option),
                                              subtitle: Text(
                                                  routeData.harvesterName.toString()),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              optionsMaxHeight: 200,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              key: Key(
                                  model.tripSheetData.harvesterNameH ?? "10"),
                              initialValue:
                                  model.tripSheetData.harvesterNameH ?? "",
                              decoration: const InputDecoration(
                                labelText: 'Harvester Name',
                              ),
                              readOnly: true,
                              onChanged: model.setSelectedHarName,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Expanded(
                          //   child: TextFormField(
                          //     key: Key(model.tripSheetData.gangType ?? "11"),
                          //     initialValue: model.tripSheetData.gangType ?? "",
                          //     decoration: const InputDecoration(
                          //       labelText: 'Gang Type',
                          //     ),
                          //     readOnly: true,
                          //     onChanged: model.setSelectedGang,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   width: 20.0,
                          // ),
                          if (model.tripSheetData.vehicleType != "BULLOCK CART")
                            Expanded(
                              child: TextFormField(
                                key: Key(
                                    model.tripSheetData.vehicleNumber ?? "12"),
                                initialValue:
                                    model.tripSheetData.vehicleNumber ?? "",
                                decoration: const InputDecoration(
                                  labelText: 'Engine Number',
                                ),
                                readOnly: true,
                                onChanged: model.setSelectedEngine,
                              ),
                            ),
                          const SizedBox(
                            width: 20.0,
                          ),
                        ],
                      ),
                      if (model.tripSheetData.vehicleType != "BULLOCK CART")
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                key: Key(model.tripSheetData.tolly1 ?? "13"),
                                initialValue: model.tripSheetData.tolly1 ?? "",
                                decoration: const InputDecoration(
                                  labelText: 'Tolly 1 ',
                                ),
                                readOnly: true,
                                onChanged: model.setSelectedTy_1,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                key: Key(model.tripSheetData.tolly2 ?? "14"),
                                initialValue: model.tripSheetData.tolly2 ?? "",
                                decoration: const InputDecoration(
                                  labelText: 'Tolly 2',
                                ),
                                readOnly: true,
                                onChanged: model.setSelectedTy_2,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            //for plant
                            child: CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: model.tripSheetData.rope,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Rope *',
                                ),
                                hint: const Text('Select Rope Type'),
                                items: model.ropeType.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                }).toList(),
                                onChanged: model.setSelectedRope,
                                //     model.setSelectedPlant(value),
                                validator: model.validateRope,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Autocomplete<String>(
                              key: Key(
                                  model.tripSheetData.waterSupplier ?? "15"),
                              initialValue: TextEditingValue(
                                text: model.watersuppliercode ?? "",
                              ),
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<String>.empty();
                                }
                                return model.waterSupplier
                                    .map((route) =>
                                        route.supplierName ?? "")
                                    .toList()
                                    .where((route) => route
                                        .toLowerCase()
                                        .contains(textEditingValue.text
                                            .toLowerCase()));
                              },
                              onSelected: (String routeName) {
                                // Find the corresponding route object
                                final routeData = model.waterSupplier
                                    .firstWhere((route) =>
                                        route.existingSupplierCode ==
                                        routeName);
                                model.setSelectedWaterSupplier(
                                    routeData); // Pass the route
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(

                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  decoration: const InputDecoration(
                                    labelText: 'Water Supplier Code',
                                  ),
                                  onChanged: (String value) {},
                                );
                              },
                              optionsViewBuilder: (BuildContext context,
                                  AutocompleteOnSelected<String> onSelected,
                                  Iterable<String> options) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    elevation: 4.0,
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: 200,
                                      ),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: options.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final String option =
                                              options.elementAt(index);
                                          // Find the corresponding route object
                                          final routeData = model.waterSupplier
                                              .firstWhere((route) =>
                                                  route.supplierName ==
                                                  option);
                                          return GestureDetector(
                                            onTap: () {
                                              onSelected(routeData
                                                      .existingSupplierCode ??
                                                  ""); // Send the name as the selected route
                                            },
                                            child: ListTile(
                                              title: Text(option),
                                              // Display the corresponding name value
                                              subtitle:
                                                  Text(routeData.existingSupplierCode!),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              optionsMaxHeight: 200,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              key: Key(model.tripSheetData.waterSupplierName ??
                                  "16"),
                              initialValue:
                                  model.tripSheetData.waterSupplierName ?? "",
                              decoration: const InputDecoration(
                                labelText: 'Water Supplier Name',
                              ),
                              readOnly: true,
                              onChanged: model.setSelectedWaterSuppName,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                controller: model.watershareController,
                                decoration: const InputDecoration(
                                  labelText: 'Water Share(%)',
                                ),
                                onChanged: model.setSelectedWaterSupShare),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          CtextButton(
                            text: 'Cancel',
                            onPressed: () => Navigator.of(context).pop(), buttonColor: Colors.red,
                          ),
                          CtextButton(
                            onPressed: () => model.onSavePressed(context),
                            // onPressed: () => () {},
                            text: 'Save', buttonColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            context: context,
            loader: model.isBusy),
      ),
    );
  }
}
