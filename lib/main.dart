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
    MoreScreen(onTabRequested: changeTab),
  ];



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF0F101A),

      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: const Color(0xFF141522),

        type: BottomNavigationBarType.fixed,

        selectedItemColor: const Color(0xFFB55FE6),

        unselectedItemColor: Colors.grey,

        selectedFontSize: 9,

        unselectedFontSize: 9,

        currentIndex: _currentIndex,

        onTap: changeTab,

        items: const [

          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: 'Packages'),

          BottomNavigationBarItem(icon: Icon(Icons.vrpano), label: 'Individual Experiences'),

          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Fees'),

          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),

        ],

      ),

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

        color: const Color(0xFF1B1D2A), 

        borderRadius: BorderRadius.circular(12),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start, 

        children: [

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween, 

            children: [

              Text(t, style: const TextStyle(color: Color(0xFFB55FE6), fontWeight: FontWeight.bold)), 

              const Icon(Icons.arrow_forward_ios, color: Colors.white30, size: 12)

            ],

          ),

          const SizedBox(height: 4), 

          Text(d, style: const TextStyle(color: Colors.white70, fontSize: 12)),

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

                  const Text('NEXT LEVEL GAMING', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),

                ],

              ),

            ),

            Container(

              width: double.infinity, 

              margin: const EdgeInsets.symmetric(horizontal: 16),

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xFF1B1D2A)),

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

                      errorBuilder: (c,e,s) => Container(width: double.infinity, height: 150, color: Colors.deepPurple),

                    ),

                  ),

                  const Padding(

                    padding: EdgeInsets.all(16), 

                    child: Text('NEXT LEVEL GAMING &\nESPORTS ARENA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),

                  ),

                ],

              ),

            ),

            const SizedBox(height: 16),

            _card('GAMING PACKAGES', 'Choose a package for a full experience', 1),

            _card('INDIVIDUAL EXPERIENCES', 'Try VR, Racing simulators and challenges', 2),

            _card('CALCULATE TOTAL FEES', 'Select services and prepare a fee estimate', 3),

            _card('ABOUT US & MORE', 'Read our mission statement and community details', 4),

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

        color: const Color(0xFF1B1D2A), 

        borderRadius: BorderRadius.circular(16), 

        border: Border.all(color: Colors.white.withAlpha(8)),

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

                    Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),

                    const SizedBox(height: 4), 

                    Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),

                  ],

                ),

              ),

              IconButton(

                icon: const Icon(Icons.arrow_forward, color: Colors.white70, size: 16),

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

                pkgItem(

                  'ULTIMATE GAMER PASS', 

                  'The ultimate gaming experience', 

                  'R1,500',

                  ['PC gaming', 'Console gaming', 'High-speed Internet', 'Snack voucher', 'Tournament entry'],

                  'Enjoy unlimited access to our gaming stations for a full day. Perfect for serious gamers and those who want the full Next Level experience.'

                ),

                pkgItem(

                  'VIP GAMING EXPERIENCE', 

                  'The ultimate premium experience', 

                  'R1,500',

                  ['Premium gaming equipment', 'Food and drinks', 'Priority booking', 'Personal gaming assistant'],

                  'Enjoy a high-end gaming experience with exclusive facilities, perfect for those who want the best.'

                ),

                pkgItem(

                  'ESPORTS TRAINING PACKAGE', 

                  'Level up your skills', 

                  'R1,500',

                  ['Strategy coaching', 'Team communication', 'Match analysis', 'Practice sessions', 'Performance feedback'],

                  'Improve your competitive gaming skills with professional coaching and guidance from experienced coaches.'

                ),

                pkgItem(

                  'BIRTHDAY PARTY PACKAGE', 

                  'The ultimate premium experience', 

                  'R1,500',

                  ['Reserved gaming area', 'Multiplayer competitions', 'Party decorations', 'Catering', 'Tournament prizes'],

'Enjoy a fun filled birthday party with friends, food and competitions.'

),

],

),

),

],

),

);

}

}

// ==========================================

// PACKAGES DETAIL WINDOW SCREEN

// ==========================================

class PackageDetailScreen extends StatelessWidget {

final String title;

final String subtitle;

final String description;

final List includes;

final String price;

const PackageDetailScreen({

super.key,

required this.title,

required this.subtitle,

required this.description,

required this.includes,

required this.price,

});

@override

Widget build(BuildContext context) {

return Scaffold(

backgroundColor: const Color(0xFF0F101A),

appBar: AppBar(

backgroundColor: Colors.transparent,

elevation: 0,

leading: IconButton(

icon: const Icon(Icons.arrow_back, color: Colors.white),

onPressed: () => Navigator.pop(context),

),

),

body: SafeArea(

child: Padding(

padding: const EdgeInsets.symmetric(horizontal: 24.0),

child: Column(

crossAxisAlignment: CrossAxisAlignment.center,

children: [

const SizedBox(height: 10),

Text(

title,

textAlign: TextAlign.center,

style: const TextStyle(color: Color(0xFFB55FE6), fontWeight: FontWeight.bold, fontSize: 24),

),

const SizedBox(height: 6),

Text(

subtitle,

textAlign: TextAlign.center,

style: const TextStyle(color: Colors.white70, fontSize: 12),

),

const SizedBox(height: 30),

Expanded(

child: Container(

width: double.infinity,

padding: const EdgeInsets.all(24),

decoration: BoxDecoration(

color: const Color(0xFF1B1D2A),

borderRadius: BorderRadius.circular(20),

),

child: SingleChildScrollView(

child: Column(

crossAxisAlignment: CrossAxisAlignment.start,

children: [

Text(

description,

style: const TextStyle(color: Color(0xFFEEEEEE), fontSize: 14, height: 1.5),

),

const SizedBox(height: 35),

const Text(

'INCLUDES :',

style: TextStyle(color: Color(0xFFE65F8E), fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.1),

),

const SizedBox(height: 14),

...includes.map((feature) => Padding(

padding: const EdgeInsets.only(bottom: 8.0),

child: Text(

feature,

style: const TextStyle(color: Colors.white70, fontSize: 13),

),

)),

const SizedBox(height: 30),

Align(

alignment: Alignment.bottomRight,

child: Text(

price,

style: const TextStyle(color: Color(0xFF8E6CEF), fontWeight: FontWeight.bold, fontSize: 26),

),

),

],

),

),

),

),

const SizedBox(height: 20),

TextButton(

onPressed: () => Navigator.pop(context),

child: Row(

mainAxisSize: MainAxisSize.min,

children: const [

Text('View Other Packages', style: TextStyle(color: Colors.white, fontSize: 13)),

SizedBox(width: 6),

Icon(Icons.arrow_forward, color: Colors.white, size: 14),

],

),

),

const SizedBox(height: 10),

Container(

width: double.infinity,

height: 54,

decoration: BoxDecoration(

borderRadius: BorderRadius.circular(27),

gradient: const LinearGradient(

colors: [Color(0xFFE65F8E), Color(0xFFB55FE6)],

begin: Alignment.centerLeft,

end: Alignment.centerRight,

),

),

child: ElevatedButton(

style: ElevatedButton.styleFrom(

backgroundColor: Colors.transparent,

shadowColor: Colors.transparent,

shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),

),

onPressed: () {},

child: const Text(

'Book Now',

style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),

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
    Widget experienceCard(
      String title,
      String subtitle,
      String price,
      List<String> includes,
      String longDesc,
      String assetPath,
    ) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1B1D2A),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                assetPath,
                width: 82,
                height: 82,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 82,
                  height: 82,
                  color: const Color(0xFF0F101A),
                  child: const Icon(Icons.sports_esports,
                      color: Color(0xFFB55FE6), size: 32),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(
                    color: Color(0xFFB55FE6),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
                  const SizedBox(height: 5),
                  Text(subtitle, maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70,
                        fontSize: 10, height: 1.3)),
                  const SizedBox(height: 7),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ExperienceDetailScreen(
                          title: title,
                          description: longDesc,
                          includes: includes,
                          price: price,
                          onTabRequested: onTabRequested,
                        )),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF292C40),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Row(mainAxisSize: MainAxisSize.min, children: [
                        Text('Learn More', style: TextStyle(fontSize: 10)),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward, size: 12),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0F101A),
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 18),
          const Text('INDIVIDUAL EXPERIENCES', textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,
                color: Color(0xFFB55FE6))),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Choose the perfect packages for your gaming adventure',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 10)),
          ),
          const SizedBox(height: 24),
          Expanded(child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              experienceCard('Virtual Reality Experience',
                'Step into new worlds with our VR setup', 'R750',
                ['VR headsets', 'Choice of games', 'Staff assistance'],
                'Experience the latest virtual reality games and immerse yourself in incredible worlds. Our VR stations offer a wide range of games for all skill levels.',
                'assets/vr_preview.png'),
              experienceCard('Racing Simulator Challenge',
                'Feel the experience of real racing', 'R750',
                ['Racing simulator', 'Choice of tracks', 'Leader board competition', 'Team challenge'],
                'Race on professional driving simulators and take on friends or climb the leader board.',
                'assets/racing_preview.png'),
              experienceCard('Escape Room Challenge',
                'Work together to solve the mystery', 'R750',
                ['Themed escape room', 'Digital scorecard', 'Team challenges'],
                'Work with your team to solve puzzles and escape before time runs out. A thrilling experience for all.',
                'assets/escape_preview.png'),
            ],
          )),
        ]),
      ),
    );
  }
}

// ==========================================
// EXPERIENCES DETAILED WINDOW VIEW
// ==========================================
class ExperienceDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final List includes;
  final String price;
  final Function(int) onTabRequested;

  const ExperienceDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.includes,
    required this.price,
    required this.onTabRequested,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F101A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 4),
            Text(title, textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFFB55FE6),
                  fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 6),
            const Text('Step into a new reality',
              style: TextStyle(color: Colors.white70, fontSize: 11)),
            const SizedBox(height: 20),
            Expanded(child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2D43),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(child: SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(description, style: const TextStyle(
                        color: Color(0xFFEEEEEE), fontSize: 12, height: 1.4)),
                    const SizedBox(height: 28),
                    const Text('INCLUDES :', style: TextStyle(
                        color: Color(0xFFE65F8E), fontWeight: FontWeight.bold,
                        fontSize: 11, letterSpacing: 1.0)),
                    const SizedBox(height: 12),
                    ...includes.map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Text(feature.toString(), style: const TextStyle(
                          color: Colors.white70, fontSize: 12)),
                    )),
                  ],
                ))),
                Align(alignment: Alignment.bottomRight,
                  child: Text(price, style: const TextStyle(
                    color: Color(0xFFE65F8E), fontWeight: FontWeight.bold, fontSize: 20))),
              ]),
            )),
            const SizedBox(height: 14),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF292C40)),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Text('View Other Packages', style: TextStyle(fontSize: 11)),
                SizedBox(width: 7),
                Icon(Icons.arrow_forward, size: 13),
              ]),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xFFB55FE6), Color(0xFFE65F8E)],
                  begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Booking form coming soon.')),
                  );
                },
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Book Now', style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold, fontSize: 12)),
                  SizedBox(width: 12),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 14),
                ]),
              ),
            ),
            const SizedBox(height: 14),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF141522),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFB55FE6),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        currentIndex: 2,
        onTap: (index) {
          Navigator.popUntil(context, (route) => route.isFirst);
          onTabRequested(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: 'Packages'),
          BottomNavigationBarItem(icon: Icon(Icons.vrpano), label: 'Individual Experiences'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Fees'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
        ],
      ),
    );
  }
}

// ==========================================

// 4. ABOUT US SCREEN

// ==========================================

class AboutUsScreen extends StatelessWidget {

final bool embedded;
const AboutUsScreen({super.key, this.embedded = false});

Widget _infoCard(String title, String description) => Container(

width: double.infinity,

margin: const EdgeInsets.only(bottom: 20),

padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),

decoration: BoxDecoration(

color: const Color(0xFF191B2C),

borderRadius: BorderRadius.circular(16),

),

child: Column(

children: [

Text(

title,

style: const TextStyle(color: Color(0xFF8E6CEF), fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 1.2),

),

const SizedBox(height: 12),

Text(

description,

textAlign: TextAlign.center,

style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),

),

],

),

);

@override

Widget build(BuildContext context) {

return Scaffold(

backgroundColor: const Color(0xFF0F101A),

body: SafeArea(

child: SingleChildScrollView(

padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),

child: Column(

crossAxisAlignment: CrossAxisAlignment.start,

children: [

const Text(

'ABOUT US',

style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF8E6CEF), letterSpacing: 0.5),

),

const SizedBox(height: 20),

const Text(

'Next Level Gaming & Esports Arena was established in 2023 by Jason Naidoo, with a simple goal - to create a safe, modern and exciting experience, where everyone can play, compete, space where gamers and communities can come together.',

style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 13, height: 1.4),

),

const SizedBox(height: 20),

Stack(

children: [

const Padding(

padding: EdgeInsets.only(bottom: 10),

child: Text(

'What started as a vision has grown into a fully equipped arena offering gaming, esports tournaments, birthday parties, Esports tournaments school outings and corporate team-building experiences.',

style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 13, height: 1.4),

),

),

Positioned(

bottom: 0,

right: 0,

child: Opacity(

opacity: 0.25,

child: Image.asset(

'assets/arena_preview.png',

width: 140,

height: 90,

fit: BoxFit.cover,

errorBuilder: (c, e, s) => const SizedBox.shrink(),

),

),

),

],

),

const SizedBox(height: 35),

_infoCard('MISSION', 'Our mission is to provide fun, accessible and high-quality gaming experiences for individuals, groups, schools and businesses.'),

_infoCard('VISION', 'Our vision is to become a leading gaming and esports destination where people can connect, compete and experience the next level of gaming'),

_infoCard('GOALS', 'Our goals are to provide modern gaming technologies, bring gamers and communities together and to create memorable gaming experiences'),

],

),

),

),

);

}

}


// ==========================================
// MORE MENU: ABOUT US AND CONTACT US
// ==========================================
class MoreScreen extends StatefulWidget {
  final Function(int) onTabRequested;
  const MoreScreen({super.key, required this.onTabRequested});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  String? _page;

  @override
  Widget build(BuildContext context) {
    if (_page == 'About Us') {
      return _MoreSubpageShell(title: 'ABOUT US', onBack: () => setState(() => _page = null),
        child: const AboutUsScreen(embedded: true));
    }
    if (_page == 'Contact Us') {
      return _MoreSubpageShell(title: 'CONTACT US', onBack: () => setState(() => _page = null),
        child: const ContactUsContent());
    }
    final options = [
      ('About Us', 'Learn about Next Level Gaming & Esports Arena', Icons.info_outline),
      ('Contact Us', 'Get in touch with our team', Icons.mail_outline),
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 12),
          const Text('MORE', style: TextStyle(color: Color(0xFFB55FE6), fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Explore more from Next Level Gaming', style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 24),
          ...options.map((item) => Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(color: const Color(0xFF1B1D2A), borderRadius: BorderRadius.circular(14)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Icon(item.$3, color: const Color(0xFFB55FE6), size: 28),
              title: Text(item.$1, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Padding(padding: const EdgeInsets.only(top: 5), child: Text(item.$2, style: const TextStyle(color: Colors.white60, fontSize: 12))),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 15),
              onTap: () => setState(() => _page = item.$1),
            ),
          )),
        ]),
      ),
    );
  }
}

class _MoreSubpageShell extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final Widget child;
  const _MoreSubpageShell({required this.title, required this.onBack, required this.child});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Column(children: [
      Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 0), child: Row(children: [
        IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back, color: Colors.white)),
        Expanded(child: Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFB55FE6), fontSize: 20, fontWeight: FontWeight.bold))),
        const SizedBox(width: 48),
      ])),
      Expanded(child: child),
    ]),
  );
}

class ContactUsContent extends StatefulWidget {
  const ContactUsContent({super.key});
  @override
  State<ContactUsContent> createState() => _ContactUsContentState();
}

class _ContactUsContentState extends State<ContactUsContent> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose(); _email.dispose(); _phone.dispose(); _message.dispose();
    super.dispose();
  }

  Widget _field(String label, String hint, TextEditingController controller, {int lines = 1, TextInputType? type}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
      const SizedBox(height: 7),
      TextField(controller: controller, maxLines: lines, keyboardType: type,
        style: const TextStyle(color: Colors.white, fontSize: 12),
        decoration: InputDecoration(hintText: hint, hintStyle: const TextStyle(color: Colors.white38, fontSize: 11), prefixIcon: lines == 1 ? const Icon(Icons.person_outline, size: 17, color: Colors.white54) : null,
          filled: true, fillColor: const Color(0xFF141522), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF292C40))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFB55FE6)))),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Center(child: Text('Enter your details and receive your personalized quote', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 11))),
      const SizedBox(height: 26),
      const Text('Personal Details', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: _field('Full name', 'e.g. Bruno', _name)), const SizedBox(width: 12),
        Expanded(child: _field('Email address', 'Bruno08@gmail.com', _email, type: TextInputType.emailAddress)),
      ]),
      const SizedBox(height: 16),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: _field('Phone number', 'e.g. 123456789', _phone, type: TextInputType.phone)), const SizedBox(width: 12),
        Expanded(child: _field('Message', 'Type your message', _message, lines: 2)),
      ]),
      const SizedBox(height: 28),
      Container(width: double.infinity, padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: const Color(0xFF2A2D43), borderRadius: BorderRadius.circular(4)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _ContactLine(icon: Icons.phone, title: 'Phone', value: '123456789'),
          SizedBox(height: 12), _ContactLine(icon: Icons.mail_outline, title: 'Email', value: 'info@nextlevelgaming.co.za'),
          SizedBox(height: 12), _ContactLine(icon: Icons.location_on_outlined, title: 'Location', value: 'Johannesburg, 2000'),
        ])),
      const SizedBox(height: 18),
      SizedBox(width: double.infinity, child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB55FE6), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Contact form ready. Connect an email service to send messages.'))),
        child: const Text('Send Message'),
      )),
    ]),
  );
}

class _ContactLine extends StatelessWidget {
  final IconData icon; final String title; final String value;
  const _ContactLine({required this.icon, required this.title, required this.value});
  @override
  Widget build(BuildContext context) => Row(children: [
    Container(width: 30, height: 30, decoration: BoxDecoration(color: const Color(0xFFB55FE6).withAlpha(70), borderRadius: BorderRadius.circular(3)), child: Icon(icon, color: Colors.white, size: 17)),
    const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: Colors.white70, fontSize: 11)), Text(value, style: const TextStyle(color: Colors.white54, fontSize: 11))])),
  ]);
}

class GetQuoteContent extends StatefulWidget {
  const GetQuoteContent({super.key});
  @override
  State<GetQuoteContent> createState() => _GetQuoteContentState();
}

class _GetQuoteContentState extends State<GetQuoteContent> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  String? _bookingType;
  bool _showGaming = false;
  bool _showIndividual = false;
  final Map<String, double> _prices = {
    'ULTIMATE GAMER PASS': 1500,
    'VIP GAMING EXPERIENCE': 1500,
    'ESPORTS TRAINING PACKAGE': 1500,
    'BIRTHDAY PARTY PACKAGE': 1500,
    'Virtual Reality Experience': 750,
    'Racing Simulator Challenge': 750,
    'Escape Room Challenge': 750,
  };
  final Set<String> _selectedPackages = {};
  bool _quoteRequested = false;

  double get _subtotal => _selectedPackages.fold<double>(
    0, (total, package) => total + (_prices[package] ?? 0));
  double get _vat => _subtotal * 0.15;
  double get _total => _subtotal + _vat;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    super.dispose();
  }

  Widget _field(String label, String hint, TextEditingController controller,
      {TextInputType? type}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
      const SizedBox(height: 6),
      TextField(
        controller: controller,
        keyboardType: type,
        style: const TextStyle(color: Colors.white, fontSize: 11),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38, fontSize: 10),
          prefixIcon: Icon(type == TextInputType.phone ? Icons.phone_outlined :
              type == TextInputType.emailAddress ? Icons.mail_outline : Icons.person_outline,
              color: Colors.white54, size: 16),
          filled: true,
          fillColor: const Color(0xFF141522),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF292C40))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFB55FE6))),
        ),
      ),
    ],
  );

  Widget _categoryTile(String title, bool expanded, VoidCallback onTap) =>
    InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        decoration: BoxDecoration(
          color: expanded ? const Color(0xFF342044) : const Color(0xFF141522),
          border: Border.all(color: expanded ? const Color(0xFFB55FE6) : const Color(0xFF292C40)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(children: [
          Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
          Icon(expanded ? Icons.expand_less : Icons.arrow_forward, color: Colors.white, size: 17),
        ]),
      ),
    );

  Widget _packageOption(String title, String description) => Container(
    margin: const EdgeInsets.only(top: 8),
    decoration: BoxDecoration(color: const Color(0xFF1B1D2A), borderRadius: BorderRadius.circular(10)),
    child: CheckboxListTile(
      value: _selectedPackages.contains(title),
      onChanged: (selected) => setState(() {
        if (selected == true) { _selectedPackages.add(title); }
        else { _selectedPackages.remove(title); }
      }),
      activeColor: const Color(0xFFB55FE6),
      checkColor: Colors.white,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
      subtitle: Text(description, style: const TextStyle(color: Colors.white60, fontSize: 10)),
      secondary: Text('R${_prices[title]!.toStringAsFixed(0)}', style: const TextStyle(color: Color(0xFFE65F8E), fontSize: 11, fontWeight: FontWeight.bold)),
    ),
  );

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Center(child: Text('GET A QUOTE', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 22, fontWeight: FontWeight.bold))),
      const SizedBox(height: 8),
      const Center(child: Text('Enter your details and receive your personalized quote', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 11))),
      const SizedBox(height: 24),
      const Text('Personal Details', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 14),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: _field('Full name', 'e.g. Bruno', _name)),
        const SizedBox(width: 12),
        Expanded(child: _field('Phone number', 'e.g. 123456789', _phone, type: TextInputType.phone)),
      ]),
      const SizedBox(height: 14),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: _field('Email address', 'you@example.com', _email, type: TextInputType.emailAddress)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Booking type', style: TextStyle(color: Colors.white, fontSize: 11)),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: _bookingType,
            dropdownColor: const Color(0xFF1B1D2A),
            style: const TextStyle(color: Colors.white, fontSize: 11),
            decoration: InputDecoration(hintText: 'Select booking type', hintStyle: const TextStyle(color: Colors.white38, fontSize: 10), filled: true, fillColor: const Color(0xFF141522), contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF292C40)))),
            items: const [DropdownMenuItem(value: 'Individual', child: Text('Individual')), DropdownMenuItem(value: 'Group', child: Text('Group')), DropdownMenuItem(value: 'School', child: Text('School')), DropdownMenuItem(value: 'Corporate', child: Text('Corporate'))],
            onChanged: (value) => setState(() => _bookingType = value),
          ),
        ])),
      ]),
      const SizedBox(height: 26),
      const Text('Select packages', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      const Text('Open a category and tick each package you want to include.', style: TextStyle(color: Colors.white60, fontSize: 11)),
      const SizedBox(height: 12),
      _categoryTile('Gaming Packages', _showGaming, () => setState(() => _showGaming = !_showGaming)),
      if (_showGaming) ...[
        _packageOption('ULTIMATE GAMER PASS', 'The ultimate gaming experience'),
        _packageOption('VIP GAMING EXPERIENCE', 'Premium equipment, food and priority booking'),
        _packageOption('ESPORTS TRAINING PACKAGE', 'Coaching, match analysis and practice sessions'),
        _packageOption('BIRTHDAY PARTY PACKAGE', 'Reserved gaming area, catering and competitions'),
      ],
      const SizedBox(height: 10),
      _categoryTile('Individual Packages', _showIndividual, () => setState(() => _showIndividual = !_showIndividual)),
      if (_showIndividual) ...[
        _packageOption('Virtual Reality Experience', 'VR headsets, choice of games and staff assistance'),
        _packageOption('Racing Simulator Challenge', 'Racing simulator, tracks and team challenges'),
        _packageOption('Escape Room Challenge', 'Themed escape room, digital scorecard and team challenges'),
      ],
      const SizedBox(height: 24),
      SizedBox(width: double.infinity, child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB55FE6), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 13)),
        onPressed: () {
          if (_selectedPackages.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select at least one package.')));
            return;
          }
          setState(() => _quoteRequested = true);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Quote prepared for ${_selectedPackages.length} package(s): R${_total.toStringAsFixed(2)}.')));
        },
        child: const Text('Request Quote'),
      )),
      if (_quoteRequested) ...[
        const SizedBox(height: 24),
        const Text('Total Quote', style: TextStyle(color: Color(0xFF8E6CEF), fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(width: double.infinity, padding: const EdgeInsets.all(12), color: const Color(0xFF2A2D43), child: Column(children: [
          _QuoteRow('Number of selected packages', '${_selectedPackages.length}'),
          _QuoteRow('Subtotal:', 'R${_subtotal.toStringAsFixed(2)}'),
          _QuoteRow('Discount:', 'R0.00'),
          _QuoteRow('VAT (15%):', 'R${_vat.toStringAsFixed(2)}'),
          _QuoteRow('Total Quoted Fee', 'R${_total.toStringAsFixed(2)}', highlight: true),
        ])),
      ],
    ]),
  );
}

class _QuoteRow extends StatelessWidget {
  final String label; final String value; final bool highlight;
  const _QuoteRow(this.label, this.value, {this.highlight = false});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.symmetric(vertical: 7), child: Row(children: [Expanded(child: Text(label, style: TextStyle(color: highlight ? const Color(0xFFB55FE6) : Colors.white, fontSize: 11, fontWeight: highlight ? FontWeight.bold : FontWeight.w500))), Text(value, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))]));
}
