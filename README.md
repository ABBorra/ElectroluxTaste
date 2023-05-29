# ElectroluxTaste
Displaying Photo gallery  in grid show  as user friendly.



# iOS MVVM

# Environment
iOS SDK: &gt; 15.0 ,
Swift version: &gt  5.0 , 
Xcode: 14.1

# Concepts Included
- Loading LazyVGrid with search hashTags for  flickr photo using flickr API - EG: [https://api.flickr.com/services/rest).
- Selection of photos navigation to Photo Details.
- REST API integration
- Dependency injection 
- Grid with PageList and load more

# Note 
- Before Running the project, Please install pods.
- cd _ project Path ~
- pod install


```
ElectroluxTest
├─ Modules
│  │ └─ PhotoList
│  │    ├─ Model
│  │    │  └─ PhotoListModel
│  │    ├─ Views
│  │    │  └─ PhotoLandingView
│  │    ├─ ViewModel
│  │    │  └─ PhotoListViewModel
│  │    │
│  │    └─ View
│  │       └─ PhotosListViewController
│  └─ PhotoDetailsView
|       ├─ ViewModel
|       |    └─ PhotoDeatilViewModel
|       └─ View
|           └─ PhotosListDetailedView
└─ AppConnections
   ├─ Constants
   │  └─ Secrets
   ├
   └─ ConnectionManager
   |--- Request
   ├─ ApiRepository
   │  ├─ PhotosApiRepository
   │  │  └─  PhotosApiRepository
   │  │    
   │  └─ ApiUrl
   └─ Util
      |
      └─ NetWorReachability
```

# Screenshots


![1](https://github.com/ABBorra/ElectroluxTaste/assets/116728482/ff6bc69e-b4e6-4d25-a737-1215b07572c1)
![2](https://github.com/ABBorra/ElectroluxTaste/assets/116728482/2ac0040e-7aec-48ad-983d-d8f35e30f767)

![Demo](https://github.com/ABBorra/ElectroluxTaste/assets/116728482/f52f2396-444a-4b0a-a37f-53815c808638)


