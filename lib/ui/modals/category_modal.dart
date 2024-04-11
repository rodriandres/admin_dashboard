import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CategoryModal extends StatefulWidget {
  
  final Category? category;

  const CategoryModal({
    super.key,
    this.category,
  });

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  
  String name = '';
  String? id;

  @override
  void initState() {
    super.initState();
    
    id = widget.category?.id;
    name = widget.category?.nombre ?? '';
    

  }

  @override
  Widget build(BuildContext context) {
    
    final CategoriesProvider categoryProvider = Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      // width: double.infinity,
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.category?.nombre ?? 'New Category', style: CustomLabels.h1.copyWith(color: Colors.white),),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white,),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),

          Divider( color: Colors.white.withOpacity(0.3)),
          const SizedBox(height: 20),

          TextFormField(
            initialValue: widget.category?.nombre ?? '',
            onChanged: (value) => name = value,
            decoration: CustomInputs.loginInputDecoration(
              hint: 'Category name',
              label: 'Name',
              icon: Icons.new_releases_outlined,
            ),
            style: const TextStyle(color: Colors.white),
          ),

          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              text: 'Save',
              color: Colors.white,
              onPressed: () async {
                if(id == null ) {
                  await categoryProvider.createCategory(name);
                } else {
                  categoryProvider.updateCategory(name, widget.category!.id);
                }
                Navigator.of(context).pop();
              },
            ),
          )

        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => 
    const BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20) ),
      color: Color(0xff0F2041),
      boxShadow:[ BoxShadow( color: Colors.black26 ), ]
    );
}