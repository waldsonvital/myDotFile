##NOTAS
+ Problema com deoplete-padawan na instalação do server padawan.php, ele não roda com php 7.2/7.1 com a versão no packagist precisa atualizar o composer json global para branch dev
    ```json
        {
            "minimum-stability": "dev",
            "require": {
                "mkusher/padawan": "dev-master"
            }
        }
    ```
    Em seguida rode o comando 'composer install' no terminal, depois instale o plugin deoplete-padawan

+ Para fzf funcionar bem precisa do pacote https://github.com/ggreer/the_silver_searcher
