
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Music extends StatefulWidget {

  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> with SingleTickerProviderStateMixin{
  bool shuffle=false; bool play_stop=false;
  int repeat=0; double value=0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_outlined,size: 40,)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,size: 30,)),

                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'this the best music i heard before, i suggest it',
                        style: TextStyle(fontSize: 24),overflow: TextOverflow.ellipsis,),
                    ),
                    SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('12:09',style: TextStyle(fontSize: 18)),
                        Container(
                          width: 350,height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            border: Border.all(width: 3,color: Colors.grey),
                            image: DecorationImage(
                                image: AssetImage('assets/aa.png'),fit: BoxFit.cover
                            )
                          ),
                        ),
                        Text('12:09',style: TextStyle(fontSize: 18)),
                      ],
                    ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Slider(value: value,onChanged: (value){this.value=value;setState((){});},),
                  ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){
                          shuffle=!shuffle;setState((){});
                        }, icon: Icon(shuffle?Icons.shuffle_on_rounded:Icons.shuffle,size: 28,)),
                        IconButton(onPressed: (){

                        }, icon: Icon(Icons.skip_previous,size: 35,)),
                        IconButton(onPressed: (){
                          play_stop=!play_stop;setState((){});
                        }, icon: Icon(play_stop?Icons.play_arrow:Icons.pause,size: 38,)),
                        IconButton(onPressed: (){

                        }, icon: Icon(Icons.skip_next,size: 35,)),
                        IconButton(onPressed: (){
                          if(repeat==2){
                            repeat=0;
                          }else{
                            repeat++;
                          }
                          setState((){});
                        }, icon: Icon(repeat==0?Icons.repeat:repeat==1?Icons.repeat_one:Icons.arrow_right_alt,size: 30,)),
                      ],
                    )
                  ],
                ),
                Container(
                  width: double.infinity,height: MediaQuery.of(context).size.height/2.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      color: Colors.black
                  ),
                  child: ListView.builder(
                    itemCount: 20,padding: EdgeInsets.all(10),
                    itemExtent: 90,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        child: Container(
                          width: double.infinity,height: 80,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width:55,height: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey
                                  ),
                                  child: Icon(Icons.music_note_outlined,color: Colors.white,),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top:20,left: 10,right: 1),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.29,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'ahmad shamal w awati',
                                                style: TextStyle(fontSize: 22),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                'Unknown',
                                                style: TextStyle(fontSize: 17),
                                              ),

                                            ],
                                          ),
                                          //Spacer(),
                                          IconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.more_vert,size: 30,),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      height: 1,width: MediaQuery.of(context).size.width/1.3,color: Colors.black,
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )

              ],
            )
        ),

      ),
    );
  }
}
