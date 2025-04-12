pragma Singleton
import QtQuick 2.15

QtObject {
    // Обработка голосовой команды
    function processCommand(command) {
        console.log("Получена голосовая команда:", command)

        if (command.includes("добавить задачу")) {
            return { action: "createTask" }
        } else if (command.includes("найти задачу")) {
            return { action: "searchTask", query: extractQuery(command) }
        } else if (command.includes("удалить задачу")) {
            return { action: "deleteTask", taskId: extractId(command) }
        }

        console.warn("Команда не распознана")
        return null
    }

    // Извлечение текстового запроса из команды
    function extractQuery(command) {
        return command.split(" ").slice(2).join(" ")
    }

    // Извлечение ID задачи из команды
    function extractId(command) {
        const match = command.match(/(\d+)/)
        return match ? parseInt(match[0]) : null
    }
}
