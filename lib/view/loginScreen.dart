import 'package:first_app/utils/MyColor.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _HomeState();
}
/*
tab bar help url

https://mightytechno.com/style-tabs-in-flutter-app/
*/
class _HomeState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  var h, w;
  bool Small = false;
  String dropdownvalue = 'Noida';
  var items = [
    'Noida',
    'Delhi',
    'Ghaziabad',
    'Gurgaon',
  ];
  List ready = [
    {
      'image': 'assets/v_logo.png',
      'name': '3BHK',
    },
    {
      'image': 'assets/v_logo.png',
      'name': '2BHK',
    },
    {
      'image': 'assets/v_logo.png',
      'name': 'PENTHOUSE',
    },
  ];
  List location = [
    {
      'image': 'assets/v_logo.png',
      'name': '3BHK',
    },
    {
      'image': 'assets/v_logo.png',
      'name': '2BHK',
    },
    {
      'image': 'assets/v_logo.png',
      'name': 'PENTHOUSE',
    },
  ];

  late final TabController _controller;



  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }
  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColor.bule,
        leading: Icon(Icons.menu),
        title: Text(
          'CLOUDUS',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          Center(
            child: IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 2.0, bottom: 7),
                child: Center(
                    child: Image.asset("assets/v_logo.png",
                        color: (MyColor.white), height: 20, fit: BoxFit.cover)),
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MySearch()),
                // );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: DropdownButton(
              underline: Container(),
              dropdownColor: MyColor.bule,
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                      fontSize: 16,
                      color: MyColor.white,
                    ),
                  ),
                );
              }).toList(),
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ],
      ),




      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColor.lineDark,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:
                      Icon(Icons.search, color: MyColor.lineDark),
                      hintText: 'Search for landmark',
                      contentPadding: EdgeInsets.zero,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, color: MyColor.lineDark),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ))),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Featured collections suited to your property needs",
                    style: TextStyle(fontSize: 13, color: MyColor.bule),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ready to move in",
                    style: TextStyle(fontSize: 16, color: MyColor.lineDark),
                  ),
                )),
            Divider(
              thickness: 0.5,
              indent: 15,
              endIndent: 20,
              color: Colors.grey,
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Center(
              child:Container(
                height: 35,
                width: w,
   child: TabBar(
       controller: _controller,
       unselectedLabelColor: MyColor.lineDark,
       indicatorPadding: EdgeInsets.only(left: -10, right: -10),
       indicatorSize: TabBarIndicatorSize.label,
       indicator: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: MyColor.lineDark),
     tabs: [
       Tab(
        child: Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: MyColor.lineDark, width: 1)),
          child: Align(
            alignment: Alignment.center,
            child: Text("APPS"),
          ),
        ),
         ),
       Tab(
         child: Container(
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               border: Border.all(color: MyColor.lineDark, width: 1)),
           child: Align(
             alignment: Alignment.center,
             child: Text("WEB"),
           ),
         ),
       ),
       Tab(
         child:  Container(
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               border: Border.all(color: MyColor.lineDark, width: 1)),
           child: Align(
             alignment: Alignment.center,
             child: Text("DESK"),
           ),
         ),
       ),

              ]
   ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 8.0),
              height: 200,
              width: w,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: ready.length,
                itemBuilder: (context, position) => Container(
                  width: 150,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: MyColor.white,

                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(ready[position]['image'],
                              height: 150,
                              //   width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        ready[position]['name'],
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.0, top: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      "LOCATIONS",
                      style:
                      TextStyle(fontSize: 16, color: MyColor.lineDark),
                    ),
                  ),
                )),
            Divider(
              // height: 25,
              thickness: 0.5,
              indent: 15,
              endIndent: 20,
              color: Colors.grey,
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Center(
              child:Container(
                height: 35,
                width: w,
                child: TabBar(
                    controller: _controller,
                    unselectedLabelColor: MyColor.lineDark,
                    indicatorPadding: EdgeInsets.only(left: -10, right: -10),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColor.lineDark),
                    tabs: [
                      Tab(
                        child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: MyColor.lineDark, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("APPS"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: MyColor.lineDark, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("WEB"),
                          ),
                        ),
                      ),
                      Tab(
                        child:  Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: MyColor.lineDark, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("DESK"),
                          ),
                        ),
                      ),

                    ]
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              height: 200,
              width: w,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: location.length,
                itemBuilder: (context, position) => Container(
                  width: 150,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: MyColor.white,

                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(location[position]['image'],
                              height: 150,
                              //   width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        location[position]['name'],
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                    child: Text(
                      "TOWNSHIPS",
                      style:
                      TextStyle(fontSize: 16, color: MyColor.lineDark),
                    ),
                  ),
                )),
            Divider(
              // height: 25,
              thickness: 0.5,
              indent: 15,
              endIndent: 20,
              color: Colors.grey,
            ),

            SizedBox(
              height: h * 0.02,
            ),
            Center(
              child:Container(
                height: 35,
                width: w,
                child: TabBar(
                    controller: _controller,
                    unselectedLabelColor: MyColor.lineDark,
                    indicatorPadding: EdgeInsets.only(left: -10, right: -10),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColor.lineDark),
                    tabs: [
                      Tab(
                        child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: MyColor.lineDark, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("APPS"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: MyColor.lineDark, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("WEB"),
                          ),
                        ),
                      ),
                      Tab(
                        child:  Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: MyColor.lineDark, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("DESK"),
                          ),
                        ),
                      ),

                    ]
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 8.0),
              height: 200,
              width: w,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: location.length,
                itemBuilder: (context, position) => Container(
                  width: 150,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: MyColor.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.shade200,
                    //     blurRadius: 2,
                    //     spreadRadius: 2,
                    //
                    //   )
                    // ],
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(location[position]['image'],
                              height: 150,
                              //   width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        location[position]['name'],
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
