import 'package:flutter/material.dart';

class TenderGoods extends StatefulWidget {
  const TenderGoods({super.key});

  @override
  State<TenderGoods> createState() => _TenderGoodsState();
}

class _TenderGoodsState extends State<TenderGoods> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Tender Goods"),
    );
  }
}