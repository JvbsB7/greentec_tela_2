import 'package:flutter/material.dart';

void main() {
  runApp(GreenTecApp());
}

class GreenTecApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GreenTecMonitor(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GreenTecMonitor extends StatefulWidget {
  @override
  _GreenTecMonitorState createState() => _GreenTecMonitorState();
}

class _GreenTecMonitorState extends State<GreenTecMonitor> {
  final Color boxColor = Color(0xFFFAFAFA);

  List<int> estufas = [];

  void carregarEstufas() {
    setState(() {
      estufas = [1, 2, 3, 4];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Removido o backgroundColor direto do Scaffold
      appBar: AppBar(
        backgroundColor: boxColor,
        title: Row(
          children: [
            Text('GreenTec Monitor', style: TextStyle(color: Colors.black)),
            Spacer(),
            Icon(Icons.eco, color: Colors.black),
          ],
        ),
        elevation: 2,
      ),
      body: Container(
        // ✅ Adicionado o Container com BoxDecoration e gradiente
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF248232), Color.fromARGB(255, 50, 153, 76)], // verde escuro → claro
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: estufas.isEmpty
                    ? Text(
                        'Atualize para receber os acessos das estufas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        children: estufas.map((index) {
                          return ElevatedButton(
                            onPressed: () {
                              // Ação da estufa
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: boxColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              padding: EdgeInsets.all(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icon_estufa.png',
                                  width: 50,
                                  height: 49,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Estufa $index',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: carregarEstufas,
                  icon: Icon(Icons.refresh, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
