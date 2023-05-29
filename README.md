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

![1](https://github.com/ABBorra/ElectroluxTaste/assets/116728482/eece4974-71f9-40d1-9d20-df92b740660f)
![2](https://github.com/ABBorra/ElectroluxTaste/assets/116728482/d4d47df1-b276-4870-8654-39fd79448a03)
![3](https://github.com/ABBorra/ElectroluxTaste/assets/116728482/65b666b7-beab-46fb-8449-2987bea3d3cb)

