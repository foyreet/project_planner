import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Вход в систему"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        TextField { id: usernameField; placeholderText: "Имя пользователя"; Layout.fillWidth: true }
        TextField { id: passwordField; placeholderText: "Пароль"; echoMode: TextInput.Password; Layout.fillWidth: true }

        Button {
            text: "Войти"
            enabled: usernameField.text.length > 0 && passwordField.text.length > 0
            onClicked: {
                if (AuthService.login(usernameField.text, passwordField.text)) {
                    pageStack.push(Qt.resolvedUrl("HomePage.qml"))
                } else {
                    errorDialog.open()
                }
            }
        }

        Dialog {
            id: errorDialog
            title: "Ошибка"
            contentItem: Text { text: "Неверное имя пользователя или пароль" }
            standardButtons: Dialog.Ok
        }
    }
}
