
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    'assets/images/image2.png',
    'assets/images/image3.png',
  ];

  // final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top welcome container with search bar
            Container(
              width: width,
              height: height * 0.38,
              color: Colors.orangeAccent.shade100,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),  // Space for the status bar
                  Text(
                    'Welcome Imran!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Search Bar
                  Row(
                    children: [
                      Container(
                        width: width * 0.77,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search...',
                            suffixIcon: Icon(Icons.search, color: Colors.orangeAccent),
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Icon(Icons.menu, color: Colors.white, size: 35,)
                    ],
                  ),
                  SizedBox(height: 16),
                  // Carousel Slider
                  SizedBox(
                    height: height * 0.15,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            height: height * 0.6,
                            child: Padding(
                              padding:  EdgeInsets.only(right: height * 0.03),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/img_2.png',
                                    width: width * 0.6,
                                    height: height * 0.6,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                    ),
                  )
                  // CarouselSlider(
                  //   // carouselController: _controller,
                  //   options: CarouselOptions(
                  //     height: 400.0,               // Slider height
                  //     autoPlay: true,              // Auto scroll
                  //     enlargeCenterPage: true,     // Zoom in on the current image
                  //     aspectRatio: 16 / 9,         // Aspect ratio of the slider
                  //     autoPlayInterval: Duration(seconds: 3), // Delay between slides
                  //     viewportFraction: 0.8,       // Fraction of the screen each item takes
                  //     onPageChanged: (index, reason) {
                  //       print('Image $index is displayed.');
                  //     },
                  //   ),
                  //   items: imageList.map((imagePath) {
                  //     return Builder(
                  //       builder: (BuildContext context) {
                  //         return Container(
                  //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             image: DecorationImage(
                  //               image: AssetImage(imagePath),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   }).toList(),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Ecommerce Lots section
            sectionTitle(context, 'Ecommerce Lots', 'View all'),
            SizedBox(height: 10),
            ecommerceBrands(width),
            SizedBox(height: 20),

            // Deals of the Day section
            sectionTitle(context, 'Deals of the Day', 'View all'),
            dealsOfDayList(width),

          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget categoryButton(BuildContext context, String title, IconData icon, String imagePath) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: (width - 60) / 2,  // Dynamic sizing based on screen width
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(BuildContext context, String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            actionText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.orangeAccent.shade100,
            ),
          ),
        ],
      ),
    );
  }

  Widget ecommerceBrands(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ecommerceBrandItem('assets/images/amazon.png', width),
              ecommerceBrandItem('assets/images/ajio.png', width),
              ecommerceBrandItem('assets/images/flipkart.png', width),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ecommerceBrandItem('assets/images/amazon.png', width),
              ecommerceBrandItem('assets/images/ajio.png', width),
              ecommerceBrandItem('assets/images/flipkart.png', width),
            ],
          ),
        ],
      ),
    );
  }

  Widget ecommerceBrandItem(String logoPath, double width) {
    return Container(
      width: width * 0.28,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(1, 1), // First shadow
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image.asset(logoPath, height: 20),  // Use asset for brand logos
      ),
    );
  }

  Widget dealsOfDayList(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(  // Set a fixed height for the GridView
        height: 400,  // Adjust the height based on your need
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  // Number of columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.62,  // Adjust this ratio to make items taller or shorter
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return dealsOfDayItem(width);
          },
        ),
      ),
    );
  }

  Widget dealsOfDayItem(double width) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(1, 1), // First shadow
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/man.png',),  // Deal image
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meesho Mens Shirt Collection',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u20B975',
                          style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'rate',
                          style: TextStyle(color: Colors.black, fontSize: 13,),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2000',
                          style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Pcs',
                          style: TextStyle(color: Colors.black, fontSize: 13,),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '100',
                          style: TextStyle(color: Colors.black,fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'MOQ',
                          style: TextStyle(color: Colors.black,fontSize: 13,),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rajkot',
                          style: TextStyle(color: Colors.black,fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Gujarat',
                          style: TextStyle(color: Colors.black,fontSize: 13,),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            child: Icon(Icons.add, color: Colors.white),
          ),
          label: 'Sell',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
