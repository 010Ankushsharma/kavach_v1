import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SoilScreen extends StatefulWidget {
  const SoilScreen({super.key});

  @override
  State<SoilScreen> createState() => _SoilScreenState();
}

class _SoilScreenState extends State<SoilScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _ecController = TextEditingController();
  final TextEditingController _nController = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _kController = TextEditingController();
  final TextEditingController _calciumController = TextEditingController();
  final TextEditingController _magnesiumController = TextEditingController();
  final TextEditingController _znController = TextEditingController();
  final TextEditingController _cuController = TextEditingController();
  final TextEditingController _mnController = TextEditingController();
  final TextEditingController _feController = TextEditingController();
  final TextEditingController _boronController = TextEditingController();
  final TextEditingController _so4sController = TextEditingController();
  final TextEditingController _sandController = TextEditingController();
  final TextEditingController _siltController = TextEditingController();
  final TextEditingController _clayController = TextEditingController();
  final TextEditingController _mwhcController = TextEditingController();
  final TextEditingController _ocController = TextEditingController();

  final Map<String, double> _standardValues = {
    'pH': 7.78,
    'EC': 0.28,
    'N': 564.48,
    'P': 22.54,
    'K': 259.16,
    'Calcium': 44.0,
    'Magnesium': 8.64,
    'Zn': 2.28,
    'Cu': 2.67,
    'Mn': 4.89,
    'Fe': 4.43,
    'Boron': 3.42,
    'So4-S': 3.42,
    'Sand': 86.6,
    'Silt': 3.4,
    'Clay': 10.0,
    'M.W.H.C': 73.18,
    'OC': 0.50,
  };

  @override
  void dispose() {
    _phController.dispose();
    _ecController.dispose();
    _nController.dispose();
    _pController.dispose();
    _kController.dispose();
    _calciumController.dispose();
    _magnesiumController.dispose();
    _znController.dispose();
    _cuController.dispose();
    _mnController.dispose();
    _feController.dispose();
    _boronController.dispose();
    _so4sController.dispose();
    _sandController.dispose();
    _siltController.dispose();
    _clayController.dispose();
    _mwhcController.dispose();
    _ocController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final Map<String, double> userValues = {
        'pH': double.parse(_phController.text),
        'EC': double.parse(_ecController.text),
        'N': double.parse(_nController.text),
        'P': double.parse(_pController.text),
        'K': double.parse(_kController.text),
        'Calcium': double.parse(_calciumController.text),
        'Magnesium': double.parse(_magnesiumController.text),
        'Zn': double.parse(_znController.text),
        'Cu': double.parse(_cuController.text),
        'Mn': double.parse(_mnController.text),
        'Fe': double.parse(_feController.text),
        'Boron': double.parse(_boronController.text),
        'So4-S': double.parse(_so4sController.text),
        'Sand': double.parse(_sandController.text),
        'Silt': double.parse(_siltController.text),
        'Clay': double.parse(_clayController.text),
        'M.W.H.C': double.parse(_mwhcController.text),
        'OC': double.parse(_ocController.text),
      };

      final List<String> recommendations = [];

      _standardValues.forEach((key, value) {
        final double? userValue = userValues[key];
        if (userValue != null) {
          if (userValue < value) {
            recommendations.add(
                '$key is below the recommended level. Consider adding more.');
          } else if (userValue > value) {
            recommendations.add('$key is above the recommended level.');
          }
        }
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Soil Testing Results"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...recommendations.map((rec) => Text(rec)),
              const SizedBox(height: 10),
              const Text("We will contact you with further recommendations."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildTextField(
      TextEditingController controller,
      String label,
      String hint, {
        TextInputType keyboardType = TextInputType.number,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.8),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          try {
            double.parse(value);
          } catch (e) {
            return 'Please enter a valid number';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Soil Testing",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF88a688), Color(0xFF427346)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFdcd5a7), Color(0xFF88a688)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField(_phController, "pH", "Enter pH level"),
                _buildTextField(
                  _ecController,
                  "EC (ms/cm)",
                  "Enter Electrical Conductivity",
                ),
                _buildTextField(
                  _nController,
                  "N (kg/hq)",
                  "Enter Nitrogen level",
                ),
                _buildTextField(
                  _pController,
                  "P (kg/hq)",
                  "Enter Phosphorus level",
                ),
                _buildTextField(
                  _kController,
                  "K (kg/hq)",
                  "Enter Potassium level",
                ),
                _buildTextField(
                  _calciumController,
                  "Calcium (meq%)",
                  "Enter Calcium level",
                ),
                _buildTextField(
                  _magnesiumController,
                  "Magnesium (meq%)",
                  "Enter Magnesium level",
                ),
                _buildTextField(_znController, "Zn (ppm)", "Enter Zinc level"),
                _buildTextField(
                  _cuController,
                  "Cu (ppm)",
                  "Enter Copper level",
                ),
                _buildTextField(
                  _mnController,
                  "Mn (ppm)",
                  "Enter Manganese level",
                ),
                _buildTextField(_feController, "Fe (ppm)", "Enter Iron level"),
                _buildTextField(
                  _boronController,
                  "Boron (ppm)",
                  "Enter Boron level",
                ),
                _buildTextField(
                  _so4sController,
                  "So4-S (mg/kg)",
                  "Enter Sulfate level",
                ),
                _buildTextField(
                  _sandController,
                  "Sand (%)",
                  "Enter Sand percentage",
                ),
                _buildTextField(
                  _siltController,
                  "Silt (%)",
                  "Enter Silt percentage",
                ),
                _buildTextField(
                  _clayController,
                  "Clay (%)",
                  "Enter Clay percentage",
                ),
                _buildTextField(
                  _mwhcController,
                  "M.W.H.C (%)",
                  "Enter Moisture Holding Capacity",
                ),
                _buildTextField(
                  _ocController,
                  "OC (%)",
                  "Enter Organic Carbon percentage",
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
