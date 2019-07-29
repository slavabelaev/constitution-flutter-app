import '../../classes/chapter.dart';
import '../../classes/section.dart';

List<Section> contentRU = [
  Section(
      name: "П",
      title: "Преамбула",
      startsWith: 0,
      endsWith: 0
  ),
  Section(
    name: "I",
    title: "Основы конституционного строя",
    startsWith: 1,
    endsWith: 15
  ),
  Section(
    name: "II",
    title: "Права, свободы, обязанности и гарантии человека и гражданина",
    startsWith: 16,
    endsWith: 52
  ),
  Section(
    name: "III",
    title: "Основы государственного управления",
    startsWith: 53,
    endsWith: 100,
    chapters: [
      Chapter(
        number: 1,
        title: "Развитие основ конституционного строя",
        startsWith: 53,
        endsWith: 58
      ),
      Chapter(
        number: 2,
        title: "Президент Приднестровской Молдавской Республики",
        startsWith: 59,
        endsWith: 66
      ),
      Chapter(
        number: 3,
        title: "Верховный совет Приднестровской Молдавской Республики",
        startsWith: 67,
        endsWith: 76
      ),
      Chapter(
        number: 3.1,
        title: "Правительство Приднестровской Молдавской Республики",
        startsWith: 76.1,
        endsWith: 76.8
      ),
      Chapter(
        number: 4,
        title: "Местное государственное управление и местное самоуправление",
        startsWith: 77,
        endsWith: 79
      ),
      Chapter(
        number: 5,
        title: "Судебная власть",
        startsWith: 80, 
        endsWith: 91
      ),
      Chapter(
        number: 6,
        title: "Надзор за точным и единообразным исполнением Конституции и законов Приднестровской Молдавской Республики",
        startsWith: 92,
        endsWith: 92
      ),
      Chapter(
        number: 7,
        title: "Оборона, безопасность и правоохранительная деятельность",
        startsWith: 93,
        endsWith: 95
      ),
      Chapter(
        number: 8,
        title: "Финансовая и бюджетная система",
        startsWith: 96,
        endsWith: 100
      )
    ]
  ),
  Section(
    name: "IV",
    title: "Изменение Конституции",
    startsWith: 101,
    endsWith: 106
  ),
  Section(
    name: "V",
    title: "Переходные нормы и положения",
    startsWith: 1,
    endsWith: 7
  )
];
