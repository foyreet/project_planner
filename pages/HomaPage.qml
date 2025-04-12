import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Текущие задачи"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        // Список задач
        ListView {
            id: taskList
            width: parent.width
            height: parent.height - 60
            model: TaskModel {}
            clip: true

            delegate: TaskItem {
                width: taskList.width
                onClicked: pageStack.push(Qt.resolvedUrl("EditTaskPage.qml"), { taskId: model.id })
            }
        }

        // Кнопка добавления задачи
        FloatingActionButton {
            icon.name: "add"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: pageStack.push(Qt.resolvedUrl("CreateTaskPage.qml"))
        }
    }
}
