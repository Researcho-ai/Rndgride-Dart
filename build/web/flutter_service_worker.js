'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "2c264d90247d4e0be72d676d2be5f114",
"/": "2c264d90247d4e0be72d676d2be5f114",
"manifest.json": "ae5185f682cbb2aeeb8e522bbdeedcd4",
"RNDgrid_Vertical_Logo_Light.svg": "ddb60cc5e55c5d328c766c6515274cbf",
"main.dart.js": "7df294a0228a98781f4f8939757f6d74",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"flutter_bootstrap.js": "1afd4e79a7d76dfb90a0f5c3d78a1519",
"RNDgrid_Icon.svg": "61bcb693d0916fb1b72c024580d3ffab",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/app_launcher_icon.png": "286203f33775db61403e6c571a17117f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/FontManifest.json": "a24db579a0658c138f0870c88737e4df",
"assets/fonts/MaterialIcons-Regular.otf": "80f552172ac7a8da09cdbca04715f453",
"assets/AssetManifest.bin": "591c8b0fac61b663a67e55a309423445",
"assets/AssetManifest.bin.json": "40b45385714d37d932e4910a3b7cb8c6",
"assets/NOTICES": "9f87027cbf932ec6b313aaa19ead28fb",
"assets/assets/jsons/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/Vector.ttf": "16fe069d8721bab1136e28376b9a8b4c",
"assets/assets/fonts/JobDetail.ttf": "c6003a685b568b4d330f4be129686ad5",
"assets/assets/fonts/2new.ttf": "23a7fdb11796533729cc714b14c98947",
"assets/assets/fonts/Iconsnew.ttf": "99914f82a7b06fa93a1759a3aaff05d1",
"assets/assets/fonts/Arrow.ttf": "71bcc4b2d47e0556e81418c449828e1e",
"assets/assets/fonts/HeroImage.ttf": "8b451cf7ac8cc16f2f1370c4c9b79b26",
"assets/assets/fonts/Community.ttf": "66693d1f000da597934231bde721cad6",
"assets/assets/fonts/Newicons.ttf": "d6323a3cfacb34bdc9390991ff1502bb",
"assets/assets/fonts/Upvotefill.ttf": "778f51e79a46a0b1027123e57148c8cc",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/NEW3.ttf": "9548fd6ad9cecea5031e7c07c9785e3a",
"assets/assets/fonts/Tool.ttf": "d07aba43af4cee64c5fe2215b91f533d",
"assets/assets/fonts/MyFlutterApp.ttf": "cb0a78d577c77c012966693eb4f56479",
"assets/assets/fonts/Instruments.ttf": "56b6a7ebe1b770b307f1fa0043ab8494",
"assets/assets/fonts/Trust.ttf": "18c0fe5b5800c14fcf2c84c52debda62",
"assets/assets/images/Contact.png": "a37592ca39b96366399fcbcb183bf8c7",
"assets/assets/images/SPU.png": "ca34a3df22772f1af13fcc08d86b6659",
"assets/assets/images/star_fill.svg": "bd5fd209f92a8f1d249b6d63b9ce7047",
"assets/assets/images/Loading.png": "1299c40b415da77af3a06e75fc49c95e",
"assets/assets/images/timer.svg": "6fcd4f997f0c19c6ba15ca1937072620",
"assets/assets/images/Rahul.png": "ccb3e074cec5090e6ea3d29dcb63d96e",
"assets/assets/images/NFSU.png": "99be6b645f383f558345b0d3348547bb",
"assets/assets/images/Book.png": "ada6848f307910c2a40a5499c8b58edd",
"assets/assets/images/Saint_Xaviers.png": "fbddcd3a1c86e3a16b375b55021b7332",
"assets/assets/images/Signin.png": "237973fe451a3e27112afe5face3a1fb",
"assets/assets/images/IIPHG_TBI.png": "26ddc859345e4c5144ffc75fd253c29a",
"assets/assets/images/atom_fill.svg": "cf4365b31767dac5fa356824d2c77ab9",
"assets/assets/images/RNDgrid_Horizontal_Logo_Dark.svg": "019b2e7c0cc367685344f4d9cc401da6",
"assets/assets/images/StrongHer-removebg-preview.png": "591ce2e2ad09d4fba44b0a2768908f83",
"assets/assets/images/Who_We_Are.png": "4d9e24bf8452eac60a76f0127d243057",
"assets/assets/images/RNDgrid_Vertical_Logo_Light.svg": "ddb60cc5e55c5d328c766c6515274cbf",
"assets/assets/images/check_mark.svg": "ddab375f76f1624605988421f6d922cf",
"assets/assets/images/Silver_Oak.png": "35d4da538dfdde3a939019f112d8a139",
"assets/assets/images/iHUB_Light-removebg-preview.png": "4b3358dae1f6dfc9c09bc4a65268a391",
"assets/assets/images/herSTART-removebg-preview.png": "23127272be3e42ecbf5838bda3c72de8",
"assets/assets/images/Why_RNDgrid_Exists.png": "cb64403d7bb82354bf1fb21c3b835386",
"assets/assets/images/STBI_Logo.png": "02f408d6257cc323536c8f15389440dd",
"assets/assets/images/Result_Not_Found.png": "aa35371ca5312261502653527be96c28",
"assets/assets/images/Profile_Page.png": "bdfc4dcea98b0662a12b6f5537c935ba",
"assets/assets/images/Students.png": "6905bc6bbcfe3f41236ce4da3d1ca38f",
"assets/assets/images/clock_fill.svg": "188cccef59860168fd75ad3e22e94e31",
"assets/assets/images/Instruments.png": "931fa2e75ffab4623f4e0c940c97cb72",
"assets/assets/images/Nirma.jpg": "8cd69b2ae7329a7e471b093a91671ebb",
"assets/assets/images/error_image.jpg": "aeeca6ed0793fda632abfc0ef04f1bbf",
"assets/assets/images/Profile.png": "f68ecf68558b06106d5e19d8a9ee0fd4",
"assets/assets/images/GUSEC-removebg-preview.png": "84192841a7b9bf99585574c7e934fac4",
"assets/assets/images/rocket-innovate_(1).svg": "79685c242c5ba84e9a7bca76d2062709",
"assets/assets/images/RNDgrid_Horizontal_Logo_Light.svg": "3445ee0e4d46cbcd98352e87e42b0978",
"assets/assets/images/SRISTI_Lab.png": "0ee3190983cba94ad122d118bec218a8",
"assets/assets/images/Startups.png": "3e7890c8aad7ed484b72a2c5e9b25f3e",
"assets/assets/images/call-_contact_us.svg": "cf9cc9f1e492ab537f0e8ec57758418b",
"assets/assets/images/Mission.png": "908d0426109bf9d8987f6051b6d8fb49",
"assets/assets/images/Submit_Request.png": "e15a1b84c9d75b9ad6e43954418730b1",
"assets/assets/images/Lets_Build_the_Future.png": "b7434a9ee09af517bab766cce1ceb77d",
"assets/assets/images/iHUB_Dark.png": "a62124e3d4183a740dbada883992f2a7",
"assets/assets/images/nshape4.svg": "21df2159bafdc12a345f490fd1c2c210",
"assets/assets/images/nshape1.svg": "ec9f5df1c3083555d4447b56305abd2e",
"assets/assets/images/mail-_contact_us.svg": "33f96cf924667acf8638557afc25da2e",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/call_1.svg": "7737a0fbb727b20858e4e56caf1b12fe",
"assets/assets/images/Research_Profile.png": "77fe015f2a5c49e2a6f40d175bcad40c",
"assets/assets/images/Indreshil.png": "48c05c0914a8a98529394ecb1e5d3e85",
"assets/assets/images/community_3.svg": "a4634e1f4cbdfca21a38cd70cf053a88",
"assets/assets/images/Fields.png": "46af9a9c83709b413f09c7c457d85ff3",
"assets/assets/images/Dev_Facilities.png": "960ae0e8da44116ef36b37331db1b62a",
"assets/assets/images/Innovators.png": "2cff7ff7455d414c62829dd24e50480e",
"assets/assets/images/IIC_Logo.png": "3456c59042b1928eb9d73323d1ccf70c",
"assets/assets/images/Dark_Instrument_Button.svg": "84c95643554c949714ccb10c0faa35b3",
"assets/assets/images/OTP.png": "84e982968a0eb43736948e4686b7104f",
"assets/assets/images/Akash.png": "2e5658e3d677601204f1e9d8d0a4f634",
"assets/assets/images/Janki.png": "18e3465496fceaf77ff73256807680f6",
"assets/assets/images/Hero_Image_Abstract.png": "18cfec424e827bd0bc4bfb0996b50b9b",
"assets/assets/images/Search_Facilites.png": "3c5234e4be5e75d3a593cfbd4bbdfe3f",
"assets/assets/images/app_launcher_icon.png": "286203f33775db61403e6c571a17117f",
"assets/assets/images/iHUB_DARK_NON_BG-removebg-preview_(1).png": "a62124e3d4183a740dbada883992f2a7",
"assets/assets/images/iHUB_Light.png": "4b3358dae1f6dfc9c09bc4a65268a391",
"assets/assets/images/Vision.png": "bb5de3786839a07ab457ed676a9c422a",
"assets/assets/images/Marwadi.png": "c7ea3e8eac7dfe4ff4a0f3deb1e7755b",
"assets/assets/images/location.svg": "4697329fc6618cd5fd3b042f1cc5dd2f",
"assets/assets/images/clock_1.svg": "ef6c3d44490dc24aa4dd164aa21d9e89",
"assets/assets/images/trust_5.svg": "520f1f2743f67a86c01236d067019d0a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "0ddeae15573eaba62511eadcbe39d6f1",
"version.json": "49855cb262758d0afc4ae6a57c7629fd"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
