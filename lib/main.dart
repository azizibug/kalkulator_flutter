import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Permutasi dan Kombinasi",
      theme: new ThemeData(
        brightness: Brightness.dark
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstnum;
  int secondnum;
  String texttodisplay = "0";
  String res;
  String oprationtoperform;

  faktorial(x) {
    if (x == 0) {
      return 1;
    } else {
      return x * faktorial(x - 1);
    }
  }

  void btnclicked(String btntext) {
    if (btntext == "C") {
      texttodisplay = "0";
      firstnum = 0;
      secondnum = 0;
      res = "0";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "x" ||
        btntext == "÷" ||
        btntext == "Permutasi" ||
        btntext == "Kombinasi" ||
        btntext == "R") {
      firstnum = int.parse(texttodisplay);

      res = "0";

      oprationtoperform = btntext;
    } else if (btntext == "=") {
      secondnum = int.parse(texttodisplay);

      if (oprationtoperform == "+") {
        int tambah = (firstnum + secondnum);
        res = ("$firstnum + $secondnum  =  $tambah").toString();
      }

      if (oprationtoperform == "-") {
        int kurangi = (firstnum - secondnum);
        res = ("$firstnum - $secondnum  =  $kurangi").toString();
      }

      if (oprationtoperform == "x") {
        int kali = (firstnum * secondnum);
        res = ("$firstnum x $secondnum  =  $kali").toString();
      }

      if (oprationtoperform == "÷") {
        int bagi = (firstnum ~/ secondnum);
        res = ("$firstnum ÷ $secondnum  =  $bagi").toString();
      }

      if (oprationtoperform == "Permutasi") {
        double result = faktorial(firstnum) / faktorial(firstnum - secondnum);
        res = ("Hasil $firstnum Permutasi $secondnum = $result ").toString();
      }

      if (oprationtoperform == "Kombinasi") {
        double result = faktorial(firstnum) /
            (faktorial(secondnum) * faktorial(firstnum - secondnum));
        res = ("Hasil $firstnum Kombinasi $secondnum = $result").toString();
      }
    } else {
      res = int.parse(texttodisplay + btntext).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget buildButton(String btnval,Color buttonColor) {
    return Expanded(
      
      child: OutlineButton(
        padding: EdgeInsets.all(20.2),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 25.0,color: buttonColor
            
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DISKRIT"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
              accountName: new Text("Muhammad Zainuddin"),
              accountEmail: new Text("180202021"),
              currentAccountPicture: 
              new CircleAvatar(
                 child: new Icon(Icons.person),
              ),
            ),
            new ListTile(
              title: new Text("Teknik Informatika A(3)"),
              trailing: new Icon(Icons.computer),
            ),
            new ListTile(
              title: new Text("Universitas Hamzanwadi"),
              trailing: new Icon(Icons.home),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(13.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                buildButton("C",Colors.red),
                buildButton("x",Colors.white),
                buildButton("÷",Colors.white),
                buildButton("+",Colors.white),
                
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("7",Colors.white),
                buildButton("8",Colors.white),
                buildButton("9",Colors.white),
                buildButton("-",Colors.white),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("4",Colors.white),
                buildButton("5",Colors.white),
                buildButton("6",Colors.white),
                buildButton("0",Colors.white),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("1",Colors.white),
                buildButton("2",Colors.white),
                buildButton("3",Colors.white),
                buildButton("=",Colors.blue),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("Permutasi",Colors.teal),
                buildButton("Kombinasi",Colors.teal),
              ],
            )
          ],
        ),
      ),
    );
  }
}
