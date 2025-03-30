import React, { useState, useEffect } from 'react';
import { Card, CardContent, Button, Input, Select, SelectItem } from '@/components/ui';

const priorities = ['Low', 'Medium', 'High'];

const App = () => {
  const [tasks, setTasks] = useState([]);
  const [newTask, setNewTask] = useState({ title: '', priority: 'Medium' });

  useEffect(() => {
    const savedTasks = JSON.parse(localStorage.getItem('tasks')) || [];
    setTasks(savedTasks);
  }, []);

  useEffect(() => {
    localStorage.setItem('tasks', JSON.stringify(tasks));
  }, [tasks]);

  const addTask = () => {
    if (!newTask.title) return;
    setTasks([...tasks, { ...newTask, id: Date.now(), completed: false }]);
    setNewTask({ title: '', priority: 'Medium' });
  };

  const toggleTask = (id) => {
    setTasks(tasks.map(task => task.id === id ? { ...task, completed: !task.completed } : task));
  };

  const deleteTask = (id) => {
    setTasks(tasks.filter(task => task.id !== id));
  };

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold">Task Planner</h1>
      <div className="my-4 flex gap-2">
        <Input
          placeholder="Task Title"
          value={newTask.title}
          onChange={(e) => setNewTask({ ...newTask, title: e.target.value })}
        />
        <Select onValueChange={(value) => setNewTask({ ...newTask, priority: value })} value={newTask.priority}>
          {priorities.map(priority => (
            <SelectItem key={priority} value={priority}>{priority}</SelectItem>
          ))}
        </Select>
        <Button onClick={addTask}>Add Task</Button>
      </div>
      <div>
        {tasks.map(task => (
          <Card key={task.id} className="mb-2">
            <CardContent className="flex justify-between items-center">
              <div>
                <p className={`font-semibold ${task.completed ? 'line-through' : ''}`}>{task.title}</p>
                <p className={`text-sm ${task.priority === 'High' ? 'text-red-500' : 'text-gray-500'}`}>{task.priority}</p>
              </div>
              <div>
                <Button onClick={() => toggleTask(task.id)}>{task.completed ? 'Undo' : 'Complete'}</Button>
                <Button onClick={() => deleteTask(task.id)} className="ml-2">Delete</Button>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
};

export default App;

