## National Red List of Endangered Species from the Perspective o Data Acess and Processing


![Status](https://img.shields.io/badge/Status-In%20progress-green) [![Versão em Português](https://img.shields.io/badge/Vers%C3%A3o%20em%20Portugu%C3%AAs-Aqui!-9cf)](README.md)


**Author:** Tawane Yara Nunes (taw.ynunes@gmail.com)           

**Supervisor:** Ana Julia Righetto


### Description

This project was developed as an end-of-course work for obtaining the title of Data Science & Analytics specialist by the University of São Paulo.

Note: all comments and directory and file names are in Portuguese(BR) because the project is focused on Brazilian users

### Background

In Brazil, lists of endangered species have been compiled since 1968 and are made official through Portarias. The updated and the current list was made official by [ Portaria MMA No. 148  de 7 de Junho de  2022](https://www.in.gov.br/en/web/dou/-/portaria-mma-n-148-de-7-de-junho-de-2022-406272733), available on the federal government's website. Although the data can be easily accessed, the lists are only available in tables formatted for viewing. Thus, someone interested in knowing the extinction risk category  of a species needs to do a manual search directly on the website or in the downloadable PDF file.

Data on websites (HTML format) or in a PDF file are considered semi-structured and unstructured, respectively, which makes them harder to manipulate and analyze than structured and formatted data in CSV and XLS files. Thus, using these data requires more advanced knowledge of tools for conversion and restructuring.

## Goals

In this context, this project aims to: i) use WebScraping techniques to extract and structure information about the risk of extinction of national species; ii) develop an algorithm to query the threat status from a pre-defined list of species; iii) make both the algorithm and the list available in a structured format on a web platform and iv) evaluate and report on the main challenges encountered to analyze the lists of endangered species in Brazil.

## Project Structure

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

In the  ``` data/raw``` subdirectory, you can find the raw data extracted from the website.
The processed ```.csv``` files are in ```data/processed```

In the directory ```docs``` you can find a ```.pdf``` version  of *Portaria MMA n° 148*

In the directory ```functions```, you will find the function created to query the species list named ```categoriaAmeacaBR```. The data used to test the function is under the ```data/test``` subdirectory.

In the ```R``` directory, you will find the scripts.

## Requirenments:

```
R packages:

- tidyverse
- xml2
- rvest
```
