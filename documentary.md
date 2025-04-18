3.1. main.qml
Описание : Главный файл приложения, который инициализирует интерфейс и управляет навигацией между страницами.
Функционал :
Загрузка начальной страницы (LoginPage).
Управление стеком страниц (pageStack).
Настройка бокового меню (Drawer) для навигации.

3.2. components/
TaskItem.qml
Описание : Компонент для отображения одной задачи в списке.
Функционал :
Отображение заголовка, описания, приоритета и статуса задачи.
Возможность перехода на страницу деталей задачи (TaskDetailsPage).
CommentItem.qml
Описание : Компонент для отображения одного комментария.
Функционал :
Отображение автора, текста и времени создания комментария.
Возможность удаления комментария (если у пользователя есть права).

SearchForm.qml
Описание : Форма для поиска задач.
Функционал :
Выбор параметра поиска (ID, имя пользователя, email, статус).
Ввод значения для поиска.
Отправка запроса на поиск задач.

4. Страницы
4.1. HomePage.qml
Описание : Главная страница приложения для просмотра текущих задач пользователя.
Функционал :
Отображение списка задач с использованием TaskItem.
Кнопка для создания новой задачи (CreateTaskPage).

4.2. CreateTaskPage.qml
Описание : Страница для создания новой задачи.
Функционал :
Форма с полями: заголовок, описание, приоритет, исполнитель, комментарий (опционально).
Валидация данных перед отправкой.
Сохранение задачи в базу данных.

4.3. EditTaskPage.qml
Описание : Страница для редактирования или удаления задачи.
Функционал :
Форма с заполненными данными выбранной задачи.
Возможность обновить данные задачи или удалить её.

4.4. SearchPage.qml
Описание : Страница для поиска задач.
Функционал :
Использование SearchForm для выбора параметров поиска.
Отображение результатов поиска в виде списка задач.

4.5. LoginPage.qml
Описание : Страница для входа в систему.
Функционал :
Форма для ввода имени пользователя и пароля.
Проверка данных через AuthService.
Переход на главную страницу после успешного входа.

4.6. TaskDetailsPage.qml
Описание : Страница для просмотра деталей задачи.
Функционал :
Отображение всей информации о задаче (заголовок, описание, приоритет, статус, исполнитель).
Отображение списка комментариев.
Возможность добавить новый комментарий.

5. Модели
5.1. TaskModel.qml
Описание : Модель для управления задачами.
Функционал :
Создание, обновление, удаление задач.
Поиск задач по различным параметрам.
Хранение данных задач в формате ListModel.

5.2. UserModel.qml
Описание : Модель для управления пользователями.
Функционал :
Создание новых пользователей.
Аутентификация пользователей.
Хранение данных пользователей в формате ListModel.

5.3. CommentModel.qml
Описание : Модель для управления комментариями.
Функционал :
Создание и удаление комментариев.
Получение комментариев для конкретной задачи.
Хранение данных комментариев в формате ListModel.
6. Сервисы
6.1. AuthService.qml
Описание : Сервис для аутентификации пользователей.
Функционал :
Вход в систему с проверкой имени пользователя и пароля.
Выход из системы.
Проверка прав доступа (например, роль администратора).

6.2. ApiService.qml
Описание : Сервис для взаимодействия с сервером.
Функционал :
Загрузка данных задач и пользователей с сервера.
Сохранение данных на сервере.

6.3. VoiceService.qml
Описание : Сервис для обработки голосовых команд.
Функционал :
Распознавание команд (например, "добавить задачу", "найти задачу").
Выполнение соответствующих действий в приложении.

7. Утилиты
7.1. Validator.qml
Описание : Утилита для валидации данных.
Функционал :
Проверка заголовка задачи (не пустой).
Проверка email (корректный формат).
Проверка пароля (минимум 6 символов).

7.2. Formatter.qml
Описание : Утилита для форматирования данных.
Функционал :
Форматирование даты и времени.
Преобразование приоритета задачи в читаемый вид (например, "Низкий", "Средний", "Высокий").
Преобразование статуса задачи в читаемый вид (например, "Новая", "В работе", "Завершена").
8. Сценарии использования
8.1. Создание задачи
Администратор переходит на страницу CreateTaskPage.
Заполняет форму с заголовком, описанием, приоритетом, исполнителем и комментарием.
Нажимает кнопку "Создать".
Задача сохраняется в TaskModel и отображается на главной странице.
8.2. Поиск задач
Администратор переходит на страницу SearchPage.
Выбирает параметр поиска (например, ID) и вводит значение.
Нажимает кнопку "Поиск".
Результаты поиска отображаются в виде списка задач.
8.3. Добавление комментария
Пользователь переходит на страницу TaskDetailsPage.
Вводит текст комментария в форму.
Нажимает кнопку "Добавить".
Комментарий сохраняется в CommentModel и отображается в списке комментариев.
9. Дополнительные замечания
Голосовой ассистент : Все ключевые действия (создание, поиск, удаление задач) поддерживают голосовые команды через VoiceService.
Аутентификация : Только авторизованные пользователи могут взаимодействовать с задачами.
Расширяемость : Архитектура позволяет легко добавлять новые функции (например, уведомления о дедлайнах, интеграцию с календарем).
