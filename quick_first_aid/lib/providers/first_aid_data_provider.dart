// providers/first_aid_data_provider.dart
import 'package:flutter/foundation.dart';
import '../models/procedure.dart';

class FirstAidDataProvider extends ChangeNotifier {
  List<Procedure> _procedures = [];

  FirstAidDataProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    // In a real app, this would load from local JSON or database
    // For this example, using hardcoded data
    _procedures = [
      // CPR Procedure Example
      Procedure(
        id: "adult_cpr",
        title: "CPR for Adults",
        category: "cpr_resuscitation",
        urgencyLevel: "critical",
        estimatedTime: "Continuous until emergency services arrive",
        seekHelp: "Call emergency services immediately before starting CPR",
        overview: "Cardiopulmonary resuscitation for adults who have stopped breathing or whose heart has stopped beating.",
        steps: [
          ProcedureStep(
            stepNumber: 1,
            heading: "Check responsiveness",
            instruction: "Tap the person's shoulder and shout \"Are you okay?\" Look for breathing or movement.",
            icon: "check_icon",
          ),
          ProcedureStep(
            stepNumber: 2,
            heading: "Call for help",
            instruction: "Ask someone to call emergency services. If alone, call yourself before beginning CPR.",
            icon: "call_icon",
          ),
          ProcedureStep(
            stepNumber: 3,
            heading: "Position correctly",
            instruction: "Place person on their back on a firm surface. Kneel beside their chest.",
            icon: "position_icon",
          ),
          ProcedureStep(
            stepNumber: 4,
            heading: "Begin chest compressions",
            instruction: "Place heel of hand on center of chest. Put other hand on top and interlock fingers. Position shoulders over hands with straight arms. Push hard and fast (100-120 compressions per minute). Allow chest to completely recoil between compressions.",
            icon: "compression_icon",
          ),
          ProcedureStep(
            stepNumber: 5,
            heading: "Perform rescue breaths (if trained)",
            instruction: "After 30 compressions, give 2 rescue breaths. Tilt head back, lift chin, pinch nose. Create seal with mouth and blow for 1 second. Watch for chest rise.",
            icon: "breath_icon",
          ),
          ProcedureStep(
            stepNumber: 6,
            heading: "Continue CPR",
            instruction: "Alternate 30 compressions with 2 rescue breaths. Continue until emergency help arrives or person shows signs of life.",
            icon: "continue_icon",
          ),
        ],
        dos: [
          "Push hard and fast",
          "Allow complete chest recoil",
          "Minimize interruptions to compressions",
          "Use AED if available",
        ],
        donts: [
          "Don't delay starting compressions",
          "Don't push on the ribs or bottom of the breastbone",
          "Don't lean on the chest between compressions",
          "Don't stop CPR unless the person shows signs of life or a professional takes over",
        ],
      ),

      // Second-degree Burns Procedure
      Procedure(
        id: "second_degree_burns",
        title: "Second-degree Burns",
        category: "burns_scalds",
        urgencyLevel: "moderate",
        estimatedTime: "10-15 minutes for initial treatment",
        seekHelp: "For burns larger than 3 inches, on face/hands/feet/genitals, or if victim is a child",
        overview: "Burns that affect the epidermis and part of the dermis, causing redness, blistering, and pain.",
        steps: [
          ProcedureStep(
            stepNumber: 1,
            heading: "Ensure safety",
            instruction: "Remove person from burn source. Remove jewelry or tight items from burned area.",
            icon: "safety_icon",
          ),
          ProcedureStep(
            stepNumber: 2,
            heading: "Cool the burn",
            instruction: "Run cool (not cold) water over the burn for 10-15 minutes. Do not use ice, as it can damage tissue.",
            icon: "cool_icon",
          ),
          ProcedureStep(
            stepNumber: 3,
            heading: "Don't break blisters",
            instruction: "Leave blisters intact to prevent infection. If blisters break, clean gently with mild soap and water.",
            icon: "blister_icon",
          ),
          ProcedureStep(
            stepNumber: 4,
            heading: "Apply clean covering",
            instruction: "Place sterile, non-stick bandage over burn. Secure with tape that doesn't touch the burn.",
            icon: "bandage_icon",
          ),
          ProcedureStep(
            stepNumber: 5,
            heading: "Manage pain",
            instruction: "Take over-the-counter pain reliever if needed. Monitor for signs of infection.",
            icon: "pain_icon",
          ),
        ],
        dos: [
          "Cool the burn with running water",
          "Cover with clean, sterile bandage",
          "Take pain relievers if needed",
          "Change dressing daily",
        ],
        donts: [
          "Don't apply ice directly to burn",
          "Don't use butter, oil, or ointments",
          "Don't break blisters",
          "Don't remove clothing stuck to burned skin",
        ],
      ),

      // Choking Procedure
      Procedure(
        id: "adult_choking",
        title: "Choking in Adults",
        category: "choking_airway",
        urgencyLevel: "critical",
        estimatedTime: "1-5 minutes",
        seekHelp: "Call emergency services if person becomes unconscious or if obstruction persists after 5 abdominal thrusts",
        overview: "Airway obstruction preventing normal breathing, requiring immediate action.",
        steps: [
          ProcedureStep(
            stepNumber: 1,
            heading: "Identify choking",
            instruction: "Look for universal choking sign (hands clutched at throat). Check if person can speak, cough, or breathe.",
            icon: "identify_icon",
          ),
          ProcedureStep(
            stepNumber: 2,
            heading: "Perform back blows",
            instruction: "Stand behind the person. Lean them forward slightly. Deliver 5 firm blows between shoulder blades with heel of hand.",
            icon: "backblows_icon",
          ),
          ProcedureStep(
            stepNumber: 3,
            heading: "Prepare for abdominal thrusts",
            instruction: "Stand behind the person. Wrap your arms around their waist. Make a fist with one hand, place thumb side against middle of their abdomen, above navel.",
            icon: "prepare_icon",
          ),
          ProcedureStep(
            stepNumber: 4,
            heading: "Perform abdominal thrusts",
            instruction: "Grasp fist with other hand. Press inward and upward with quick thrusts. Repeat 5 times.",
            icon: "thrust_icon",
          ),
          ProcedureStep(
            stepNumber: 5,
            heading: "Alternate techniques",
            instruction: "Continue alternating 5 back blows and 5 abdominal thrusts. Continue until object is expelled or person becomes unconscious.",
            icon: "alternate_icon",
          ),
        ],
        dos: [
          "Ask \"Are you choking?\" before helping",
          "Use firm back blows and abdominal thrusts",
          "Call emergency services if obstruction doesn't clear quickly",
        ],
        donts: [
          "Don't intervene if person is coughing forcefully",
          "Don't give abdominal thrusts to pregnant women or obese individuals (use chest thrusts instead)",
          "Don't slap a choking person's back while they're upright",
        ],
      ),

      //Control Bleeding
      Procedure(
        id: "bleeding_control",
        title: "Control Bleeding",
        category: "bleeding_wounds",
        urgencyLevel: "urgent",
        estimatedTime: "5-10 minutes",
        seekHelp: "Call emergency services if bleeding is severe or doesn’t stop after 10 minutes of pressure",
        overview: "Managing external bleeding to prevent blood loss and shock.",
        steps: [
          ProcedureStep(stepNumber: 1, heading: "Ensure safety", instruction: "Wear gloves if available to avoid contact with blood.", icon: "gloves_icon"),
          ProcedureStep(stepNumber: 2, heading: "Expose the wound", instruction: "Remove or cut clothing around the wound to see the source of bleeding.", icon: "expose_icon"),
          ProcedureStep(stepNumber: 3, heading: "Apply pressure", instruction: "Use a clean cloth or bandage to apply firm, steady pressure.", icon: "pressure_icon"),
          ProcedureStep(stepNumber: 4, heading: "Elevate if possible", instruction: "If no fracture suspected, raise the bleeding limb above heart level.", icon: "elevate_icon"),
          ProcedureStep(stepNumber: 5, heading: "Secure dressing", instruction: "Wrap a bandage over the dressing to hold it in place.", icon: "wrap_icon"),
        ],
        dos: ["Use clean cloths", "Apply direct pressure", "Keep the person calm", "Monitor for shock"],
        donts: ["Don’t remove embedded objects", "Don’t use a tourniquet unless trained", "Don’t use dirty materials"],
      ),

      Procedure(
        id: "fracture_sprain",
        title: "Fractures and Sprains",
        category: "fractures_sprains",
        urgencyLevel: "moderate",
        estimatedTime: "15-30 minutes",
        seekHelp: "Seek medical attention for suspected fractures or severe swelling/deformity",
        overview: "Initial care for suspected broken bones or ligament injuries.",
        steps: [
          ProcedureStep(stepNumber: 1, heading: "Immobilize the area", instruction: "Do not move the affected limb. Use a splint or padding to support it.", icon: "immobilize_icon"),
          ProcedureStep(stepNumber: 2, heading: "Apply cold", instruction: "Use an ice pack wrapped in a cloth for 15-20 minutes to reduce swelling.", icon: "ice_icon"),
          ProcedureStep(stepNumber: 3, heading: "Elevate if possible", instruction: "Raise the limb above heart level to help reduce swelling.", icon: "elevate_icon"),
          ProcedureStep(stepNumber: 4, heading: "Seek evaluation", instruction: "Avoid using the limb until seen by a healthcare provider.", icon: "doctor_icon"),
        ],
        dos: ["Keep the limb still", "Use ice to reduce swelling", "Seek X-ray if unsure"],
        donts: ["Don’t move or realign bones", "Don’t apply heat", "Don’t ignore deformities"],
      ),

      Procedure(
        id: "bites_stings",
        title: "Bites and Stings",
        category: "bites_stings",
        urgencyLevel: "moderate",
        estimatedTime: "10-15 minutes",
        seekHelp: "Seek medical help for signs of allergic reaction or if bitten by a venomous animal",
        overview: "Managing common insect stings, animal bites, or venomous bites.",
        steps: [
          ProcedureStep(stepNumber: 1, heading: "Move to safety", instruction: "Leave the area to prevent further stings or bites.", icon: "safety_icon"),
          ProcedureStep(stepNumber: 2, heading: "Clean the area", instruction: "Wash with soap and water to prevent infection.", icon: "clean_icon"),
          ProcedureStep(stepNumber: 3, heading: "Apply cold pack", instruction: "Reduce swelling and pain using a wrapped ice pack.", icon: "ice_icon"),
          ProcedureStep(stepNumber: 4, heading: "Monitor for reaction", instruction: "Watch for swelling of face/lips, trouble breathing, or rash.", icon: "monitor_icon"),
          ProcedureStep(stepNumber: 5, heading: "Use epinephrine if allergic", instruction: "If prescribed, use an epinephrine auto-injector immediately.", icon: "epi_icon"),
        ],
        dos: ["Clean wound", "Apply ice", "Use antihistamines if needed"],
        donts: ["Don’t suck out venom", "Don’t scratch the area", "Don’t delay epinephrine in allergic reaction"],
      ),

      Procedure(
        id: "allergic_reaction",
        title: "Allergic Reaction",
        category: "allergic_reactions",
        urgencyLevel: "critical",
        estimatedTime: "Immediate",
        seekHelp: "Call emergency services immediately for anaphylaxis",
        overview: "Severe allergic reactions can be life-threatening and need urgent care.",
        steps: [
          ProcedureStep(stepNumber: 1, heading: "Identify symptoms", instruction: "Look for swelling, hives, difficulty breathing, dizziness.", icon: "symptom_icon"),
          ProcedureStep(stepNumber: 2, heading: "Use epinephrine", instruction: "Administer epinephrine auto-injector in outer thigh.", icon: "epi_icon"),
          ProcedureStep(stepNumber: 3, heading: "Call emergency services", instruction: "Always call after using epinephrine.", icon: "call_icon"),
          ProcedureStep(stepNumber: 4, heading: "Lay person down", instruction: "Lay flat and elevate legs unless breathing difficulty requires sitting up.", icon: "position_icon"),
          ProcedureStep(stepNumber: 5, heading: "Second dose", instruction: "If no improvement after 5-15 mins, a second epinephrine dose may be needed.", icon: "second_dose_icon"),
        ],
        dos: ["Use epinephrine promptly", "Call emergency services", "Stay with the person"],
        donts: ["Don’t wait to see if symptoms improve", "Don’t give food or drink", "Don’t leave the person alone"],
      ),
      
      Procedure(
        id: "heatstroke",
        title: "Heatstroke",
        category: "heat_cold_injuries",
        urgencyLevel: "critical",
        estimatedTime: "Immediate",
        seekHelp: "Call emergency services immediately",
        overview: "Heatstroke is a life-threatening condition where the body overheats.",
        steps: [
          ProcedureStep(stepNumber: 1, heading: "Move to shade", instruction: "Get the person out of the sun and into a cool area.", icon: "shade_icon"),
          ProcedureStep(stepNumber: 2, heading: "Cool the person", instruction: "Apply cool water, ice packs to armpits/groin/neck, or fan.", icon: "cool_icon"),
          ProcedureStep(stepNumber: 3, heading: "Remove excess clothing", instruction: "Take off unnecessary clothes to aid cooling.", icon: "remove_clothing_icon"),
          ProcedureStep(stepNumber: 4, heading: "Hydrate if conscious", instruction: "Give small sips of water. Avoid caffeine or alcohol.", icon: "water_icon"),
          ProcedureStep(stepNumber: 5, heading: "Monitor and reassure", instruction: "Stay with the person and monitor breathing.", icon: "monitor_icon"),
        ],
        dos: ["Cool the body quickly", "Use fans and water", "Keep person calm"],
        donts: ["Don’t give fluids if unconscious", "Don’t delay emergency help", "Don’t use ice baths for elderly/children"],
      ),


    ];

    notifyListeners();
  }

  List<Procedure> get procedures => _procedures;

  List<Procedure> getProceduresByCategory(String categoryId) {
    return _procedures.where((p) => p.category == categoryId).toList();
  }

  Procedure? getProcedureById(String id) {
    try {
      return _procedures.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}