import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<Offset> _subtitleSlideAnimation;
  late Animation<Offset> _imagesSlideAnimation;
  late Animation<Offset> _buttonsSlideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    // Create curved animations for different elements
    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    // Staggered slide animations
    _titleSlideAnimation = Tween<Offset>(
      begin: Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _subtitleSlideAnimation = Tween<Offset>(
      begin: Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.2, 0.7, curve: Curves.easeOut),
    ));

    _imagesSlideAnimation = Tween<Offset>(
      begin: Offset(-0.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.4, 0.8, curve: Curves.easeOut),
    ));

    _buttonsSlideAnimation = Tween<Offset>(
      begin: Offset(0.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.6, 1.0, curve: Curves.easeOut),
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: size.height * 0.04),
              // Animated Title
              SlideTransition(
                position: _titleSlideAnimation,
                child: FadeTransition(
                  opacity: _fadeInAnimation,
                  child: Center(
                    child: Text(
                      "Welcome to StackTrack",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF1E88E5),
                      ),
                    ),
                  ),
                ),
              ),

              // Animated Subtitle
              SlideTransition(
                position: _subtitleSlideAnimation,
                child: FadeTransition(
                  opacity: _fadeInAnimation,
                  child: Center(
                    child: Text(
                      "Time Management made minimal",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF42A5F5),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.08),

              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Animated Images Section
                    Expanded(
                      flex: 3,
                      child: SlideTransition(
                        position: _imagesSlideAnimation,
                        child: FadeTransition(
                          opacity: _fadeInAnimation,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Your existing image containers here
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      height: size.height * 0.25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF90CAF9), width: 2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Placeholder(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      height: size.height * 0.25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF90CAF9), width: 2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Placeholder(),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.all(8.0),
                                height: size.height * 0.25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFF90CAF9), width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Placeholder(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Animated Buttons Section
                    Expanded(
                      flex: 2,
                      child: SlideTransition(
                        position: _buttonsSlideAnimation,
                        child: FadeTransition(
                          opacity: _fadeInAnimation,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF1E88E5),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 20,
                                    ),
                                    minimumSize: Size(double.infinity, 60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 12),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Color(0xFF1E88E5),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 20,
                                    ),
                                    minimumSize: Size(double.infinity, 60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side:
                                          BorderSide(color: Color(0xFF1E88E5)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
