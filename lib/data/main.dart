import 'package:flutter/material.dart';

final List<String> schools = <String>[
  "N/A",
  'College: George Brown College',
  'College: Centennial College',
  'University: University Of Toronto',
  'University: Ryerson University',
];

//STANDARD - Keys first letter "miniscule",
//0 = vegan, 1 = vegetarian, 2 = All

//Breakfast(String), array(dynamic)
Map<String, dynamic> food = {
  "breakfast": [
    {
      "name": "Egg Sandwich",
      "diet": 1,
      "assemble": true,
      "cook": false,
      // "calories": 250
    },
    {
      "name": "Ham and swiss omelet",
      "diet": 2,
      "assemble": false,
      "cook": true,
    },
    {
      "name": "Sausage & Crescent Roll Casserole",
      "diet": 2,
      "assemble": true,
      "cook": true
    },
    {
      "name": "Peanut Butter Oatmeeal",
      "diet": 1,
      "assemble": true,
      "cook": false,
    },
    {
      "name": "Homemade Egg McMuffins",
      "diet": 1,
      "assemble": true,
      "cook": true
    },
    {
      "name": "Protein Packed Nut-Free Chocolate Granola Bars",
      "diet": 1,
      "assemble": true,
      "cook": false
    },
    {
      "name": "Protein Packed Vegan Breakfast Burrito",
      "diet": 0,
      "assemble": true,
      "cook": true
    },
    {
      "name": "Vegan Gluten-Free Lemon Blueberry Belgian Waffles",
      "diet": 0,
      "assemble": true,
      "cook": false
    },
  ]
};
