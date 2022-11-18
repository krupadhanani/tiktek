import 'package:flutter/material.dart';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  String p1 = "X";
  String p2 = "O";
  String w = "";
  List<int> up = [];
  List<String> uv = [];
  List<int> rp = [];
  List<String> rv = [];
  int k = 0;
  List<String> l = List.filled(9, "");
  int cnt = 0;
  String msg = "game is running";
  bool winner = false;
  bool msg1= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "tic_tac_toe",
          style: TextStyle(fontSize: 24, color: Color(0xFF180F03)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      height: double.infinity,
                      color: Colors.white,
                      alignment: Alignment.center,
                      width: 200,
                      child: Text(
                        msg,
                        style: TextStyle(fontSize: 24),
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: () {
                        if (!winner && cnt >= 0 && !msg1 && up.length>0 ) {
                          int lastpos= up.last;
                          String lastval=uv.last;
                          l[lastpos]="";
                          cnt--;
                          up.removeLast();
                          uv.removeLast();
                          rp.add(lastpos);
                          rv.add(lastval);
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: double.infinity,
                        color: Colors.white,
                        alignment: Alignment.center,
                        width: 200,
                        child: Text(
                          "undo",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    )),
                Expanded(
                    child: InkWell(
                      onTap: () {
                        if (!winner && cnt >= 0 && !msg1 && rv.length>0 ) {
                          int lastpos= rp.last;
                          String lastval=rv.last;

                          l[lastpos]=lastval;
                          cnt++;
                          rp.removeLast();
                          rv.removeLast();
                          up.add(lastpos);
                          uv.add(lastval);

                          setState(() {});
                        }
                      },
                      child: Container(
                        height: double.infinity,
                        color: Colors.white,
                        alignment: Alignment.center,
                        width: 200,
                        child: Text(
                          "redo",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: () {
                        l = List.filled(9, "");
                        cnt = 0;
                        k = 0;
                        w="";
                        msg = "game is running";
                        winner = false;
                        msg1= false;
                        up.clear();
                        uv.clear();
                        rp.clear();
                        rv.clear();
                        setState(() {});
                      },
                      child: Container(
                        height: 200,
                        color: Colors.white,
                        alignment: Alignment.center,
                        width: 200,
                        child: Text(
                          "reset",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                des(0, Colors.lightBlueAccent),
                des(1, Colors.lightBlueAccent),
                des(2, Colors.lightBlueAccent),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                des(3, Colors.lightBlueAccent),
                des(4, Colors.lightBlueAccent),
                des(5, Colors.lightBlueAccent),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                des(6, Colors.lightBlueAccent),
                des(7, Colors.lightBlueAccent),
                des(8, Colors.lightBlueAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  des(int i, Color c) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: (l[i] == "" && !winner)
              ? () {
            if (cnt % 2 == 0) {
              l[i] = p1;
            } else {
              l[i] = p2;
            }
            up.add(i);
            uv.add(l[i]);
            cnt++;
            win();
            setState(() {});
          }
              : null,
          child: Container(
            height: double.infinity,
            color: (l[i] == "")
                ? c
                : (!winner)
                ? ((l[i] == p1) ? Colors.blueAccent : Colors.lightBlue)
                : (w == "p1")
                ? ((l[i] == p1) ? Colors.greenAccent : c)
                : (w == "p2")
                ? ((l[i] == p2) ? Colors.greenAccent : c)
                : null,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: Text(l[i]),
          ),
        ));
  }

  win() {
    if ((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[4] == p1 && l[8] == p1) ||
        (l[2] == p1 && l[4] == p1 && l[6] == p1)) {
      msg = "$p1 is win";
      w = "p1";
      winner = true;
    } else if ((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) ||
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[4] == p2 && l[8] == p2) ||
        (l[2] == p2 && l[4] == p2 && l[6] == p2)) {
      msg = "$p2 is win";
      w = "p2";
      winner = true;
    } else if (cnt > 8) {
      msg = "game is draw";
      msg1=true;
    }

  }
}