from Activity import Activity

def createActivity(label, weight, value, time):
    newactivity = Activity(label, weight, value, time)
    return newactivity

def deleteActivity(activity):
    del activity

if __name__ == "__main__":
    label = input("Dificuldade atividade 1: ")
    weight = input("Peso da atividade 1: ")
    value = input("Porcentagem de conhecimento atv1: ")
    time = input("Tempo atv1(em horas): ")
    print("\n")
    
    newact1 = createActivity(label, weight, value, time)

    label = input("Dificuldade atividade 2: ")
    weight = input("Peso da atividade 2: ")
    value = input("Porcentagem de conhecimento atv2: ")
    time = input("Tempo atv2(em horas): ")
    print("\n")
    
    newact2 = createActivity(label, weight, value, time)
    
    resul1 = Activity.calcImportance(newact1)
    resul2 = Activity.calcImportance(newact2)
    
    print("Importancia 1 = " + str(resul1))
    print("Importancia 2 = " + str(resul2))
    print("\n")
    
    if resul1 < resul2:
        print(str(resul1) + " eh mais importante")
    elif resul1 > resul2:
        print(str(resul2) + " eh mais importante")
    else:
        print("Atividades sao de mesma importancia")