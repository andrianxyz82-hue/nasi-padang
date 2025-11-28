import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/app_theme.dart';
import 'create_course_screen.dart';
import 'manage_courses_screen.dart';
import '../../core/widgets/neon_background_painter.dart';

class TeacherCoursesScreen extends StatefulWidget {
  const TeacherCoursesScreen({super.key});

  @override
  State<TeacherCoursesScreen> createState() => _TeacherCoursesScreenState();
}

class _TeacherCoursesScreenState extends State<TeacherCoursesScreen> {
  final List<NeonDot> _neonDots = [];

  @override
  void initState() {
    super.initState();
    _generateNeonDots();
  }

  void _generateNeonDots() {
    final random = math.Random();
    for (int i = 0; i < 15; i++) {
      _neonDots.add(NeonDot(
        x: random.nextDouble(),
        y: random.nextDouble() * 0.5, // Top half
        radius: random.nextDouble() * 4 + 1,
        color: i % 2 == 0 ? const Color(0xFFB042FF) : const Color(0xFF42E0FF),
        opacity: random.nextDouble() * 0.5,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: const Color(0xFF1d1d2b),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: NeonBackgroundPainter(dots: _neonDots),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(
                      'Courses',
                      style: TextStyle(color: isDark ? Colors.white : AppTheme.textDark),
                    ),
                  ),
                  // Create Course Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateCourseScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Create New Course'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7C7CFF),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 12),

                  // Manage Courses Button
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ManageCoursesScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.book),
                    label: const Text('Manage Courses'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF7C7CFF),
                      side: const BorderSide(color: Color(0xFF7C7CFF)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Info Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D2D44),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF7C7CFF).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.info_outline,
                                color: Color(0xFF7C7CFF),
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Course Management',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? Colors.white : AppTheme.textDark,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '• Create new courses for your students\n'
                          '• Manage existing courses (edit, delete)\n'
                          '• Add lessons and materials to courses\n'
                          '• Track student enrollments',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Colors.grey[300] : Colors.grey[700],
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
