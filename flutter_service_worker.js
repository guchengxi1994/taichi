'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "750ef7b7fa13cab421cad600ad96091d",
"main.dart.js_22.part.js": "7621f655fb983fa31cf508c21c5685c2",
"main.dart.js_12.part.js": "f62305a6314ce32f64a9a207b213902a",
"main.dart.js_10.part.js": "249861fd5e1d00f19db27a6156ff713a",
"main.dart.js_35.part.js": "426dd1e4c941d88bc2128a56425fa7b9",
"main.dart.js_1.part.js": "92d765cc0111add974fef76e1355b5df",
"main.dart.js_33.part.js": "173e64f27ec85904b885facd2de55559",
"main.dart.js_7.part.js": "918e4b9b8761da026566651e540b71b5",
"main.dart.js_28.part.js": "fd48ab80e71e0853981cd30c55cfed74",
"main.dart.js_3.part.js": "88a084facd1304838b31417eb7b9abf2",
"main.dart.js_11.part.js": "4502bd231b95a06b9af3acdabe35f1ae",
"main.dart.js_21.part.js": "902d776dafef8a624765117e2e31075e",
"manifest.json": "035a521ac78dbe41644399f73366b6ac",
"main.dart.js_29.part.js": "4484379f55edd2f7bdf0b9cf426d7437",
"main.dart.js_17.part.js": "a87863d6b64a127f5c07164d8c30689f",
"version.json": "b1352d85895503aba1fcdd29e31f2066",
"main.dart.js_37.part.js": "311a2216d0cc9456b3eaccd911e2826b",
"main.dart.js_32.part.js": "c54c733a2d1644230817918c7ec7ea0d",
"main.dart.js_44.part.js": "d961cd1db89b595b1e4edae392044ead",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_20.part.js": "e682defd3da8f2e5a058fafb94be59e1",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_19.part.js": "ea99607cd44a75dfd63453fa10f27258",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"main.dart.js_16.part.js": "8ec7d8254e3b5a6d2131258a9248bc1b",
"main.dart.js_25.part.js": "27cfe96339730f31ef248a45a9a87ae6",
"main.dart.js_8.part.js": "bacad67b52744e7c9a13c5782488d964",
"main.dart.js_40.part.js": "3a2c078dd413edba6ba5bc5ef80ac3ac",
"main.dart.js_45.part.js": "933ea67a4083d94dbdfdb7015cbcafcc",
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
"main.dart.js_39.part.js": "e15f1653e855b0e344da1a02ead4dbb8",
"main.dart.js_26.part.js": "28ff83ecf1cf4201205818c9a87a53e4",
"main.dart.js_2.part.js": "ec60ed6abb46d00501929365703d9294",
"main.dart.js_31.part.js": "d18fff7506a0c189fc23848657e76479",
"main.dart.js_42.part.js": "d58cb83352835d27610c9543b7bb9a43",
"main.dart.js_18.part.js": "d6dfb2559ba04c32c28a26a75a4ab779",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js_15.part.js": "4c0dd5694baa19d2f7883972ea047565",
"main.dart.js_27.part.js": "b87dd79634165a2b37b2c5c9db5027f2",
"main.dart.js_6.part.js": "698bcf5f861240a07be2529e8d82f093"
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
