#""
class driver:
    def __init__(self, bus,bus_num, price):
        self.bus = bus
        self.bus_num = bus_num
        self.price = price
    def display_info(self):
        print(f"Bus Available: {self.bus}, Bus Range: {self.bus_num}, Price: {self.price}")
class Manager(driver):
    def __init__(self , bus, bus_num, price, department):
        super().__init__(bus, bus_num, price)
        self.department = department
    def display_info(self):
        super().display_info()
        print(f"Department: {self.department}")
        
class city(driver):
    def __init__(self,bus, bus_num, price, department,bus_model):
        super().__init__(bus,bus_num,price)
        self.bus_model = bus_model
    def display_info(self):
        super().display_info()
        print(f"Bus Model: {self.bus_model}")
if __name__ == "__main__":
    emp = driver("Silicon", "Dhaka to Chittagong" , 2400)
    mgr = Manager("Unique", "Noakhali to Dhaka",5400, "Dhaka , Noakhali and Chittagong")
    dev = city("Dhaka,Chittagong,Noakhali","Chittagong to Noakhali",3400,"Chittagong,Dhaka,Moimonshing,Borishal","Volvo")
    
    emp.display_info()
    mgr.display_info()
    dev.display_info()
