**As tecnologias requeridas são:**
- Rails framework
- Qualquer banco de dados (preferencial MySQL)

# Contexto
A tarefa é desenvolver uma api com três endpoints. Um para listar projetos, outro para receber projetos e suas avaliações e outro para cadastro de critérios de avaliação. Abaixo segue as entidades e os campos de cada uma:

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

O campo media_ponderada da entidade Avaliacao é definido da seguinte maneira: Dado uma avaliacao v1 que possui 5 notas de n1 a n5 onde cada nota pertence a um critério que vão de c1 a c5 a media_ponderada de v1 é dados pela fórmula: **(n1 * c1)+(n2 * c2)+..+(n5 * c5)/(c1+c2+..+c5)**.

Ex: A Avaliacao v1 possui 5 notas 1,2,3,4,5 que pertencem aos critério 5,4,3,2,1 respectivamente então a media_ponderada é (1*5+2*4+3*3+4*2+5*1)/5+4+3+2+1 = 2.33.

A media_total da entidade Projeto é definida da seguinte maneira: Dado um projeto p1 que possui 5 avaliações e cada uma com suas respectivas médias poderadas de m1 a m5 a media_total é dado pela fórmula: **(m1+m2+...+m5)/5**.

Ex: O projeto p1 possui 5 avaliações com as seguintes médias poderadas 2,4,6,8,10 então a media_total é (2+4+6+8+10)/5 = 6.

# Requisitos
Endpoint:

1. POST /projetos
2. GET /projetos
3. POST /criterios

- O endpoint 1 deve receber um corpo de requisição onde seja possível cadastrar ou atualizar 1 projeto com N avaliações onde cada avaliação tem N notas pertencentes a N critérios.


- O endpoint 2 deve retornar uma lista de projetos e aceitar de 25 a 100 objetos por página.
- O endpoint 3 deve receber um corpo de requisição onde seja possivel cadastrar ou atualizar um criterio.
- Deve ser mantidada a consistências das médias após a atualização dos dados. Por exemplo se for atualizado o peso de um critério todas as médias devem ser recalculadas, assim como alteração em alguma nota deve atualizar a média podenrada da avaliação e a media total do projeto.
- Deve ser possível consumir todos os endpoints por qualquer client http - curl, postman, insominia, etc.

# Testes
No teste a aplicação deve receber mil projetos cada um com 5 notas para 5 critérios diferentes.


Caso não consiga fazer qualquer uma das atividades acima não tem problema, faça até onde consegue ou tem disponibilidade.

Publique o código em algum repositório público. Adicione no README as instruções para startar a aplicação. Depois nos envie o link para avaliarmos o código.

**O que vamos avaliar**
- Seu conhecimento do framework
- Requisitos atendidos
- Nível de testes
- Documentação do projeto
- Organização do código
- Padrões adotados para resolver o teste
- Performance(Tome como paramêtro que os endpoins não podem passar de 2s para responder uma requisição)
