import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(children: [
                Text('No transaction added yet!',
                    style: TextStyle(fontFamily: 'Quicksand')),
                SizedBox(height: 20),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover))
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  final currentTransaction = transactions[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                                child: Text('\$${currentTransaction.amount}')),
                          )),
                      title: Text(
                        currentTransaction.title,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(currentTransaction.date)),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
