# Noventa e Oito
Este aplicativo foi feito para o desafio da Irhis Consultoria.
## Modulos
A página inicial contém os nomes de motoristas, quantidade de corridas e média de avaliações que cada um fez. Ao clicar no item, será feita uma navegação para uma tela com detalhes do motorista, avaliações de usuários, a foto do motorista ampliada, e um botão para solicitar uma corrida com o respectivo motorista. Ao clicar nesse botão, será feita uma navegação para a segunda tela.

A tela de histórico contém duas listas, uma com as corridas concluídas, e outra com as corridas canceladas e, quando houver, um item no topo aparecerá indicando que o motorista solicitado está a caminho. É possível cancelar a corrida no ícone vermelho ao lado do nome do motorista. É possível avaliar a corrida, quando concluída, nos ícones verde e vermelho ao lado do nome do motorista. Clicando nestes ícones, será feita uma navegação para a tela de avaliação.

A tela de avaliação contém os mesmos detalhes do motorista citados anteriormente, e um botão de avaliar corrida. Clicando neste botão, uma janela vai aparecer com um campo para escrita do feedback do usuário, e seleção de quantidade de estrelas que o usuário deseja avaliar o motorista. A avaliação enviada é registrada e aparecerá abaixo das outras.

## Fotos
Para as fotos-fantasia dos motoristas e usuários foi usado a API Pexels.
https://www.pexels.com/pt-br/

## Nomes
Para os nomess-fantasia dos motoristas e usuários foi usado a API Fake Name Generator.
https://www.fakenamegenerator.com/gen-random-us-us.php

## Avaliações
Para as avaliações de usuário, foi usada a API The Dad Joke Generator.
https://edition.cnn.com/interactive/2019/06/us/dad-joke-generator-trnd/

## Back-end
API interna usada no projeto, foi a escrita e reescrita de arquivos json. O Cubit é o responsável por fazer a "chamada" à falsa API e gerenciar os estados de cada tela.


## Front-end
Os componentes usados no aplicativo foram criados exclusivamente para o uso deste, e estão localizados na pasta `utils` do projeto. 

