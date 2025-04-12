pragma Singleton
import QtQuick 2.15

QtObject {
    // Проверка заголовка задачи
    function validateTitle(title) {
        if (!title || title.trim().length === 0) {
            console.warn("Заголовок не может быть пустым")
            return false
        }
        return true
    }

    // Проверка email
    function validateEmail(email) {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
        if (!regex.test(email)) {
            console.warn("Неверный формат email")
            return false
        }
        return true
    }

    // Проверка пароля
    function validatePassword(password) {
        if (password.length < 6) {
            console.warn("Пароль должен содержать минимум 6 символов")
            return false
        }
        return true
    }
}
