import 'package:flutter/material.dart';

class ItemOferta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/detalhe");
      },
      // onLongPress: () {
      //   Navigator.of(context).pushNamed("/cadastro");
      // },
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
        padding: EdgeInsets.all(8),
        //color: Colors.white,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(4, 4),
                blurRadius: 12,
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://via.placeholder.com/100x100.png?text=Produto1',
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Computador Dell Vostro 1400, Intel i9, 16GB RAM e 1TB SSD",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "www.kabum.com.br",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.thumb_up, size: 16),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "(1230)",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      Text(
                        "R\$ 1560,00",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            GestureDetector(
              // onTap: () => Navigator.of(context).pushNamed('/cadastro'),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://imagens.canaltech.com.br/celebridades/78.400.jpg'),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fulano da Silva Xavier Andrade",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "26 de agosto de 20202",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
