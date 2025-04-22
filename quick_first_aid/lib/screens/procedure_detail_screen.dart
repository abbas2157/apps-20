// procedure_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/first_aid_data_provider.dart';
import '../models/procedure.dart';

class ProcedureDetailScreen extends StatefulWidget {
  final String procedureId;

  const ProcedureDetailScreen({
    Key? key,
    required this.procedureId,
  }) : super(key: key);

  @override
  State<ProcedureDetailScreen> createState() => _ProcedureDetailScreenState();
}

class _ProcedureDetailScreenState extends State<ProcedureDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isBookmarked = false;
  // Track completed steps
  final Map<int, bool> completedSteps = {};

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
    final dataProvider = Provider.of<FirstAidDataProvider>(context);
    final procedure = dataProvider.getProcedureById(widget.procedureId);

    if (procedure == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Procedure Not Found')),
        body: const Center(child: Text('The requested procedure was not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(procedure.title),
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            ),
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isBookmarked
                        ? '${procedure.title} added to bookmarks'
                        : '${procedure.title} removed from bookmarks',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Steps'),
            Tab(text: "Do's & Don'ts"),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.7),
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Overview Tab
          _buildOverviewTab(context, procedure),

          // Steps Tab
          _buildStepsTab(context, procedure),

          // Do's & Don'ts Tab
          _buildDosAndDontsTab(context, procedure),
        ],
      ),
      bottomNavigationBar: procedure.urgencyLevel == 'critical'
          ? _buildEmergencyCallBar()
          : null,
    );
  }

  Widget _buildOverviewTab(BuildContext context, Procedure procedure) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Emergency Notice for Critical Procedures
          if (procedure.urgencyLevel == 'critical')
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.warning, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'CRITICAL SITUATION',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This is a life-threatening emergency. Call emergency services immediately.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.phone),
                    label: const Text('CALL EMERGENCY SERVICES'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Emergency call functionality
                      final Uri phoneUri = Uri(scheme: 'tel', path: '911');
                      launchUrl(phoneUri);
                    },
                  ),
                ],
              ),
            ),

          // Urgency Level Indicator
          Wrap(
            spacing: 16,
            children: [
              _buildUrgencyBadge(procedure.urgencyLevel),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Est. time:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      procedure.estimatedTime,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Overview Description
          Text(
            'Overview',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            procedure.overview,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          // When to Seek Help
          Text(
            'When to Seek Medical Help',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            procedure.seekHelp,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildStepsTab(BuildContext context, Procedure procedure) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: procedure.steps.length,
      itemBuilder: (context, index) {
        final step = procedure.steps[index];
        final isCompleted = completedSteps[index] ?? false;

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isCompleted ? Colors.green : Colors.transparent,
              width: isCompleted ? 2 : 0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Step number and heading
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${step.stepNumber}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        step.heading,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Step instructions
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Text(step.instruction),
                ),

                // Mark as completed option
                Padding(
                  padding: const EdgeInsets.only(left: 44.0, top: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        completedSteps[index] = !(completedSteps[index] ?? false);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          isCompleted
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: isCompleted ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isCompleted ? 'Completed' : 'Mark as completed',
                          style: TextStyle(
                            color: isCompleted ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDosAndDontsTab(BuildContext context, Procedure procedure) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Do's Section
          Expanded(
            child: Card(
              color: Colors.green.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.green[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green[700]),
                        const SizedBox(width: 10),
                        Text(
                          "DO's",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // List of Do's
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: procedure.dos.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green[700],
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(procedure.dos[index]),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Don'ts Section
          Expanded(
            child: Card(
              color: Colors.red.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.red[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.cancel, color: Colors.red[700]),
                        const SizedBox(width: 10),
                        Text(
                          "DON'Ts",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.red[700],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // List of Don'ts
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: procedure.donts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.close,
                                color: Colors.red[700],
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(procedure.donts[index]),
                              ),
                            ],
                          ),
                        );
                      },
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

  Widget _buildUrgencyBadge(String urgencyLevel) {
    Color color;
    String text;

    switch (urgencyLevel) {
      case 'critical':
        color = Colors.red;
        text = 'CRITICAL';
        break;
      case 'moderate':
        color = Colors.orange;
        text = 'MODERATE';
        break;
      case 'low':
        color = Colors.green;
        text = 'LOW';
        break;
      default:
        color = Colors.blue;
        text = 'STANDARD';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildEmergencyCallBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.red,
      child: TextButton.icon(
        icon: const Icon(Icons.call, color: Colors.white),
        label: const Text(
          'CALL EMERGENCY SERVICES',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          final Uri phoneUri = Uri(scheme: 'tel', path: '911');
          launchUrl(phoneUri);
        },
      ),
    );
  }
}