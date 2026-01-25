import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop',
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 5.0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.accent,
          unselectedLabelColor: Colors.white,
          indicatorColor: AppColors.accent,
          indicatorWeight: 4.0,
          tabs: const [
            Tab(text: 'Fertilizers'),
            Tab(text: 'Insecticides'),
            Tab(text: 'Pesticides'),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.primaryGradient,
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildTabContent([
              _buildItem(
                'DAP (Diammonium Phosphate)',
                'Water-soluble fertilizer providing nitrogen and phosphorus for plant growth',
                '₹1,400 - ₹1,600 per 50 kg bag',
              ),
              _buildItem(
                'Urea (46% N)',
                'Nitrogen-rich fertilizer promoting plant growth and development.',
                '₹280 - ₹320 per 50 kg bag',
              ),
              _buildItem(
                'MOP (Muriate of Potash)',
                'Potassium-rich fertilizer for overall plant health and resistance.',
                '₹1,000 - ₹1,200 per 50 kg bag',
              ),
              _buildItem(
                'NPK 19:19:19',
                'Balanced fertilizer providing nitrogen, phosphorus, and potassium for plant',
                '₹1,200 - ₹1,400 per 50 kg bag',
              ),
              _buildItem(
                'Ammonium Sulphate (21% N)',
                'Nitrogen-rich fertilizer with sulphur for plant growth and soil health.',
                '₹400 - ₹500 per 50 kg bag',
              ),
            ]),
            _buildTabContent([
              _buildItem(
                'Monocil 40 SC (Monocrotophos 40% SC)',
                'Broad-spectrum insecticide for controlling pests like aphids, whiteflies, and thrips.',
                '₹540 - ₹620 per liter',
              ),
              _buildItem(
                'Confidor 200 SL (Imidacloprid 20% SL)',
                'Systemic insecticide for controlling sucking pests like aphids, jassids, and whiteflies.',
                '₹1,050 - ₹1,200 per liter',
              ),
              _buildItem(
                'Thiodan 35 EC (Endosulfan 35% EC)',
                'Broad-spectrum insecticide for controlling pests like bollworms, aphids, and thrips.',
                '₹450 - ₹520 per liter',
              ),
              _buildItem(
                'Nuvan 50 EC (Chlorpyrifos 50% EC)',
                'Broad-spectrum insecticide for controlling pests like mosquitoes, flies, and ticks.',
                '₹380 - ₹450 per liter',
              ),
              _buildItem(
                'Decis 2.8 EC (Deltamethrin 2.8% EC)',
                'Broad-spectrum insecticide for controlling pests like bollworms, aphids, and thrips.',
                '₹620 - ₹700 per liter',
              ),
            ]),
            _buildTabContent([
              _buildItem(
                'Confidor 200 SL (Imidacloprid 20% SL)',
                'Systemic pesticide for controlling sucking pests like aphids, jassids, and whiteflies.',
                '₹1,050 - ₹1,200 per liter',
              ),
              _buildItem(
                'Coragen 20 SC (Chlorantraniliprole 20% SC)',
                'Broad-spectrum pesticide for controlling pests like bollworms, aphids, and thrips.',
                '₹800 - ₹950 per liter',
              ),
              _buildItem(
                'Nova 40 EC (Indoxacarb 40% EC)',
                'Broad-spectrum pesticide for controlling pests like bollworms, aphids, and thrips.',
                '₹600 - ₹700 per liter',
              ),
              _buildItem(
                'Marvel 45 SC (Dinotefuran 45% SC)',
                'Systemic pesticide for controlling sucking pests like aphids, jassids, and whiteflies.',
                '₹900 - ₹1,050 per liter',
              ),
              _buildItem(
                'Falcon 3.6 EC (Bifenthrin 3.6% EC)',
                'Broad-spectrum pesticide for controlling pests like mosquitoes, flies, and ticks.',
                '₹450 - ₹550 per liter',
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(List<Widget> items) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: items,
    );
  }

  Widget _buildItem(String title, String description, String price) {
    return Card(
      elevation: 5.0,
      shadowColor: Colors.grey.withValues(alpha: 0.5),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Color(0xFF1A4314),
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF4B7D33),
          ),
        ),
        trailing: Text(
          price,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
