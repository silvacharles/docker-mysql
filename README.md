Raspberry Pi compatível Docker base imagem com MySQL. Baseia-se na imagem oficial do Mysql Docker portada para o Raspbery Pi baseado em ARM.

![alt text](https://raw.githubusercontent.com/docker-library/docs/master/mysql/logo.png "Logo Mysql")

O MySQL é o banco de dados de código aberto mais popular do mundo. Com o seu desempenho comprovado, confiabilidade e facilidade de uso, o MySQL tornou-se a principal opção de banco de dados para aplicativos baseados na web, cobrindo toda a gama de projetos e sites pessoais, através de serviços de comércio eletrônico e de informações, até o alto perfil Propriedades da Web, incluindo Facebook, Twitter, YouTube, Yahoo! e muitos mais.

### Conecte-se ao MySQL a partir de um aplicativo em outro recipiente Docker

```
$ docker run --name jazz -e MYSQL_ROOT_PASSWORD=senha -d charlessilva/rpi-mysql:tag
```



Esta imagem expõe a porta MySQL padrão (3306), de modo que a ligação de contêiner torna a instância MySQL disponível para outros contêineres de aplicativos. Inicie seu contêiner de aplicativos como este para vinculá-lo ao recipiente MySQL:



```
$ docker run --name jazz --link ratchet:mysql -d aplicativo-que-usa-mysql
```

### License

The MIT License (MIT)

Copyright (c) 2017 Charles Silva

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
