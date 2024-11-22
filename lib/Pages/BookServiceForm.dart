import 'package:flutter/material.dart';

class BookServiceForm extends StatefulWidget {
  const BookServiceForm({Key? key}) : super(key: key);

  @override
  State<BookServiceForm> createState() => _BookServiceFormState();
}

class _BookServiceFormState extends State<BookServiceForm> {
  String? selectedLocation;
  String? selectedTimeSlot;
  final TextEditingController additionalInfoController = TextEditingController();

  final List<String> locations = [
    '07w Dubai',
    '09w Abu Dhabi',
    '11w Sharjah',
    '13w Ajman'
  ];

  final List<String> timeSlots = [
    '9 am to 10 am',
    '10 am to 11 am',
    '11 am to 12 pm'
  ];

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your Request is Booked Successfully with',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Request No. 5500',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 45),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                    Navigator.of(context).pop(); // Return to vehicle details
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WORKSHOP LOCATION',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedLocation,
                hint: Text('  - Select -'),
                padding: EdgeInsets.symmetric(horizontal: 8),
                items: locations.map((String location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'TIMING SLOTS',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...timeSlots.map((slot) => RadioListTile<String>(
                title: Text(slot),
                value: slot,
                groupValue: selectedTimeSlot,
                onChanged: (String? value) {
                  setState(() {
                    selectedTimeSlot = value;
                  });
                },
              )),
          const SizedBox(height: 20),
          Text(
            'ADDITIONAL INFO',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: additionalInfoController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter a value',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(double.infinity, 45),
            ),
            onPressed: () {
              _showSuccessDialog(context);
            },
            child: Text(
              'BOOK SERVICE',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}