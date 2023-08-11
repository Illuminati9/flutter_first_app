import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  dynamic data = {
    'isDayTime':false
  };

  @override
  Widget build(BuildContext context) {

    data = data['isDayTime'] ? data :  ModalRoute.of(context)!.settings.arguments;
    print(data);

    String bgImage = data['isDayTime'] ?'day.png':'night.png';
    Color bgColor = data['isDayTime']?Colors.blue:Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location':result['location'],
                          'flag': result['flag'],
                          'time':result['time'],
                          'isDayTime':result['isDayTime']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                      size: 30.0,
                    ),
                    label: Text('Edit location',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
