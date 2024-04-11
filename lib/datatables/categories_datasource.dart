
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  final BuildContext context;
  final List<Category> categories;

  CategoriesDTS(this.context, this.categories);

  @override
  DataRow getRow(int index) {
    final category = categories[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell( Text(category.id) ),
        DataCell( Text(category.nombre) ),
        DataCell( Text(category.usuario.nombre) ),
        DataCell( 
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: (){
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: ( _ ) => CategoryModal( category: category),
                    );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: (){
                  final dialog = AlertDialog(
                    
                    title: const Text('Delete Category'),
                    content: Text('Are you sure you want to delete ${category.nombre} category?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Confirm'),
                        onPressed: () {
                          Provider.of<CategoriesProvider>(context, listen: false)
                            .deleteCategory( category.id );
                          
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );

                  showDialog(context: context, builder: ( _ ) => dialog);
                },
              ),
            ],
          ),
        ),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;

}