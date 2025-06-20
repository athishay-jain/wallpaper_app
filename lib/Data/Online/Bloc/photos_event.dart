abstract class PhotosEvents{}
class SetInitialPhotos extends PhotosEvents{}
class SearchPhoto extends PhotosEvents{
   String search;
   SearchPhoto({required this.search});
}