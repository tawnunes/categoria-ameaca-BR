
<!--Lista Nacional de Espécies Ameaçadas Sob a Perspectiva do Acesso e Processamento de Dados -->


![Status](https://img.shields.io/badge/Status-Em%20andamento-green)  [![English Version](https://img.shields.io/badge/English%20Version-Here!-9cf)](https://github.com/tawnunes/categoria-ameaca-BR/blob/master/README.en.html)

<!-- [![Download lista .csv](https://img.shields.io/badge/Download%20da%20lista%20em%20.csv-Clique%20aqui!-important)](dados/processados/lista_especies_ameacadas_P148.csv)

[Acesse o repositório no GitHub](https://github.com/tawnunes/categoria-ameaca-BR)  -->


**Autora:** Tawane Yara Nunes [📧](mailto:taw.ynunes@gmail.com)

**Orientadora:** Ana Julia Righetto


### Descrição

O presente projeto foi desenvolvido como Trabalho de Conclusão de Curso para obtenção do título de especialista em Data Science & Analytics pela Universidade de São Paulo.


### Background

No Brasil as listas de espécies ameaçadas são elaboradas desde 1968 e são oficializadas por meio de Portarias. A lista atualizada e vigente foi oficializada pela [Portaria MMA n° 148 de junho de 2022](https://www.in.gov.br/en/web/dou/-/portaria-mma-n-148-de-7-de-junho-de-2022-406272733), disponível no website do governo federal. Embora os dados possam ser acessados com facilidade, as listas são disponibilizadas apenas em tabelas formatadas para visualização. Desta forma, alguém interessado em saber a categoria de ameaça de uma espécie, precisa fazer uma busca manual diretamente no website ou no arquivo PDF que pode ser baixado.

Dados em websites (formato HTML) ou em arquivo PDF são considerados semiestruturados e não-estruturados respectivamente, o que os torna mais difíceis de manipular e analisar do que dados estruturados e formatados em arquivos CSV e XLS. Assim, utilizar estes dados requer conhecimento mais avançados de ferramentas para conversão e reestruturação.

### Objetivos

Neste contexto, o presente projeto tem como objetivo: i) utilizar de técnicas de *WebScraping* para extração e estruturação das informações sobre o risco de extinção das espécies nacionais; ii) elaborar um algoritmo de consulta do status de ameaça a partir de uma lista de espécies pré-definida; iii) disponibilizar tanto o algoritmo como a lista em formato estruturado em plataforma web e iv) avaliar e relatar os principais desafios encontrados para analisar as listas de espécies ameaçadas no Brasil.

### Estrutura do Projeto

```
Projeto/
*    ├── dados/
*    │   ├── raw
*    │   └── processados
*    │   └── teste
     ├── docs/
*    ├── funcoes/
     ├── R/
*    └── README.md
```

Os dados brutos extraídos podem ser encontrados em ``` dados/raw```
Os arquivos ```.csv``` processados encontra-se em ```dados/processados```

No diretório ```docs```você encontra uma versão ```.pdf``` da Portaria MMA n° 148

No diretório ```funcoes```você encontra a função criada para consulta da lista de espécies
chamada ```categoriaAmeacaBR```, os dados utlizados para teste da função encontram-se em ```dados/teste```

No diretório ```R``` você encontra os scripts


#### Requerimentos:

```
Pacotes R:

- tidyverse
- xml2
- rvest
```
