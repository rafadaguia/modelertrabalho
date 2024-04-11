# Pseudocódigo para criar um arquivo CSV de produtos
"""
importar csv

produtos = lista vazia

Função obter_informações_produto():
    Ler descrição_produto ("Digite a descrição do produto: ")
    Enquanto True:
        tente:
            Ler valor_produto em formato float ("Digite o valor do produto: ")
                break
            except ValueError:
                Escreva ("Valor Inválido. Digite um número válido")
        Ler tipo_embalagem ("Digite o tipo de embalagem")
        retornar descricao_produto, valor_produto, tipo_embalagem

Enquanto True:
    Escreva ("\nCadastro de Produto")
    descricao_produto, valor_produto, tipo_embalagem = obter_info_produto()
    produtos.adicionar((descricao_produto, valor_produto, tipo_embalagem))
    Ler resposta ("Deseja cadastrar um novo produto? (sim/não): ")
    Se resposta.lower != 'sim':
        break

Se len(produtos) < 5:
    Escreva("É necessário ter no mínimo 5 produtos cadastrados")
Então:
    nome_arquivo = "1_5_arquivo_produto.csv"
    com abrir(nome_arquivo, mode='w', newline='') como arquivo_csv:
        writer = csv.writer(arquivo_csv)
        writer.writerow(["Descrição", "Valor", "Tipo de Embalagem"])
        para produto em produtos:
            writer.writerow(produto)
    Escreva(f"Arquivo {nome_arquivo} criado com sucesso!")
"""
#Código em Python
#importar
import csv
#lista produtos
produtos = []
#função obter_informacoes_produto
def obter_informacoes_produto():
    descricao_produto = input("Digite a descrição do produto: ")   #ler descricao_produto
    while True:   #loop while  para pegar informacoes
        try:
            valor_produto = float(input("Digite o valor do produto: "))  #ler valor, tipo float
            break
        except ValueError:   #se caso der Valor invalido
            print("Valor inválido. Digite um número válido.")
    tipo_embalagem = input("Digite o tipo de embalagem: ")  #ler tipo_embalagem
    return descricao_produto, valor_produto, tipo_embalagem   #retorna essas variaveis

while True:   #outro loop while para cadastrar o produto
    print("\nCadastro de Produto")    #vai escrever Cadastro de Produto
    descricao_produto, valor_produto, tipo_embalagem = obter_informacoes_produto()  #pega as variaveis coletadas da função obter ...
    produtos.append((descricao_produto, valor_produto, tipo_embalagem))   #adiciona as info na lista
    resposta = input("Deseja cadastrar um novo produto? (sim/não): ")  #perguntar se faz o cadastro de um novo produto
    if resposta.lower() != "sim":  #se for diferente de sim ele vai parar o processo
        break

if len(produtos) < 5:   #varrerá a lista produtos, se tem menos de 5 campos
    print("É necessário ter no mínimo 5 produtos cadastrados")  #escreve que o minimo é 5
else:  #se não vai gerar arquivo.csv
    nome_arquivo = "1_5_arquivo_produto.csv"  #nome do arquivo que irá gerar
    with open(nome_arquivo, mode='w', newline='') as arquivo_csv:   #este nome de arquivo será salvo como arquivo.csv
        writer = csv.writer(arquivo_csv)  #irá escrever no arquivo criado
        writer.writerow(["Descrição", "Valor", "Tipo de Embalagem"])  #irá escrever esta linha no arquivo.csv, no caso 3 colunas com 3 linhas cada.
        for produto in produtos:  #loop for, para escrever todos produtos
            writer.writerow(produto)
    print(f"Arquivo {nome_arquivo} criado com sucesso!")  #irá escrever que o arquivo foi salvo com sucesso
#Fim!

