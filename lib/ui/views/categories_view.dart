import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();

  }

  @override
  Widget build(BuildContext context) {
    
    final List<Category> categories = Provider.of<CategoriesProvider>(context).categories;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Categories', style: CustomLabels.h1,),

          const SizedBox(height: 10),

          // Theme(
          //   data: Theme.of(context).copyWith(
          //     cardTheme: CardTheme(
          //       color: Colors.red,
          //       elevation: 0, // remove shadow
          //       margin: const EdgeInsets.all(0), // reset margin
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(16), // Change radius
          //       ),
          //     ),
          //   ),
          //   child: PaginatedDataTable(
          //     columns: [
          //       DataColumn(label: Text('ID')),
          //       DataColumn(label: Text('Category')),
          //       DataColumn(label: Text('Created by')),
          //       DataColumn(label: Text('Actions')),
          //     ],
          //     source: CategoriesDTS(),
          //   ),
          // ),

          PaginatedDataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Category')),
                DataColumn(label: Text('Created by')),
                DataColumn(label: Text('Actions')),
              ],
              source: CategoriesDTS( context, categories ),
              onRowsPerPageChanged: (value) {
                setState(() {
                  _rowsPerPage = value ?? 10;
                });
              },
              rowsPerPage: _rowsPerPage,
              header: const Text('Categories'),
              actions: [
                
                CustomIconButton(
                  text: 'Create',
                  icon: Icons.add,
                  // color: Colors.red,
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: ( _ ) => const CategoryModal(),
                    );
                  })
              ],
            ),


        ],
      ),
    );
  }
}