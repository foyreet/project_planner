import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    property int taskId: -1 // ID задачи, передается при открытии страницы
    title: "Детали задачи"

    Component.onCompleted: {
        if (taskId !== -1) {
            taskDetails = TaskModel.getTaskById(taskId)
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        // Блок с основной информацией о задаче
        GroupBox {
            title: "Информация о задаче"
            Layout.fillWidth: true
            ColumnLayout {
                spacing: 5

                Text { text: "Заголовок: " + taskDetails.title; font.bold: true }
                Text { text: "Описание: " + taskDetails.description }
                Text { text: "Приоритет: " + taskDetails.priority }
                Text { text: "Исполнитель: " + taskDetails.assignee }
                Text { text: "Статус: " + taskDetails.status }
            }
        }

        // Блок с комментариями
        GroupBox {
            title: "Комментарии"
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.4

            ColumnLayout {
                spacing: 10

                // Список комментариев
                ListView {
                    id: commentList
                    width: parent.width
                    height: parent.height - 60
                    model: taskDetails.comments
                    clip: true

                    delegate: CommentItem {
                        commentData: modelData
                    }
                }

                // Форма добавления комментария
                AddCommentForm {
                    onCommentAdded: {
                        commentList.model.push(comment)
                    }
                }
            }
        }
    }
}
