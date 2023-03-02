import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/model.dart';

class Details extends StatefulWidget {
  WeatherModel? weatherModel;

  Details({Key? key, this.weatherModel}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  bool isSwitched = false;
  var textValue = 'Celsius to Ferhanite';
  double deg=0.0;
  var degr='\u2103';

  void initState(){
    setState(() {
      deg=widget.weatherModel?.main?.temp ?? 0.0;
    });
  }

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Celsius to Ferhanite';
        deg=widget.weatherModel?.main?.temp ?? 0.0;
        deg=deg*1.8+32;
        degr='\u2109';
      });
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Ferhanite to Celsius';
        deg=widget.weatherModel?.main?.temp ?? 0.0;
        degr='\u2103';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${widget.weatherModel?.name}",
              style: TextStyle(color: Colors.black, fontSize: 20.sp,fontWeight:FontWeight.bold)),
          Text("Temp ${deg}${degr}",
              style: TextStyle(color: Colors.black, fontSize: 20.sp)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.weatherModel?.weather![0]?.description == "clear sky")
                Image.asset(
                  'asset/img_7.png',
                  width: 30.w,
                  height: 30.h,
                )
              else if (widget.weatherModel?.weather![0]?.description == "smoke")
                Image.asset(
                  'asset/img_6.png',
                  width: 30.w,
                  height: 30.h,
                )
              else if (widget.weatherModel?.weather![0]?.description ==
                  "scattered clouds")
                Image.asset(
                  'asset/img_8.png',
                  width: 30.w,
                  height: 30.h,
                )
              else if (widget.weatherModel?.weather![0]?.description == "haze")
                Image.asset(
                  'asset/img.png',
                  width: 30.w,
                  height: 30.h,
                )
                  else if (widget.weatherModel?.weather![0]?.description == "overcast clouds")
                      Image.asset(
                        'asset/img.png',
                        width: 30.w,
                        height: 30.h,
                      )
                    else if (widget.weatherModel?.weather![0]?.description == "few clouds")
                        Image.asset(
                          'asset/img_8.png',
                          width: 30.w,
                          height: 30.h,
                        ),
              SizedBox(width:10.w,),
              Text("${widget.weatherModel?.weather![0]?.description}",
                  style: TextStyle(color: Colors.black, fontSize: 20.sp)),
    ],
          ),
          SizedBox(height:50.h,),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
          Text("${textValue}",
              style: TextStyle(color: Colors.black, fontSize: 20.sp)),
          Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.blue,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          ),
        ],
      ),
      ],
      ),
    );
  }
}
