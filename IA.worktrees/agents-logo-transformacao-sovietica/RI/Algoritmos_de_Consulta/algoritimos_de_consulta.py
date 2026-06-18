def validarTipoS(string): return isinstance(string, str)

def validarTipoN(num): return (isinstance(num, int) or isinstance(num, float))

def validarList(lista): 
    if (lista is None or not isinstance(lista, list) or len(lista) == 0): raise ValueError("Tem de ser uma lista, não nula e com pelo menos um elemento")

def validarTupla(tupla):
    if (tupla is None or not isinstance(tupla, tuple) or not isinstance(tupla[0], list) or not isinstance(tupla[1], bool)): raise ValueError("Tem de ser passado uma tupla, com uma lista na posição 0 e um boolean na posição 1")

def validarStr(string):
    if (len(string) == 0): raise ValueError("String não pode ser vazia")

def swap(lista, i, j):
    temp = lista[i]
    lista[i] = lista[j]
    lista[j] = temp
    return lista

def quickSort(lista, left, right):
    if (left < right):
        pivot = partition(lista, left, right)
        quickSort(lista, left, pivot - 1)
        quickSort(lista, pivot + 1, right)
    return lista

def partition(lista, left, right):
    i = left
    pivot = lista[left]
    for j in range(left + 1, right + 1):
        if (validarTipoN(lista[j]) and validarTipoN(pivot) and lista[j] <= pivot):
            i += 1
            swap(lista, i, j)
        if (validarTipoS(lista[j]) and validarTipoS(pivot) and calcularScorePalavra(lista[j], pivot, menorLen(len(lista[j]), len(pivot)))):
            i += 1
            swap(lista, i, j)
    swap(lista, left, i)
    return i

"""
Intersect espera duas tuplas, cada uma com 2 itens: 
posição 0: Lista
Posição 1: Boolean

O boolean serve para indicar se a lista já está ordenada ou se precisa ser ordenada. A lista deve ter pelo menos um elemento.
"""
def intersect(tupla1, tupla2):

    validarTupla(tupla1)

    validarTupla(tupla2)

    lista1 = tupla1[0]

    validarList(lista1)

    lista2 = tupla2[0]

    validarList(lista2)

    if (not tupla1[1] and len(lista1) > 1): quickSort(lista1, 0, len(lista1) - 1)

    if (not tupla2[1] and len(lista2) > 1): quickSort(lista2, 0, len(lista2) - 1)

    if (len(lista1) > 1): eliminarRepeticoes(lista1, 0)

    if (len(lista2) > 1): eliminarRepeticoes(lista2, 0)

    if (len(lista1) <= len(lista2)):
        return intersectLogica(lista1, lista2)
    else:
        return intersectLogica(lista2, lista1)

def intersectLogica(lista1, lista2):
    i = 0
    j = 0
    while (len(lista1) - 1 >= i and len(lista2) - 1 >= j):
        if (lista1[i] == lista2[j]):
            i += 1
            j += 1
        elif (validarTipoN(lista1[i]) and validarTipoN(lista2[j]) and lista1[i] > lista2[j]):
            if (len(lista2) - 1 == j):
                return removerItens(lista1, i)
            j += 1
        elif (validarTipoS(lista1[i]) and validarTipoS(lista2[j]) and score(lista1[i], menorLen(len(lista1[i]), len(lista2[j]))) > score(lista2[j], menorLen(len(lista1[i]), len(lista2[j])))):
            if (len(lista2) - 1 == j):
                return removerItens(lista1, i)
            j += 1
        else:
            lista1.remove(lista1[i])
    return lista1
    
def removerItens(lista, i):
    if (len(lista) - 1 < i): return lista
    else:
        lista.remove(lista[i])
        return removerItens(lista, i)
    
def eliminarRepeticoes(lista, i):
    if (len(lista) - 1 < i or i < 1): return lista
    else:
        if (lista[i - 1] == lista[i]): 
            lista.remove(lista[i])
            return eliminarRepeticoes(lista, i)
        else:
            return eliminarRepeticoes(lista, i + 1)

#Exemplo:
print(intersect(([4, 3, 2, 1001, 33, 4, 6, 63, 70, 1], False), ([ 1, 2, 3, 5, 7, 8, 11, 70, 102],True)))

def calcularScorePalavra(str1, str2, menorLen):
    validarStr(str1)
    validarStr(str2)
    return score(str1, menorLen) <= score(str2, menorLen)

def menorLen(num1, num2):
    if (num1 >= num2): return num2
    else: return num1

def score(palavra, menorLen):
    valor = 0
    indice = 0
    for i in palavra:
        if (indice == menorLen and len(palavra) > menorLen): return valor
        if (indice == menorLen): return valor + 0.0001
        if (ord(i) > 64 and ord(i) < 91): valor += (indice + 1) * (ord(i) + 32) + 0.0001
        else: valor += (indice + 1) * ord(i)
        indice += 1
    return valor

"""
Versão recursiva, em desenvolvimento

def score(palavra, indice, menorLen):
    if indice < len(palavra):
        return ((indice + 1) * ord(palavra[indice])) + score(palavra, indice + 1, menorLen)
    else:
        return 0
"""

#Exemplo de ordenação de carcteres não númericos
print(quickSort(["Aaaa", "Aaa", "Aa", "x", "e", "abcd", "d", "c", "a~", "-", "B", "y", "11"], 0, 12))

#Exemplo de intersecção
print(intersect((["A", "x", "e", "abcd", "d", "c", "a~", "-", "B", "y", "f", "ba"], False), (["ab", "A", "f", "y", "-"], True)))
