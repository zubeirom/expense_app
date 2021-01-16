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
                      child: Row(children: [
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$ ${currentTransaction.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Quicksand',
                              color: Theme.of(context).primaryColor),
                        )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentTransaction.title,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat().format(currentTransaction.date),
                              style: TextStyle(
                                  color: Colors.grey, fontFamily: 'Quicksand'))
                        ])
                  ]));
                },
                itemCount: transactions.length,
              ));
  }
}
