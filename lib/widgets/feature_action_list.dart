import 'package:flutter/material.dart';
import 'package:kavach_v1/screens/ai_chat_screen.dart';
import 'package:kavach_v1/screens/community_screen.dart';
import 'package:kavach_v1/screens/expert_talk_screen.dart';
import 'package:kavach_v1/screens/guidance_screen.dart';
import 'package:kavach_v1/screens/sell_veggies_screen.dart';
import 'package:kavach_v1/screens/shop_screen.dart';
import 'package:kavach_v1/screens/soil_screen.dart';
import 'package:kavach_v1/screens/subscription_screen.dart';
import 'package:kavach_v1/screens/weather_screen.dart';
import 'feature_action_button.dart';

class FeatureActionList extends StatelessWidget {
  const FeatureActionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FeatureActionButton(
            icon: Icons.cloud,
            label: "Weather",
            onTap: () {
              // Navigator.push(...)
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const WeatherScreen(),),);
            },
          ),
          FeatureActionButton(
            icon: Icons.grass,
            label: "Soil Fertility",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SoilScreen()),);
            },
          ),
          FeatureActionButton(
            icon: Icons.smart_toy,
            label: "AI Chat",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
              builder: (context) => const AiChatScreen()),);},
          ),
          FeatureActionButton(
            icon: Icons.store,
            label: "Sell Veggies",
            onTap: () { Navigator.push(context, MaterialPageRoute(
              builder: (context) => const SellVeggiesScreen()),);},
          ),
          FeatureActionButton(
            icon: Icons.shopping_cart,
            label: "Shop",
            onTap: () { Navigator.push(context, MaterialPageRoute(
              builder: (context) => const ShopScreen()),);},
          ),
          FeatureActionButton(
            icon: Icons.groups,
            label: "Community",
            onTap: () { Navigator.push(context, MaterialPageRoute(
              builder: (context) => const CommunityScreen()),);},
          ),
          FeatureActionButton(
            icon: Icons.card_membership,
            label: "Subscription",
            onTap: () { Navigator.push(context, MaterialPageRoute(
              builder: (context) => const SubscriptionScreen()),);},
          ),
          FeatureActionButton(
            icon: Icons.support_agent,
            label: "1-on-1 Guidance",
            onTap: () { Navigator.push(context, MaterialPageRoute(
              builder: (context) => const GuidanceScreen()),);},
          ),
          FeatureActionButton(
            icon: Icons.mic,
            label: "Expert Talk",
            onTap: () { Navigator.push(context, MaterialPageRoute(
              builder: (context) => const ExpertTalkScreen()),);},
          ),
        ],
      ),
    );
  }
}
