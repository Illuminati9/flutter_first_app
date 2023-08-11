import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  var location;
  var time;
  var flag;
  var url;
  var isDayTime=false;

  WorldTime({ this.location,this.flag,this.url});

    Future<void> getTime() async {
      try{
        Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
        Map data = jsonDecode(response.body);
        //print(time);
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);
        // print(datetime);
        // print(offset);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        //set time property
        isDayTime = now.hour>6 && now.hour<18 ? true: false ;
        time = DateFormat.jm().format(now);
      }catch(e){
        print(e);
        time = 'could not get time data';
      }

  }

}