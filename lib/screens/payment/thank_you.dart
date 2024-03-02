import 'package:flutter/material.dart';

class thank_you extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child:   Stack(
            clipBehavior: Clip.none,
            children:[
              Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.only(top:66.0),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text("Tank you",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(height: 15.0,),
                      Text("Your transaction was successful",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Data",
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(flex: 1,),
                            Text("12/11/2035",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Time",
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(flex: 1,),
                            Text("12:00 AM",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("To",
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(flex: 1,),
                            Text("mosalm",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("Total",
                              style: TextStyle(fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Spacer(flex: 1,),
                            Text("106",
                              style: TextStyle(fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 280,
                        height: 80,
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            )),
                        child:
                        Row(
                          children: [
                            Image.network("https://th.bing.com/th/id/OIP.iR8TomphS2B127F_S8BFHwHaE7?rs=1&pid=ImgDetMain"),
                            Column(

                              children: [
                                SizedBox(height: 15.0,),
                                Text("Credit Card",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0
                                  ),
                                ),
                                Text("MasterCard **78",
                                  style: TextStyle(
                                      fontSize: 15.0
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 35,),
                      Divider(thickness: 1,color: Colors.green,),
                      SizedBox(height: 15.0,),
                      MaterialButton(
                        onPressed: () {
                        },
                        child: Container(
                          width: 100,
                          height: 80,
                          decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.green,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: Center(child: Text("ok",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.green
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: -20,
                  bottom: MediaQuery.sizeOf(context).height*.2,
                  child: CircleAvatar(

                    backgroundColor: Colors.white,

                  )),
              /* Positioned(
      top: 150,
      left: 0,
      height: 0,
      child: Row(
        children:
          List.generate(50, (index) =>
          Expanded(
            child: Container(
              color: Colors.black,
              height: 1,
            ),
          ))
        ,
      ),
    ),*/
              Positioned(
                  right: -20,
                  bottom: MediaQuery.sizeOf(context).height*.2,
                  child: CircleAvatar(

                    backgroundColor: Colors.white,

                  )),
              Positioned(
                top: -30,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.check,
                      size: 50,),
                  ),
                ),
              )


            ]

        ),
      ),
    );
  }

}