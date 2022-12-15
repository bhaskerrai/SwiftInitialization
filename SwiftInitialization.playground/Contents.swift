import UIKit

var greeting = "Hello, playground"

//Initialization is the process of preparing an instance of a class, structure, or enumeration for use. This process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that’s required before the new instance is ready for use.

//You implement this initialization process by defining initializers, which are like special methods that can be called to create a new instance of a particular type.
//Instances of class types can also implement a deinitializer, which performs any custom cleanup just before an instance of that class is deallocated.

//When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")


//“You can write the Fahrenheit structure from above in a simpler form by providing a default value for its temperature property at the point that the property is declared:
/*
 struct Fahrenheit {
    var temperature = 32.0
 }
*/


//Initialization Parameters
//You can provide initialization parameters as part of an initializer’s definition, to define the types and names of values that customize the initialization process”

struct Celsius{
    var temperatureInCelsius: Double
    
    init(fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(kelvin: Double){
        temperatureInCelsius = kelvin - 273.15
    }
}

let t1 = Celsius(fahrenheit: 78)
print("\nTemperature in fahrenheit:",t1.temperatureInCelsius)

let t2 = Celsius(kelvin: 273)
print("\nTemperature in kelvin:",t2.temperatureInCelsius)

//As with function and method parameters, initialization parameters can have both a parameter name for use within the initializer’s body and an argument label for use when calling the initializer.

//However, initializers don’t have an identifying function name before their parentheses in the way that functions and methods do. Therefore, the names and types of an initializer’s parameters play a particularly important role in identifying which initializer should be called.

//If you don’t want to use an argument label for an initializer parameter, write an underscore (_) instead of an explicit argument label for that parameter to override the default behavior.

struct New{
    var t : Double
    
    init(_ celsius: Double){
        t = celsius
    }
}

let t3 = New(37.0) //as we wrote "_" as argument label while defining init, so we don't have write the argument label inside parentheses while calling the init
print(t3.t)


//If your custom type has a stored property that’s logically allowed to have “no value”—perhaps because its value can’t be set during initialization, or because it’s allowed to have “no value” at some later point—declare the property with an optional type”

class NameOfPerson{
    var nameP: String
    
    init(_ firstN: String, _ middle: String?, _ lastN: String){
      if middle != nil {
        nameP = firstN + " " + middle! + " " + lastN
      }

      else{
        nameP = firstN + " " + lastN
      }
        
    }
    
    func hello(){
        print("Hello \(nameP)!")
    }
}
var n = NameOfPerson("Ali", nil, "Khan")
//var n = NameOfPerson("Ali", "Ahmed", "Khan")
n.hello()

//For class instances, a constant property can be modified during initialization only by the class that introduces it. It can’t be modified by a subclass.
//Even though the text property is now a constant, it can still be set within the class’s initializer



//Swift provides a default initializer for any structure or class that provides default values for all of its properties and doesn’t provide at least one initializer itself. The default initializer simply creates a new instance with all of its properties set to their default values. You can omit either property or both properties, and the initializer uses the default value for anything you omit

class Car{
    let name = "Honda City"
    let color = "Red"
    var number : String?
}

let c = Car()  //Default initizer is used here
print(c.color, c.name)



//“Memberwise Initializers for Structure Types”

//Struct also have memberwise initializer. Memberwise initializer allows us to re-assign values to store properties with deafult values in struct having no custom initializer.

struct Car2{
    var name = "Honda City"
    var color = "Red"
    var number : String?
}

let c2 = Car2(name: "Honda Civic", color: "Black") //here memberwise initializer is used. We can reassigning values to stored properties which already had default values. we can not do this thing with classes, this memberwise initializer is only for stucture types.
print(c2.color, c2.name)

//When you call a memberwise initializer, you can omit values for any properties that have default values.

let c3 = Car2(name: "Mercedes", number: "BUZ-987")
print(c3.color,c3.name, "with number \(c3.number!)")

let c4 = Car2(color: "grey")
print(c4.color, c4.name)
