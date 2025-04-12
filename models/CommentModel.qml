import QtQuick 2.15

ListModel {
    id: commentModel

    // Создание нового комментария
    function createComment(commentData) {
        append({
            id: generateUniqueId(),
            taskId: commentData.taskId, // ID задачи, к которой принадлежит комментарий
            author: commentData.author, // Автор комментария
            text: commentData.text,     // Текст комментария
            timestamp: new Date().getTime() // Временная метка создания
        })
    }

    // Удаление комментария
    function deleteComment(commentId) {
        for (var i = 0; i < count; i++) {
            var comment = get(i)
            if (comment.id === commentId) {
                remove(i)
                break
            }
        }
    }

    // Получение комментариев для конкретной задачи
    function getCommentsByTaskId(taskId) {
        var comments = []
        for (var i = 0; i < count; i++) {
            var comment = get(i)
            if (comment.taskId === taskId) {
                comments.push(comment)
            }
        }
        return comments
    }

    // Генерация уникального ID для комментария
    function generateUniqueId() {
        return Math.random().toString(36).substr(2, 9)
    }
}
