import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Поиск задач"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        ComboBox {
            id: searchType
            Layout.fillWidth: true
            model: ["ID", "Имя пользователя", "Email", "Статус"]
        }
        TextField { id: searchValue; placeholderText: "Введите значение"; Layout.fillWidth: true }

        Button {
            text: "Поиск"
            onClicked: {
                const results = TaskModel.searchTasks(searchType.currentText, searchValue.text)
                resultList.model = results
            }
        }

        ListView {
            id: resultList
            width: parent.width
            height: parent.height - 150
            model: []
            clip: true

            delegate: TaskItem {
                width: resultList.width
                onClicked: pageStack.push(Qt.resolvedUrl("EditTaskPage.qml"), { taskId: model.id })
            }
        }
    }
}
