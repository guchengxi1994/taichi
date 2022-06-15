'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js_38.part.js": "1efcc2d56ad74841819102fdafb6ba3f",
"main.dart.js_22.part.js": "264b9a81ed973b5623a808224f675709",
"main.dart.js_6.part.js": "8ca5d6c8a0dd3b84f65b7984d84f0b74",
"main.dart.js_39.part.js": "1e10a636922bddfca480f5f2eb3c0c87",
"main.dart.js_33.part.js": "e6f0b5887278ed1203872d8ccbe3a740",
"main.dart.js_19.part.js": "f49b6c73840def3c668118e1b75908bd",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"main.dart.js_27.part.js": "daa7c142adf992cabdfc3881a0a214d1",
"main.dart.js_1.part.js": "41c2280964a869f6727ea4d3a53efb8c",
"main.dart.js_11.part.js": "3e90be499777f35041d5c31615c78fa4",
"main.dart.js_10.part.js": "2322865b22c61fdb82e5888728b4c34d",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_31.part.js": "c82d48069a730ff2e4cff8969260dad9",
"main.dart.js_23.part.js": "cacbda5f505d1683bad38e5f4e63b30e",
"main.dart.js_8.part.js": "d3dbdcc3be916e3e31852f0083692f4b",
"main.dart.js_29.part.js": "03549a7a25e0d11d4b3b43bfff7384bb",
"main.dart.js": "7cb2e830c3ec5eb0c7614028db6cc545",
"version.json": "b1352d85895503aba1fcdd29e31f2066",
"main.dart.js_24.part.js": "305b0cabd3f88e65a95523a36d06b9b4",
"main.dart.js_2.part.js": "54179ea93124c70bde48e2f9817a8139",
"main.dart.js_18.part.js": "53f9483a6c0eb4cf95f88f4649d6b90a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_34.part.js": "c54ffb1e435176363f3e50ae27327afb",
"main.dart.js_21.part.js": "8d828c86364f4172f4aebb762bff6ca2",
"main.dart.js_15.part.js": "0d65b3de0a0e3b875e484362922d79ac",
"main.dart.js_3.part.js": "d6413834716e663c44bd2ade576be1c9",
"main.dart.js_26.part.js": "40a1ad825f20991ace78e6f01a04963c",
"main.dart.js_17.part.js": "50ac30c38a8e2d89b8a1c8799ea44156",
"main.dart.js_7.part.js": "1b6751b85b8854474a5a9d28b6048437",
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
"main.dart.js_36.part.js": "9332bdf33b1d46961227841e1f1071bd",
"main.dart.js_20.part.js": "c1c4147bbaf468eff3e27a2c03d33bc8",
"main.dart.js_16.part.js": "a24aab28d359a2d54503e55d637829c7",
"main.dart.js_12.part.js": "ddb4a10cd34afb5e6d5695cdf5d3058a",
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
