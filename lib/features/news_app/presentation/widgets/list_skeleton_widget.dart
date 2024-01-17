import 'package:flutter/material.dart';


class ListSkeletonWidget extends StatelessWidget {
  const ListSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index){
      return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 4.0),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Color(0xffcfcfcf),
            
            
          ),
          const SizedBox(height: 15.0),
          Container(
            height: 50,
            width: double.infinity,
            color: Color(0xffcfcfcf),

          ),
          const SizedBox(height: 15.0),
          Container(
            height: 35,
            width: double.infinity,
            color: Color(0xffcfcfcf),

          )
        ],
      ),
    );
      });
  }
}