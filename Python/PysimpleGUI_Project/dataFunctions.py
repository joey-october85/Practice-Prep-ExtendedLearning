from patient import Patient
from datetime import datetime

patients = [
    Patient("Namish", "Narang", datetime(1990,1,6), 185, 90.3, True),
    Patient("Marisela", "Medina", datetime(1988,7,14), 144, 54, True),
    Patient("Joey", "Rodriguez", datetime(1990,1,6), 166, 65.8, False),
]

def convert_patients_to_table_rows():
    patient_data = []
    for i in patients:
        strings = i.convert_to_strings()
        patient_data.append(strings)

    return patient_data

