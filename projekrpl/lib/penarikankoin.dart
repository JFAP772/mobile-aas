import 'package:flutter/material.dart';
import 'package:projekrpl/beranda.dart';

class penarikan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PenarikanKoinScreen(),
    );
  }
}

class PenarikanKoinScreen extends StatefulWidget {
  @override
  _PenarikanKoinScreenState createState() => _PenarikanKoinScreenState();
}

class _PenarikanKoinScreenState extends State<PenarikanKoinScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _noGopayController = TextEditingController();
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Penarikan Koin'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildKoinAndaSection(),
              SizedBox(height: 20),
              _buildNominalPenarikanSection(),
              SizedBox(height: 20),
              _buildNoGopaySection(),
              SizedBox(height: 20),
              _buildPilihPenarikanSection(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Beranda()));
                },
                child: Text('Tarik Koin'),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black, // Button color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKoinAndaSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Koin Anda', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text('10000 Koin', style: TextStyle(fontSize: 20)),
          SizedBox(height: 4),
          Text('*1 koin bernilai Rp.1,-', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildNominalPenarikanSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Masukkan Nominal Penarikan Koin',
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          TextFormField(
            controller: _nominalController,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: '*Minimal Penarikan 1000 koin',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Masukkan nominal penarikan';
              }
              if (int.tryParse(value) == null || int.parse(value) < 1000) {
                return 'Nominal penarikan minimal 1000 koin';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNoGopaySection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Masukkan Nomor Gopay Anda', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          TextFormField(
            controller: _noGopayController,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'No Gopay',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Masukkan nomor Gopay Anda';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPilihPenarikanSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Penarikan Koin', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          RadioListTile<String>(
            title: Text('Gopay'),
            value: 'Gopay',
            groupValue: _selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Shopee Pay'),
            value: 'Shopee Pay',
            groupValue: _selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Ovo'),
            value: 'Ovo',
            groupValue: _selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Dana'),
            value: 'Dana',
            groupValue: _selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
