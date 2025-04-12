import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.20 as Kirigami

Kirigami.ApplicationWindow {
    id: root
    width: 360
    height: 640
    
    pageStack.initialPage: LoginPage {}
    
    Drawer {
        id: navDrawer
        width: Math.min(root.width * 0.8, 300)
        
        ColumnLayout {
            anchors.fill: parent
            
            Button { text: "Главная"; onClicked: pageStack.push(Qt.resolvedUrl("pages/HomePage.qml")) }
            Button { text: "Поиск задач"; onClicked: pageStack.push(Qt.resolvedUrl("pages/SearchPage.qml")) }
            Button { text: "Добавить задачу"; onClicked: pageStack.push(Qt.resolvedUrl("pages/CreateTaskPage.qml")) }
            Button { text: "Выйти"; onClicked: authService.logout() }
        }
    }
}
