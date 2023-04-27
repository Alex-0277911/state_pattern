// pattern state можна реалізувати в Dart для метеорологічної програми:

// Ось приклад використання цих класів:

// У цьому прикладі ми маємо абстрактний клас WeatherState з єдиним методом
// display, який виводить опис поточної погоди.

abstract class WeatherState {
  void display();
}

// Також у нас є три конкретні класи WeatherState: SunnyState, CloudyState і
// RainyState. Кожен клас по-різному реалізує метод display для опису погодних умов.

class SunnyState implements WeatherState {
  @override
  void display() {
    print('The weather is sunny and warm');
  }
}

class CloudyState implements WeatherState {
  @override
  void display() {
    print('The weather is cloudy and cool');
  }
}

class RainyState implements WeatherState {
  @override
  void display() {
    print('The weather is rainy and wet');
  }
}

// Клас Weather є контекстним класом, який зберігає поточний стан погоди. Він
// має метод setState, який приймає об'єкт WeatherState і оновлює поточний стан.
// Він також має метод displayWeather, який викликає метод відображення
// поточного стану для виведення опису погоди.

class Weather {
  WeatherState _state = SunnyState();

  void setState(WeatherState state) {
    _state = state;
  }

  void displayWeather() {
    _state.display();
  }
}

void main() {
  final weather = Weather();
  weather.displayWeather();

  weather.setState(CloudyState());
  weather.displayWeather();

  weather.setState(RainyState());
  weather.displayWeather();
}

// Цей код створює об'єкт Weather і викликає його метод displayWeather, який
// виводить поточний стан погоди (за замовчуванням SunnyState). Потім
// викликається метод setState з різними об'єктами WeatherState для оновлення
// поточного стану погоди. Нарешті, знову викликається метод displayWeather для
// виведення оновленого стану погоди.

// Це простий приклад того, як паттерн State можна використовувати для
// інкапсуляції поведінки об'єкта на основі його внутрішнього стану. Визначивши
// набір класів станів, які інкапсулюють поведінку для кожного можливого стану
// об'єкта, ми можемо легко оновлювати поведінку об'єкта, змінюючи його стан.
// Це може бути особливо корисно в додатках, де поведінка об'єкта залежить від
// зовнішніх факторів, таких як погодні умови.