import '../../classes/chapter.dart';
import '../../classes/section.dart';

List<Section> content_ua = [
  Section(
      name: "П",
      title: "ПРЕАМБУЛА",
      startsWith: 0,
      endsWith: 0
  ),
  Section(
    name: "I",
    title: "ОСНОВЫ КОНСТИТУЦИОННОГО СТРОЯ",
    startsWith: 1,
    endsWith: 15
  ),
  Section(
    name: "II",
    title: "ПРАВА, СВОБОДЫ, ОБЯЗАННОСТИ И ГАРАНТИИ ЧЕЛОВЕКА И ГРАЖДАНИНА",
    startsWith: 16,
    endsWith: 52
  ),
  Section(
    name: "III",
    title: "ОСНОВЫ ГОСУДАРСТВЕННОГО УПРАВЛЕНИЯ",
    startsWith: 53,
    endsWith: 100,
    chapters: [
      Chapter(
        number: 1,
        title: "РАЗВИТИЕ ОСНОВ КОНСТИТУЦИОННОГО СТРОЯ",
        startsWith: 53,
        endsWith: 58
      ),
      Chapter(
        number: 2,
        title: "ПРЕЗИДЕНТ ПРИДНЕСТРОВСКОЙ МОЛДАВСКОЙ РЕСПУБЛИКИ",
        startsWith: 59,
        endsWith: 66
      ),
      Chapter(
        number: 3,
        title: "ВЕРХОВНЫЙ СОВЕТ ПРИДНЕСТРОВСКОЙ МОЛДАВСКОЙ РЕСПУБЛИКИ",
        startsWith: 67,
        endsWith: 76
      ),
      Chapter(
        number: 3.1,
        title: "ПРАВИТЕЛЬСТВО ПРИДНЕСТРОВСКОЙ МОЛДАВСКОЙ РЕСПУБЛИКИ",
        startsWith: 76.1,
        endsWith: 76.8
      ),
      Chapter(
        number: 4,
        title: "МЕСТНОЕ ГОСУДАРСТВЕННОЕ УПРАВЛЕНИЕ И МЕСТНОЕ САМОУПРАВЛЕНИЕ",
        startsWith: 77,
        endsWith: 79
      ),
      Chapter(
        number: 5,
        title: "СУДЕБНАЯ ВЛАСТЬ", 
        startsWith: 80, 
        endsWith: 91
      ),
      Chapter(
        number: 6,
        title: "НАДЗОР ЗА ТОЧНЫМ И ЕДИНООБРАЗНЫМ ИСПОЛНЕНИЕМ КОНСТИТУЦИИ И ЗАКОНОВ ПРИДНЕСТРОВСКОЙ МОЛДАВСКОЙ РЕСПУБЛИКИ",
        startsWith: 92,
        endsWith: 92
      ),
      Chapter(
        number: 7,
        title: "ОБОРОНА, БЕЗОПАСНОСТЬ И ПРАВООХРАНИТЕЛЬНАЯ ДЕЯТЕЛЬНОСТЬ",
        startsWith: 93,
        endsWith: 95
      ),
      Chapter(
        number: 8,
        title: "ФИНАНСОВАЯ И БЮДЖЕТНАЯ СИСТЕМА",
        startsWith: 96,
        endsWith: 100
      )
    ]
  ),
  Section(
    name: "IV",
    title: "ИЗМЕНЕНИЕ КОНСТИТУЦИИ",
    startsWith: 101,
    endsWith: 106
  ),
  Section(
    name: "V",
    title: "ПЕРЕХОДНЫЕ НОРМЫ И ПОЛОЖЕНИЯ",
    startsWith: 1,
    endsWith: 7
  )
];
