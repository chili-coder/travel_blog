import 'package:flutter/material.dart';
import 'package:travel_blog/screen/home.dart';

class DetailsPage extends StatefulWidget {
   DetailsPage({Key? key,this.author,this.proImg,this.title,this.des,this.time,this.imgUrl}) : super(key: key);

   String? author;
   String? proImg;
   String? title;
   String? des;
   String? time;
   String? imgUrl;


  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
backgroundColor: Colors.white,

      body: CustomScrollView(
        physics: BouncingScrollPhysics(),

        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 300,

            leading: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(Icons.arrow_back_ios,color: Colors.black,),
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.bookmark_border),
              )
            ],

            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  centerTitle: true,
                  stretchModes: [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,

                  ],

                  background: Image.asset("${widget.imgUrl}",width: double.infinity,fit: BoxFit.cover,),

                ),

                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.title}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600,),),
                      SizedBox(height: 20,),

                   Row(
                     children: [
                     Row(
                         children: [
                           CircleAvatar(
                             radius: 8,
                             backgroundImage:
                             AssetImage("${widget.proImg}"),
                           ),
                           Text("${widget.author}",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),

                         ]),

                     SizedBox(width: 20,),

                     Row(
                       children: [
                         Icon(Icons.timer_outlined,color: Colors.white,size: 20,),
                         Text("${widget.time}",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),

                       ],),


                   ],),





                    ],
                  ),
                )



              ],

            ),

          ),
          SliverList(delegate: SliverChildListDelegate([
          Column(
            children: [
              SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text("${widget.des}",style: TextStyle(color: Colors.black,fontSize: 16,),),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
          ]))
        ],
      ),
        floatingActionButton: new FloatingActionButton(
            elevation:10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Icon(Icons.favorite,color: Colors.red,),
                Text("200",style: TextStyle(color: Colors.black,fontSize: 8,fontWeight: FontWeight.bold),),
              ],),
            ),
            backgroundColor: Colors.white,
            onPressed: (){}
        )

    );
  }
}
