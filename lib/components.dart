import 'package:flutter/material.dart';

Widget defaultText({required String text,double? size, weight,Color color = Colors.white}){
  return Text(text,style: TextStyle(fontSize: size,fontWeight: weight,color: color),maxLines: 1,overflow: TextOverflow.ellipsis,);
}

buildOtherCityItem({name, temp,description,image}){
  return Expanded(
    child: SizedBox(
      child: Card(
        elevation: 2.5,
        shadowColor: Colors.blue[400],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 8.0),
              child: defaultText(
                  text: name,
                  color: Colors.black,
                  size: 13.0),
            ),
            defaultText(text: temp, color: Colors.black),
            const SizedBox(
              height: 5.0,
            ),
            Image(image: NetworkImage(image)),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: defaultText(
                  text: description, color: Colors.black54,size: 12),
            ),
          ],
        ),
      ),
    ),
  );
}

buildForecastCityItem({temp,description,image,date}){
  return SizedBox(
    width: 110.0,
    height: 120.0,
    child: Card(
      elevation: 2.5,
      shadowColor: Colors.blue[400],
      child: Column(
        children: [
          const SizedBox(height: 2.5,),
          defaultText(text: temp, color: Colors.black),
          const SizedBox(
            height: 5.0,
          ),
          Image(image: NetworkImage(image)),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: defaultText(
                text: description, color: Colors.black54,size: 14.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          defaultText(
              text: date, color: Colors.black,size: 10.0),
        ],
      ),
    ),
  );
}

