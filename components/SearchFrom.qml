import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ColumnLayout {
    id: searchForm
    spacing: 10
    anchors.fill: parent

    // Выбор параметра для поиска
    ComboBox {
        id: searchType
        Layout.fillWidth: true
        model: ["ID", "Имя пользователя", "Email", "Статус"]
        textRole: "text"
        placeholderText: "Выберите параметр поиска"
    }

    // Поле ввода значения для поиска
    TextField {
        id: searchValue
        Layout.fillWidth: true
        placeholderText: "Введите значение для поиска"
        enabled: searchType.currentIndex !== -1
    }

    // Кнопка поиска
    Button {
        text: "Поиск"
        enabled: searchType.currentIndex !== -1 && searchValue.text.length > 0
        onClicked: {
            // Вызываем функцию поиска с выбранными параметрами
            searchTask(searchType.currentText, searchValue.text)
        }
    }

    // Сигнал для передачи данных в родительский компонент
    signal searchTask(string type, string value)
}
