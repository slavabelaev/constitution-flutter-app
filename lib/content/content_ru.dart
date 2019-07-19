import '../classes/chapter.dart';
import '../classes/section.dart';

List<Section> content = [
  Section(
    name: "I",
    title: "ОСНОВЫ КОНСТИТУЦИОННОГО СТРОЯ",
    from: 1,
    to: 15
  ),
  Section(
    name: "II",
    title: "ПРАВА, СВОБОДЫ, ОБЯЗАННОСТИ И ГАРАНТИИ ЧЕЛОВЕКА И ГРАЖДАНИНА",
    from: 16,
    to: 52
  ),
  Section(
    name: "III",
    title: "ОСНОВЫ ГОСУДАРСТВЕННОГО УПРАВЛЕНИЯ",
    from: 53,
    to: 100,
    chapters: [
      Chapter(
        number: 1,
        title: "РАЗВИТИЕ ОСНОВ КОНСТИТУЦИОННОГО СТРОЯ",
        from: 53,
        to: 58
      ),
      Chapter(
        number: 2,
        title: "ПРЕЗИДЕНТ ПРИДНЕСТРОВСКОЙ МОЛДАВСКОЙ РЕСПУБЛИКИ",
        from: 59,
        to: 66
      ),
      Chapter(
        number: 3,
        title: "ВЕРХОВНЫЙ СОВЕТ ПРИДНЕСТРОВСКОЙ МОЛДАВСКОЙ РЕСПУБЛИКИ",
        from: 67,
        to: 76
      ),
      Chapter(
        number: 3.1,
        title: "ПРАВИТЕЛЬСТВО ПРИДНЕСТРОВСКОЙ МОЛДАВСКОЙ РЕСПУБЛИКИ",
        from: 76.1,
        to: 76.8
      ),
      Chapter(
        number: 4,
        title: "МЕСТНОЕ ГОСУДАРСТВЕННОЕ УПРАВЛЕНИЕ И МЕСТНОЕ САМОУПРАВЛЕНИЕ",
        from: 77,
        to: 79
      ),
      Chapter(
        number: 5,
        title: "СУДЕБНАЯ ВЛАСТЬ", 
        from: 80, 
        to: 91
      ),
      Chapter(
        number: 6,
        title: "НАДЗОР ЗА ТОЧНЫМ И ЕДИНООБРАЗНЫМ ИСПОЛНЕНИЕМ КОНСТИТУЦИИ И ЗАКОНОВ ПРИДНЕСТРОВСКОЙ МОЛДАВСКОЙ РЕСПУБЛИКИ",
        from: 92,
        to: 92
      ),
      Chapter(
        number: 7,
        title: "ОБОРОНА, БЕЗОПАСНОСТЬ И ПРАВООХРАНИТЕЛЬНАЯ ДЕЯТЕЛЬНОСТЬ",
        from: 93,
        to: 95
      ),
      Chapter(
        number: 8,
        title: "ФИНАНСОВАЯ И БЮДЖЕТНАЯ СИСТЕМА",
        from: 96,
        to: 100
      )
    ]
  ),
  Section(
    name: "IV",
    title: "ИЗМЕНЕНИЕ КОНСТИТУЦИИ",
    from: 101,
    to: 106
  ),
  Section(
    name: "V",
    title: "ПЕРЕХОДНЫЕ НОРМЫ И ПОЛОЖЕНИЯ",
    from: 1,
    to: 7
  )
];
