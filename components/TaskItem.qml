import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    width: parent.width
    height: column.height + 20
    
    Column {
        id: column
        spacing: 5
        
        Text { text: model.title; font.bold: true }
        Text { text: model.description }
        Text { text: "Приоритет: " + model.priority }
        Text { text: "Исполнитель: " + model.assignee }
        
        Button {
            text: "Добавить комментарий"
            onClicked: {
                // Логика добавления комментария
            }
        }
    }
    
    MouseArea {
        anchors.fill: parent
        onClicked: pageStack.push(Qt.resolvedUrl("EditTaskPage.qml"), {taskId: model.id})
    }
}
