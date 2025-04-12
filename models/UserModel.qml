import QtQuick 2.15

ListModel {
    id: userModel

    // Создание нового пользователя
    function createUser(userData) {
        var existingUser = getUserByUsername(userData.username)
        if (existingUser) {
            console.warn("Пользователь с таким именем уже существует")
            return false
        }

        append({
            id: generateUniqueId(),
            username: userData.username,
            password: hashPassword(userData.password), // Хешируем пароль для безопасности
            email: userData.email,
            role: userData.role || "user", // По умолчанию роль "user"
            createdAt: new Date().getTime()
        })
        return true
    }

    // Аутентификация пользователя
    function authenticate(username, password) {
        var user = getUserByUsername(username)
        if (!user) {
            console.warn("Пользователь не найден")
            return null
        }

        if (user.password === hashPassword(password)) {
            return user
        } else {
            console.warn("Неверный пароль")
            return null
        }
    }

    // Получение пользователя по имени пользователя
    function getUserByUsername(username) {
        for (var i = 0; i < count; i++) {
            var user = get(i)
            if (user.username.toLowerCase() === username.toLowerCase()) {
                return user
            }
        }
        return null
    }

    // Обновление данных пользователя
    function updateUser(userId, updatedData) {
        for (var i = 0; i < count; i++) {
            var user = get(i)
            if (user.id === userId) {
                set(i, updatedData)
                break
            }
        }
    }

    // Удаление пользователя
    function deleteUser(userId) {
        for (var i = 0; i < count; i++) {
            var user = get(i)
            if (user.id === userId) {
                remove(i)
                break
            }
        }
    }

    // Генерация уникального ID для пользователя
    function generateUniqueId() {
        return Math.random().toString(36).substr(2, 9)
    }

    // Хеширование пароля (простая реализация для примера)
    function hashPassword(password) {
        // В реальном приложении используйте криптографически безопасные методы
        return password.split("").reverse().join("") + "_hash"
    }
}
