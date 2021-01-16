import 'package:appuiprac/widgets/country_dropdown.dart';
import 'package:flutter/material.dart';


class UIFlutterWorkshop extends StatefulWidget {
  @override
  _UIFlutterWorkshopState createState() => _UIFlutterWorkshopState();
}

class _UIFlutterWorkshopState extends State<UIFlutterWorkshop> {
  String _country='Pk';
  int _currentIndex=0;
  final prevention = [
    {'assets/images/distance.png': 'Avoid close\ncontact'},
    {'assets/images/wash_hands.png': 'Clean your\nhands often'},
    {'assets/images/mask.png': 'Wear a\nfacemask'},
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
            .asMap()
            .map((key, value) => MapEntry(
          key,
          BottomNavigationBarItem(
            title: Text(''),
            icon: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: _currentIndex == key
                    ? Colors.blue[600]
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Icon(value),
            ),
          ),
        ))
            .values
            .toList(),
      ),
       appBar:  new PreferredSize(
         child: new Container(
           alignment: Alignment.centerLeft,
           child: new Padding(
             padding: const EdgeInsets.only(
                 left: 10.0,
               top: 30,
             ),
             child: new Icon(Icons.menu,size: 34,),
           ),
           decoration: new BoxDecoration(
               gradient: new LinearGradient(
                   colors: [
                     Color(0xFFAD9FE4),
                     Colors.black
                   ]
               ),
           ),
         ),
         preferredSize: new Size(
             MediaQuery.of(context).size.width,
             50.0
         ),
       ),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFAD9FE4), Colors.black],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'COVID-19',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CountryDropdown(
                          countries: ['CN', 'FR', 'Pk', 'IT', 'UK', 'USA'],
                          country: _country,
                          onChanged: (val) => setState(() => _country = val),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Are you feeling sick?',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'If you have any COVID-19 symptoms, please call or text us immediately for help',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton.icon(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              onPressed: () {},
                              color: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Call Now',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              textColor: Colors.white,
                            ),
                            FlatButton.icon(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              onPressed: () {},
                              color: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              icon: const Icon(
                                Icons.chat_bubble,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Send SMS',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Prevention Tips',
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: prevention
                          .map((e) => Column(
                        children: <Widget>[
                          Image.asset(
                            e.keys.first,
                            height: size.height * 0.12,
                          ),
                          SizedBox(height: size.height * 0.015),
                          Text(
                            e.values.first,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                padding: const EdgeInsets.all(10.0),
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFAD9FE4), Colors.black],
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset('assets/images/own_test.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Do your own test!',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'Follow the instructions\nto do your own test.',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}
