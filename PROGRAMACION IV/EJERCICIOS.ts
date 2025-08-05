const firstName = "Juan";
const lastName = "Perez";
const age = 30;
const email = "juan.perez@example.com";
const address = "Calle Falsa 123";

const fullName = `${firstName} ${lastName}`;

let count: number = 0;

// while (count < 5) {
//   count++;
//   console.log("Entered while ", count);
// }

// do {
//   console.log("Entered dowhile");
// } while (count < 1);

class MyClass {
  name: string;
  constructor(name: string) {
    this.name = name;
  }

  myMethod() {
    console.log("MyClass method called");
  }

  myOtherMethod() {
    console.log(this.name);
  }

  myThirdMethod() {
    console.log("MyClass third method called");
  }
}

const myInstance = new MyClass("asdasd");
myInstance.myOtherMethod();
