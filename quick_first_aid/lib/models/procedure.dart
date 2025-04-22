// models/procedure.dart
import 'package:flutter/foundation.dart';

class Procedure {
  final String id;
  final String title;
  final String category;
  final String urgencyLevel;
  final String estimatedTime;
  final String seekHelp;
  final String overview;
  final List<ProcedureStep> steps;
  final List<String> dos;
  final List<String> donts;

  Procedure({
    required this.id,
    required this.title,
    required this.category,
    required this.urgencyLevel,
    required this.estimatedTime,
    required this.seekHelp,
    required this.overview,
    required this.steps,
    required this.dos,
    required this.donts,
  });

  factory Procedure.fromJson(Map<String, dynamic> json) {
    return Procedure(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      urgencyLevel: json['urgency_level'],
      estimatedTime: json['estimated_time'],
      seekHelp: json['seek_help'],
      overview: json['overview'],
      steps: (json['steps'] as List)
          .map((step) => ProcedureStep.fromJson(step))
          .toList(),
      dos: List<String>.from(json['dos']),
      donts: List<String>.from(json['donts']),
    );
  }
}

class ProcedureStep {
  final int stepNumber;
  final String heading;
  final String instruction;
  final String? icon;

  ProcedureStep({
    required this.stepNumber,
    required this.heading,
    required this.instruction,
    this.icon,
  });

  factory ProcedureStep.fromJson(Map<String, dynamic> json) {
    return ProcedureStep(
      stepNumber: json['step_number'],
      heading: json['heading'],
      instruction: json['instruction'],
      icon: json['icon'],
    );
  }
}