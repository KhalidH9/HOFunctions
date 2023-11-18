import SwiftUI

struct Player {
    let id = UUID()
    let image: String
    let name: String
    let nationality: String
    let timesWon: Int
    let club: String
}

struct FilterView: View {
    @State private var searchText = " "
    
    let players: [Player] = [
        Player(image: "messi", name: "Lionel Messi", nationality: "Argentina", timesWon: 8, club: "FC Barcelona"),
        Player(image: "cristiano", name: "Cristiano Ronaldo",nationality: "Portugal", timesWon: 7, club: "Real Madrid"),
        Player(image: "ronaldinho", name: "Ronaldinho", nationality: "Brazil", timesWon: 1, club: "FC Barcelona"),
        Player(image: "zidane", name: "Zinedine Zidane", nationality: "France", timesWon: 1, club: "Real MAdrid"),
        Player(image: "rivaldo", name: "Rivaldo", nationality: "Brazil", timesWon: 1, club: "AC Milan")
    ]
    
    var filteredPlayers: [Player]{
        if searchText.isEmpty{
            return players
        }else{
            return players.filter
            {$0.nationality == (searchText)}

        }
    }
    
    var body: some View {
        ScrollView{

            Text("Ballon d'Or, history and winners")
                .font(.title2)
                .padding()
            
            VStack {
                
                HStack{
                    Image("bd")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .infinity, height: 200)
                    
                    Text("The Ballon d'Or is an annual football award presented by French news magazine France Football since 1956. Historically it has been regarded as football's most prestigious and valuable individual award.")
                        .multilineTextAlignment(.leading)
                        .font(.callout)
                }.padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Ballon d'Or Winners")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                TextField("Search winners by nationality: ", text: $searchText)
                    .padding()
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .font(.title3)
                    .frame(width: 360, height: 45)
                    .background(RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.gray.opacity(0.3)))

                List(filteredPlayers, id: \.nationality){ player in
                    Text(player.nationality)
                }
                
                ForEach(players, id: \.name) { player in
                    HStack{
                        Image(player.image)
                            .resizable()
                            .clipShape(.circle)
                            .scaledToFit()
                            .frame(width: 16 * 6, height: 16 * 5)
                            .padding()
                        VStack(alignment: .leading){
                            
                            Text("\(player.name)")
                                .font(.headline)
                            
                            HStack{
                                Text("\(player.nationality)")
                                    .font(.callout)
                                
                                Text("- \(player.club)")
                                    .font(.callout)
                            }
                            Text("\(player.timesWon) Times Won:")
                                .font(.callout)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius:8 ).stroke(Color.gray.opacity(0.4)))
                    .padding(.horizontal)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
