-- 1) Do total de escolas registradas, quanto estão ativas?
QUERY: select count(1) from escolas_schema.escola where status_escola = 'Ativa'
Resultado esperado: 14

-- 2) Quais escolas possuem bibliotecas?
QUERY: 
select escola.nome_escola
FROM escolas_schema.escola as escola
INNER JOIN escolas_schema.biblioteca as biblioteca 
ON escola.fk_id_espaco = biblioteca.fk_id_espaco

Resultado esperado: 
ESCOLA DE REFERENCIA EM ENSINO MEDIO COMENDADOR MANOEL CAETANO DE BRITO
ESCOLA MUNICIPAL MONSENHOR ESTANISLAU FERREIRA DE CARVALHO

-- 3) Quais escolas possuem algum tipo de diferenciamento em sua localização e qual diferenciamento é esse?
QUERY:
select escola.nome_escola, diff.tipo_diferenciamento
FROM escolas_schema.diferenciamento as diff
INNER JOIN escolas_schema.escola as escola 
ON escola.fk_id_diferenciamento = diff.id_diferenciamento
WHERE escola.fk_id_diferenciamento <> 0

Resultado esperado: 
ESCOLA SAO JOAO BATISTA | Terra Indígena

-- 4) Qual a quantidade de escolas com a modalidade EJA?
QUERY: select count(1) FROM escolas_schema.escola as escola WHERE escola.nivel_escola like '%EJA%'
Resultado esperado: 5