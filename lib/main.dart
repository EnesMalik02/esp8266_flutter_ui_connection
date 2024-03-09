// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:teknofest/pages/counter_page.dart';
import 'package:teknofest/pages/first_page.dart';
import 'package:teknofest/pages/real_time_data_page.dart';
import 'package:teknofest/pages/settings_page.dart';
import 'package:teknofest/pages/todo_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  List actions = ["Current Datas", "Previous Datas","Other"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstpage' :(context) => FirstPage(),
        '/realtimedatapage' :(context) => RealTimeDataPage(),
        '/settingspage':(context) => SettingsPage(),
        '/counterpage':(context) => CounterPage(),
        '/todopage':(context) => ToDoPage(),
      } ,
    );
      
  }
}
//         backgroundColor: Colors.grey[400],
//         appBar: AppBar(
//           title:Text("İpekYolu"),
//           backgroundColor: Colors.blueGrey,
//           //elevation: 0,
//           leading: IconButton(onPressed: (){},icon: Icon(Icons.menu)),
//           actions: [
//             IconButton(onPressed: () {}, icon: Icon(Icons.logout))
//           ],
//         ) ,
//          body: Center(
//           child: GestureDetector(
//             onTap: () {
//               // do something, user tapped the container
//               print("A");
//             },
//           child: Container(
//             height: 200,
//             width: 200,
//             color: Colors.deepPurple,
//             child: Center(child: Text("Tap!")),
            
//           ),
//           ),
//          ),
//         //Stack(
//         //   alignment: Alignment.center,
//         //   children: [
//         //     // big box
//         //     Container(
//         //       height: 300,
//         //       width: 300,
//         //       color: Colors.deepPurple,
//         //     ),

//         //     // medium box
//         //      Container(
//         //       height: 200,
//         //       width: 200,
//         //       color: Colors.deepPurple[400],
//         //     ),

//         //     // small box
//         //      Container(
//         //       height: 100,
//         //       width: 100,
//         //       color: Colors.deepPurple[200],
//         //     ),
//         //   ],
//         // ),
        
        
        
//         // Search the gridView
//         /*ListView.builder(
//           itemCount: actions.length,
//           itemBuilder: (context, index) => ListTile(
//             title: Text(actions[index]),
//           ),
          
          
//           /*scrollDirection: Axis.vertical,
          
//           //mainAxisAlignment: MainAxisAlignment.center, --> this for the positioning the column
//           //crossAxisAlignment: CrossAxisAlignment.start, this is also for the positioning the columns
//           children: [
//             /*Expanded(
//               flex: 2,
//               child: Container(
//               //height: 200,        --> expanded Container
//               //width: 200,
//               color: Colors.deepPurple[100],
//               ),
//             ),*/
              
//               Container(
//               height: 550,
//               width: 200,
//               color: Colors.deepPurple[200],
//               ),
              
//                //-> with that we can let the widgets exist to rest of the screen 
//                         // if we delete all the widths and height for each container and if we put them into expanded they will cover whole screen in their location
//                 Container(
//               height: 550,
//               width: 200,
//               color: Colors.deepPurple[300],
//               ),
              
       

//       ],*/
//       ),*/
//       ),
//     );
//   }
// }
