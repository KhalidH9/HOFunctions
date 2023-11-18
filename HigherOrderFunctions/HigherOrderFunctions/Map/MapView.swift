import SwiftUI

struct Person {
    let name: String
    let age: Int
    let job: String
    let salary: Int
}

struct MapView: View {
    let people = [
        
        Person(name: "Ahmed", age: 25, job: "Software Engineer", salary: 15300),
        Person(name: "Salman", age: 31, job: "Developer", salary: 12059),
        Person(name: "Nawaf", age: 41, job: "Cyper Security Specialist", salary: 25220),
        Person(name: "Sultan", age: 27, job: "Computer Engineer", salary: 17430),
        Person(name: "Asem", age: 37, job: "Spokesman", salary: 19500),
    ]
    
    var body: some View {
        ScrollView{
            
            HStack{
                
                Text("Arab Newsletter")
                    .font(.title)
            }.padding()
            
            Spacer()
            
            VStack (alignment: .leading){
                Text("In Google Inc., there are five Arab employees work there. Here is their names, salaries, ages, and jobs")
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                
                Spacer()
                
                Text("Their names are:")
                    .font(.headline)
                ForEach(people.map { $0.name }, id: \.self) { i in
                    Text("\(i)")
                        .font(.callout)
                }
                
                Spacer()
                
                Text("Their jobs are:")
                    .font(.headline)
                ForEach(people.map { $0.job }, id: \.self) { i in
                    Text("\(i)")
                        .font(.callout)
                }
                
                Spacer()
                
                Text("Their salaries: ")
                    .font(.headline)
                ForEach(people.map { $0.salary }, id: \.self) { i in
                    Text("\(i)")
                        .font(.callout)
                }
                
                Spacer()
                
                Text("Age of each one of them age:")
                    .font(.headline)
                ForEach(people.map { $0.age }, id: \.self) { i in
                    Text("\(i)")
                        .font(.callout)
                }
                
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
