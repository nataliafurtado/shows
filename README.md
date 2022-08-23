
# Flutter Link Shortener 

Projeto de teste Nubank

Proposta: Fazer uma arquitetura de microapps com tecnologias abstraídas. Idealizadas para grande times e para projetos com longo ciclo de vida.

###  * Utilizado versão do FLutter 2.10.5

## Arquitetura utilizada

- Utilizada arquitetura d `micro apps` e `packages`.
- Criado `Instance manager` para gerenciar instancias entre micro apps.
- Criado `MicroAppDependencies`para comunicação entre microapps.
- Criado lógica no instance manager para abrir e fechar instancias de acordo como a rotas de navegação.
- Criado package de controle de estado.
    - Utilizado abstração para MOBX e para RXNotifier. (Utilizado duas para fins de demosntração dos conceitos.)
- Criado `Packages`para centralizar as bibliotecas entre microapps. (Todos usarem as mesmas versões)
- Criado início de um design system com modelo atômico.
- Criado makefile.
- Utilzado `clean arquitecture` na parte de infraestrutura. 
- Criado `entities` para reutilizar entidades entre microapps


## Testes

- Feito teste no dataSource com mockWebServer para testar exceptions, mapper e configurações de client. 
- Feito testes nos controlles para testar logica da view
- Feito teste de widget para testar logica da página
- Feito golden teste para testar layout da página 



*Por uma questão de tempo não foi feito microap de tagueamento, de gerencimaneto de strings e de logger. 

