const express = require('express');

const server = express();

const projects = [];

// Crie um middleware que será utilizado em todas rotas que recebem o ID do projeto nos parâmetros da URL que verifica se o projeto com aquele ID existe.
// Se não existir retorne um erro, caso contrário permita a requisição continuar normalmente;
CheckProjectExists = (req, res, next) => {
  const { id } = req.params;

  if (!projects.find(p => p.id == id)) {
    return res.status(400).json({ error: 'Project not found.' });
  }

  next();
};

// Crie um middleware global chamado em todas requisições que imprime (console.log) uma contagem de quantas requisições foram feitas na aplicação até então;
CountRequests = (req, res, next) => {
  console.count('Requests count');

  next();
};

server.use(express.json());

// GET - Return all projects
server.get('/projects', CountRequests, (req, res) => {
  return res.json(projects);
});

// POST - Add new project
// Request body: id, title
server.post('/projects', CountRequests, (req, res) => {
  const { id, title } = req.body;

  projects.push({ id, title, tasks: [] });

  return res.json(projects);
});

// PUT - Update the project's title
// Route params: id
// Request body: title
server.put('/projects/:id', CountRequests, CheckProjectExists, (req, res) => {
  const { id } = req.params;
  const { title } = req.body;

  const project = projects.find(p => p.id == id);
  project.title = title;

  return res.json(project);
});

// DELETE - Delete project by id
// Route params: id
server.delete(
  '/projects/:id',
  CountRequests,
  CheckProjectExists,
  (req, res) => {
    const { id } = req.params;

    const projectIndex = projects.findIndex(p => p.id == id);
    projects.splice(projectIndex, 1);

    return res.json(projects);
  }
);

// POST - Add new tasks to project by id
// Route params: id
// Request body: title
server.post('/projects/:id/tasks', CheckProjectExists, (req, res) => {
  const { id } = req.params;
  const { title } = req.body;

  const project = projects.find(p => p.id == id);

  project.tasks.push(title);

  return res.json(projects);
});

server.listen(8080);
