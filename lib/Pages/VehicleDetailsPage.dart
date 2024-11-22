import 'package:aly_car_service/Authentication/Login.dart';
import 'package:aly_car_service/Pages/car_detail_page.dart';
import 'package:flutter/material.dart';

class VehicleDetailsPage extends StatefulWidget {
  @override
  _VehicleDetailsPageState createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Sample vehicle data
  final List<Map<String, dynamic>> vehicles = [
    {
      'id': 1,
      'name': 'Range Rover Sport',
      'vin': 'ASD123213213213213',
      'year': 2020,
      'image': 'assets/vehicle.jpg',
    },
    {
      'id': 2,
      'name': 'Range Rover Sport',
      'vin': 'ASD123213213213213',
      'year': 2020,
      'image': 'assets/vehicle2.jpg',
    },
    {
      'id': 3,
      'name': 'Range Rover Sport',
      'vin': 'ASD123213213213213',
      'year': 2020,
      'image': 'assets/vehicle3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Vehicle Details'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: _buildDrawer(context), // Sidebar (Drawer)
      body: GestureDetector(
        onTap: () {
          // Close the drawer when tapping outside
          if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
            Navigator.of(context).pop();
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Vehicle Image and Details
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Vehicle Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                vehicle['image'],
                                width: constraints.maxWidth * 0.3,
                                height: constraints.maxWidth * 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            // Vehicle Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${vehicle['id']}. ${vehicle['name']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    'VIN: ${vehicle['vin']}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Mfg Year: ${vehicle['year']}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        // Button aligned to bottom-right
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CarDetailPage(vehicle: vehicle),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              'Select',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // Sidebar (Drawer)
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Welcome, Shakeer',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.car_repair),
            title: const Text('Your Vehicle Details'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.build),
            title: const Text('Service Requests'),
            onTap: () {
              Navigator.pop(context); // Handle service requests navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
