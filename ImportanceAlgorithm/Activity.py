class Activity:
    def __init__(self, label, weight, value, time):
        self.label = label
        self.weight = weight
        self.value = value
        self.time = time
        
    def calcImportance(self):
        importance =  ((float(self.value) * 0.01) / float(self.label)) * float(self.weight)
        importance = importance * float(self.time)
        return importance
        
    def __del__(self):
        print("Obj has died")