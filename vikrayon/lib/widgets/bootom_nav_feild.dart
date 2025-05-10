// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BootombarFeild extends StatefulWidget {
  final Color backgroundColor;
  final Color backgroundColorbn;
  final Color bnviewcolour;
  final int currentIndex;
  final List<Widget> screens;
  final List<Widget> bnitems;
  final void Function(int) onItemTapped;

  const BootombarFeild({
    super.key,
    required this.backgroundColor,
    required this.backgroundColorbn,
    required this.currentIndex,
    required this.screens,
    required this.bnitems,
    required this.onItemTapped,
    required this.bnviewcolour,
  });

  @override
  State<BootombarFeild> createState() => _BootomBarFeildState();
}

class _BootomBarFeildState extends State<BootombarFeild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundColor,
        body:
            IndexedStack(index: widget.currentIndex, children: widget.screens),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: widget.backgroundColorbn,
          color: widget.bnviewcolour,
          index: widget.currentIndex,
          items:
              widget.bnitems.map((item) => Icon((item as Icon).icon)).toList(),
          onTap: widget.onItemTapped,

          // (index){
          //   setState(() {
          //     widget.onItemTapped(index);
          //   });
          // },
        ));
  }
}
