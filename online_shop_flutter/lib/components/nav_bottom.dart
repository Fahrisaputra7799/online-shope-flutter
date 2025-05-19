import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_flutter/screens/cart_screen.dart';
import 'package:online_shop_flutter/screens/home_screen.dart';

class NavBottom extends StatelessWidget {
  const NavBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 430),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _SocialIcon(
              icon: FontAwesomeIcons.house,
              tooltip: "Home",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const HomeScreen(),
                    transitionDuration: Duration.zero, // Tanpa animasi
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            ),
            _SocialIcon(
              icon: FontAwesomeIcons.cartShopping,
              tooltip: "Blog",
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  ),
            ),
            _SocialIcon(
              icon: FontAwesomeIcons.heartCircleCheck,
              tooltip: "GitHub",
              onPressed: () {},
            ),
            _SocialIcon(
              icon: FontAwesomeIcons.chartSimple,
              tooltip: "linkedin",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _SocialIcon({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  double _scale = 1.0;
  bool _isHovered = false;

  void _onTapDown(TapDownDetails _) {
    setState(() => _scale = 0.9);
  }

  void _onTapUp(TapUpDetails _) {
    setState(() => _scale = _isHovered ? 1.05 : 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = _isHovered ? 1.05 : 1.0);
  }

  void _onHoverEnter(PointerEnterEvent event) {
    setState(() {
      _isHovered = true;
      _scale = 1.05;
    });
  }

  void _onHoverExit(PointerExitEvent event) {
    setState(() {
      _isHovered = false;
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onHoverEnter,
      onExit: _onHoverExit,
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: _scale),
        duration: const Duration(milliseconds: 150),
        builder: (context, scale, child) {
          return Transform.scale(scale: scale, child: child);
        },
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: widget.onPressed,
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.icon,
              size: 24,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }
}
