
import 'package:flutter/material.dart';

sealed class KTScaffoldMessage{
  static ScaffoldFeatureController scaffoldMessage(context,String message,{Color color = Colors.red}) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,style: const TextStyle(fontSize: 16,color: Colors.white),),backgroundColor: color,));
}