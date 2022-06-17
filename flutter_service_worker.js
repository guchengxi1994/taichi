'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js_30.part.js": "b9effa2a8d0f85774820c926aab5ba32",
"main.dart.js": "cf0400c64a01cb9776bfd417aa4b9326",
"main.dart.js_12.part.js": "86c8a6e1ee029cd979711eee71d0f8e5",
"main.dart.js_10.part.js": "d4639e478caddcaf50d5c73e04481826",
"main.dart.js_35.part.js": "0a907b276719fdf5c621eecacae621c3",
"main.dart.js_1.part.js": "7b7775e8ffb5926da855ad32ebcf7823",
"main.dart.js_33.part.js": "a23d4eb575e9767fb18121493baf92f1",
"main.dart.js_7.part.js": "b25363b3a9fc77fe788d3acab28ef57e",
"main.dart.js_28.part.js": "a952754984d43f58ee254fb6cb6f7efa",
"main.dart.js_3.part.js": "142ed5f300ccbc844a763a8ad2d2aa70",
"main.dart.js_43.part.js": "32b6be3a15e506e872f0d42d06d1e58d",
"main.dart.js_11.part.js": "7602b5c78f2b7d8cdc8cfb3405ac3d3b",
"main.dart.js_21.part.js": "6bcf07046479b1d0116ae7b5764fd001",
"manifest.json": "035a521ac78dbe41644399f73366b6ac",
"main.dart.js_17.part.js": "a424a6a2bb9af20f4d5f629ecab52c2b",
"version.json": "b1352d85895503aba1fcdd29e31f2066",
"main.dart.js_37.part.js": "b1793fe652ec459ee4289c881ead8b8b",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_20.part.js": "c2c195553ca3d25b720c4f14932dd73d",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_19.part.js": "928a741fa64765c69684bd53a2f41589",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"main.dart.js_16.part.js": "b99fb68d627549030997a01b3a4ed7d6",
"main.dart.js_25.part.js": "4db3559c9f819aac658edc0a8ee86b26",
"main.dart.js_8.part.js": "4ba443e22968321a5043bcdef4663b57",
"main.dart.js_40.part.js": "7d391463aaa489c84f9f0e9262308411",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"assets/AssetManifest.json": "309c416f3d0cf5750989b17b37bd35ec",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/assets/images/0.jpg": "92d1545d90ec7ead183bf75ac146d213",
"assets/assets/images/demo.png": "13e9c72ec37fac220397aa819fa1ef2d",
"assets/NOTICES": "fd7df88c6cf33e99e1873c97cba6b6d1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"main.dart.js_26.part.js": "8df537dd29d250a9bf9fe40b8229d0db",
"main.dart.js_2.part.js": "c0dfc3d9a12756035375c6b31a32f9c5",
"main.dart.js_31.part.js": "ac4a864045ec80cacb41ac3540abfc37",
"main.dart.js_38.part.js": "d8299e37258515dee0831cf38862b101",
"main.dart.js_24.part.js": "ed8c99e7249e09a954e7d526b7a54677",
"main.dart.js_42.part.js": "e635f0e2dec5a48d4e873e6a1909ff9f",
"main.dart.js_18.part.js": "b1a286152e57a4dd399e4e023f749f6b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js_15.part.js": "433f3ec422af6f420c1d84e5caccc794",
"main.dart.js_27.part.js": "2c2dac9ad45fd6c13fc4ba1d83a4a8b9",
"main.dart.js_6.part.js": "cce56cf1b4113f1887eec4e2a3af36dd"
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
