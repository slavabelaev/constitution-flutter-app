import '../../classes/chapter.dart';
import '../../classes/section.dart';

List<Section> contentUK = [
  Section(
      name: "П",
      title: "Преамбула",
      startsWith: 0,
      endsWith: 0
  ),
  Section(
    name: "I",
    title: "Основи конституційного устрою",
    startsWith: 1,
    endsWith: 15
  ),
  Section(
    name: "II",
    title: "Права, свободи, обов’язки людини і громадянина і їх гарантії",
    startsWith: 16,
    endsWith: 52
  ),
  Section(
    name: "III",
    title: "Основи державного управління",
    startsWith: 53,
    endsWith: 100,
    chapters: [
      Chapter(
        number: 1,
        title: "Розвиток основ конституційного ладу",
        startsWith: 53,
        endsWith: 58
      ),
      Chapter(
        number: 2,
        title: "Президент Придністровської Молдавської Республіки",
        startsWith: 59,
        endsWith: 66
      ),
      Chapter(
        number: 3,
        title: "Верховна рада Придністровської Молдавської Республіки",
        startsWith: 67,
        endsWith: 76
      ),
      Chapter(
        number: 3.1,
        title: "Уряд Придністровської Молдавській Республіки",
        startsWith: 76.1,
        endsWith: 76.8
      ),
      Chapter(
        number: 4,
        title: "Місцеве державне управління і місцеве самоврядування",
        startsWith: 77,
        endsWith: 79
      ),
      Chapter(
        number: 5,
        title: "Судова влада",
        startsWith: 80, 
        endsWith: 91
      ),
      Chapter(
        number: 6,
        title: "Нагляд за точним і однаковим виконанням Конституції і законів Придністровської Молдавської Республіки",
        startsWith: 92,
        endsWith: 92
      ),
      Chapter(
        number: 7,
        title: "Оборона, безпека і правоохоронна діяльність",
        startsWith: 93,
        endsWith: 95
      ),
      Chapter(
        number: 8,
        title: "Фінансова та бюджетна система",
        startsWith: 96,
        endsWith: 100
      )
    ]
  ),
  Section(
    name: "IV",
    title: "Зміна Конституції",
    startsWith: 101,
    endsWith: 106
  ),
  Section(
    name: "V",
    title: "Перехідні норми й положення",
    startsWith: 1,
    endsWith: 7
  )
];
