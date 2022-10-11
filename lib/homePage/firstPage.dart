import 'package:derzelas/general_widgets/categories.dart';
import 'package:derzelas/general_widgets/info_card.dart';
import 'package:derzelas/general_widgets/recent_posts.dart';
import 'package:derzelas/general_widgets/search.dart';
import 'package:derzelas/const/colors.dart';
import 'package:derzelas/const/texte.dart';
import 'package:derzelas/logic/responsive.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isReadMoreDespreNoi = false;
  bool isReadMoreProduse = false;
  bool isReadMoreServicii = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              InfoCard(
                  'Anunț',
                  null,
                  'Momentat, împrospătăm designul acestui website. Ne pare rău pentru orice inconveniențe și vă mulțumim pentru înțelegere!',
                  false,
                  10,
                  'Anunț',
                  'Website în lucru',
                  false),
              Padding(
                padding: const EdgeInsets.only(bottom: largePadding),
                child: Container(
                  padding: EdgeInsets.all(largePadding),
                  decoration: BoxDecoration(
                      color: albastru_cer,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Despre Noi'.toUpperCase(),
                            style: TextStyle(
                                color: maro,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: largePadding,
                          ),
                          Text(
                            'Descoperă Asociația și alătură-te!',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: smallPadding),
                        child: Text(
                          'Asociația Derzelas',
                          style: TextStyle(
                              color: negru,
                              fontSize: 32,
                              height: 1.2,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        (isReadMoreDespreNoi)
                            ? prezentareNume + '\n \n' + prezentareAsociatie
                            : prezentareAsociatie,
                        style: TextStyle(color: negru, height: 1.5),
                        maxLines: (isReadMoreDespreNoi == false) ? 3 : 200,
                      ),
                      SizedBox(
                        height: largePadding,
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isReadMoreDespreNoi = !isReadMoreDespreNoi;
                                });
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.only(bottom: smallPadding / 2),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: mov, width: 2))),
                                child: (isReadMoreDespreNoi == false)
                                    ? Text('Citește mai mult')
                                    : Text('Mai puțin'),
                              )),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.comment_rounded),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.share_rounded),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              // Produse și servicii
              Padding(
                padding: const EdgeInsets.only(bottom: largePadding),
                child: Container(
                  padding: EdgeInsets.all(largePadding),
                  decoration: BoxDecoration(
                      color: albastru_cer,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Poduse și Servicii'.toUpperCase(),
                            style: TextStyle(
                                color: maro,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: largePadding,
                          ),
                          Text(
                            'Vă oferim o gamă largă de produse și servicii',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: smallPadding),
                        child: Text(
                          'Produse',
                          style: TextStyle(
                              color: negru,
                              fontSize: 32,
                              height: 1.2,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        produseDescriere,
                        style: TextStyle(color: negru, height: 1.5),
                        maxLines: (isReadMoreProduse == false) ? 3 : 100,
                      ),
                      SizedBox(
                        height: largePadding,
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isReadMoreProduse = !isReadMoreProduse;
                                });
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.only(bottom: smallPadding / 2),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: mov, width: 2))),
                                child: (isReadMoreProduse == false)
                                    ? Text(
                                        'Citește mai mult despre produsele oferite!')
                                    : Text('Mai puțin!'),
                              )),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.comment_rounded),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.share_rounded),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: smallPadding),
                        child: Text(
                          'Servicii',
                          style: TextStyle(
                              color: negru,
                              fontSize: 32,
                              height: 1.2,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        produseDescriere,
                        style: TextStyle(color: negru, height: 1.5),
                        maxLines: (isReadMoreServicii == false) ? 3 : 100,
                      ),
                      SizedBox(
                        height: largePadding,
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isReadMoreServicii = !isReadMoreServicii;
                                });
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.only(bottom: smallPadding / 2),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: mov, width: 2))),
                                child: (isReadMoreServicii == false)
                                    ? Text(
                                        'Citește mai mult despre serviciile oferite!')
                                    : Text('Mai puțin!'),
                              )),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.comment_rounded),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.share_rounded),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // end - Produse si servicii
            ],
          ),
        ),

        // sidebar
        if (!Responsive.isMobile(context))
          SizedBox(
            width: largePadding,
          ),
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: largePadding),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(largePadding),
                        decoration: BoxDecoration(
                            color: piersica,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              autorizatie1,
                              style: TextStyle(color: negru, height: 1.5),
                            ),
                            SizedBox(
                              height: largePadding,
                            ),
                            Text(
                              autorizatie2,
                              style: TextStyle(color: negru, height: 1.5),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Search(),
                SizedBox(height: largePadding),
                Categories(),
                SizedBox(height: largePadding),
                RecentPosts(),
              ],
            ),
          ),
      ],
    );
  }
}
