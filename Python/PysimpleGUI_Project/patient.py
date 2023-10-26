from datetime import datetime

class Patient:
    def __init__ (self, first_name, last_name, date_of_birth, height, weight, is_taking_medication):
        self.first_name = first_name
        self.last_name = last_name
        self.height = height
        self.weight = weight
        self.date_of_birth = date_of_birth
        self.is_taking_medication = is_taking_medication
    
    def convert_to_strings(self):
            
        date_of_birth = datetime.strftime(self.date_of_birth, '%Y/%m/%d')
        height =  str(self.height)
        weight = str(self.weight)
        is_taking_medication = str(self.is_taking_medication)
        
        return [self.first_name, self.last_name, date_of_birth, height, weight, is_taking_medication]


