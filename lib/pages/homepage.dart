import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_design_demo/utilities/constants.dart';
import 'package:social_design_demo/utilities/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedIndex == 1 ? homePageAppbarText : secondPageAppbarText,
              style: TextStyle(color: title, fontSize: h1, fontWeight: w1),
            ),
            selectedIndex == 1
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.grey[200], width: 2.0),
                    ),
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image(
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        allowImplicitScrolling: false,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey[500],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Search Topics",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17.0,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 250.0,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homePageScrollCards[index]['cardTitle'],
                                style: TextStyle(
                                    color: title, fontSize: h2, fontWeight: w2),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                homePageScrollCards[index]['cardSubtitle'],
                                style: TextStyle(
                                    color: subtitle,
                                    fontSize: h4,
                                    fontWeight: w3),
                              ),
                              SizedBox(height: 10.0),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  height: 170,
                                  width: MediaQuery.of(context).size.width - 40,
                                  image: NetworkImage(
                                      'https://classbento.com.au/images/class/abstract-art-painting-workshop-sydney-600.jpg'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: homePageScrollCards.length,
                  ),
                ),
                Divider(
                  color: Colors.grey[500],
                  endIndent: 30.0,
                  indent: 30.0,
                  thickness: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        homePageTrendTitle,
                        style: TextStyle(
                            color: title, fontSize: h2, fontWeight: w1),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            color: Colors.blue, fontSize: h4, fontWeight: w1),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(
                      homePageTrendingData.length,
                      (index) => ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                  'https://i.pinimg.com/originals/c5/e0/4f/c5e04fa97d53ca7625e8458b87b77a89.jpg'),
                            ),
                            title: Text(
                              homePageTrendingData[index]['title'],
                              style: TextStyle(
                                  color: title, fontSize: h4, fontWeight: w1),
                            ),
                            subtitle: Text(
                              homePageTrendingData[index]['subtitle'],
                              style: TextStyle(
                                  color: subtitle,
                                  fontSize: h5,
                                  fontWeight: w3),
                            ),
                            trailing: Container(
                              width: 100.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                      color: Colors.grey[500], width: 1.0)),
                              alignment: Alignment.center,
                              child: Text('Read'),
                            ),
                          )),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://pixinvent.com/demo/vuexy-vuejs-admin-dashboard-template/demo-3/img/user-13.005c80e1.jpg'),
                  ),
                  title: Text(
                    userName,
                    style:
                        TextStyle(color: title, fontSize: h3, fontWeight: w1),
                  ),
                  subtitle: Text(
                    userPost,
                    style: TextStyle(
                        color: subtitle, fontSize: h5, fontWeight: w3),
                  ),
                  trailing: Container(
                    width: 100.0,
                    height: 35.0,
                    alignment: Alignment.center,
                    child: Text('Edit',
                        style: TextStyle(color: Colors.blue, fontSize: h3)),
                  ),
                ),
                Column(
                  children: List.generate(
                      secondPageAccountList.length,
                      (index) => ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                  'https://www.logotaglines.com/wp-content/uploads/2018/11/Visa-Logo-Tagline-1200x1200.jpg'),
                            ),
                            title: Text(
                              secondPageAccountList[index]['title'],
                              style: TextStyle(
                                  color: title, fontSize: h3, fontWeight: w1),
                            ),
                            subtitle: Text(
                              secondPageAccountList[index]['subtitle'],
                              style: TextStyle(
                                  color: subtitle,
                                  fontSize: h5,
                                  fontWeight: w3),
                            ),
                            trailing: Container(
                                width: 100.0,
                                height: 35.0,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.chevron_right,
                                  size: 30.0,
                                )),
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    children: [
                      Text(
                        secondPageSectionReward,
                        style: TextStyle(
                            color: title, fontSize: h2, fontWeight: w1),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(
                      secondPageAccountList.length,
                      (index) => ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                  'https://www.aafsfl.org/uploads/5/7/8/0/5780701/s324222675859668953_p18_i1_w1280.jpeg'),
                            ),
                            title: Text(
                              secondPageRewardsList[index]['title'],
                              style: TextStyle(
                                  color: title, fontSize: h3, fontWeight: w1),
                            ),
                            subtitle: Text(
                              secondPageRewardsList[index]['subtitle'],
                              style: TextStyle(
                                  color: subtitle,
                                  fontSize: h5,
                                  fontWeight: w3),
                            ),
                            trailing: Container(
                                width: 100.0,
                                height: 35.0,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.chevron_right,
                                  size: 30.0,
                                )),
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    children: [
                      Text(
                        secondPageSectionSetting,
                        style: TextStyle(
                            color: title, fontSize: h2, fontWeight: w1),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(
                      secondPageAccountList.length,
                      (index) => ListTile(
                          title: Text(
                            secondPageSettingsTexts[index]['title'],
                            style: TextStyle(
                                color: title, fontSize: h3, fontWeight: w3),
                          ),
                          trailing: CupertinoSwitch(
                              value: secondPageSettingsTexts[index]['state'],
                              onChanged: (value) {
                                setState((){
                                  secondPageSettingsTexts[index]['state'] = value;
                                });
                              }))),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          bottomNavigationMenu.length,
          (index) => BottomNavigationBarItem(
            icon: bottomNavigationMenu[index]['icon'],
            title: Text(bottomNavigationMenu[index]['title']),
            backgroundColor: Colors.grey[100],
          ),
        ),
        selectedItemColor: Colors.blue[500],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey[500],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 1) {
            _pageController.jumpToPage(0);
          }
          if (index == 4) {
            _pageController.jumpToPage(1);
          }
        },
      ),
    );
  }
}
