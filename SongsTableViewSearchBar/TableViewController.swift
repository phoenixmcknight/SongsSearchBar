

import UIKit

class TableViewController: UITableViewController {
    
    

    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    
    var songsAndTitle = Song.loveSongs
    var searchBarText: String? = nil {
        didSet {
            self.tableView.reloadData()
        }
    }
    var searchResults: [Song] {
        get {
            guard let searchString = searchBarText else {
                return songsAndTitle
            }
            guard searchString != "" else {
                return songsAndTitle
            }
            if let scopeVariable = searchBarOutlet.scopeButtonTitles {

            let currentscopeIndex = searchBarOutlet.selectedScopeButtonIndex
            switch scopeVariable[currentscopeIndex] {
            case "Songs":
                return songsAndTitle.filter {$0.name.lowercased().contains(searchString.lowercased())}
            case "Artist":
           return     songsAndTitle.filter {$0.artist.lowercased().contains(searchString.lowercased())}
            default:
                return songsAndTitle
                }
            }
            return songsAndTitle
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResults.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songAndTitle", for: indexPath)

        cell.textLabel?.text = searchResults[indexPath.row].name
        
        cell.detailTextLabel?.text = searchResults[indexPath.row].artist
        

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "artistAndSongViewController") as? ArtistAndSongViewController {
            viewController.artistAndSong = songsAndTitle[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
        
    }

}


extension TableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBarText = searchBar.text
        print("working?")
    }
    
//    func searchBar(_ searchBar1: UISearchBar, textDidChange searchText: String) {
//        searchBar = searchBar1.text
//        print("working?")
//    }
    

}

