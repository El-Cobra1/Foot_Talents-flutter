import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foottalents/data.dart';
import 'package:foottalents/models/team_stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController ;

  List<TeamStats> teamStats = top5Teams;

  bool isLoading1 = false;
  bool isLoading2 = false;
  bool isLoading3 = false;

  final List<String> labels = [
    'Teams',
    'Players',
    'Matches',
  ];

  _salesSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context,widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = (_pageController.page! - index);
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: (){},//navigate to
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: teamStats[index].team!.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        imageUrl: teamStats[index].team!.imageUrl,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 19.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        colors: [Colors.grey.shade900,Colors.transparent,Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                    )
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: SizedBox(
                width: 250.0,
                child: Text(
                  teamStats[index].team!.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // getProducts()async{
  //   if(savedProducts.isEmpty){
  //     products = List.from(await ServerController.getProducts());
  //   }else{
  //     products = List.from(savedProducts);
  //   }
  //   isLoading1 = false;
  //   setState(() { });
  // }



  @override
  void initState() {
    _pageController = PageController(initialPage: 0,viewportFraction: 0.8,keepPage: true);
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141414),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Color(0XFF2AAA8A)),
        title: const Text(
          "SCOUTIFY",
          style: TextStyle(
              color: Color(0xFF8c54fc),
              fontSize: 24
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading1 || isLoading2 || isLoading3 ? const Center(child: CircularProgressIndicator(color: Color(0XFF2AAA8A),),) : ListView(
        children: [
          SizedBox(
            height: 280,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: teamStats.length,
              itemBuilder: (context,index){
                return _salesSelector(index);
              },
            ),
          ),
          SizedBox(
            height: 90.0,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    //height: ,
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF8c54fc),
                          Color(0xFF320064),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFF8c54fc),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        labels[index].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
