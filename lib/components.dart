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

buildForecastCityItem({temp,description,image,date,name}){
  return Card(
    elevation: 2.5,
    shadowColor: Colors.blue[400],
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.blueAccent[100],child: Image(image: NetworkImage(image))),
              const SizedBox(width: 5.0,),
              defaultText(text: name, color: Colors.black),
              const SizedBox(width: 5.0,),
              defaultText(text: temp, color: Colors.black),
              const SizedBox(
                height: 5.0,
              ),
              const SizedBox(
                width: 5.0,
              ),
              defaultText(
                  text: description, color: Colors.black54,size: 14.0),
            ],
          ),
          Center(
            child: defaultText(
                text: date, color: Colors.black,size: 14.0),
          ),
        ],
      ),
    ),
  );
}

