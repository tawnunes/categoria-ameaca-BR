## Lista Nacional de Espécies Ameaçadas Sob a Perspectiva da Acessibilidade e Sistematização de Dados


```Status:``` *Em andamento*


**Autora:** Tawane Yara Nunes (taw.ynunes@gmail.com)           

**Orientadora:** Ana Julia Righetto


### Descrição

O presente projeto foi desenvolvido como Trabalho de Conclusão de Curso para obtenção do título de especialista em Data Science & Analytics pela Universidade de São Paulo.


### Background

### Objetivos

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
chamada ```statusAmeacaBR```, os dados utlizados para teste da função encontram-se em ```dados/teste```

No diretório ```R``` você encontra os scripts


#### Requerimentos:

```
Pacotes R:

- tidyverse
- xml2
- rvest
```