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
                    style: Theme.of(context).textTheme.title),
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
                              color: Theme.of(context).primaryColor),
                        )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentTransaction.title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(DateFormat().format(currentTransaction.date),
                              style: TextStyle(color: Colors.grey))
                        ])
                  ]));
                },
                itemCount: transactions.length,
              ));
  }
}
