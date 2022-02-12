import 'package:flutter/material.dart';
import 'package:twendekaziprovider/model/wallet_model.dart';
import 'package:intl/intl.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              );
            },
          ),
          title: const Text('Wallet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          elevation: 0.0,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.playlist_play_rounded),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const walletHead(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: WalletTransaction.walletTransaction.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            height: 100,
                            child: transactioncard(
                                walletTransaction: WalletTransaction
                                    .walletTransaction[index]));
                      }))
            ],
          ),
        ));
  }
}

class walletHead extends StatelessWidget {
  const walletHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Card(
        color: Colors.black,
        elevation: 5,
        shadowColor: Colors.grey,
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('ACCOUNT BALANCE',
                          style: TextStyle(
                            color: Colors.white70,
                          )),
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Kshs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            )),
                        Text(
                          '2500.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class transactioncard extends StatelessWidget {
  const transactioncard({Key? key, required this.walletTransaction})
      : super(key: key);

  final WalletTransaction walletTransaction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Text('TK'),
              backgroundColor: Colors.black87,
            ),
            title: Text(walletTransaction.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            subtitle: Text(walletTransaction.description,
                style: const TextStyle(color: Colors.black45, fontSize: 16)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                walletTransaction.isPayment
                    ? Text('+ Kshs. ${walletTransaction.total}',
                        style: TextStyle(
                            color: walletTransaction.isPayment
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))
                    : Text('- Kshs. ${walletTransaction.total}',
                        style: TextStyle(
                            color: walletTransaction.isPayment
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                Text(DateFormat('dd-MM-yy').format(walletTransaction.createdAt),
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ],
            ),
          ),
        ));
  }
}
