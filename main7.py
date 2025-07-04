from abc import ABC, abstractmethod

class Vehicle(ABC):
    @abstractmethod
    def start(self):
        pass

    @abstractmethod
    def stop(self):
        pass

class BMW(Vehicle):
    def start(self):
        return "BMW starts with a smooth ignition."

    def stop(self):
        return "BMW stops with advanced braking system."

class Ferrari(Vehicle):
    def start(self):
        return "Ferrari roars to life with a powerful engine."

    def stop(self):
        return "Ferrari halts using carbon-ceramic brakes."

def main():
    vehicles = [
        BMW(),
        Ferrari()
    ]
    for vehicle in vehicles:
        print(f"{vehicle.__class__.__name__}:")
        print(f" Start: {vehicle.start()}")
        print(f" Stop: {vehicle.stop()}\n")

if __name__ == "__main__":
    main()
