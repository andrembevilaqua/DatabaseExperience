## Banco de dados relacionais ##

- Em um banco de dados relacional, cada linha da tabela é um registro com uma identificação única chamada chave primaria. 
- As colunas da tabela contêm os atributos dos dados, e cada registro geralmente tem um valor para cada atributo, facilitando o estabelecimento das relações entre os dados.
- Ao criar relações, você sempre trabalha com duas tabelas de cada vez. Uma tabela é chamada de tabela principal ou parent table e a outra é a tabela relacionada ou child table.
- Os três tipos de relação que você vai encontrar nas bases de dados relacionais são, 1 para 1, 1 para muitos e muitos para muitos. As relações estão descritas abaixo.

--> SQL é a sigla para “Structured Query Language” que significa, traduzindo para o português, “Linguagem de Consulta Estruturada”. Trata-se de uma linguagem de consulta a banco de dados relacionais. Com o SQL, você pode executar vários comandos para criar, alterar, gerenciar, consultar, dentre outras informações no seu banco de dados. Costumamos dizer que bancos SQL seguem uma modelagem relacional, pois estes se baseiam no fato de que todos seus dados sejam guardados em tabelas. 

## Banco de dados não relacionais ##

- Um banco de dados não relacional é qualquer banco de dados que não segue o modelo relacional fornecido pelos sistemas tradicionais de gerenciamento de bancos de dados relacionais (SGBDR). 
- Os dados são organizados em uma única estrutura de dados.Esta categoria de bancos de dados, é também conhecida como banco de dados NoSQL.
- Os mais populares sendo MongoDB, DocumentDB, Cassandra, Couchbase, HBase, Redis, e Neo4j. Estes bancos de dados são geralmente agrupados em quatro categorias: Key-value stores, Graph stores, Column stores, e Document stores.

## Diferença entre base de dados relacional e não relacional ##
- Bancos de dados relacionais como MySQL, PostgreSQL e SQLite3 representam e armazenam dados em tabelas e filas. 
- Os relacionais são baseados na álgebra relacional. 
- Bancos de dados não-relacionais como o MongoDB representam dados em coleções de documentos JSON.
- As bases de dados relacionais utilizam Linguagem de Consulta Estruturada (SQL), tornando-as uma boa escolha para aplicações que envolvem o gerenciamento de várias transações. 
- A estrutura de um banco de dados relacional permite vincular informações de diferentes tabelas através do uso de chaves (ou índices) estrangeiras.

--> NoSQL (Not Only SQL) é o termo utilizado para banco de dados não relacionais de alto desempenho, onde geralmente não é utilizado o SQL como linguagem de consulta. O NoSQL foi criado para ter uma performance melhor e uma escalabilidade mais horizontal para suprir necessidades onde os bancos relacionais não são eficazes. No geral, temos 4 tipos de bancos de dados NoSQL:

Documento – Os dados são armazenados como documentos. Os documentos podem ser descritos como dados no formato de chave-valor, como por exemplo, o padrão JSON. Um exemplo de banco de dados neste formato é o MongoDB;

Colunas – Os dados são armazenados em linhas particulares de tabela no disco, podendo suportar várias linhas e colunas. Também permitem sub-colunas. Um banco de dados dessa família, por exemplo, é o Cassandra;

Grafos – Os dados são armazenados na forma de grafos (vértices e arestas). O Neo4j é um banco que utiliza grafos;

Chave-valor – Esta família de bancos NoSQL é a que aguenta mais carga de dados, pois o conceito dele é que um determinado valor seja acessado através de uma chave identificadora única. Um exemplo é o banco de dados Riak.

## Desvantagens das bases de dados relacionais ##
Embora as bases de dados relacionais sejam ótimas, elas vêm com trade-offs. Uma delas é a ORM Impedance Mismatching, porque as bases de dados relacionais não foram inicialmente criadas com as linguagens OOP em mente.

A melhor maneira de evitar esta questão é criar seu esquema de banco de dados com integridade referencia. Portanto, ao utilizar um banco de dados relacional com OOP (como Ruby ou Java), você tem que pensar em como configurar suas chaves primárias e estrangeiras, o uso de restrições (incluindo a exclusão e atualização em cascata), e como escrever suas migrações.

## Desvantagens das bases de dados não relacionais ##
Em bancos de dados não relacionais como MongoDB, não há joins como nos bancos de dados relacionais, é necessário realizar múltiplas consultas e unir os dados manualmente dentro de seu código.

Como Mongo não trata automaticamente as operações como transações da mesma forma que um banco de dados relacional, deve-se escolher criar uma transação e depois verificá-la, fazer o commit ou o roll-back manualmente.


## Conclusão ##
O NoSQL tem muitas vantagens para ser utilizado. Mas não é por isso que devemos utilizá-lo em todas as situações. Em muitos sistemas, você pode (e até deve) usar o modelo relacional. O NoSQL é mais indicado para aqueles sistemas que tenham necessidades maiores de armazenamento e desempenho.

O NoSQL não veio para substituir o SQL, mas sim para oferecer mais uma alternativa de um banco de dados mais flexível no suporte de dados. Sendo assim, você pode usar ambas as soluções para diferentes casos de uso. Por isso, o mais comum em soluções escalares de sucesso é a utilização de uma arquitetura híbrida, aproveitando o melhor dois dois modelos.


fontes:
https://blog.debugeverything.com/pt/diferenca-base-de-dados-relacional-e-nao-relacional/
https://logap.com.br/blog/banco-de-dados-relacional-nao-relacional/