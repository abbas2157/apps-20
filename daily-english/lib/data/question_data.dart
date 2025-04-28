// data/question_data.dart
import '../models/question.dart';

class QuestionData {
  // Basic Mode Questions
  static List<EnhancedQuestion> basicQuestions = [
    // Vocabulary Questions
    EnhancedQuestion(
      questionText: "What is the opposite of 'hot'?",
      options: ['Cold', 'Warm', 'Wet', 'Dry'],
      correctAnswerIndex: 0,
      difficulty: Difficulty.basic,
      category: QuestionCategory.vocabulary,
      explanation: "The opposite of 'hot' is 'cold'. Hot means high temperature, while cold means low temperature.",
    ),
    EnhancedQuestion(
      questionText: "Which word means 'not expensive'?",
      options: ['Rich', 'Poor', 'Cheap', 'Costly'],
      correctAnswerIndex: 2,
      difficulty: Difficulty.basic,
      category: QuestionCategory.vocabulary,
      explanation: "'Cheap' means something that doesn't cost much money or is inexpensive.",
    ),
    EnhancedQuestion(
      questionText: "Which is a color?",
      options: ['Dog', 'Book', 'Blue', 'House'],
      correctAnswerIndex: 2,
      difficulty: Difficulty.basic,
      category: QuestionCategory.vocabulary,
      explanation: "Blue is a color. The other options are nouns but not colors.",
    ),
    EnhancedQuestion(
      questionText: "Which word describes very good food?",
      options: ['Delicious', 'Boring', 'Ugly', 'Expensive'],
      correctAnswerIndex: 0,
      difficulty: Difficulty.basic,
      category: QuestionCategory.vocabulary,
      explanation: "'Delicious' describes food that tastes very good.",
    ),
    EnhancedQuestion(
      questionText: "Which word is an animal?",
      options: ['Table', 'Elephant', 'Pencil', 'Mountain'],
      correctAnswerIndex: 1,
      difficulty: Difficulty.basic,
      category: QuestionCategory.vocabulary,
      explanation: "An elephant is an animal. The other options are objects or geographical features.",
    ),
    
    // Grammar Questions
    EnhancedQuestion(
      questionText: "Complete the sentence: 'She ___ to the store yesterday.'",
      options: ['go', 'goes', 'went', 'going'],
      correctAnswerIndex: 2,
      difficulty: Difficulty.basic,
      category: QuestionCategory.grammar,
      explanation: "We use 'went' (past tense of 'go') because the action happened in the past (yesterday).",
    ),
    EnhancedQuestion(
      questionText: "Which word is a verb?",
      options: ['Happy', 'Run', 'Beautiful', 'Table'],
      correctAnswerIndex: 1,
      difficulty: Difficulty.basic,
      category: QuestionCategory.grammar,
      explanation: "'Run' is a verb (an action). The others are adjectives or nouns.",
    ),
    EnhancedQuestion(
      questionText: "What is the plural of 'child'?",
      options: ['Childs', 'Childes', 'Children', 'Child'],
      correctAnswerIndex: 2,
      difficulty: Difficulty.basic,
      category: QuestionCategory.grammar,
      explanation: "'Children' is the plural form of 'child'. It's an irregular plural form.",
    ),
    EnhancedQuestion(
      questionText: "What is the past tense of 'eat'?",
      options: ['Eat', 'Ate', 'Eaten', 'Eated'],
      correctAnswerIndex: 1,
      difficulty: Difficulty.basic,
      category: QuestionCategory.grammar,
      explanation: "'Ate' is the past tense of 'eat'. 'Eaten' is the past participle.",
    ),
    EnhancedQuestion(
      questionText: "Choose the correct sentence:",
      options: [
        'She don\'t like coffee.',
        'She doesn\'t likes coffee.',
        'She doesn\'t like coffee.',
        'She not like coffee.'
      ],
      correctAnswerIndex: 2,
      difficulty: Difficulty.basic,
      category: QuestionCategory.grammar,
      explanation: "'She doesn't like coffee' is correct. For third person singular (she/he/it), we use 'doesn't' + base verb.",
    ),
    
    // Time and Daily Life Questions
    EnhancedQuestion(
      questionText: "What time is 6:30 PM?",
      options: [
        'Six thirty in the morning',
        'Six thirty in the evening',
        'Half past five in the evening',
        'Half past six in the morning'
      ],
      correctAnswerIndex: 1,
      difficulty: Difficulty.basic,
      category: QuestionCategory.vocabulary,
      explanation: "6:30 PM means 'six thirty in the evening'. PM stands for Post Meridiem (afternoon/evening).",
    ),
    EnhancedQuestion(
      questionText: "Which word means 'the day before today'?",
      options: ['Today', 'Tomorrow', 'Yesterday', 'Next week'],
      correctAnswerIndex: 2,
      difficulty: Difficulty.basic,
      category: QuestionCategory.vocabulary,
      explanation: "'Yesterday' means the day before today.",
    ),
    EnhancedQuestion(
      questionText: "Complete the sentence: 'I ___ breakfast every morning.'",
      options: ['eat', 'eats', 'eating', 'ate'],
      correctAnswerIndex: 0,
      difficulty: Difficulty.basic,
      category: QuestionCategory.grammar,
      explanation: "With 'I' as the subject, we use the base form 'eat', not 'eats' which is for third person (he/she/it).",
    ),
    EnhancedQuestion(
      questionText: "Which is NOT a day of the week?",
      options: ['Monday', 'Friday', 'January', 'Sunday'],
      correctAnswerIndex: 2,
      difficulty: Difficulty.basic,
      category: QuestionCategory.vocabulary,
      explanation: "January is a month, not a day of the week. The others are all days of the week.",
    ),
    EnhancedQuestion(
      questionText: "Choose the correct preposition: 'I live ___ New York.'",
      options: ['in', 'on', 'at', 'for'],
      correctAnswerIndex: 0,
      difficulty: Difficulty.basic,
      category: QuestionCategory.grammar,
      explanation: "We use the preposition 'in' with cities. 'I live in New York' is correct.",
    ),
  ];

  // Intermediate Mode Questions
  static List<EnhancedQuestion> intermediateQuestions = [
    // More complex vocabulary
    EnhancedQuestion(
      questionText: "Which word is a synonym for 'happy'?",
      options: ['Sad', 'Joyful', 'Angry', 'Tired'],
      correctAnswerIndex: 1,
      difficulty: Difficulty.intermediate,
      category: QuestionCategory.vocabulary,
      explanation: "'Joyful' means feeling or showing great happiness, which is a synonym for 'happy'.",
    ),
    EnhancedQuestion(
      questionText: "What does the idiom 'break the ice' mean?",
      options: [
        'To actually break ice with a tool',
        'To damage a friendship',
        'To make people feel more comfortable in a social situation',
        'To cool down a drink'
      ],
      correctAnswerIndex: 2,
      difficulty: Difficulty.intermediate,
      category: QuestionCategory.idioms,
      explanation: "'Break the ice' means to do or say something to relieve tension or get conversation going in a social situation.",
    ),
    
    // More complex grammar
    EnhancedQuestion(
      questionText: "Choose the correct past perfect tense:",
      options: [
        'I have eaten breakfast.',
        'I had eaten breakfast before she arrived.',
        'I was eating breakfast.',
        'I eat breakfast.'
      ],
      correctAnswerIndex: 1,
      difficulty: Difficulty.intermediate,
      category: QuestionCategory.grammar,
      explanation: "The past perfect tense 'had eaten' is used to describe an action that happened before another past action.",
    ),
    EnhancedQuestion(
      questionText: "Which sentence uses the present continuous tense correctly?",
      options: [
        'She work at the hospital.',
        'She works at the hospital.',
        'She working at the hospital.',
        'She is working at the hospital.'
      ],
      correctAnswerIndex: 3,
      difficulty: Difficulty.intermediate,
      category: QuestionCategory.grammar,
      explanation: "The present continuous tense is formed with 'is/am/are' + present participle (-ing form). 'She is working' is correct.",
    ),
    
    // More intermediate questions
    EnhancedQuestion(
      questionText: "Select the correct comparative form:",
      options: [
        'This book is more better than that one.',
        'This book is more good than that one.',
        'This book is better than that one.',
        'This book is gooder than that one.'
      ],
      correctAnswerIndex: 2,
      difficulty: Difficulty.intermediate,
      category: QuestionCategory.grammar,
      explanation: "'Better' is the correct comparative form of 'good'. We don't say 'more better' or 'gooder'.",
    ),
    EnhancedQuestion(
      questionText: "Choose the word that best completes the sentence: 'She was _____ tired to continue working.'",
      options: ['to', 'too', 'two', 'so'],
      correctAnswerIndex: 1,
      difficulty: Difficulty.intermediate,
      category: QuestionCategory.grammar,
      explanation: "'Too' is used to indicate excess. 'She was too tired' means she was excessively tired.",
    ),
  ];
  
  // Advanced Mode Questions
  static List<EnhancedQuestion> advancedQuestions = [
    // Complex grammar
    EnhancedQuestion(
      questionText: "Identify the sentence with correct subject-verb agreement:",
      options: [
        'Neither of the students have completed the assignment.',
        'The committee are divided on this issue.',
        'Everyone in the room was asked to stand up.',
        'A number of books is missing from the shelf.'
      ],
      correctAnswerIndex: 2,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.grammar,
      explanation: "When 'everyone' is the subject, it takes a singular verb (was). 'Neither' with 'of' takes a singular verb, 'committee' can take singular or plural depending on British/American English, and 'a number of' takes a plural verb.",
    ),
    EnhancedQuestion(
      questionText: "Select the sentence with the correct use of the past perfect continuous tense:",
      options: [
        'I have been working on this project for three hours.',
        'I had been working on this project for three hours when my computer crashed.',
        'I was working on this project for three hours.',
        'I would have been working on this project for three hours.'
      ],
      correctAnswerIndex: 1,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.grammar,
      explanation: "The past perfect continuous (had been + -ing form) describes an action that was ongoing in the past before another past action occurred.",
    ),
    
    // Advanced vocabulary
    EnhancedQuestion(
      questionText: "Which word means 'to criticize severely'?",
      options: ['Lambaste', 'Articulate', 'Venerate', 'Placate'],
      correctAnswerIndex: 0,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.vocabulary,
      explanation: "'Lambaste' means to criticize harshly. 'Articulate' means to express clearly, 'venerate' means to revere, and 'placate' means to soothe or pacify.",
    ),
    EnhancedQuestion(
      questionText: "Choose the word that means 'ambiguous or open to more than one interpretation':",
      options: ['Explicit', 'Equivocal', 'Unequivocal', 'Lucid'],
      correctAnswerIndex: 1,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.vocabulary,
      explanation: "'Equivocal' means ambiguous or having multiple meanings. The other options all relate to clarity or explicitness.",
    ),
    
    // Complex idioms
    EnhancedQuestion(
      questionText: "What does the idiom 'to bite the bullet' mean?",
      options: [
        'To accidentally hurt oneself',
        'To accept something difficult or unpleasant',
        'To be extremely angry',
        'To make a dangerous choice'
      ],
      correctAnswerIndex: 1,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.idioms,
      explanation: "'To bite the bullet' means to endure a painful or difficult situation because it's unavoidable.",
    ),
    EnhancedQuestion(
      questionText: "What is meant by the expression 'a flash in the pan'?",
      options: [
        'A cooking technique',
        'A bright idea',
        "Something that brings quick success but doesn't last",
        'A moment of anger'
      ],
      correctAnswerIndex: 2,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.idioms,
      explanation: "'A flash in the pan' refers to something that appears successful but proves to be short-lived or unsuccessful in the long term.",
    ),
    
    // Complex grammar
    EnhancedQuestion(
      questionText: "Identify the correct use of the subjunctive mood:",
      options: [
        'I wish I was taller.',
        'She demanded that he leaves immediately.',
        'If I was rich, I would buy a yacht.',
        'It is essential that he be present at the meeting.'
      ],
      correctAnswerIndex: 3,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.grammar,
      explanation: "The subjunctive mood uses the base form of the verb (be) rather than the indicative (is) in clauses that express necessity, recommendation, or formal requests.",
    ),
    EnhancedQuestion(
      questionText: "Which sentence contains a correctly used participle phrase?",
      options: [
        'Walking down the street, the trees were beautiful.',
        'Having finished the exam, the relief was immediate.',
        'Running to catch the bus, my books fell out of my bag.',
        'Exhausted from the hike, the bed felt extremely comfortable.'
      ],
      correctAnswerIndex: 2,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.grammar,
      explanation: "A participle phrase should modify the subject of the main clause. Only in option C is the subject ('my books') logically connected to the participle phrase ('Running to catch the bus').",
    ),
    
    // Advanced conversation
    EnhancedQuestion(
      questionText: "Which would be the most appropriate response to someone saying, 'I'm terribly sorry for your loss'?",
      options: [
        "Don't worry about it.",
        'Thank you for your condolences.',
        "It's not a big deal.",
        "You're welcome."
      ],
      correctAnswerIndex: 1,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.conversation,
      explanation: "'Thank you for your condolences' is the appropriate response when someone expresses sympathy for a death or loss.",
    ),
    EnhancedQuestion(
      questionText: "In formal English, how would you politely disagree with someone in a professional setting?",
      options: [
        "You're wrong about that.",
        'I see your point, but have you considered...',
        "No way, that doesn't make any sense.",
        'Whatever you say, but actually...'
      ],
      correctAnswerIndex: 1,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.conversation,
      explanation: "In formal or professional settings, it's best to acknowledge the other person's perspective before offering an alternative viewpoint.",
    ),
    
    // Advanced pronunciation
    EnhancedQuestion(
      questionText: "Which word has a different stress pattern from the others?",
      options: ['Photographer', 'Biology', 'Geography', 'Psychology'],
      correctAnswerIndex: 0,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.pronunciation,
      explanation: "'Photographer' has stress on the second syllable (phoTOgrapher), while the others have stress on the third syllable from the end.",
    ),
    EnhancedQuestion(
      questionText: "Which pair of words contains a different vowel sound?",
      options: ['Bread/Head', 'Great/Wait', 'Said/Bed', 'Dead/Led'],
      correctAnswerIndex: 1,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.pronunciation,
      explanation: "'Great' and 'Wait' both have the long 'a' sound /eɪ/, while all the other pairs have the short 'e' sound /ɛ/.",
    ),
    
    // Advanced comprehension
    EnhancedQuestion(
      questionText: "Which sentence uses the word 'ironic' correctly?",
      options: [
        'It was ironic that it rained on the day we planned a picnic.',
        'It was ironic that the fire station burned down.',
        'It was ironic that she had to wait in line for an hour.',
        'It was ironic that the store was closed on Sunday.'
      ],
      correctAnswerIndex: 1,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.vocabulary,
      explanation: "True irony involves a situation that is the opposite of what you would expect. A fire station burning down is ironic because fire stations are meant to prevent fires.",
    ),
    EnhancedQuestion(
      questionText: "Which of these is an example of a euphemism?",
      options: [
        "He's as strong as an ox.",
        "She's no longer with us.",
        'This task is a piece of cake.',
        'He works like a dog.'
      ],
      correctAnswerIndex: 1,
      difficulty: Difficulty.advanced,
      category: QuestionCategory.vocabulary,
      explanation: "A euphemism is a mild expression used to refer to something unpleasant. 'She's no longer with us' is a euphemism for 'she died.' The others are similes or idioms.",
    ),
  ];
  
  // Get questions by difficulty
  static List<EnhancedQuestion> getQuestionsByDifficulty(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.basic:
        return basicQuestions;
      case Difficulty.intermediate:
        return intermediateQuestions;
      case Difficulty.advanced:
        return advancedQuestions;
      default:
        return basicQuestions;
    }
  }
  
  // Get questions by category
  static List<EnhancedQuestion> getQuestionsByCategory(QuestionCategory category, Difficulty difficulty) {
    List<EnhancedQuestion> questions = getQuestionsByDifficulty(difficulty);
    return questions.where((q) => q.category == category).toList();
  }
}