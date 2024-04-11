import 'package:admin_dashboard/ui/cards/custom_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Icons View', style: CustomLabels.h1,),

          const SizedBox(height: 10),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [

              const CustomCard(
                title: 'ac_unit_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.ac_unit_outlined ),
                ),
              ),

              
              const CustomCard(
                title: 'access_alarms_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.access_alarms_outlined ),
                ),
              ),

              
              const CustomCard(
                title: 'add_home_work_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.add_home_work_outlined ),
                ),
              ),

              
              const CustomCard(
                title: 'dangerous_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.dangerous_outlined ),
                ),
              ),

              
              const CustomCard(
                title: 'kayaking_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.kayaking_outlined ),
                ),
              ),

              
              const CustomCard(
                title: 'join_full_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.join_full_outlined ),
                ),
              ),

              const CustomCard(
                title: 'join_full_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.join_full_outlined ),
                ),
              ),

              const CustomCard(
                title: 'padding_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.padding_outlined ),
                ),
              ),

              const CustomCard(
                title: 'lan_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.lan_outlined ),
                ),
              ),

              const CustomCard(
                title: 'face_2_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.face_2_outlined ),
                ),
              ),

              const CustomCard(
                title: 'smoking_rooms_outlined',
                color: Colors.white,
                width: 170,
                child: Center(
                  child: Icon( Icons.smoking_rooms_outlined ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}