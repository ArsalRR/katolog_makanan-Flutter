import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> foodData = [
    {
      'title': 'Apple Pie',
      'description': '53 menit',
      'imagePath': 'https://esensi.tv/wp-content/uploads/2023/11/apple-pie.jpg',
    },
    {
      'title': 'Beef Burger',
      'description': '30 menit',
      'imagePath': 'https://asset.kompas.com/crops/JFC1_i_OaGvcNEviEw4WKk-r3qQ=/12x51:892x637/750x500/data/photo/2022/03/05/622358ed771fb.jpg',
    },
    {
      'title': 'Ramen Udang',
      'description': '30 menit',
      'imagePath': 'https://img.okezone.com/content/2020/02/08/298/2165526/resep-dan-cara-memasak-mi-ramen-udang-hidangan-lezat-di-musim-hujan-SfLhkvfH2f.jpg',
    },
    {
      'title': 'Karaage',
      'description': '30 menit',
      'imagePath': 'https://asset.kompas.com/crops/2DZVhYBQx7VTMgKfITDTqYZGPEI=/0x0:1000x667/750x500/data/photo/2023/01/27/63d32f161d7cf.jpg',
    },
    {
      'title': 'Takoyaki',
      'description': '30 menit',
      'imagePath': 'https://asset.kompas.com/crops/it_rFrDqX-g3HsNFV8jL_tIAOwY=/0x0:1000x667/750x500/data/photo/2021/09/08/613812d19a190.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'F',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(
                      text: 'o',
                      style: TextStyle(color: Colors.orange),
                    ),
                    TextSpan(
                      text: 'o',
                      style: TextStyle(color: Colors.yellow),
                    ),
                    TextSpan(
                      text: 'd',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Katalog Resep Makanan',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.red), 
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('All'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.orange; 
                          }
                          return Colors.orange; 
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Makanan'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Kue'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: foodData.length,
                itemBuilder: (context, index) {
                  return buildFoodCard(
                    foodData[index]['title']!,
                    foodData[index]['description']!,
                    NetworkImage(foodData[index]['imagePath']),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 
          },
          backgroundColor: Colors.orange,
          child: Icon(Icons.add), 
          shape: CircleBorder(), 
        ),
      ),
    );
  }

  Widget buildFoodCard(String title, String description, ImageProvider<Object> imageProvider) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            child: SizedBox(
              height: 120,
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        description,
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ], 
      ),
    );
  }
}
