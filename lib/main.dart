
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainTabsController(),
    debugShowCheckedModeBanner: false,
  ));
}

// ==========================================
// MAIN NAVIGATION CONTROLLER
// ==========================================

class MainTabsController extends StatefulWidget {
  const MainTabsController({super.key});

  @override
  State<MainTabsController> createState() => _MainTabsControllerState();
}

class _MainTabsControllerState extends State<MainTabsController> {
  int _currentIndex = 0;

  String? _selectedBooking;

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Opens the Fees page and automatically selects the chosen package.
  void openBooking(String booking) {
    setState(() {
      _selectedBooking = booking;
      _currentIndex = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(onTabRequested: changeTab),
      PackagesScreen(onBookNow: openBooking),
      ExperiencesScreen(onBookNow: openBooking),
      GetQuoteContent(
        key: ValueKey(_selectedBooking),
        initialItem: _selectedBooking,
      ),
      const MoreScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomBottomNav(
        currentIndex: _currentIndex,
        onTap: changeTab,
      ),
    );
  }
}

// ==========================================
// COLOURS
// ==========================================

const Color purple = Color(0xFFB55FE6);
const Color lightPurple = Color(0xFF8E6CEF);
const Color pink = Color(0xFFE65F8E);
const Color darkText = Color(0xFF11121A);
const Color lightBackground = Color(0xFFF3F4F6);

// ==========================================
// BOTTOM NAVIGATION
// ==========================================

class BottomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFF9FAFB),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: purple,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 9,
      unselectedFontSize: 9,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_esports),
          label: 'Packages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.vrpano),
          label: 'Individual Experiences',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: 'Fees',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'More',
        ),
      ],
    );
  }
}

// ==========================================
// REUSABLE BOOK NOW BUTTON
// ==========================================

Widget bookNowButton(VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    height: 46,
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.calendar_month, color: Colors.white),
      label: const Text(
        'BOOK NOW',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

// ==========================================
// 1. HOME SCREEN
// ==========================================

class HomeScreen extends StatelessWidget {
  final Function(int) onTabRequested;

  const HomeScreen({
    super.key,
    required this.onTabRequested,
  });

  Widget _card(String title, String description, int index) {
    return GestureDetector(
      onTap: () => onTabRequested(index),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: lightBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black26,
                  size: 12,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                color: darkText,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                    errorBuilder: (c, e, s) => const Icon(
                      Icons.sports_esports,
                      color: purple,
                      size: 48,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'NEXT LEVEL GAMING',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: lightBackground,
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: Image.asset(
                      'assets/hero_banner.png',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      errorBuilder: (c, e, s) => Container(
                        color: Colors.deepPurple.shade100,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'NEXT LEVEL GAMING &\nESPORTS ARENA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: darkText,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _card(
              'GAMING PACKAGES',
              'Choose a package for a full gaming or event experience',
              1,
            ),

            _card(
              'INDIVIDUAL EXPERIENCES',
              'Try VR, Racing Simulator and escape room challenges',
              2,
            ),

            _card(
              'CALCULATE TOTAL FEES',
              'Select the services you are interested in and prepare a fee estimate',
              3,
            ),

            _card(
              'CONTACT US',
              'Contact us with your questions and booking enquiries',
              4,
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// PACKAGE DATA
// ==========================================

final List<Map<String, dynamic>> gamingPackages = [
  {
    'title': 'ULTIMATE GAMER PASS',
    'subtitle': 'The ultimate gaming experience',
    'price': 'R1,500',
    'description':
        'Enjoy unlimited access to our gaming stations for a full day.',
    'includes': [
      'PC gaming',
      'Console gaming',
      'High-speed Internet',
    ],
    'bookingKey': 'ULTIMATE GAMER PASS (R1,500)',
  },
  {
    'title': 'VIP GAMING EXPERIENCE',
    'subtitle': 'Premium gaming with exclusive perks',
    'price': 'R1,500',
    'description':
        'Enjoy a high-end gaming experience with exclusive facilities.',
    'includes': [
      'Premium hardware',
      'Food options',
    ],
    'bookingKey': 'VIP GAMING EXPERIENCE (R1,500)',
  },
  {
    'title': 'ESPORTS TRAINING PACKAGE',
    'subtitle': 'Train like a pro, Compete like a champion',
    'price': 'R1,500',
    'description':
        'Improve your competitive gaming skills with professional coaching.',
    'includes': [
      'Strategy coaching',
      'Match analysis',
    ],
    'bookingKey': 'ESPORTS TRAINING PACKAGE (R1,500)',
  },
  {
    'title': 'BIRTHDAY PARTY PACKAGE',
    'subtitle': 'Celebrate your special day with epic gaming',
    'price': 'R1,500',
    'description':
        'Enjoy a fun filled birthday party with friends, food and competitions.',
    'includes': [
      'Reserved area',
      'Catering included',
    ],
    'bookingKey': 'BIRTHDAY PARTY PACKAGE (R1,500)',
  },
];

// ==========================================
// 2. GAMING PACKAGES SCREEN
// ==========================================

class PackagesScreen extends StatelessWidget {
  final Function(String) onBookNow;

  const PackagesScreen({
    super.key,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),

          const Text(
            'GAMING PACKAGES',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: purple,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Choose the perfect packages for your journey',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: gamingPackages.length,
              itemBuilder: (context, index) {
                final package = gamingPackages[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: lightBackground,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.black.withAlpha(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  package['title'],
                                  style: const TextStyle(
                                    color: darkText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  package['subtitle'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: darkText,
                              size: 18,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PackageDetailScreen(
                                    package: package,
                                    onBookNow: () {
                                      Navigator.pop(context);
                                      onBookNow(
                                        package['bookingKey'],
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Text(
                        package['price'],
                        style: const TextStyle(
                          color: pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      const SizedBox(height: 14),

                      bookNowButton(() {
                        onBookNow(package['bookingKey']);
                      }),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// PACKAGE DETAILS SCREEN
// ==========================================

class PackageDetailScreen extends StatelessWidget {
  final Map<String, dynamic> package;
  final VoidCallback onBookNow;

  const PackageDetailScreen({
    super.key,
    required this.package,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: darkText),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                package['title'],
                style: const TextStyle(
                  color: purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: lightBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        package['description'],
                        style: const TextStyle(
                          color: darkText,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'INCLUDES:',
                        style: TextStyle(
                          color: pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      ...(package['includes'] as List<String>).map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: purple,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                item,
                                style: const TextStyle(
                                  color: darkText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Spacer(),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          package['price'],
                          style: const TextStyle(
                            color: lightPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      bookNowButton(onBookNow),
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
// INDIVIDUAL EXPERIENCE DATA
// ==========================================

final List<Map<String, dynamic>> individualExperiences = [
  {
    'title': 'Virtual Reality Experience',
    'subtitle': 'Step into new worlds with our VR setup',
    'price': 'R750',
    'description': 'Experience the latest virtual reality games.',
    'includes': [
      'VR headsets',
      'Choice of games',
    ],
    'image': 'assets/vr_preview.png',
    'bookingKey': 'Virtual Reality Experience (R750)',
  },
  {
    'title': 'Racing Simulator Challenge',
    'subtitle': 'Feel the experience of real racing',
    'price': 'R750',
    'description':
        'Race on professional driving simulators.',
    'includes': [
      'Racing simulator',
      'Choice of tracks',
    ],
    'image': 'assets/racing_preview.png',
    'bookingKey': 'Racing Simulator Challenge (R750)',
  },
  {
    'title': 'Escape Room Challenge',
    'subtitle': 'Work together to solve the mystery',
    'price': 'R750',
    'description':
        'Work with your team to solve puzzles and escape before time runs out.',
    'includes': [
      'Themed escape room',
      'Digital scorecard',
    ],
    'image': 'assets/escape_preview.png',
    'bookingKey': 'Escape Room Challenge (R750)',
  },
];

// ==========================================
// 3. INDIVIDUAL EXPERIENCES SCREEN
// ==========================================

class ExperiencesScreen extends StatelessWidget {
  final Function(String) onBookNow;

  const ExperiencesScreen({
    super.key,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              'INDIVIDUAL EXPERIENCES',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: purple,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              'Choose the perfect packages for your gaming adventure',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: individualExperiences.length,
                itemBuilder: (context, index) {
                  final experience =
                      individualExperiences[index];

                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: lightBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xFFE5E7EB),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                experience['image'],
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) =>
                                    const Icon(
                                  Icons.vrpano,
                                  color: purple,
                                  size: 32,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    experience['title'],
                                    style: const TextStyle(
                                      color: lightPurple,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    experience['subtitle'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: darkText,
                                      fontSize: 11,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    experience['price'],
                                    style: const TextStyle(
                                      color: pink,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ExperienceDetailScreen(
                                              experience: experience,
                                              onBookNow: () {
                                                Navigator.pop(context);
                                                onBookNow(
                                                  experience[
                                                      'bookingKey'],
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Learn More →',
                                        style: TextStyle(
                                          color: darkText,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        bookNowButton(() {
                          onBookNow(experience['bookingKey']);
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// EXPERIENCE DETAILS SCREEN
// ==========================================

class ExperienceDetailScreen extends StatelessWidget {
  final Map<String, dynamic> experience;
  final VoidCallback onBookNow;

  const ExperienceDetailScreen({
    super.key,
    required this.experience,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: darkText),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                experience['title'],
                style: const TextStyle(
                  color: lightPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: lightBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience['description'],
                        style: const TextStyle(
                          color: darkText,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'INCLUDES:',
                        style: TextStyle(
                          color: pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      ...(experience['includes'] as List<String>).map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: purple,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                item,
                                style: const TextStyle(
                                  color: darkText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Spacer(),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          experience['price'],
                          style: const TextStyle(
                            color: pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      bookNowButton(onBookNow),
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
// 4. FEES CALCULATOR
// ==========================================

class GetQuoteContent extends StatefulWidget {
  final String? initialItem;

  const GetQuoteContent({
    super.key,
    this.initialItem,
  });

  @override
  State<GetQuoteContent> createState() =>
      _GetQuoteContentState();
}

class _GetQuoteContentState extends State<GetQuoteContent> {
  String selectedBookingType = 'Gaming Station';

  bool showQuoteResult = false;

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

  final Map<String, double> itemPrices = {
    'ULTIMATE GAMER PASS (R1,500)': 1500.00,
    'VIP GAMING EXPERIENCE (R1,500)': 1500.00,
    'ESPORTS TRAINING PACKAGE (R1,500)': 1500.00,
    'BIRTHDAY PARTY PACKAGE (R1,500)': 1500.00,
    'Virtual Reality Experience (R750)': 750.00,
    'Racing Simulator Challenge (R750)': 750.00,
    'Escape Room Challenge (R750)': 750.00,
  };

  int countSelected = 0;

  double subtotal = 0.00;
  double discount = 0.00;
  double vatAmount = 0.00;
  double totalQuoted = 0.00;

  @override
  void initState() {
    super.initState();

    // Automatically select the item the customer clicked.
    if (widget.initialItem != null) {
      if (selectedGamingItems.containsKey(widget.initialItem)) {
        selectedGamingItems[widget.initialItem!] = true;
      }

      if (selectedIndividualItems.containsKey(widget.initialItem)) {
        selectedIndividualItems[widget.initialItem!] = true;
      }
    }
  }

  // ==========================================
  // CALCULATE QUOTE
  // ==========================================

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

      // Discount for selecting two or more packages.
      discount = totalCount >= 2 ? 150.00 : 0.00;

      // Calculate 15% VAT.
      vatAmount = (subtotal - discount) * 0.15;

      // Calculate final amount.
      totalQuoted = (subtotal - discount) + vatAmount;

      showQuoteResult = true;
    });
  }

  // ==========================================
  // INPUT FIELD DESIGN
  // ==========================================

  Widget _mockInput(
    String label,
    String placeholder,
    IconData icon,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: lightPurple,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF141622),
              borderRadius: BorderRadius.circular(8),
            ),

            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white54,
                  size: 16,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    placeholder,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // CHECKBOXES
  // ==========================================

  Widget _buildCheckboxes(
    String blockHeader,
    Map<String, bool> itemSourceMap,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          blockHeader,
          style: const TextStyle(
            color: darkText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        ...itemSourceMap.keys.map((String itemName) {
          return CheckboxListTile(
            title: Text(
              itemName,
              style: const TextStyle(
                fontSize: 13,
                color: darkText,
              ),
            ),

            value: itemSourceMap[itemName],

            activeColor: lightPurple,

            contentPadding: EdgeInsets.zero,

            controlAffinity: ListTileControlAffinity.leading,

            onChanged: (bool? value) {
              setState(() {
                itemSourceMap[itemName] = value ?? false;

                // Hide the previous quote until recalculated.
                showQuoteResult = false;
              });
            },
          );
        }),

        const SizedBox(height: 14),
      ],
    );
  }

  // ==========================================
  // RECEIPT ROW
  // ==========================================

  Widget _receiptRow(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              left,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),

          Text(
            right,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // BOOKING CONFIRMATION
  // ==========================================

  void _bookNow() {
    if (countSelected == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a package before booking.'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          title: const Text(
            'Booking Enquiry',
            style: TextStyle(
              color: lightPurple,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Text(
            'Your booking enquiry is ready!\n\n'
            'Number of selected packages: $countSelected\n'
            'Total quoted fee: R${totalQuoted.toStringAsFixed(2)}\n\n'
            'Please contact our team to confirm availability and finalise your booking.',
            style: const TextStyle(
              color: darkText,
              fontSize: 14,
              height: 1.5,
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'CLOSE',
                style: TextStyle(
                  color: lightPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ==========================================
  // MAIN FEES PAGE
  // ==========================================

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
                child: Text(
                  'GET A QUOTE',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: lightPurple,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              const Center(
                child: Text(
                  'Select options below and trigger calculation to receive your quote',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Personal Details',
                style: TextStyle(
                  color: lightPurple,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  _mockInput(
                    'Full name',
                    'e.g. Bruno',
                    Icons.person_outline,
                  ),

                  const SizedBox(width: 14),

                  _mockInput(
                    'Phone number',
                    'e.g. 123456789',
                    Icons.phone_android_outlined,
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  _mockInput(
                    'Email address',
                    'Bruno08@gmail.com',
                    Icons.mail_outline,
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Booking type',
                          style: TextStyle(
                            color: lightPurple,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF141622),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: const Color(0xFF141622),

                              value: selectedBookingType,

                              isExpanded: true,

                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white54,
                              ),

                              items: [
                                'Gaming Station',
                                'Esports Team Tournament',
                                'Birthday Event',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }).toList(),

                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    selectedBookingType = value;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Select Products From Categories',
                style: TextStyle(
                  color: lightPurple,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              _buildCheckboxes(
                'Gaming Packages Options',
                selectedGamingItems,
              ),

              _buildCheckboxes(
                'Individual Packages Options',
                selectedIndividualItems,
              ),

              // CALCULATE QUOTE BUTTON

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  onPressed: _calculateFullQuote,

                  child: const Text(
                    'Calculate Full Quote →',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ==========================================
              // QUOTE RESULT
              // ==========================================

              if (showQuoteResult) ...[
                const Text(
                  'Total Quote Summary',
                  style: TextStyle(
                    color: lightPurple,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF141622),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Column(
                    children: [
                      _receiptRow(
                        'Number of selected packages',
                        '$countSelected',
                      ),

                      _receiptRow(
                        'Subtotal:',
                        'R${subtotal.toStringAsFixed(2)}',
                      ),

                      _receiptRow(
                        'Discount Applied:',
                        '-R${discount.toStringAsFixed(2)}',
                      ),

                      _receiptRow(
                        'VAT (15%)',
                        'R${vatAmount.toStringAsFixed(2)}',
                      ),

                      const Divider(
                        color: Colors.white24,
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              'Total Quoted Fee',
                              style: TextStyle(
                                color: purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          Text(
                            'R${totalQuoted.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // BOOK NOW BUTTON AFTER QUOTE

                bookNowButton(_bookNow),

                const SizedBox(height: 12),

                const Center(
                  child: Text(
                    'Ready to take your gaming experience to the next level?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 5. MORE SCREEN
// ==========================================

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MORE NAVIGATION',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: lightPurple,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Select an option to see details or talk with our team',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 30),

              ListTile(
                leading: const Icon(
                  Icons.info_outline,
                  color: purple,
                ),

                title: const Text(
                  'About Us',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: darkText,
                  ),
                ),

                subtitle: const Text(
                  'Read our mission statement and studio history',
                  style: TextStyle(fontSize: 12),
                ),

                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DedicatedAboutUs(),
                    ),
                  );
                },
              ),

              const Divider(color: Colors.black12),

              ListTile(
                leading: const Icon(
                  Icons.contact_mail,
                  color: purple,
                ),

                title: const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: darkText,
                  ),
                ),

                subtitle: const Text(
                  'Send booking enquiries or custom technical quotes',
                  style: TextStyle(fontSize: 12),
                ),

                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DedicatedContactUs(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// ABOUT US SCREEN
// ==========================================

class DedicatedAboutUs extends StatelessWidget {
  const DedicatedAboutUs({super.key});

  Widget _box(String heading, String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: lightBackground,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: [
          Text(
            heading,
            style: const TextStyle(
              color: lightPurple,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: darkText,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(color: darkText),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: darkText),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ABOUT US',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: lightPurple,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Next Level Gaming & Esports Arena was established in 2023 by Jason Naidoo...',
              style: TextStyle(
                color: darkText,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            _box(
              'MISSION',
              'Our mission is to provide fun, accessible and high-quality gaming experiences for individuals, groups, schools and businesses.',
            ),

            _box(
              'VISION',
              'Our vision is to become a leading gaming and esports destination where people can connect, compete and experience the next level of gaming.',
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// CONTACT US SCREEN
// ==========================================

class DedicatedContactUs extends StatelessWidget {
  const DedicatedContactUs({super.key});

  Widget mockField(
    String label,
    String placeholder,
    IconData icon, {
    bool isLarge = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: lightPurple,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Container(
            height: isLarge ? 90 : 48,
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: const Color(0xFF141622),
              borderRadius: BorderRadius.circular(8),
            ),

            child: Row(
              crossAxisAlignment: isLarge
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white54,
                  size: 16,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    placeholder,
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(
    IconData icon,
    String header,
    String content,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: purple,
          size: 18,
        ),

        const SizedBox(width: 14),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 11,
              ),
            ),

            Text(
              content,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: darkText),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'CONTACT US',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: lightPurple,
                ),
              ),
            ),

            const Center(
              child: Text(
                'Enter your details and receive your personalized quote',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Personal Details',
              style: TextStyle(
                color: lightPurple,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            mockField(
              'Full name',
              'e.g. Bruno',
              Icons.person_outline,
            ),

            mockField(
              'Email address',
              'Bruno08@gmail.com',
              Icons.mail_outline,
            ),

            mockField(
              'Phone number',
              'e.g. 123456789',
              Icons.phone_android_outlined,
            ),

            mockField(
              'Message',
              'Type your message',
              Icons.chat_bubble_outline,
              isLarge: true,
            ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF23253A),
                borderRadius: BorderRadius.circular(8),
              ),

              child: Column(
                children: [
                  _infoRow(
                    Icons.phone,
                    'Phone',
                    '123456789',
                  ),

                  const SizedBox(height: 12),

                  _infoRow(
                    Icons.email,
                    'Email',
                    'info@nextlevelgaming.co.za',
                  ),

                  const SizedBox(height: 12),

                  _infoRow(
                    Icons.location_on,
                    'Location',
                    'Johannesburg, 2000',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
