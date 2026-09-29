import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherPredictionPage extends StatefulWidget {
  const WeatherPredictionPage({super.key});

  @override
  State<WeatherPredictionPage> createState() => _WeatherPredictionPageState();
}

class _WeatherPredictionPageState extends State<WeatherPredictionPage> {
  final latitudeController = TextEditingController(text: '10.522410');
  final longitudeController = TextEditingController(text: '76.203463');

  bool locating = false;
  bool predicting = false;
  Map<String, dynamic>? weatherData;
  String? errorMessage;

  static const Color primary = Color(0xFF246BFD);
  static const Color dark = Color(0xFF172B4D);
  static const Color background = Color(0xFFF4F7FC);

  @override
  void dispose() {
    latitudeController.dispose();
    longitudeController.dispose();
    super.dispose();
  }

  Future<void> getCurrentLocation() async {
    setState(() {
      locating = true;
      errorMessage = null;
    });

    try {
      // Check location service
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        throw Exception('Please enable location services.');
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied.');
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
          'Location permission permanently denied. '
          'Enable it in settings.',
        );
      }

      // Get current GPS coordinates
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      final lat = position.latitude;
      final lon = position.longitude;

      // Update the coordinate fields
      latitudeController.text = lat.toStringAsFixed(6);
      longitudeController.text = lon.toStringAsFixed(6);

      // Send POST request to the weather API
      final uri = Uri.parse(
        'https://8w873g22-8001.inc1.devtunnels.ms/weather/',
      );

      final response = await http
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'latitude': lat,
              'longitude': lon,
            }),
          )
          .timeout(const Duration(seconds: 30));

      final decoded = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw Exception(
          decoded is Map
              ? decoded['message']?.toString() ??
                  'Server error: ${response.statusCode}'
              : 'Server error: ${response.statusCode}',
        );
      }

      if (decoded is! Map<String, dynamic> || decoded['status'] != true) {
        throw Exception(
          decoded is Map
              ? decoded['message']?.toString() ?? 'Weather prediction failed.'
              : 'Invalid server response.',
        );
      }

      // Display the API response in the existing UI
      if (!mounted) return;

      setState(() {
        weatherData = decoded;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          locating = false;
        });
      }
    }
  }

  Future<void> predictWeather() async {
    final lat = double.tryParse(latitudeController.text.trim());
    final lon = double.tryParse(longitudeController.text.trim());

    if (lat == null ||
        lon == null ||
        lat < -90 ||
        lat > 90 ||
        lon < -180 ||
        lon > 180) {
      setState(() {
        errorMessage = 'Enter valid latitude and longitude.';
      });
      return;
    }

    setState(() {
      predicting = true;
      errorMessage = null;
      weatherData = null;
    });

    try {
      final uri = Uri.parse(
        'https://8w873g22-8001.inc1.devtunnels.ms/weather/',
      );

      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'latitude': lat,
          'longitude': lon,
        }),
      ).timeout(
        const Duration(seconds: 30),
      );

      final decoded = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw Exception(
          decoded is Map
              ? decoded['message']?.toString() ??
                  'Server error: ${response.statusCode}'
              : 'Server error: ${response.statusCode}',
        );
      }

      if (decoded is! Map<String, dynamic> || decoded['status'] != true) {
        throw Exception(
          decoded is Map
              ? decoded['message']?.toString() ?? 'Prediction failed.'
              : 'Invalid server response.',
        );
      }

      if (!mounted) return;
      setState(() {
        weatherData = decoded;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() => predicting = false);
      }
    }
  }

  Color riskColor(String? level) {
    switch (level?.toUpperCase()) {
      case 'LOW':
        return const Color(0xFF16A34A);
      case 'MEDIUM':
        return const Color(0xFFF59E0B);
      case 'HIGH':
        return const Color(0xFFEA580C);
      case 'SEVERE':
      case 'EXTREME':
        return const Color(0xFFDC2626);
      default:
        return Colors.blueGrey;
    }
  }

  IconData weatherIcon(String? weather) {
    final value = (weather ?? '').toLowerCase();

    if (value.contains('thunder')) {
      return Icons.thunderstorm_rounded;
    }
    if (value.contains('rain') || value.contains('drizzle')) {
      return Icons.grain_rounded;
    }
    if (value.contains('cloud')) {
      return Icons.cloud_rounded;
    }
    if (value.contains('snow')) {
      return Icons.ac_unit_rounded;
    }
    if (value.contains('fog')) {
      return Icons.foggy;
    }
    return Icons.wb_sunny_rounded;
  }

  String formatDate(dynamic value) {
    if (value == null) return '--';
    final date = DateTime.tryParse(value.toString());
    if (date == null) return value.toString();

    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${days[date.weekday - 1]}, '
        '${date.day} ${months[date.month - 1]}';
  }

  String value(dynamic value, [String suffix = '']) {
    if (value == null) return '--';
    if (value is num) return '${value.toStringAsFixed(1)}$suffix';
    return '$value$suffix';
  }

  Widget sectionTitle(String title, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: dark,
              )),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle,
                style:
                    TextStyle(fontSize: 12, color: Colors.blueGrey.shade500)),
          ]
        ],
      ),
    );
  }

  Widget metricCard(
      IconData icon, String title, String valueText, String unit) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE9EEF6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.09),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primary, size: 21),
          ),
          const SizedBox(height: 13),
          Text(title,
              style: TextStyle(color: Colors.blueGrey.shade500, fontSize: 12)),
          const SizedBox(height: 5),
          Text(valueText,
              style: const TextStyle(
                color: dark,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              )),
          Text(unit,
              style: TextStyle(color: Colors.blueGrey.shade400, fontSize: 11)),
        ],
      ),
    );
  }

  Widget riskCard(
    String title,
    Map<String, dynamic>? risk, {
    bool overall = false,
  }) {
    final level = risk?['level']?.toString() ?? 'UNKNOWN';
    final color = riskColor(level);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color:
              overall ? color.withValues(alpha: 0.5) : const Color(0xFFE9EEF6),
          width: overall ? 1.5 : 1,
        ),
        boxShadow: overall
            ? [
                BoxShadow(
                  color: color.withValues(alpha: 0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                overall
                    ? Icons.health_and_safety_rounded
                    : Icons.shield_outlined,
                color: color,
                size: 23,
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Text(title,
                    style: const TextStyle(
                      color: dark,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    )),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(level,
                    style: TextStyle(
                      color: color,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    )),
              )
            ],
          ),
          if (risk?['type'] != null) ...[
            const SizedBox(height: 9),
            Text('Risk type: ${risk!['type']}',
                style:
                    const TextStyle(color: dark, fontWeight: FontWeight.w600)),
          ],
          if (risk?['reason'] != null) ...[
            const SizedBox(height: 9),
            Text(risk!['reason'].toString(),
                style: TextStyle(
                    color: Colors.blueGrey.shade600,
                    height: 1.45,
                    fontSize: 13)),
          ],
          if (risk?['recommendation'] != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.lightbulb_outline_rounded, size: 19, color: color),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      risk!['recommendation'].toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: dark,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ],
      ),
    );
  }

  Widget buildForecast(List<dynamic> forecast) {
    if (forecast.isEmpty) {
      return const Text('No forecast available.');
    }

    return SizedBox(
      height: 178,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: forecast.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = forecast[index] as Map<String, dynamic>;
          final rain = item['precipitation'];

          return Container(
            width: 120,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: const Color(0xFFE9EEF6)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  formatDate(item['date']),
                  style: const TextStyle(
                    color: dark,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  weatherIcon(item['weather']?.toString()),
                  size: 32,
                  color: primary,
                ),
                Text(
                  item['weather']?.toString() ?? 'Unknown',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blueGrey.shade500,
                  ),
                ),
                Text(
                  '${value(item['max_temperature'], '°')} / '
                  '${value(item['min_temperature'], '°')}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: dark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.water_drop_rounded,
                        size: 13, color: primary),
                    const SizedBox(width: 3),
                    Text('${value(rain, ' mm')}',
                        style: TextStyle(
                            fontSize: 10, color: Colors.blueGrey.shade600)),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildResults() {
    final data = weatherData!;
    final current = data['current'] as Map<String, dynamic>? ?? {};
    final risk = data['risk'] as Map<String, dynamic>? ?? {};
    final location = data['location'] as Map<String, dynamic>? ?? {};
    final forecast = data['forecast'] as List<dynamic>? ?? [];
    final overall = risk['overall'] as Map<String, dynamic>? ?? {};
    final condition = current['weather']?.toString() ?? 'Unknown';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 28),
        sectionTitle('Current Weather',
            subtitle: 'Live weather information for your location'),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF347CF6), Color(0xFF1644BC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: primary.withValues(alpha: 0.24),
                blurRadius: 20,
                offset: const Offset(0, 8),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_rounded,
                      color: Colors.white, size: 18),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      '${location['latitude'] ?? '--'}, '
                      '${location['longitude'] ?? '--'}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Text(
                    current['time']?.toString() ?? '',
                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Icon(weatherIcon(condition), color: Colors.white, size: 64),
                  const SizedBox(width: 17),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value(current['temperature'], '°C'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 43,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(condition,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 18),
              const Divider(color: Colors.white30),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _heroMetric(Icons.water_drop_outlined, 'Humidity',
                      value(current['humidity'], '%')),
                  _heroMetric(Icons.air_rounded, 'Wind',
                      value(current['wind_speed'], ' km/h')),
                  _heroMetric(Icons.grain_rounded, 'Rain',
                      value(current['rain'], ' mm')),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 25),
        sectionTitle('Weather Details'),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.78,
          children: [
            metricCard(Icons.water_drop_rounded, 'Humidity',
                value(current['humidity'], '%'), 'Relative humidity'),
            metricCard(Icons.cloud_rounded, 'Cloud Cover',
                value(current['cloud_cover'], '%'), 'Sky coverage'),
            metricCard(Icons.speed_rounded, 'Pressure',
                value(current['pressure'], ' hPa'), 'Atmospheric'),
            metricCard(Icons.air_rounded, 'Wind Speed',
                value(current['wind_speed'], ' km/h'), 'Current wind'),
            metricCard(Icons.grain_rounded, 'Precipitation',
                value(current['precipitation'], ' mm'), 'Current'),
            metricCard(Icons.umbrella_rounded, 'Rainfall',
                value(current['rain'], ' mm'), 'Current'),
          ],
        ),
        const SizedBox(height: 28),
        sectionTitle('Weather Risk Assessment',
            subtitle: 'Risk levels and recommended precautions'),
        riskCard('Overall Risk', overall, overall: true),
        riskCard(
          'Current Risk',
          risk['current'] as Map<String, dynamic>?,
        ),
        riskCard(
          'Forecast Risk',
          risk['forecast'] as Map<String, dynamic>?,
        ),
        const SizedBox(height: 18),
        sectionTitle('7-Day Forecast',
            subtitle: 'Daily temperature and rainfall outlook'),
        buildForecast(forecast),
      ],
    );
  }

  Widget _heroMetric(IconData icon, String title, String valueText) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(height: 6),
          Text(valueText,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 14)),
          const SizedBox(height: 3),
          Text(title,
              style: const TextStyle(color: Colors.white70, fontSize: 11)),
        ],
      ),
    );
  }

  Widget coordinateField(String label, TextEditingController controller) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                color: Colors.blueGrey.shade600,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: true),
            decoration: InputDecoration(
              filled: true,
              fillColor: background,
              hintText: 'Enter $label',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: Color(0xFFE3EAF4)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Weather Prediction',
          style: TextStyle(
            color: dark,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: dark),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(color: const Color(0xFFE9EEF6)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.my_location_rounded,
                            color: primary, size: 22),
                        SizedBox(width: 9),
                        Text(
                          'Select Location',
                          style: TextStyle(
                            color: dark,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'Get your coordinates automatically or enter them manually.',
                      style: TextStyle(
                          color: Colors.blueGrey.shade500,
                          fontSize: 12,
                          height: 1.5),
                    ),
                    const SizedBox(height: 19),
                    Row(
                      children: [
                        coordinateField('Latitude', latitudeController),
                        const SizedBox(width: 12),
                        coordinateField('Longitude', longitudeController),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: locating ? null : getCurrentLocation,
                        icon: locating
                            ? const SizedBox(
                                height: 17,
                                width: 17,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.gps_fixed_rounded),
                        label: Text(locating
                            ? 'Getting location...'
                            : 'Use My Current Location'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: primary,
                          side: const BorderSide(color: primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: predicting ? null : predictWeather,
                        icon: predicting
                            ? const SizedBox(
                                height: 19,
                                width: 19,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.analytics_rounded),
                        label: Text(
                          predicting
                              ? 'Predicting Weather...'
                              : 'Predict Weather',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor:
                              primary.withValues(alpha: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (errorMessage != null) ...[
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEEEE),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          errorMessage!,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (predicting && weatherData == null)
                const Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(color: primary),
                        SizedBox(height: 14),
                        Text('Analyzing weather conditions...'),
                      ],
                    ),
                  ),
                ),
              if (weatherData != null) buildResults(),
              if (weatherData == null && !predicting)
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.cloud_outlined,
                            size: 65, color: Colors.blueGrey.shade200),
                        const SizedBox(height: 12),
                        const Text(
                          'Ready to predict',
                          style: TextStyle(
                            color: dark,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Select a location and tap Predict Weather.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey.shade500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
