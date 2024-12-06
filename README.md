
# 🤖 SmartBit Robot 🤖

**Bem-vindo ao repositório SmartBit Robot!** Este projeto foi desenvolvido como parte do curso *"Universo Robot Framework"* da QAxperience (Fernando Papito) com o objetivo de consolidar os conhecimentos adquiridos sobre automação de testes utilizando o Robot Framework. A proposta principal é integrar e praticar os conceitos fundamentais de automação em diferentes contextos: **web**, **mobile** e **API**.

---

## 🚀 Objetivos do Projeto

- Demonstrar o uso do **Robot Framework** em diferentes cenários de automação.
- Praticar a modularização do código com a criação de bibliotecas personalizadas.
- Realizar testes automatizados em aplicações **web**, **mobile** e serviço **REST API**.
- Consolidar o aprendizado adquirido ao longo do curso e documentar as melhores práticas.
### - Observação:
- caso queira executar os testes na sua máquina, me envie uma mensagem através do linkedin ou por email para eu te mandar os arquivos necessários e um tutorial detalhado! ;)

---

## 🛠️ Funcionalidades

1. **Testes Web:** Automação de funcionalidades em um sistema web.
2. **Testes Mobile:** Automação de ações em dispositivos móveis.
3. **Testes de API:** Interações com endpoints REST, incluindo criação, leitura, atualização e exclusão de dados (CRUD).
4. **Bibliotecas Customizadas:** Criação de bibliotecas próprias para encapsular lógicas reutilizáveis.

---

## 🗂️ Estrutura do Projeto

```
smartbit-robot/
├── libs/                # Bibliotecas customizadas do projeto
├── mobile/              # Testes relacionados à automação mobile
├── services/            # Testes de API
├── web/                 # Testes relacionados à automação web
├── .gitignore           # Arquivos ignorados pelo Git
├── requirements.txt     # Dependências do projeto
└── README.md            # Documentação do projeto
```

### 📁 Diretórios Principais

- **`libs/`**: Contém bibliotecas reutilizáveis, como funções customizadas para testes.
- **`web/`**: Scripts de automação voltados para a aplicação web da Smartbit.
- **`mobile/`**: Scripts para automação do aplicativo Smartbit em dispositivos móveis.
- **`services/`**: Scripts de testes para a APIRest Smartbit.

---

## 🧰 Requisitos

Antes de iniciar, certifique-se de que você tem as seguintes ferramentas instaladas:

- **Python 3.x**
- **Robot Framework**
- **Bibliotecas adicionais** (listadas no arquivo `requirements.txt`)

Para instalar as dependências, execute:

```bash
pip install -r requirements.txt
```

---

## 🎯 Aprendizados Destacados

Durante o desenvolvimento deste projeto, os seguintes conceitos foram praticados e aprofundados:

- **Encapsulamento de Keywords:** Organização do código para facilitar a reutilização de componentes.
- **PageObjects:** Utilização de um design pattern para estruturar testes de interface de forma eficiente.
- **Ganchos de Testes:** Configuração de *setup* e *teardown* para preparação e limpeza do ambiente de teste.
- **Test Templates:** Uso de templates para padronizar e simplificar a criação de múltiplos casos de teste.
- **Automação de APIs REST:** Manipulação de variáveis dinâmicas, autenticação e verificação de respostas HTTP.
- **Automação Mobile:** Execução de testes em dispositivos móveis com Appium.
- **Refatoração e Modularização:** Divisão do código em bibliotecas e reutilização de lógicas entre diferentes tipos de testes.
- **Relatórios Dinâmicos:** Geração de relatórios claros para facilitar a análise de resultados.
- **Fluxos Multi-line e Complexos:** Trabalho com comandos que envolvem múltiplas etapas para cenários mais elaborados.

---

## 📌 Contribuições Futuras

- Melhorar a cobertura de testes e criar mais cenários para APIs REST.
- Explorar novas funcionalidades de automação mobile.
- Adicionar pipelines CI/CD para execução automatizada dos testes.

---

## 🤝 Contribuições

Contribuições, sugestões e melhorias são sempre bem-vindas! Para contribuir:

1. Faça um fork do repositório.
2. Crie um branch para sua funcionalidade (`git checkout -b feature/nova-funcionalidade`).
3. Envie suas alterações (`git push origin feature/nova-funcionalidade`).
4. Abra um Pull Request.

---

## 👤 Autor

### **Pedro Nunes**  

🔗 [LinkedIn](https://www.linkedin.com/in/nunescodex/)  
📧 [pedro.hq_@outlook.com](mailto:pedro.hq_@outlook.com)
