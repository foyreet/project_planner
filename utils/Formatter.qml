pragma Singleton
import QtQuick 2.15

QtObject {
    // Форматирование даты
    function formatDate(timestamp) {
        const date = new Date(timestamp)
        return date.toLocaleDateString() + " " + date.toLocaleTimeString()
    }

    // Форматирование приоритета задачи
    function formatPriority(priority) {
        switch (priority) {
            case "low": return "Низкий"
            case "medium": return "Средний"
            case "high": return "Высокий"
            default: return "Неизвестно"
        }
    }

    // Форматирование статуса задачи
    function formatStatus(status) {
        switch (status) {
            case "new": return "Новая"
            case "in_progress": return "В работе"
            case "completed": return "Завершена"
            default: return "Неизвестно"
        }
    }
}
