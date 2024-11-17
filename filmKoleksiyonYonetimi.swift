enum Genre: String {
    case aksiyon = "Aksiyon"
    case bilim_kurgu = "Bilim Kurgu"
    case komedi = "Komedi"
    case dram = "Dram"
    case animasyon = "Animasyon"
}
var filmDict: [String: Genre] = [:]
func addFilm(_ filmName: String, _ genre: Genre) -> String {
    if filmName.isEmpty {
        return "Lütfen film adı giriniz.."
    }

    if filmDict[filmName] != nil {
        return "Bu film listenizde mevcut!"
    }

    filmDict[filmName] = genre
    return "\(filmName) filmi başarıyla eklendi!"
}
func updateFilmGenre(_ filmName: String, _ updateGenre: Genre) -> String {
    if filmDict[filmName] != nil {
        filmDict[filmName] = updateGenre 
        return "\(filmName) isimli filmin türü \(updateGenre.rawValue) olarak değiştirildi.."
    } else {
        return "\(filmName) isimli film bulunamadı.."
    }
}
func countByGenre() -> String {
    var genreCount: [Genre: Int] = [
        .aksiyon: 0,
        .bilim_kurgu: 0,
        .komedi: 0,
        .dram: 0,
        .animasyon: 0,
    ]

    for (_, genre) in filmDict {
        if let count = genreCount[genre] {
            genreCount[genre] = count + 1
        }
    }

    var results = ""
    for (genre, count) in genreCount {
        results += "\(genre.rawValue): \(count), "
    }
    results = String(results.dropLast(2))

    return results
}

print(addFilm("Gora", .komedi))
print(addFilm("Lucy", .bilim_kurgu))
print(addFilm("Müslüm", .dram))
print(addFilm("Kaptan Tsubasa", .animasyon))
print(addFilm("Hızlı ve Öfkeli", .aksiyon))

print("----------------------------------------")

print(countByGenre())

print("----------------------------------------")

print(updateFilmGenre("Gora", .aksiyon))

print("----------------------------------------")

print("Filmler:")
for (filmName, genre) in filmDict {
    print("- \(filmName): \(genre.rawValue)")
}

print("----------------------------------------")

print(countByGenre())




