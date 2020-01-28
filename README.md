<h1 align="center">
    <img alt="GoStack" src="https://rocketseat-cdn.s3-sa-east-1.amazonaws.com/bootcamp-header.png" width="200px" />
</h1>

<h3 align="center">
  Challenge 1: NodeJS Concepts
</h3>

## :rocket: About the challenge

Build an application to store projects and it's tasks from scratch using [Express](https://expressjs.com/).

### Routes

- `POST /projects`: This route should receive an id and a title inside the request body and register a new project inside an array in the following format:  `{ id: "1", title: 'Novo projeto', tasks: [] }`;

- `GET /projects`: This route should return a list of all projects and it's tasks;

- `PUT /projects/:id`: This route should only update a project's `title` based on the `id` from the request parameters;

- `DELETE /projects/:id`: This route should delete a project based on the `id` from the request parameters;

- `POST /projects/:id/tasks`: This route should receive a `title` and store it as a task in a project based on the `id` from the request parameters;

### Example

If `POST /projects` route is called with a body `{ id: 1, title: 'New project' }` and  `POST /projects/1/tasks` route with a body `{ title: 'New task' }`, the projects array should be the as follows:

```js
[
  {
    id: "1",
    title: "New project",
    tasks: ["New task"]
  }
];
```
