'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js_22.part.js": "4df15716ee6b5edd3c2296607917ed98",
"main.dart.js_25.part.js": "0694f48d6f050ae679da0763c8e2a41b",
"main.dart.js_30.part.js": "5a758ee5123095477d539d078b24e251",
"main.dart.js_6.part.js": "dfcf6dd57ca6e8883dce4a14d9bc7c53",
"main.dart.js_39.part.js": "0e17c9193c2d74c49eb818191b074a86",
"main.dart.js_32.part.js": "8128dc14d9ea01c3806d102b70d410e0",
"main.dart.js_19.part.js": "33f23370be4207a2c114180784a10514",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"main.dart.js_27.part.js": "b0f8afd3a76c0d74fc79986dd810156d",
"main.dart.js_1.part.js": "d4823a2c55bc2d0d2f3c0b5b48b6784d",
"main.dart.js_11.part.js": "d049cd9e299a1551f2f337ad2e6ccfc9",
"main.dart.js_10.part.js": "086cb9311c069034450d958b4fedf628",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_23.part.js": "1480e92a2a4bd35f524d2ad6537dbabe",
"main.dart.js_40.part.js": "30cb539d7349bd8928c269c002b53bf9",
"main.dart.js_8.part.js": "29cd964f851570c84d27f1a6123644e7",
"main.dart.js": "36d39f01f76d8ff7b93de741bd252f6e",
"version.json": "b1352d85895503aba1fcdd29e31f2066",
"main.dart.js_24.part.js": "8e7116acecb1bb338afab5c3767e53bf",
"main.dart.js_2.part.js": "d85f9248e18071ccad30693a6bcf6c9b",
"main.dart.js_28.part.js": "b9613eef153ab71269254e364423fdd4",
"main.dart.js_18.part.js": "92a2512349be4011b82af1abba997337",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_35.part.js": "37c9602a2102b7054309f662b6cf8eaa",
"main.dart.js_34.part.js": "0166926979764c1dbd494f510bc3dad9",
"main.dart.js_21.part.js": "9c5b0edf19efea5369d8dde2f5b4567c",
"main.dart.js_15.part.js": "ef333d48c1b5b4fd142ad0213609b63f",
"main.dart.js_37.part.js": "876afc7c4989a2f22098f9b758642ce5",
"main.dart.js_3.part.js": "b0fd7a6820199bb20913fd9289891e4d",
"main.dart.js_17.part.js": "11a8d32ee45e235818f930994a5d16c9",
"main.dart.js_7.part.js": "2302b902a95e91425da09af27ae4e119",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.json": "309c416f3d0cf5750989b17b37bd35ec",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/demo.png": "13e9c72ec37fac220397aa819fa1ef2d",
"assets/assets/images/0.jpg": "92d1545d90ec7ead183bf75ac146d213",
"assets/NOTICES": "fd7df88c6cf33e99e1873c97cba6b6d1",
"main.dart.js_20.part.js": "c7d468178844accc97483674ff775f03",
"main.dart.js_16.part.js": "78549cb9fd4b57b63c8efaf547742653",
"main.dart.js_12.part.js": "f598b971a3afe8262241a489f8d0bc74",
"manifest.json": "035a521ac78dbe41644399f73366b6ac"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
