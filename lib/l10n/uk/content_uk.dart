import '../../classes/chapter.dart';
import '../../classes/section.dart';

List<Section> contentUK = [
  Section(
      name: "П",
      title: "ПРЕАМБУЛА",
      startsWith: 0,
      endsWith: 0
  ),
  Section(
    name: "I",
    title: "ОСНОВИ КОНСТИТУЦІЙНОГО УСТРОЮ",
    startsWith: 1,
    endsWith: 15
  ),
  Section(
    name: "II",
    title: "ПРАВА, СВОБОДИ, ОБОВ’ЯЗКИ ЛЮДИНИ І ГРОМАДЯНИНА І ЇХ ГАРАНТІЇ",
    startsWith: 16,
    endsWith: 52
  ),
  Section(
    name: "III",
    title: "ОСНОВИ ДЕРЖАВНОГО УПРАВЛІННЯ",
    startsWith: 53,
    endsWith: 100,
    chapters: [
      Chapter(
        number: 1,
        title: "РОЗВИТОК ОСНОВ КОНСТИТУЦІЙНОГО ЛАДУ",
        startsWith: 53,
        endsWith: 58
      ),
      Chapter(
        number: 2,
        title: "ПРЕЗИДЕНТ ПРИДНІСТРОВСЬКОЇ МОЛДАВСЬКОЇ РЕСПУБЛІКИ",
        startsWith: 59,
        endsWith: 66
      ),
      Chapter(
        number: 3,
        title: "ВЕРХОВНА РАДА ПРИДНІСТРОВСЬКОЇ МОЛДАВСЬКОЇ РЕСПУБЛІКИ",
        startsWith: 67,
        endsWith: 76
      ),
      Chapter(
        number: 3.1,
        title: "УРЯД ПРИДНІСТРОВСЬКОЇ МОЛДАВСЬКІЙ РЕСПУБЛІКИ",
        startsWith: 76.1,
        endsWith: 76.8
      ),
      Chapter(
        number: 4,
        title: "МІСЦЕВЕ ДЕРЖАВНЕ УПРАВЛІННЯ І МІСЦЕВЕ САМОВРЯДУВАННЯ",
        startsWith: 77,
        endsWith: 79
      ),
      Chapter(
        number: 5,
        title: "СУДОВА ВЛАДА",
        startsWith: 80, 
        endsWith: 91
      ),
      Chapter(
        number: 6,
        title: "НАГЛЯД ЗА ТОЧНИМ І ОДНАКОВИМ ВИКОНАННЯМ КОНСТИТУЦІЇ І ЗАКОНІВ ПРИДНІСТРОВСЬКОЇ МОЛДАВСЬКОЇ РЕСПУБЛІКИ",
        startsWith: 92,
        endsWith: 92
      ),
      Chapter(
        number: 7,
        title: "ОБОРОНА, БЕЗПЕКА І ПРАВООХОРОННА ДІЯЛЬНІСТЬ",
        startsWith: 93,
        endsWith: 95
      ),
      Chapter(
        number: 8,
        title: "ФІНАНСОВА ТА БЮДЖЕТНА СИСТЕМА",
        startsWith: 96,
        endsWith: 100
      )
    ]
  ),
  Section(
    name: "IV",
    title: "ЗМІНА КОНСТИТУЦІЇ",
    startsWith: 101,
    endsWith: 106
  ),
  Section(
    name: "V",
    title: "ПЕРЕХІДНІ НОРМИ Й ПОЛОЖЕННЯ",
    startsWith: 1,
    endsWith: 7
  )
];
