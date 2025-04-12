import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    property var taskId: -1
    title: "Редактировать задачу"

    Component.onCompleted: {
        if (taskId !== -1) {
            const task = TaskModel.getTaskById(taskId)
            titleField.text = task.title
            descriptionField.text = task.description
            priorityField.currentIndex = ["Низкий", "Средний", "Высокий"].indexOf(task.priority)
            assigneeField.text = task.assignee
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TextField { id: titleField; placeholderText: "Заголовок"; Layout.fillWidth: true }
        TextField { id: descriptionField; placeholderText: "Описание"; Layout.fillWidth: true }
        ComboBox {
            id: priorityField
            Layout.fillWidth: true
            model: ["Низкий", "Средний", "Высокий"]
        }
        TextField { id: assigneeField; placeholderText: "Исполнитель"; Layout.fillWidth: true }

        RowLayout {
            Button {
                text: "Удалить"
                onClicked: {
                    TaskModel.deleteTask(taskId)
                    pageStack.pop()
                }
            }
            Button {
                text: "Сохранить"
                enabled: titleField.text.length > 0 && descriptionField.text.length > 0
                onClicked: {
                    TaskModel.updateTask(taskId, {
                        title: titleField.text,
                        description: descriptionField.text,
                        priority: priorityField.currentText,
                        assignee: assigneeField.text
                    })
                    pageStack.pop()
                }
            }
        }
    }
}
