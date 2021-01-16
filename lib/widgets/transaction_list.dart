import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteHandler;

  TransactionList(this.transactions, this._deleteHandler);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(children: [
            Text('No transaction added yet!',
                style: TextStyle(fontFamily: 'Quicksand')),
            SizedBox(height: 20),
            Container(
                height: 200,
                child:
                    Image.asset('assets/images/waiting.png', fit: BoxFit.cover))
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
                  title: Text(currentTransaction.title,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    DateFormat.yMMMd().format(currentTransaction.date),
                    style: TextStyle(fontFamily: 'Quicksand'),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).primaryColor,
                      onPressed: () => _deleteHandler(currentTransaction.id)),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
