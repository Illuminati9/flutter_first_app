import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {

  Quote quote= new Quote();

  QuoteCard(quote){
    this.quote.quote = quote.quote;
    this.quote.author = quote.author;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(quote.quote,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),),
            SizedBox(height: 6.0),
            Text('- ${quote?.author}',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800]
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: (){
                print(quote.quote+" -"+quote.author);
              },
              icon: Icon(Icons.delete),
              label: Text('Delete this quote'),
            ),
          ],
        ),
      ),
    );
  }
}