import '../../classes/chapter.dart';
import '../../classes/section.dart';

List<Section> contentMD = [
  Section(
    name: "П",
    title: "Преамбул",
    startsWith: 0,
    endsWith: 0
  ),
  Section(
    name: "I",
    title: "Базеле реӂимулуй конституционал",
    startsWith: 1,
    endsWith: 15
  ),
  Section(
    name: "II",
    title: "Дрептуриле, либертэциле, облигациуниле ши гаранцииле омулуй ши четэцянулуй",
    startsWith: 16,
    endsWith: 52
  ),
  Section(
    name: "III",
    title: "Базеле администрэрий де стат",
    startsWith: 53,
    endsWith: 100,
    chapters: [
      Chapter(
        number: 1,
        title: "Дезволтаря орындуирий базелор куонституционале",
        startsWith: 53,
        endsWith: 58
      ),
      Chapter(
        number: 2,
        title: "Прешединтеле Републичий Молдовенешть Нистрене",
        startsWith: 59,
        endsWith: 66
      ),
      Chapter(
        number: 3,
        title: "Советул супрем ал Републичий Молдовенешть Нистрене",
        startsWith: 67,
        endsWith: 76
      ),
      Chapter(
        number: 3.1,
        title: "Гувернул Републичий Молдовенешть Нистрене",
        startsWith: 76.1,
        endsWith: 76.8
      ),
      Chapter(
        number: 4,
        title: "Администраря локалэ де стат ши аутоадминистраря локалэ",
        startsWith: 77,
        endsWith: 79
      ),
      Chapter(
        number: 5,
        title: "Ауторитатя жудекэторяскэ",
        startsWith: 80, 
        endsWith: 91
      ),
      Chapter(
        number: 6,
        title: "Суправегеря апликэрий стрикте конформ конституцией лежилор Републичий Модлдовенешть Нистрене",
        startsWith: 92,
        endsWith: 92
      ),
      Chapter(
        number: 7,
        title: "Апэраря, секуритатя ши апликаря лежий",
        startsWith: 93,
        endsWith: 95
      ),
      Chapter(
        number: 8,
        title: "Финансаря ши системул бужетар",
        startsWith: 96,
        endsWith: 100
      )
    ]
  ),
  Section(
    name: "IV",
    title: "Модификаря конституцией",
    startsWith: 101,
    endsWith: 106
  ),
  Section(
    name: "V",
    title: "Нормеле ши регулиле транзиторий",
    startsWith: 1,
    endsWith: 7
  )
];
