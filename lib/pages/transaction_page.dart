import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isExpense = true;
  List<String> list = ['Makan dan Jajan', 'Transportasi', 'Nonton Film'];
  late String dropdownValue = list.first;
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah transaksi", style: TextStyle(color:Colors.white)), backgroundColor: Colors.purple),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                Switch(value: isExpense, 
                onChanged: (bool value){
                  setState(() {
                    isExpense = value;
                  });
                }, 
                inactiveTrackColor: Colors.green[200],
                inactiveThumbColor: Colors.green,
                activeColor: Colors.red,
                ),
                Text(
                  isExpense ? 'Pengeluaran' : 'Pemasukan', 
                  style: TextStyle(fontSize: 14),
                )
              ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(), 
                    labelText: "Jumlah"),
                ),
              ),
              SizedBox(
                height: 25,
              ), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                    "Kategori", 
                    style: TextStyle(fontSize: 16),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton <String>(
                  value: dropdownValue,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_downward),
                  items: list.map <DropdownMenuItem <String>> ((String value) {
                  return DropdownMenuItem<String>(
                    value: value, 
                    child : Text(value),
                    );
                }).toList(), 
                onChanged: (String? value){
                
                }),
              ),
              SizedBox(
                height: 25,
              ), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(labelText: "Pilih Tanggal"),
                   onTap:()async{
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), 
                        firstDate: DateTime(2020), 
                        lastDate: DateTime(2099));

                        if (pickedDate != null){
                          String formattedDate = 
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                          dateController.text = formattedDate;
                        }
                   },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(child: ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor:  Colors.green, //background color of button   
                    ),onPressed: (){}, child: Text('Save',style: TextStyle(color: Colors.white))))               
            ],
          ))),
    );
  }
} 