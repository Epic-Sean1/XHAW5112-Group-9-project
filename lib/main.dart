import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: MainTabsController(), 
  debugShowCheckedModeBanner: false,
));

// ==========================================
// PERSISTENT TAB CONTROLLER HOUSING ALL SCREENS
// ==========================================
class MainTabsController extends StatefulWidget {
  const MainTabsController({super.key});

  @override
  State<MainTabsController> createState() => _MainTabsControllerState();
}

class _MainTabsControllerState extends State<MainTabsController> {
  int _currentIndex = 0;

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> get _screens => [
    HomeScreen(onTabRequested: changeTab),
    const PackagesScreen(),
    ExperiencesScreen(onTabRequested: changeTab),
    const GetQuoteContent(),
    const MoreScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomBottomNav(currentIndex: _currentIndex, onTap: changeTab),
    );
  }
}

class BottomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomBottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFF9FAFB),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFB55FE6),
      unselectedItemColor: Colors.grey,
      selectedFontSize: 9,
      unselectedFontSize: 9,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: 'Packages'),
        BottomNavigationBarItem(icon: Icon(Icons.vrpano), label: 'Individual Experiences'),
        BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Fees'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
      ],
    );
  }
}

// ==========================================
// 1. HOME SCREEN VIEW
// ==========================================
class HomeScreen extends StatelessWidget {
  final Function(int) onTabRequested;
  const HomeScreen({super.key, required this.onTabRequested});

  Widget _card(String t, String d, int index) => GestureDetector(
    onTap: () => onTabRequested(index),
    child: Container(
      width: double.infinity, 
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16), 
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Text(t, style: const TextStyle(color: Color(0xFFB55FE6), fontWeight: FontWeight.bold)), 
              const Icon(Icons.arrow_forward_ios, color: Colors.black26, size: 12)
            ],
          ),
          const SizedBox(height: 4), 
          Text(d, style: const TextStyle(color: Color(0xFF11121A), fontSize: 12)),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Padding(
              padding: const EdgeInsets.all(16), 
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.png', 
                    width: 60, 
                    height: 60, 
                    filterQuality: FilterQuality.high, 
                    errorBuilder: (c,e,s) => const Icon(Icons.sports_esports, color: Color(0xFFB55FE6), size: 48),
                  ),
                  const SizedBox(width: 16), 
                  const Text('NEXT LEVEL GAMING', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF11121A))),
                ],
              ),
            ),
            Container(
              width: double.infinity, 
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xFFF3F4F6)),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  SizedBox(
                    width: double.infinity, 
                    height: 220,
                    child: Image.asset(
                      'assets/hero_banner.png', 
                      width: double.infinity, 
                      height: double.infinity, 
                      fit: BoxFit.cover, 
                      filterQuality: FilterQuality.high, 
                      errorBuilder: (c,e,s) => Container(width: double.infinity, height: 150, color: Colors.deepPurple.shade100),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16), 
                    child: Text('NEXT LEVEL GAMING &\nESPORTS ARENA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF11121A))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _card('GAMING PACKAGES', 'Choose a package for a full gaming or event experience', 1),
            _card('INDIVIDUAL EXPERIENCES', 'Try VR, Racing simulator and escape room challenges', 2),
            _card('CALCULATE TOTAL FEES', 'Select the services you are interested in and prepare a fee estimate', 3),
            _card('CONTACT US', 'Contact us with your questions and booking enquiries', 4),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. GAMING PACKAGES SCREEN
// ==========================================
class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget pkgItem(String title, String subtitle, String price, List<String> includes, String longDesc) => Container(
      margin: const EdgeInsets.only(bottom: 14), 
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16), 
        border: Border.all(color: Colors.black.withAlpha(12)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    Text(title, style: const TextStyle(color: Color(0xFF11121A), fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 4), 
                    Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward, color: Color(0xFF11121A), size: 16),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PackageDetailScreen(
                        title: title,
                        subtitle: subtitle,
                        description: longDesc,
                        includes: includes,
                        price: price,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(price, style: const TextStyle(color: Color(0xFFE65F8E), fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('GAMING PACKAGES', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFB55FE6))),
          const SizedBox(height: 4),
          const Text('Choose the perfect packages for your journey', style: TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16), 
              children: [
                pkgItem('ULTIMATE GAMER PASS', 'The ultimate gaming experience', 'R1,500', ['PC gaming', 'Console gaming', 'High-speed Internet'], 'Enjoy unlimited access to our gaming stations for a full day.'),
                pkgItem('VIP GAMING EXPERIENCE', 'Premium gaming with exclusive perks', 'R1,500', ['Premium hardware', 'Food options'], 'Enjoy a high-end gaming experience with exclusive facilities.'),
                pkgItem('ESPORTS TRAINING PACKAGE', 'Train like a pro, Compete like a champion', 'R1,500', ['Strategy coaching', 'Match analysis'], 'Improve your competitive gaming skills with professional coaching.'),
                pkgItem('BIRTHDAY PARTY PACKAGE', 'Celebrate your special day with epic gaming', 'R1,500', ['Reserved area', 'Catering included'], 'Enjoy a fun filled birthday party with friends, food and competitions.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PackageDetailScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final List<String> includes;
  final String price;

const PackageDetailScreen({super.key, required this.title, required this.subtitle, required this.description, required this.includes, required this.price});
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: const BackButton(color: Color(0xFF11121A))),
body: SafeArea(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 24.0),
child: Column(
children: [
Text(title, style: const TextStyle(color: Color(0xFFB55FE6), fontWeight: FontWeight.bold, fontSize: 24)),
const SizedBox(height: 30),
Expanded(
child: Container(
padding: const EdgeInsets.all(24),
decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(20)),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(description, style: const TextStyle(color: Color(0xFF11121A), fontSize: 14)),
const SizedBox(height: 20),
const Text('INCLUDES :', style: TextStyle(color: Color(0xFFE65F8E), fontWeight: FontWeight.bold)),
...includes.map((f) => Text(f, style: const TextStyle(color: Color(0xFF11121A)))),
const Spacer(),
Align(alignment: Alignment.bottomRight, child: Text(price, style: const TextStyle(color: Color(0xFF8E6CEF), fontWeight: FontWeight.bold, fontSize: 26))),
],
),
),
),
const SizedBox(height: 20),
],
),
),
),
);
}
}
// ==========================================
// 3. INDIVIDUAL EXPERIENCES SCREEN
// ==========================================
class ExperiencesScreen extends StatelessWidget {
final Function(int) onTabRequested;
const ExperiencesScreen({super.key, required this.onTabRequested});
@override
Widget build(BuildContext context) {
Widget experienceCard(String title, String subtitle, String price, List includes, String longDesc, String assetPath) => Container(
width: double.infinity,
margin: const EdgeInsets.only(bottom: 16),
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(16)),
child: Row(
children: [
Container(
width: 80,
height: 80,
decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFFE5E7EB)),
clipBehavior: Clip.antiAlias,
child: Image.asset(assetPath, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.vrpano, color: Color(0xFFB55FE6), size: 32)),
),
const SizedBox(width: 16),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(title, style: const TextStyle(color: Color(0xFF8E6CEF), fontWeight: FontWeight.w600, fontSize: 13)),
const SizedBox(height: 4),
Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF11121A), fontSize: 11)),
const SizedBox(height: 6),
Align(
alignment: Alignment.bottomRight,
child: InkWell(
onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => ExperienceDetailScreen(title: title, description: longDesc, includes: includes, price: price)));
},
child: Row(
mainAxisSize: MainAxisSize.min,
children: const [
Text('Learn More', style: TextStyle(color: Color(0xFF11121A), fontSize: 12, fontWeight: FontWeight.bold)),
SizedBox(width: 4),
Icon(Icons.arrow_forward, color: Color(0xFF11121A), size: 12),
],
),
),
),
],
),
),
],
),
);
return Scaffold(
backgroundColor: Colors.white,
body: SafeArea(
child: Column(
children: [
const SizedBox(height: 20),
const Text('INDIVIDUAL EXPERIENCES', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFB55FE6))),
const SizedBox(height: 4),
const Text('Choose the perfect packages for your gaming adventure', style: TextStyle(color: Colors.grey, fontSize: 12)),
const SizedBox(height: 24),
Expanded(
child: ListView(
padding: const EdgeInsets.symmetric(horizontal: 16),
children: [
experienceCard('Virtual Reality Experience', 'Step into new worlds with our VR setup', 'R750', ['VR headsets', 'Choice of games'], 'Experience the latest virtual reality games.', 'assets/vr_preview.png'),
experienceCard('Racing Simulator Challenge', 'Feel the experience of real racing', 'R750', ['Racing simulator', 'Choice of tracks'], 'Race on professional driving simulators.', 'assets/racing_preview.png'),
experienceCard('Escape Room Challenge', 'Work together to solve the mystery', 'R750', ['Themed escape room', 'Digital scorecard'], 'Work with your team to solve puzzles and escape before time runs out.', 'assets/escape_preview.png'),
],
),
),
],
),
),
);
}
}
class ExperienceDetailScreen extends StatelessWidget {
final String title;
final String description;
final List includes;
final String price;
const ExperienceDetailScreen({super.key, required this.title, required this.description, required this.includes, required this.price});
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: const BackButton(color: Color(0xFF11121A))),
body: SafeArea(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 24.0),
child: Column(
children: [
Text(title, style: const TextStyle(color: Color(0xFF8E6CEF), fontWeight: FontWeight.bold, fontSize: 24)),
const SizedBox(height: 30),
Expanded(
child: Container(
padding: const EdgeInsets.all(24),
decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(20)),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(description, style: const TextStyle(color: Color(0xFF11121A), fontSize: 14)),
const SizedBox(height: 20),
const Text('INCLUDES :', style: TextStyle(color: Color(0xFFE65F8E), fontWeight: FontWeight.bold)),
...includes.map((f) => Text(f, style: const TextStyle(color: Color(0xFF11121A)))),
const Spacer(),
Align(alignment: Alignment.bottomRight, child: Text(price, style: const TextStyle(color: Color(0xFFE65F8E), fontWeight: FontWeight.bold, fontSize: 26))),
],
),
),
),
const SizedBox(height: 20),
],
),
),
),
);
}
}
// ==========================================
// 4. IMPROVED FEES CALCULATOR WITH ITEM SELECTORS
// ==========================================
class GetQuoteContent extends StatefulWidget {
const GetQuoteContent({super.key});
@override
State createState() => _GetQuoteContentState();
}
class _GetQuoteContentState extends State {
String selectedBookingType = 'Gaming Station';
bool showQuoteResult = false;
// Selected state metrics
final Map<String, bool> selectedGamingItems = {
'ULTIMATE GAMER PASS (R1,500)': false,
'VIP GAMING EXPERIENCE (R1,500)': false,
'ESPORTS TRAINING PACKAGE (R1,500)': false,
'BIRTHDAY PARTY PACKAGE (R1,500)': false,
};
final Map<String, bool> selectedIndividualItems = {
'Virtual Reality Experience (R750)': false,
'Racing Simulator Challenge (R750)': false,
'Escape Room Challenge (R750)': false,
};
// Pricing configuration matrices
final Map<String, double> itemPrices = {
'ULTIMATE GAMER PASS (R1,500)': 1500.00,
'VIP GAMING EXPERIENCE (R1,500)': 1500.00,
'ESPORTS TRAINING PACKAGE (R1,500)': 1500.00,
'BIRTHDAY PARTY PACKAGE (R1,500)': 1500.00,
'Virtual Reality Experience (R750)': 750.00,
'Racing Simulator Challenge (R750)': 750.00,
'Escape Room Challenge (R750)': 750.00,
};
// Math summary state variables
int countSelected = 0;
double subtotal = 0.00;
double discount = 0.00;
double vatAmount = 0.00;
double totalQuoted = 0.00;
void _calculateFullQuote() {
int totalCount = 0;
double runningSubtotal = 0.00;
selectedGamingItems.forEach((key, isChecked) {
if (isChecked) {
totalCount++;
runningSubtotal += itemPrices[key]!;
}
});
selectedIndividualItems.forEach((key, isChecked) {
if (isChecked) {
totalCount++;
runningSubtotal += itemPrices[key]!;
}
});
setState(() {
countSelected = totalCount;
subtotal = runningSubtotal;
// Volume tier bonus discount rule logic
discount = totalCount >= 2 ? 150.00 : 0.00;
vatAmount = (subtotal - discount) * 0.15;
totalQuoted = (subtotal - discount) + vatAmount;
showQuoteResult = true; // Flashes open the result summary card container panel
});
}
Widget _mockInput(String label, String placeholder, IconData icon) => Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(label, style: const TextStyle(color: Color(0xFF8E6CEF), fontSize: 13, fontWeight: FontWeight.bold)),
const SizedBox(height: 6),
Container(
height: 48,
padding: const EdgeInsets.symmetric(horizontal: 12),
decoration: BoxDecoration(color: const Color(0xFF141622), borderRadius: BorderRadius.circular(8)),
child: Row(
children: [
Icon(icon, color: Colors.white54, size: 16),
const SizedBox(width: 8),
Text(placeholder, style: const TextStyle(color: Colors.white38, fontSize: 12)),
],
),
),
],
),
);
Widget _buildCheckboxes(String blockHeader, Map<String, bool> itemSourceMap) => Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(blockHeader, style: const TextStyle(color: Color(0xFF11121A), fontSize: 14, fontWeight: FontWeight.bold)),
const SizedBox(height: 6),
...itemSourceMap.keys.map((String itemName) {
return CheckboxListTile(
title: Text(itemName, style: const TextStyle(fontSize: 13, color: Color(0xFF11121A))),
value: itemSourceMap[itemName],
activeColor: const Color(0xFF8E6CEF),
contentPadding: EdgeInsets.zero,
controlAffinity: ListTileControlAffinity.leading,
onChanged: (bool? value) {
setState(() {
itemSourceMap[itemName] = value ?? false;
showQuoteResult = false; // Forces recalculation on click toggles
});
},
);
}),
const SizedBox(height: 14),
],
);
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
body: SafeArea(
child: SingleChildScrollView(
padding: const EdgeInsets.all(24),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Center(
child: Text('GET A QUOTE', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF8E6CEF))),
),
const SizedBox(height: 4),
const Center(
child: Text('Select options below and trigger calculation to receive your quote', style: TextStyle(color: Colors.grey, fontSize: 11)),
),
const SizedBox(height: 25),
const Text('Personal Details', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 16, fontWeight: FontWeight.bold)),
const SizedBox(height: 14),
Row(
children: [
_mockInput('Full name', 'e.g. Bruno', Icons.person_outline),
const SizedBox(width: 14),
_mockInput('Phone number', 'e.g. 123456789', Icons.phone_android_outlined),
],
),
const SizedBox(height: 14),
Row(
children: [
_mockInput('Email address', 'Bruno08@gmail.com', Icons.mail_outline),
const SizedBox(width: 14),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text('Booking type', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 13, fontWeight: FontWeight.bold)),
const SizedBox(height: 6),
Container(
height: 48, padding: const EdgeInsets.symmetric(horizontal: 12),
decoration: BoxDecoration(color: const Color(0xFF141622), borderRadius: BorderRadius.circular(8)),
child: DropdownButtonHideUnderline(
child: DropdownButton(
dropdownColor: const Color(0xFF141622),
value: selectedBookingType,
isExpanded: true,
icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
items: ['Gaming Station', 'Esports Team Tournament', 'Birthday Event'].map((String value) {
return DropdownMenuItem(value: value, child: Text(value, style: const TextStyle(color: Colors.white70, fontSize: 12)));
}).toList(),
onChanged: (v) => setState(() => selectedBookingType = v!),
),
),
),
],
),
),
],
),
const SizedBox(height: 24),
const Text('Select Products From Categories', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 16, fontWeight: FontWeight.bold)),
const SizedBox(height: 14),
_buildCheckboxes('Gaming Packages Options', selectedGamingItems),
_buildCheckboxes('Individual Packages Options', selectedIndividualItems),
// Wide Action Push Button to Calculate Full Quote
SizedBox(
width: double.infinity,
height: 50,
child: ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFF8E6CEF),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
),
onPressed: _calculateFullQuote,
child: const Text('Calculate Full Quote →', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
),
),
const SizedBox(height: 24),
// Conditional Display Receipt Invoice Panel Block
if (showQuoteResult) ...[
const Text('Total Quote Summary', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 16, fontWeight: FontWeight.bold)),
const SizedBox(height: 14),
Container(
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(color: const Color(0xFF141622), borderRadius: BorderRadius.circular(4)),
child: Column(
children: [
_receiptRow('Number of selected packages', '$countSelected'),
_receiptRow('Subtotal:', 'R${subtotal.toStringAsFixed(2)}'),
_receiptRow('Discount Applied:', '-R${discount.toStringAsFixed(2)}'),
_receiptRow('Vat (15%)', 'R${vatAmount.toStringAsFixed(2)}'),
const Divider(color: Colors.white24, height: 20),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
const Text('Total Quoted Fee', style: TextStyle(color: Color(0xFFB55FE6), fontWeight: FontWeight.bold, fontSize: 14)),
Text('R${totalQuoted > 0 ? totalQuoted.toStringAsFixed(2) : "0.00"}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
],
),
],
),
),
],
],
),
),
),
);
}
Widget _receiptRow(String left, String right) => Padding(
padding: const EdgeInsets.symmetric(vertical: 4.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(left, style: const TextStyle(color: Colors.white70, fontSize: 12)),
Text(right, style: const TextStyle(color: Colors.white70, fontSize: 12)),
],
),
);
}
// ==========================================
// 5. MORE SCREEN ROUTER HUB
// ==========================================
class MoreScreen extends StatelessWidget {
const MoreScreen({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
body: SafeArea(
child: Padding(
padding: const EdgeInsets.all(24.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text('MORE NAVIGATION', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF8E6CEF))),
const SizedBox(height: 6),
const Text('Select an option to see details or talk with our team', style: TextStyle(color: Colors.grey, fontSize: 12)),
const SizedBox(height: 30),
ListTile(
leading: const Icon(Icons.info_outline, color: Color(0xFFB55FE6)),
title: const Text('About Us', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF11121A))),
subtitle: const Text('Read our mission statement and studio history', style: TextStyle(fontSize: 12)),
trailing: const Icon(Icons.arrow_forward_ios, size: 14),
onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DedicatedAboutUs())),
),
const Divider(color: Colors.black12),
ListTile(
leading: const Icon(Icons.contact_mail, color: Color(0xFFB55FE6)),
title: const Text('Contact Us', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF11121A))),
subtitle: const Text('Send booking enquiries or custom technical quotes', style: TextStyle(fontSize: 12)),
trailing: const Icon(Icons.arrow_forward_ios, size: 14),
onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DedicatedContactUs())),
),
],
),
),
),
);
}
}
class DedicatedAboutUs extends StatelessWidget {
const DedicatedAboutUs({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(title: const Text('About Us', style: TextStyle(color: Color(0xFF11121A))), backgroundColor: Colors.transparent, elevation: 0, leading: const BackButton(color: Color(0xFF11121A))),
body: SingleChildScrollView(
padding: const EdgeInsets.all(24),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text('ABOUT US', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF8E6CEF))),
const SizedBox(height: 16),
const Text('Next Level Gaming & Esports Arena was established in 2023 by Jason Naidoo...', style: TextStyle(color: Color(0xFF11121A), fontSize: 14, height: 1.5)),
const SizedBox(height: 25),
_box('MISSION', 'Our mission is to provide fun, accessible and high-quality gaming experiences for individuals, groups, schools and businesses.'),
_box('VISION', 'Our vision is to become a leading gaming and esports destination where people can connect, compete and experience the next level of gaming'),
],
),
),
);
}
Widget _box(String h, String t) => Container(
width: double.infinity, margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(20),
decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(12)),
child: Column(children: [
Text(h, style: const TextStyle(color: Color(0xFF8E6CEF), fontWeight: FontWeight.bold)),
const SizedBox(height: 8), Text(t, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF11121A), fontSize: 13)),
]),
);
}
class DedicatedContactUs extends StatelessWidget {
const DedicatedContactUs({super.key});
Widget mockField(String label, String placeholder, IconData icon, {bool isLarge = false}) => Padding(
padding: const EdgeInsets.only(bottom: 14),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(label, style: const TextStyle(color: Color(0xFF8E6CEF), fontSize: 13, fontWeight: FontWeight.bold)),
const SizedBox(height: 6),
Container(
height: isLarge ? 90 : 48, padding: const EdgeInsets.all(12),
decoration: BoxDecoration(color: const Color(0xFF141622), borderRadius: BorderRadius.circular(8)),
child: Row(
crossAxisAlignment: isLarge ? CrossAxisAlignment.start : CrossAxisAlignment.center,
children: [
Icon(icon, color: Colors.white54, size: 16),
const SizedBox(width: 8),
Text(placeholder, style: const TextStyle(color: Colors.white38, fontSize: 12)),
],
),
),
],
),
);
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: const BackButton(color: Color(0xFF11121A))),
body: SingleChildScrollView(
padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Center(child: Text('CONTACT US', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF8E6CEF)))),
const Center(child: Text('Enter your details and receive your personalized quote', style: TextStyle(color: Colors.grey, fontSize: 11))),
const SizedBox(height: 25),
const Text('Personal Details', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 16, fontWeight: FontWeight.bold)),
const SizedBox(height: 14),
mockField('Full name', 'e.g. Bruno', Icons.person_outline),
mockField('Email address', 'Bruno08@gmail.com', Icons.mail_outline),
mockField('Phone number', 'e.g. 123456789', Icons.phone_android_outlined),
mockField('Message', 'Type your message', Icons.chat_bubble_outline, isLarge: true),
const SizedBox(height: 16),
Container(
width: double.infinity, padding: const EdgeInsets.all(20),
decoration: BoxDecoration(color: const Color(0xFF23253A), borderRadius: BorderRadius.circular(4)),
child: Column(
children: [
_infoRow(Icons.phone, 'Phone', '123456789'),
const SizedBox(height: 12),
_infoRow(Icons.email, 'Email', 'info@nextlevelgaming.co.za'),
const SizedBox(height: 12),
_infoRow(Icons.location_on, 'Location', 'Johannesburg, 2000'),
],
),
)
],
),
),
);
}
Widget _infoRow(IconData icon, String header, String content) => Row(
children: [
Icon(icon, color: const Color(0xFFB55FE6), size: 18),
const SizedBox(width: 14),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(header, style: const TextStyle(color: Colors.white38, fontSize: 11)),
Text(content, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500)),
],
)
],
);
}