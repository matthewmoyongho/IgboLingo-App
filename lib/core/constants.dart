import 'dart:ui';

const Color kPrimaryColor = Color(0XFF00155D);
const Color kSecondaryColor = Color(0XFFFCFCFC);
Color kTextColor = Color(0XFF181818).withOpacity(0.7);

const kQuestions = [
  {
    "question": "How many days are there in a week?",
    "answer": [
      {"aT": "16", "aV": 0},
      {"aT": "7", "aV": 1},
      {"aT": "48", "aV": 0},
      {"aT": "22", "aV": 0}
    ]
  },
  {
    "question": "Is blue a colour?",
    "answer": [
      {"aT": "Maybe", "aV": 0},
      {"aT": "Yes", "aV": 1},
      {"aT": "Maybe not", "aV": 0},
      {"aT": "Go and ask my grandfather", "aV": 0}
    ]
  },
  {
    "question": "Who is the vice chancellor of UNN?",
    "answer": [
      {"aT": "Mr PUN", "aV": 0},
      {"aT": "Dr. Mrs Uguishiwu", "aV": 0},
      {"aT": "Prof. Charlie Boy", "aV": 1},
      {"aT": "Dr. Aniakwu", "aV": 0}
    ]
  },
  {
    "question": "What is John Brave's Favourite food?",
    "answer": [
      {"aT": "Rice", "aV": 0},
      {"aT": "Rice and beans", "aV": 1},
      {"aT": "I don't Know", "aV": 0},
      {"aT": "How am i suppose to know?", "aV": 0}
    ]
  },
];

const kGreetingsAndIntroduction = [
  {
    "question": "What does \"Kedu\" mean?",
    "answer": [
      {"aT": "Hello", "aV": 0},
      {"aT": "Goodbye", "aV": 1},
      {"aT": "No", "aV": 0},
      {"aT": "Yes", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"My name is\" in Igbo?",
    "answer": [
      {"aT": "A hụrụ m gị n'anya", "aV": 0},
      {"aT": "Kedu", "aV": 1},
      {"aT": "Ị hụrụ m gị n'anya?", "aV": 0},
      {"aT": "Nnoo", "aV": 0}
    ]
  },
  {
    "question": "Which phrase means \"How are you?\" in Igbo?",
    "answer": [
      {"aT": "A hụrụ m gị n'anya", "aV": 0},
      {"aT": "Ị hụrụ m gị n'anya?", "aV": 0},
      {"aT": "Kedu ka ị mere?", "aV": 1},
      {"aT": "Nnoo", "aV": 0}
    ]
  },
  {
    "question": "\"Ị hụrụ m gị n'anya?\" is used to ask?",
    "answer": [
      {"aT": "What's your name?", "aV": 0},
      {"aT": "What do you want?", "aV": 1},
      {"aT": "How are you?", "aV": 0},
      {"aT": "Where are you?", "aV": 0}
    ]
  },
  {
    "question": "What is the response to \"Kedu ka ị mere?\"",
    "answer": [
      {"aT": "Nnoo", "aV": 0},
      {"aT": "Nnoo, ọ dị mma", "aV": 1},
      {"aT": "Ị hụrụ m gị n'anya?", "aV": 0},
      {"aT": "Daalụ", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"Hello\" in Igbo?",
    "answer": [
      {"aT": "Nnoo", "aV": 1},
      {"aT": "Nnoo, ọ dị mma", "aV": 0},
      {"aT": "O di mma", "aV": 0},
      {"aT": "Kedu", "aV": 0}
    ]
  },
  {
    "question": "\"Daalụ\" means:",
    "answer": [
      {"aT": "Please", "aV": 0},
      {"aT": "Thank you", "aV": 1},
      {"aT": "Goodbye", "aV": 0},
      {"aT": "Sorry", "aV": 0}
    ]
  },
  {
    "question": "What does \"O di mma\" mean?",
    "answer": [
      {"aT": "Goodbye", "aV": 0},
      {"aT": "Please", "aV": 0},
      {"aT": "Sorry", "aV": 0},
      {"aT": "I'm fine", "aV": 1},
    ]
  },
  {
    "question": "How do you ask \"What is your name?\" in Igbo?",
    "answer": [
      {"aT": "Kedu ka ị mere?", "aV": 0},
      {"aT": "Ị hụrụ m gị n'anya?", "aV": 1},
      {"aT": "Ị hụrụ m gị n'anya?", "aV": 0},
      {"aT": "A hụrụ m gị n'anya", "aV": 0}
    ]
  },
  {
    "question": "\"A hụrụ m gị n'anya\" translates to:",
    "answer": [
      {"aT": "How are you?", "aV": 0},
      {"aT": "My name is...", "aV": 0},
      {"aT": "I'm fine", "aV": 1},
      {"aT": "Goodbye", "aV": 0}
    ]
  },
];

const kNumbersAndCounting = [
  {
    "question": "What is the Igbo word for \"One\"?",
    "answer": [
      {"aT": "Nne", "aV": 0},
      {"aT": "Otu", "aV": 1},
      {"aT": "Eji", "aV": 0},
      {"aT": "Nna", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"Five\" in Igbo?",
    "answer": [
      {"aT": "Ise", "aV": 0},
      {"aT": "Isii na asatọ", "aV": 1},
      {"aT": "Isii", "aV": 0},
      {"aT": "Isii na otu", "aV": 0}
    ]
  },
  {
    "question": "\"Nwa\" means:",
    "answer": [
      {"aT": "Woman", "aV": 0},
      {"aT": "Man", "aV": 0},
      {"aT": "Child", "aV": 1},
      {"aT": "Food", "aV": 0}
    ]
  },
  {
    "question": "Which number is \"Ọgụgụ\"?",
    "answer": [
      {"aT": "Eight", "aV": 0},
      {"aT": "Nine", "aV": 1},
      {"aT": "Ten", "aV": 0},
      {"aT": "Seven", "aV": 0}
    ]
  },
  {
    "question": "What is the Igbo term for \"Twenty\"?",
    "answer": [
      {"aT": "Iri na otu", "aV": 0},
      {"aT": "Iri abụọ na otu", "aV": 1},
      {"aT": "Nri", "aV": 0},
      {"aT": "Iri abụọ", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"Fifty\" in Igbo?",
    "answer": [
      {"aT": "Irije na otu", "aV": 1},
      {"aT": "Isii abụọ na otu", "aV": 0},
      {"aT": "Irije", "aV": 0},
      {"aT": "Agha", "aV": 0}
    ]
  },
  {
    "question": "\"Nnọọ\" translates to:",
    "answer": [
      {"aT": "Hello", "aV": 0},
      {"aT": "Thank you", "aV": 1},
      {"aT": "Goodbye", "aV": 0},
      {"aT": "Please", "aV": 0}
    ]
  },
  {
    "question": "How do you write \"Hundred\" in Igbo?",
    "answer": [
      {"aT": "kara", "aV": 0},
      {"aT": "Ọkara na otu", "aV": 0},
      {"aT": "Ọkara abụọ na otu", "aV": 0},
      {"aT": "Ọkara na abụọ", "aV": 1},
    ]
  },
  {
    "question": "What is the Igbo word for \"Thousand\"?",
    "answer": [
      {"aT": "Ise", "aV": 0},
      {"aT": "Ọkara?", "aV": 1},
      {"aT": "Nne", "aV": 0},
      {"aT": "Ndu", "aV": 0}
    ]
  },
  {
    "question": "\"Ndi\" means:",
    "answer": [
      {"aT": "Father", "aV": 0},
      {"aT": "Mother", "aV": 0},
      {"aT": "People", "aV": 1},
      {"aT": "Brother", "aV": 0}
    ]
  },
];

const kDaysMonthsSeasons = [
  {
    "question": "\"Ụbọchị\" refers to which part of the day?",
    "answer": [
      {"aT": "Night", "aV": 0},
      {"aT": "Evening", "aV": 1},
      {"aT": "Afternoon", "aV": 0},
      {"aT": "Morning", "aV": 0}
    ]
  },
  {
    "question": "Which month is \"Ọnwa isi\"?",
    "answer": [
      {"aT": "January", "aV": 0},
      {"aT": "February", "aV": 1},
      {"aT": "March", "aV": 0},
      {"aT": "December", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"Week\" in Igbo?",
    "answer": [
      {"aT": "Ilo", "aV": 0},
      {"aT": "Isii", "aV": 0},
      {"aT": "Izu", "aV": 1},
      {"aT": "Isi", "aV": 0}
    ]
  },
  {
    "question": "What is the Igbo term for \"Sunday\"?",
    "answer": [
      {"aT": "Eke", "aV": 0},
      {"aT": "Eke", "aV": 1},
      {"aT": "Orie", "aV": 0},
      {"aT": "Afo", "aV": 0}
    ]
  },
  {
    "question": "\"Ọnwa abụọ\" means:",
    "answer": [
      {"aT": "March", "aV": 0},
      {"aT": "November", "aV": 1},
      {"aT": "December", "aV": 0},
      {"aT": "February", "aV": 0}
    ]
  },
  {
    "question": "\"Ụbọchị na-abụọ\" refers to:",
    "answer": [
      {"aT": "Morning", "aV": 0},
      {"aT": "Afternoon", "aV": 1},
      {"aT": "Evening", "aV": 0},
      {"aT": "Night", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"Month\" in Igbo?",
    "answer": [
      {"aT": "Ọnwa", "aV": 0},
      {"aT": "Ilo", "aV": 1},
      {"aT": "Ụbọchị", "aV": 0},
      {"aT": "Please", "aV": 0}
    ]
  },
  {
    "question": "What is the Igbo word for \"Saturday\"?",
    "answer": [
      {"aT": "Afọ", "aV": 0},
      {"aT": "Orie", "aV": 0},
      {"aT": "Aforie", "aV": 0},
      {"aT": "Orie", "aV": 1},
    ]
  },
  {
    "question": "Which season is \"Ụbọchị\"?",
    "answer": [
      {"aT": "Rainy season", "aV": 0},
      {"aT": "Dry season", "aV": 0},
      {"aT": "Harmattan season", "aV": 0},
      {"aT": "Early season", "aV": 1}
    ]
  },
  {
    "question": "How do you say \"Friday\" in Igbo?",
    "answer": [
      {"aT": "Afor", "aV": 0},
      {"aT": "Nkwo", "aV": 0},
      {"aT": "Eke", "aV": 0},
      {"aT": "Afọ", "aV": 1}
    ]
  },
];

const kBasicVocabulary = [
  {
    "question": "What does \"Ijeoma\" mean?",
    "answer": [
      {"aT": "Joy", "aV": 0},
      {"aT": "Peace", "aV": 1},
      {"aT": "Love", "aV": 0},
      {"aT": "Beauty", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"Water\" in Igbo?",
    "answer": [
      {"aT": "Nri", "aV": 0},
      {"aT": "Nkwụ", "aV": 1},
      {"aT": "Mmiri", "aV": 0},
      {"aT": "Enyi", "aV": 0}
    ]
  },
  {
    "question": "\"Anyị\" translates to:",
    "answer": [
      {"aT": "They", "aV": 0},
      {"aT": "She", "aV": 0},
      {"aT": "We", "aV": 1},
      {"aT": "You", "aV": 0}
    ]
  },
  {
    "question": "Which word means \"Dog\"?",
    "answer": [
      {"aT": "Nne", "aV": 0},
      {"aT": "Nkita", "aV": 1},
      {"aT": "Nwoke", "aV": 0},
      {"aT": "Nwunye", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"Sun\" in Igbo?",
    "answer": [
      {"aT": "Mmadụ", "aV": 0},
      {"aT": "Nri", "aV": 1},
      {"aT": "Mmịrị", "aV": 0},
      {"aT": "Nkụ", "aV": 0}
    ]
  },
  {
    "question": "What does \"Nwanne\" mean?",
    "answer": [
      {"aT": "Sister", "aV": 0},
      {"aT": "Brother", "aV": 1},
      {"aT": "Child", "aV": 0},
      {"aT": "Parent", "aV": 0}
    ]
  },
  {
    "question": "\"Ihe\" translates to:",
    "answer": [
      {"aT": "Place", "aV": 0},
      {"aT": "Thing", "aV": 1},
      {"aT": "Time", "aV": 0},
      {"aT": "Food", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"Book\" in Igbo?",
    "answer": [
      {"aT": "Akwụkwọ", "aV": 0},
      {"aT": "Akụ", "aV": 0},
      {"aT": "Ura", "aV": 0},
      {"aT": "Akwụkwọ", "aV": 1},
    ]
  },
  {
    "question": "What is the Igbo term for \"Tree\"?",
    "answer": [
      {"aT": "Ebe", "aV": 0},
      {"aT": "Mmanụ", "aV": 0},
      {"aT": "Ikenga", "aV": 0},
      {"aT": "Mmanụ", "aV": 1}
    ]
  },
  {
    "question": "\"Egwu\" means:",
    "answer": [
      {"aT": "Talk", "aV": 0},
      {"aT": "Play", "aV": 0},
      {"aT": "Sing", "aV": 0},
      {"aT": "Dance", "aV": 1}
    ]
  },
];
const kBasicPhrasesAndQuestions = [
  {
    "question": "How do you say \"Hello\" in Igbo?",
    "answer": [
      {"aT": "Kedu", "aV": 0},
      {"aT": "Dalụ", "aV": 1},
      {"aT": "Biko", "aV": 0},
      {"aT": "Nnoo", "aV": 0}
    ]
  },
  {
    "question": "What is the meaning of \"Kedu\"?",
    "answer": [
      {"aT": "Goodbye", "aV": 0},
      {"aT": "What", "aV": 1},
      {"aT": "Thank you", "aV": 0},
      {"aT": "How are you?", "aV": 0}
    ]
  },
  {
    "question": "\"Nnoo\" is used to express:",
    "answer": [
      {"aT": "Sorry", "aV": 0},
      {"aT": "Excuse me", "aV": 0},
      {"aT": "Welcome", "aV": 1},
      {"aT": "Thank you", "aV": 0}
    ]
  },
  {
    "question": "How do you ask \"What is your name?\" in Igbo?",
    "answer": [
      {"aT": "I nwere ike ịbụrụ ihe dị?", "aV": 0},
      {"aT": "Gịnị mere ị bụ?", "aV": 1},
      {"aT": "Kedu afa gi?", "aV": 0},
      {"aT": "Daaalu nwoke", "aV": 0}
    ]
  },
  {
    "question": "What does \"I nwere ike ịbụrụ ihe dị?\" mean?",
    "answer": [
      {"aT": " How are you?", "aV": 0},
      {"aT": " Can you do it?", "aV": 1},
      {"aT": "Where are you?", "aV": 0},
      {"aT": "What do you do?", "aV": 0}
    ]
  },
  {
    "question": "How do you say \"My name is Chidi\" in Igbo?",
    "answer": [
      {"aT": " A gba m Chidi", "aV": 0},
      {"aT": "Afa m Chidi", "aV": 1},
      {"aT": "A chọ m Chidi", "aV": 0},
      {"aT": "Abara m Chidi", "aV": 0}
    ]
  },
  {
    "question": "\"Biko\" is used to politely say:",
    "answer": [
      {"aT": "Yes", "aV": 0},
      {"aT": "Please", "aV": 1},
      {"aT": "No", "aV": 0},
      {"aT": "Sorry", "aV": 0}
    ]
  },
  {
    "question": "How do you ask \"How are you?\" in Igbo?",
    "answer": [
      {"aT": "Kedu?", "aV": 0},
      {"aT": "Gịnị m ụzọ?", "aV": 0},
      {"aT": "Kedu kwanu?", "aV": 0},
      {"aT": "Kamsiyochukwu?", "aV": 1},
    ]
  },
  {
    "question": "What does \"Ndo\" mean?",
    "answer": [
      {"aT": "Hello", "aV": 0},
      {"aT": "Goodbye", "aV": 0},
      {"aT": "Thank you", "aV": 0},
      {"aT": "Sorry", "aV": 1}
    ]
  },
  {
    "question": "How do you say \"Goodbye\" in Igbo?",
    "answer": [
      {"aT": "Kachifo", "aV": 0},
      {"aT": "Dalụ", "aV": 0},
      {"aT": "Kwenu", "aV": 0},
      {"aT": "Ka omesia", "aV": 1}
    ]
  },
];
