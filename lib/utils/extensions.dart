import 'package:flutter/material.dart';

extension SizeExtension on num{
  get horizontal=>SizedBox(width:toDouble());
  get vertical=>SizedBox(height:toDouble());
}