import 'package:flutter/material.dart';
import 'package:shop_app/Network/local/Cach_Helper.dart';
import 'package:shop_app/modules/LoginScreen/Login_Screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModele {
  final String image;
  final String title;
  final String body;
  BoardingModele(
      {required this.image,
        required this.title,
        required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   bool islast = false;
  var pageviewc = PageController();

  List<BoardingModele> modele = [
    BoardingModele(
        image: 'assets/images/photo.png.webp',
        title: 'Title Screen 1',
        body: 'Title Body 1'),
    BoardingModele(
        image:'assets/images/photo1.png',
        title: 'Title Screen 2',
        body: 'Title Body 2'),
    BoardingModele(
        image:'assets/images/photo.png.webp',
        title: 'Title Screen 3',
        body: 'Title Body 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            MaterialButton(
              onPressed: () {
                Submit();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orangeAccent,
                  ),
                  child: Text(
                    'SKiP',
                    style: TextStyle(fontSize: 20),
                  )
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    setState(() {
                      if (index == modele.length - 1) {
                        islast = true;
                      } else {
                        islast = false;
                      }
                    });
                  },
                  controller: pageviewc,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Bordinditem(modele[index]),
                  itemCount: modele.length,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.orangeAccent,
                        radius: 3,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 2,
                      ),
                      controller: pageviewc,
                      count: modele.length),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (islast) {
                        Submit();
                      } else {
                        pageviewc.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),

                ],
              )
            ],
          ),
        ));
  }

void Submit()
{
  CachHelper.saveData(key: 'OnBoardingScreen', value: true).then((value) {
    if(value!)
    {
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => true);
    }


  });
}


  Widget Bordinditem(BoardingModele modele) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Expanded(child: Image(image: AssetImage('${modele.image}'))),
        SizedBox(
          height: 30,
        ),
        Text(
          '${modele.title}',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${modele.body}',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ]);
}
