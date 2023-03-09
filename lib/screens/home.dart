import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../http_call/get.dart';
import '../model/model.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children:[
          SizedBox(width:40.w,),
          Text("Search"),
          IconButton(
              onPressed:() async {
                weatherModel = await Repo().getWeatherByLiveLocation();
                print(weatherModel?.main?.temp ?? "error");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details(weatherModel:weatherModel,)),
                );
              },
              icon: Icon(
                Icons.near_me,
                size: 30.0,
              ),
          ),
          ],
        ),
          centerTitle:true,
        ),
        body:Padding(padding:EdgeInsets.only(left:10.w,right:10.w),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              child: TextField(
                controller:controller,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xff2879FF),
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color(0xff2879FF)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  hintText: 'City Name',
                  filled: true,
                  fillColor: Color(0xffF4F4F4),
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  weatherModel = await Repo().getWeatherByCityName(controller.text);
                  print(weatherModel?.main?.temp ?? "error");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details(weatherModel:weatherModel,)),
                  );
                  setState(() {});
                },
                child: Text("How's Weather")),
          ],
        ),
        ),
    );
  }
}
