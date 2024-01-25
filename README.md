# Contexto
A tarefa é desenvolver uma api com três endpoints. Um para listar projetos, outro para receber projetos e suas avaliações e outro para cadastro de critérios de avaliação. Abaixo segue as entidades e os campos de cada uma:

## TODOs

- [x] Configurar MySQL;
- [x] Rails framework;
- [x] Configurar Postman e exportar schema;
- [x] Criar endpoint /projetos para cadastrar projetos com avaliações e notas;
- [x] Criar endpoint /projetos para consultar projetos;
  - [x] aceitar de 25 a 100 projetos por página;
  - [x] adicionar headers com dados da paginação
- [x] Criar endpoint /criterios para cadastrar critérios;
- [x] Ao atualizar uma nota, a média da avaliação e do projeto devem ser atualizadas;
- [x] Ao atualizar um critério, a média da avaliação e do projeto devem ser atualizadas;
- [x] Criar uma base teste com 1000 projetos com 5 notas para cada um de 5 critérios;
- [x] Criar calculo para media_ponderada usando a fórmula  **(n1 * c1)+(n2 * c2)+..+(n5 * c5)/(c1+c2+..+c5)**;
- [x] Criar calculo para media_total do projeto usando a fórmula **(m1+m2+...+m5)/5**;

### Melhorias
- [ ] Adicionar criação e edição de notas pela interface
- [ ] Adicionar criação e edição de avaliações pela interface
- [x] Adicionar workers para calcular quando critérios são atualizados e não travar a requisição;

Projeto:
- nome: String
- media_total: Float

Avaliacao:
- media_ponderada: Float
- projeto_id: Integer

Nota:
- nota: Float
- avaliacao_id: Integer
- criterio_id: Integer

Criterio:
- peso: Float

![image](https://github.com/fagnerpereira/prosas-project/assets/4353880/e334818f-2773-4695-838f-b8fc455ea12f)
