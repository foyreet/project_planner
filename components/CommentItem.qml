import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: commentItem
    width: parent.width
    height: column.height + 20
    property var commentData: {}

    ColumnLayout {
        id: column
        spacing: 5
        anchors.fill: parent
        anchors.margins: 10

        // Заголовок с информацией о пользователе и времени
        RowLayout {
            spacing: 10
            Text {
                text: commentData.author || "Неизвестный автор"
                font.bold: true
                color: "#333"
            }
            Text {
                text: formatTimestamp(commentData.timestamp)
                color: "#666"
                font.pointSize: 10
            }
        }

        // Текст комментария
        Text {
            text: commentData.text
            wrapMode: Text.Wrap
            color: "#333"
            Layout.fillWidth: true
        }

        // Кнопка удаления (если пользователь имеет права)
        Button {
            visible: commentData.canDelete
            text: "Удалить"
            background: Rectangle { color: "red" }
            onClicked: {
                // Логика удаления комментария
                commentModel.deleteComment(commentData.id)
            }
        }
    }

    // Функция форматирования времени
    function formatTimestamp(timestamp) {
        if (!timestamp) return ""
        var date = new Date(timestamp)
        return date.toLocaleDateString() + " " + date.toLocaleTimeString()
    }
}
