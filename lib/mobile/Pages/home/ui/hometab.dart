import 'package:flutter/material.dart';
import 'package:fyp/mobile/Pages/In-progressBids/in_progress_bids.dart';
import 'package:fyp/mobile/Pages/publishedBids/publishedBids.dart';
//import 'package:fyp/Pages/home/ui/homepage.dart';
import 'package:fyp/mobile/Pages/submittedBids/submitted_bids.dart';
import 'package:fyp/mobile/data/cardlist.dart';

class Hometab extends StatelessWidget {
  const Hometab({super.key});

   void _navigateToSpecificScreen(BuildContext context, int index) {
    // Conditionally navigate to the screen based on the index or other identifier
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubmittedBids()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InProgressBids()),
        );
        break;

        default:
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TenderOpened()),
        );


      // Add more cases for other indices and screens
      
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  
            crossAxisSpacing: screenWidth * 0.02,  
            mainAxisSpacing: screenHeight * 0.03,
            childAspectRatio: 2.1/1.7,  
              ),
              itemCount: cardList.length,  
              itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(2 , 2, 2, 3),  
                child: Stack(
                 children: [
                  ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: screenHeight * 0.12,
                    width: screenWidth * 0.5,
                    color: Colors.blue,),),
                  Positioned(
                    bottom:0,
                    left: 5,
                    child: TextButton(
                      onPressed: (){
                        _navigateToSpecificScreen(context, index);
                      }, 
                      
                      child: const Text("View Details",style: TextStyle(color:  Color.fromARGB(255, 75, 73, 73)),),
                      
                      ),
                  ),
                  Positioned(
                    top: 5,
                    left: 10,
                    child: Image.asset(cardList[index].iconpath,height: screenHeight * 0.05,) ,),
                  Positioned(
                    top: 50,
                    right: 10,
                    child: Text("${cardList[index].name}",style: TextStyle(color: Colors.white),),
                  ),
                  Positioned(
                    top: 10,
                    right: 15,
                    child:Text("${cardList[index].count}",style: TextStyle(color: Colors.white,fontSize:20 ),)),
                  
                 ],
                ),
              ),
            );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 20),
            child: ElevatedButton(onPressed: (){}, child: Text("Search Opportunities"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white
            )),
          ),
      
        ],
      ),
    );
  }
}