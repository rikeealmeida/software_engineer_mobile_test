# Descrição da Tarefa:

### Construa um aplicativo em Flutter que exiba uma lista de produtos e seus detalhes. O aplicativo deve atender aos seguintes requisitos:

# Tela Inicial

1. Deve exibir a lista de produtos.

2. Permitir que o usuário pesquise os produtos por nome.

3. Exibir o nome, preço, classificação de avaliações, quantidade de avaliações e imagem de cada produto.

4. Incluir um ícone de coração que permita ao usuário marcar/desmarcar o produto como favorito.

# Barra de Pesquisa

1. A pesquisa deve atualizar a lista de produtos em tempo real conforme o usuário digitar.

2. A pesquisa não deve diferenciar letras maiúsculas de minúsculas.

3. A pesquisa não deve ser apagada quando o usuário navega da tela inicial e retornar.

# Tela de Detalhes do Produto

1. Mostrar informações adicionais sobre um produto selecionado, incluindo nome, preço, classificação de avaliações, quantidade de avaliações, descrição, categoria e imagem.

2. Incluir um ícone de coração que permita ao usuário marcar/desmarcar o produto como favorito.

# Tela de Favoritos

1. Exibir a lista dos produtos favoritos do usuário.

# API

1. Use a seguinte API para buscar a lista de produtos: https://fakestoreapi.com/docs

2. Use o pacote Dio para fazer requisições à API.

# Gerenciamento de Estado

1. Use ValueNotifier para gerenciar os estados das telas.

# Armazenamento Local

1.  Use o pacote shared_preferences para salvar os produtos favoritos localmente.

# Testes

1. Escreva testes unitários para as regras de negócios.

2. Escreva testes de widget para a interface do usuário.

# Design Visual

1. Use o protótipo fornecido para o fluxo de navegação das telas e para o design visual do aplicativo: https://www.figma.com/file/mNgC26HuTYGaiRvpPVZFkR/test?type=design&node- id=0%3A1&t=hcm2yy2qBxXuNCWm-1
2. Certifique-se de que o aplicativo se adapte adequadamente em diferentes tamanhos de tela.

# Critérios de Avaliação

1. Funcionalidade: O aplicativo deve atender a todos os requisitos listados acima.
2. Qualidade do Código: O código deve ser bem organizado, fácil de ler e manter.
3. Tratamento de Erros: O aplicativo deve lidar com erros e fornecer feedback apropriado ao usuário.
4. Gerenciamento de Estado: O aplicativo deve usar ValueNotifier para gerenciar o estado das telas.
5. Testes Unitários: O aplicativo deve ter testes unitários que cubram a regra de negócio.
6. Testes de Widget: O aplicativo deve ter testes de widget que cubram a interface do usuário.
7. Design Visual: O aplicativo deve corresponder ao design fornecido no Figma.
