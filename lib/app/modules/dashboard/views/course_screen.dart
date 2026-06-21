import 'package:flutter/material.dart';

// Course Model
class CourseModule {
  final String title;
  final String duration;
  final double progress;
  final IconData icon;
  final Color accentColor;

  CourseModule({
    required this.title,
    required this.duration,
    required this.progress,
    required this.icon,
    required this.accentColor,
  });
}

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final List<CourseModule> modules = [
    CourseModule(
      title: 'Introduction to UI/UX Design',
      duration: '45 mins',
      progress: 1.0,
      icon: Icons.palette_outlined,
      accentColor: const Color(0xFF6C63FF),
    ),
    CourseModule(
      title: 'User Research & Personas',
      duration: '1 hr 15 mins',
      progress: 0.7,
      icon: Icons.people_alt_outlined,
      accentColor: const Color(0xFFFF6584),
    ),
    CourseModule(
      title: 'Wireframing & Prototyping',
      duration: '2 hrs 30 mins',
      progress: 0.0,
      icon: Icons.layers_outlined,
      accentColor: const Color(0xFF4CAF50),
    ),
    CourseModule(
      title: 'Visual Design Systems',
      duration: '1 hr 45 mins',
      progress: 0.0,
      icon: Icons.text_fields_outlined,
      accentColor: const Color(0xFFFFB300),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF202124),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Color(0xFF202124)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Design Library',
                style: TextStyle(
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Mastering Product Design',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202124),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Instructor: Alex Morgan • 12 Lessons',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 24),

            // Progress Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF202124),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Course Progress',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),

                  const SizedBox(height: 6),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '42% Completed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '2/12 Items',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      value: 0.42,
                      minHeight: 8,
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF6C63FF),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Course Modules',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202124),
              ),
            ),

            const SizedBox(height: 16),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: modules.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                return ModuleCard(module: modules[index], index: index + 1);
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class ModuleCard extends StatelessWidget {
  final CourseModule module;
  final int index;

  const ModuleCard({super.key, required this.module, required this.index});

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = module.progress >= 1.0;
    final bool isNotStarted = module.progress == 0.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: module.accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(module.icon, color: module.accentColor, size: 24),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Module $index',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade500,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  module.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202124),
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      module.duration,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          if (isCompleted)
            const CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xFFE8F5E9),
              child: Icon(Icons.check, color: Colors.green, size: 16),
            )
          else if (isNotStarted)
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.grey.shade100,
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.grey,
                size: 18,
              ),
            )
          else
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                value: module.progress,
                strokeWidth: 3,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(module.accentColor),
              ),
            ),
        ],
      ),
    );
  }
}
