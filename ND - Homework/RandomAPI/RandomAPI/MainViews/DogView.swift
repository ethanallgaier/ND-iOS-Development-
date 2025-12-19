import SwiftUI
import SwiftData

struct DogView: View {
    
    let apiController: DogAPIControllerProtocol = DogAPIController()
    
    @State private var dogName: String = ""
    @State private var imageURL: String = ""
    @Environment(\.modelContext) private var context
    @Query private var savedDogs: [Dog]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                // Featured dog image
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 370, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            .scaleEffect(1.4)
                            .frame(width: 300, height: 300)//stops the UI from jumping
                    }
                
                // Name input
                TextField("Enter Dog name", text: $dogName)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)

                // Generate button
                Button {
                    saveDog()
                    Task { await fetchNewDog() }
                } label: {
                    Label("Generate New Dog", systemImage: "pawprint.fill")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                // Saved dogs
                List {
                    ForEach(savedDogs) { dog in
                        HStack(spacing: 12) {
                            AsyncImage(url: URL(string: dog.imageURL)) { image in
                                image.resizable().scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                            Text(dog.name)
                                .font(.headline)
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: deleteDog)
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Dogs")
            .task {
                await fetchNewDog()
            }
        }
    }
}



extension DogView {
    
    func fetchNewDog() async {
        do {
            imageURL = try await apiController.fetchRandomDog()
        } catch {
            print("Error fetching dog: \(error)")
        }
    }
    
    func saveDog() {
        guard !dogName.isEmpty, !imageURL.isEmpty else { return }

        let newDog = Dog(name: dogName, imageURL: imageURL)
        context.insert(newDog)

        dogName = ""
        imageURL = ""
    }

    
    func deleteDog(at offsets: IndexSet) {
        for index in offsets {
            context.delete(savedDogs[index])
        }
    }
}



















#Preview {
    DogView()
        .modelContainer(for: Dog.self)//This is needed for viewing the favorite dogs in the list 
}
