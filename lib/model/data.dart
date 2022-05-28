class Blogs{
  String author;
  String proImg;
  String title;
  String des;
  String time;
  String imgUrl;



  Blogs(this.author,this.proImg,this.title,this.des,this.time,this.imgUrl);

  static List<Blogs>listItem(){
    return[
     Blogs("author", "assets/images/pp2.jpg", "7 Great Biking Cities (and Which Trails to Ride)","There’s no better way to zip through a new city than on two wheels. Here are some routes to try, from riverside jaunts to mountain climbs.", "12 min","assets/images/cover.jpg"),
      Blogs("Sohagh", "assets/images/profile.png", " From Italy to Croatia on Two Wheels","A leisurely paced ride, from Trieste, Italy, to the ancient city of Pula, on Croatia’s Istrian shore, offers culture, history and sublime views, not to mention wine and truffles.", "52 min","assets/images/cover2.jpg"),
      Blogs("Editor", "assets/images/pp2.jpg", "Help! The Airline Changed My Flight Itinerary (for the Worse)","Airlines are within their contractual rights to cancel booked flights and place passengers on less-convenient routes with hours-long layovers. Our columnist investigates whether travelers have any recourse.", "32 min","assets/images/c1.jpg"),
      Blogs("author", "assets/images/profile.png", "titl promote destinations, tourism boards sadh jhawgwd"," des kjashdj kjshdkjh asdh", "12 min","assets/images/c2.jpg"),
      Blogs("Sohagh", "assets/images/pp1.jpg", " promote destinations, tourism boards"," We help promote destinations, tourism boards, resorts, tour operators and more.", "52 min","assets/images/cover2.jpg"),
      Blogs("author", "assets/images/profile.png", "We help promote destinations, tourism boards, resorts, tour operators and more."," des", "32 min","assets/images/c2.jpg"),
      Blogs("author", "assets/images/pp2.jpg", "titl promote destinations, tourism boards sadh jhawgwd"," des kjashdj kjshdkjh asdh", "12 min","assets/images/cover.jpg"),
      Blogs("Sohagh", "assets/images/pp1.jpg", " promote destinations, tourism boards"," We help promote destinations, tourism boards, resorts, tour operators and more.", "52 min","assets/images/c1.jpg"),
      Blogs("author", "assets/images/pp2.jpg", "We help promote destinations, tourism boards, resorts, tour operators and more."," des", "32 min","assets/images/cover.jpg"),
    ];
  }

}