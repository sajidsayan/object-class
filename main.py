class Student:
    def __init__(self,name,roll_no):
        self.name = name
        self.roll_no = roll_no
        self.marks = {}
    
    def display_info(self):
        print(f"Name: {self.name}, Roll No: {self.roll_no}")
    def add_mark(self, subject, mark):
        self.marks[subject] = mark
        print(f"Added mark for {subject}: {mark}")
    def get_average(self):
        if not self.marks:
            return 0
        return sum(self.marks.values()) / len(self.marks)
    def display_marks(self):
        if not self.marks:
            print("No marks available.")
        else:
            for subject, mark in self.marks.items():
                print(f"{subject}: {mark}")
s = Student("Sajid Mahmud Sayan", 1)

s.display_info()
s.add_mark("Math", 1000)
s.add_mark("English", 2321)
s.display_marks()
print(f"Average Marks: {s.get_average()}")
