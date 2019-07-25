import '../../classes/chapter.dart';
import '../../classes/section.dart';

List<Section> content_md = [
  Section(
    name: "П",
    title: "ПРЕАМБУЛ",
    startsWith: 0,
    endsWith: 0
  ),
  Section(
    name: "I",
    title: "БАЗЕЛЕ РЕӁИМУЛУЙ КОНСТИТУЦИОНАЛ",
    startsWith: 1,
    endsWith: 15
  ),
  Section(
    name: "II",
    title: "ДРЕПТУРИЛЕ, ЛИБЕРТЭЦИЛЕ, ОБЛИГАЦИУНИЛЕ ШИ ГАРАНЦИИЛЕ ОМУЛУЙ ШИ ЧЕТЭЦЯНУЛУЙ",
    startsWith: 16,
    endsWith: 52
  ),
  Section(
    name: "III",
    title: "БАЗЕЛЕ АДМИНИСТРЭРИЙ ДЕ СТАТ",
    startsWith: 53,
    endsWith: 100,
    chapters: [
      Chapter(
        number: 1,
        title: "ДЕЗВОЛТАРЯ ОРЫНДУИРИЙ БАЗЕЛОР КУОНСТИТУЦИОНАЛЕ",
        startsWith: 53,
        endsWith: 58
      ),
      Chapter(
        number: 2,
        title: "ПРЕШЕДИНТЕЛЕ РЕПУБЛИЧИЙ МОЛДОВЕНЕШТЬ НИСТРЕНЕ",
        startsWith: 59,
        endsWith: 66
      ),
      Chapter(
        number: 3,
        title: "СОВЕТУЛ СУПРЕМ АЛ РЕПУБЛИЧИЙ МОЛДОВЕНЕШТЬ НИСТРЕНЕ",
        startsWith: 67,
        endsWith: 76
      ),
      Chapter(
        number: 3.1,
        title: "ГУВЕРНУЛ РЕПУБЛИЧИЙ МОЛДОВЕНЕШТЬ НИСТРЕНЕ",
        startsWith: 76.1,
        endsWith: 76.8
      ),
      Chapter(
        number: 4,
        title: "АДМИНИСТРАРЯ ЛОКАЛЭ ДЕ СТАТ ШИ АУТОАДМИНИСТРАРЯ ЛОКАЛЭ",
        startsWith: 77,
        endsWith: 79
      ),
      Chapter(
        number: 5,
        title: "АУТОРИТАТЯ ЖУДЕКЭТОРЯСКЭ",
        startsWith: 80, 
        endsWith: 91
      ),
      Chapter(
        number: 6,
        title: "СУПРАВЕГЕРЯ АПЛИКЭРИЙ СТРИКТЕ КОНФОРМ КОНСТИТУЦИЕЙ ЛЕЖИЛОР РЕПУБЛИЧИЙ МОДЛДОВЕНЕШТЬ НИСТРНЕ",
        startsWith: 92,
        endsWith: 92
      ),
      Chapter(
        number: 7,
        title: "АПЭРАРЯ, СЕКУРИТАТЯ ШИ АПЛИКАРЯ ЛЕЖИЙ",
        startsWith: 93,
        endsWith: 95
      ),
      Chapter(
        number: 8,
        title: "ФИНАНСАРЯ ШИ СИСТЕМУЛ БУЖЕТАР",
        startsWith: 96,
        endsWith: 100
      )
    ]
  ),
  Section(
    name: "IV",
    title: "МОДИФИКАРЯ КОНСТИТУЦИЕЙ",
    startsWith: 101,
    endsWith: 106
  ),
  Section(
    name: "V",
    title: "НОРМЕЛЕ ШИ РЕГУЛИЛЕ ТРАНЗИТОРИЙ",
    startsWith: 1,
    endsWith: 7
  )
];
