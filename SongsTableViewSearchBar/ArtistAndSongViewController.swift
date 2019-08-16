

import UIKit

class ArtistAndSongViewController: UIViewController {
    
    var artistAndSong: Song!
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var imageSong: UIImageView!
    
    
    func setupOutlets() {
        songLabel.text = artistAndSong.name
        artistLabel.text = artistAndSong.artist
        imageSong.image = UIImage(named: "loveSongs")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    
    
    
}
