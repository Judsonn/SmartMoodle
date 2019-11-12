class Activity:
    def __init__(self, label, value, time):
        self.label = label
        self.value = value
        self.time = time
        
    def calcImportance(self):
        importance =  (float(self.value) * 0.01) / float(self.label)
        importance = importance * float(self.time)
        return importance
        
    def __del__(self):
        print("Obj has died")