import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Создать задачу"

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
        TextArea { id: commentField; placeholderText: "Комментарий (опционально)"; Layout.fillWidth: true }

        RowLayout {
            Button {
                text: "Отмена"
                onClicked: pageStack.pop()
            }
            Button {
                text: "Создать"
                enabled: titleField.text.length > 0 && descriptionField.text.length > 0
                onClicked: {
                    TaskModel.createTask({
                        title: titleField.text,
                        description: descriptionField.text,
                        priority: priorityField.currentText,
                        assignee: assigneeField.text,
                        comments: commentField.text
                    })
                    pageStack.pop()
                }
            }
        }
    }
}
