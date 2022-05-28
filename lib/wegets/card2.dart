import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_blog/model/data.dart';
import 'package:travel_blog/screen/details.dart';

class CardTwo extends StatefulWidget {
  const CardTwo({Key? key}) : super(key: key);

  @override
  _CardTwoState createState() => _CardTwoState();
}

class _CardTwoState extends State<CardTwo> {
  final data =Blogs.listItem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(itemBuilder: (context, index) {
          var item=data[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(
                author: data[index].author,
                proImg: data[index].proImg,
                des: data[index].des,
                time: data[index].time,
                title: data[index].title,
                imgUrl: data[index].imgUrl,

              )));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                height: 110,
                child: Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),

                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              item.imgUrl,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                      ),

                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item.title,maxLines: 2,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold,),),

                            SizedBox(height: 10,),
                            Row(
                              children: [

                                Row(children: [
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundImage:
                                    AssetImage(item.proImg),
                                  ),
                                  SizedBox(width: 5,),

                                  Text(item.author,style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400),),


                                ],),
                                SizedBox(width: 20,),
                                Row(
                                  children: [
                                    Icon(Icons.timer_outlined,color: Colors.grey,size: 20,),
                                    Text(item.time,style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400),),


                                  ],),
                              ],),



                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),

          );
        },
            separatorBuilder: (context,index){
              return SizedBox(height: 2,);
            },
            itemCount: data.length
        ),
    );
  }
}
