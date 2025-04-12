import QtQuick 2.15

ListModel {
    id: taskModel

    // Создание новой задачи
    function createTask(taskData) {
        append({
            id: generateUniqueId(),
            title: taskData.title,
            description: taskData.description,
            priority: taskData.priority,
            assignee: taskData.assignee,
            status: "Новая", // По умолчанию статус "Новая"
            comments: taskData.comments ? [taskData.comments] : [],
            createdAt: new Date().getTime()
        })
    }

    // Получение задачи по ID
    function getTaskById(taskId) {
        for (var i = 0; i < count; i++) {
            var task = get(i)
            if (task.id === taskId) {
                return task
            }
        }
        return null
    }

    // Обновление задачи
    function updateTask(taskId, updatedData) {
        for (var i = 0; i < count; i++) {
            var task = get(i)
            if (task.id === taskId) {
                set(i, updatedData)
                break
            }
        }
    }

    // Удаление задачи
    function deleteTask(taskId) {
        for (var i = 0; i < count; i++) {
            var task = get(i)
            if (task.id === taskId) {
                remove(i)
                break
            }
        }
    }

    // Поиск задач
    function searchTasks(searchType, searchValue) {
        var results = []
        for (var i = 0; i < count; i++) {
            var task = get(i)
            switch (searchType) {
                case "ID":
                    if (String(task.id).includes(searchValue)) results.push(task)
                    break
                case "Имя пользователя":
                    if (task.assignee.toLowerCase().includes(searchValue.toLowerCase())) results.push(task)
                    break
                case "Email":
                    // Предполагается, что email хранится в assignee или другом поле
                    if (task.assignee.toLowerCase().includes(searchValue.toLowerCase())) results.push(task)
                    break
                case "Статус":
                    if (task.status.toLowerCase() === searchValue.toLowerCase()) results.push(task)
                    break
            }
        }
        return results
    }

    // Добавление комментария к задаче
    function addComment(taskId, comment) {
        for (var i = 0; i < count; i++) {
            var task = get(i)
            if (task.id === taskId) {
                var updatedComments = task.comments ? task.comments.concat([comment]) : [comment]
                setProperty(i, "comments", updatedComments)
                break
            }
        }
    }

    // Удаление комментария из задачи
    function deleteComment(taskId, commentId) {
        for (var i = 0; i < count; i++) {
            var task = get(i)
            if (task.id === taskId) {
                var updatedComments = task.comments.filter(comment => comment.id !== commentId)
                setProperty(i, "comments", updatedComments)
                break
            }
        }
    }

    // Генерация уникального ID для задачи
    function generateUniqueId() {
        return Math.random().toString(36).substr(2, 9)
    }
}
