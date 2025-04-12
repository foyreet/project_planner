pragma Singleton
import QtQuick 2.15

QtObject {
    property var currentUser: null // Текущий пользователь

    // Вход в систему
    function login(username, password) {
        const user = UserModel.authenticate(username, password)
        if (user) {
            currentUser = user
            console.log("Вход выполнен:", currentUser)
            return true
        }
        console.warn("Ошибка входа")
        return false
    }

    // Выход из системы
    function logout() {
        currentUser = null
        console.log("Выход выполнен")
    }

    // Проверка прав доступа
    function hasPermission(role) {
        return currentUser && currentUser.role === role
    }
}
