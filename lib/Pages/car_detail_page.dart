import 'package:aly_car_service/Pages/BookServiceForm.dart';
import 'package:flutter/material.dart';

class CarDetailPage extends StatelessWidget {
  final Map<String, dynamic> vehicle;

  const CarDetailPage({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Details'),
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2, // Two tabs: Service History and Book Service
          child: Column(
            children: [
              // Vehicle Details Section
              Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Vehicle Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        vehicle['image'],
                        width: double.infinity,
                        height: screenWidth * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Vehicle Details
                    Text(
                      vehicle['name'],
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Manufacturing Year: ${vehicle['year']}',
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                    Text(
                      'VIN: ${vehicle['vin']}',
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ],
                ),
              ),

              // Tabs Section
              TabBar(
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      'Service History',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Book Service',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              // Tab Views
              SizedBox(
                height: screenHeight * 0.6,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(), 
                  children: [
                    // Service History Table
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: DataTable(
                          columnSpacing: 16.0,
                          headingRowColor: MaterialStateProperty.all(Colors.black),
                          border: TableBorder.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          columns: [
                            DataColumn(
                              label: Text(
                                'Date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Service Type',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Service Category',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Amount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('20-FEB-2024')),
                              DataCell(Text('New')),
                              DataCell(Text('Periodic')),
                              DataCell(Text('2500 AED')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('20-MAR-2024')),
                              DataCell(Text('New')),
                              DataCell(Text('Periodic')),
                              DataCell(Text('600 AED')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('20-APR-2024')),
                              DataCell(Text('New')),
                              DataCell(Text('Periodic')),
                              DataCell(Text('250 AED')),
                            ]),
                          ],
                        ),
                      ),
                    ),

                    BookServiceForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Widget for Service History
Widget _buildServiceHistory() {
  final List<Map<String, dynamic>> serviceHistory = [
    {
      'date': '20-FEB-2024',
      'type': 'New',
      'category': 'Periodic',
      'amount': '2500 AED'
    },
    {
      'date': '20-MAR-2024',
      'type': 'New',
      'category': 'Periodic',
      'amount': '600 AED'
    },
    {
      'date': '20-APR-2024',
      'type': 'New',
      'category': 'Periodic',
      'amount': '250 AED'
    },
  ];

  return Card(
    elevation: 4.0,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 16.0,
        columns: const [
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Service Type')),
          DataColumn(label: Text('Service Category')),
          DataColumn(label: Text('Amount')),
        ],
        rows: serviceHistory.map((history) {
          return DataRow(
            cells: [
              DataCell(Text(history['date'])),
              DataCell(Text(history['type'])),
              DataCell(Text(history['category'])),
              DataCell(Text(history['amount'])),
            ],
          );
        }).toList(),
      ),
    ),
  );
}

// Widget for Book Service
Widget _buildBookService() {
  return Card(
    elevation: 4.0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Book a Service',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            'To book a service for your vehicle, please contact our customer support or visit the nearest service center.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
