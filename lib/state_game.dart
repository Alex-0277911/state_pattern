// У цьому прикладі ми маємо абстрактний клас GameState з єдиним методом display,
// який виводить опис поточного стану гри.

abstract class GameState {
  void display();
}

// Також у нас є три конкретні класи GameState: PlayingState, TimeoutState і
// HalftimeState. Кожен клас по-різному реалізує метод display для опису стану гри.

class PlayingState implements GameState {
  @override
  void display() {
    print('The game is currently being played');
  }
}

class TimeoutState implements GameState {
  @override
  void display() {
    print('The game is currently in a timeout');
  }
}

class HalftimeState implements GameState {
  @override
  void display() {
    print('The game is currently at halftime');
  }
}

// Клас Game є контекстним класом, який зберігає поточний стан гри. Він має
// метод setState, який приймає об'єкт GameState і оновлює поточний стан.
// Він також має метод displayGameStatus, який викликає метод display для
// поточного стану, щоб вивести опис стану гри.

class Game {
  GameState _state = PlayingState();

  void setState(GameState state) {
    _state = state;
  }

  void displayGameStatus() {
    _state.display();
  }
}

// Ось приклад використання цих класів:

void main() {
  final game = Game();
  game.displayGameStatus();

  game.setState(TimeoutState());
  game.displayGameStatus();

  game.setState(HalftimeState());
  game.displayGameStatus();
}

// Цей код створює об'єкт Game і викликає його метод displayGameStatus, який
// виводить поточний стан гри (за замовчуванням PlayingState). Потім викликається
// метод setState з різними об'єктами GameState для оновлення поточного стану гри.
// Нарешті, знову викликається метод displayGameStatus для виведення оновленого стану гри.

// Це простий приклад того, як паттерн State можна використовувати для інкапсуляції
// поведінки об'єкта на основі його внутрішнього стану. Визначивши набір класів станів,
// які інкапсулюють поведінку для кожного можливого стану об'єкта, ми можемо легко оновлювати
// поведінку об'єкта, змінюючи його стан. Це може бути особливо корисно в додатках,
// де поведінка об'єкта залежить від зовнішніх факторів, наприклад, від стану спортивної гри.