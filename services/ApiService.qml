pragma Singleton
import QtQuick 2.15

QtObject {
    // Загрузка данных задач
    function fetchTasks() {
        // Пример запроса к API
        console.log("Загрузка задач с сервера...")
        return TaskModel // Или данные с сервера
    }

    // Сохранение данных задач
    function saveTasks(tasks) {
        // Пример отправки данных на сервер
        console.log("Сохранение задач на сервере...")
        tasks.forEach(task => {
            TaskModel.createTask(task)
        })
    }

    // Загрузка данных пользователей
    function fetchUsers() {
        console.log("Загрузка пользователей с сервера...")
        return UserModel // Или данные с сервера
    }
}
