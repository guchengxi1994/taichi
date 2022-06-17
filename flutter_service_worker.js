'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "8b35195404c59aaaa36d7e86c14ab594",
"main.dart.js_22.part.js": "3d2f9e8bf2acba56652a46ba466949bb",
"main.dart.js_12.part.js": "4088ff9c32a245378ab57b3d895e4b7e",
"main.dart.js_10.part.js": "fbc1450809ab2a08234df3ddd6e47862",
"main.dart.js_35.part.js": "863b5bf7934170bcc435389e47f2fc38",
"main.dart.js_1.part.js": "60f88b778b51c1bdfb8b526f300f2db1",
"main.dart.js_33.part.js": "56a8f60c5be7b86fa3ecfed8e4571f9b",
"main.dart.js_7.part.js": "918e4b9b8761da026566651e540b71b5",
"main.dart.js_28.part.js": "2455e325d1ecb0129892a394b03cabd3",
"main.dart.js_3.part.js": "88a084facd1304838b31417eb7b9abf2",
"main.dart.js_11.part.js": "4502bd231b95a06b9af3acdabe35f1ae",
"main.dart.js_21.part.js": "f1740c3c1c83681db10117624cf06e33",
"manifest.json": "035a521ac78dbe41644399f73366b6ac",
"main.dart.js_29.part.js": "8997cd04b29c44d19cfc135e234c37e9",
"main.dart.js_17.part.js": "a4ddbff819ced015ce19c96869b62b68",
"version.json": "b1352d85895503aba1fcdd29e31f2066",
"main.dart.js_37.part.js": "edbd00c4cd7688cfc25e399e0989453c",
"main.dart.js_32.part.js": "e058e28535ac8dd503b961024782729a",
"main.dart.js_44.part.js": "ffb2a1ed073bbae2e4d63ff1e5bd0d48",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_20.part.js": "3ac239f95a5d3d5a2c48c5fbfb1de92b",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_19.part.js": "ea99607cd44a75dfd63453fa10f27258",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"main.dart.js_16.part.js": "f23edc002336645d7c13ad2c25254d36",
"main.dart.js_25.part.js": "27cfe96339730f31ef248a45a9a87ae6",
"main.dart.js_8.part.js": "bacad67b52744e7c9a13c5782488d964",
"main.dart.js_40.part.js": "997105ed468ed2e6211f1585cf5784d5",
"main.dart.js_45.part.js": "0bafd6d0dccafe1368a6789768c2d275",
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
"main.dart.js_39.part.js": "fdf4227430a795015e7e75c437bcae32",
"main.dart.js_26.part.js": "266338d12445bfdf8c3049ad87c79e26",
"main.dart.js_2.part.js": "c8f16315cf6f796879a47a8a9ccc9f4b",
"main.dart.js_31.part.js": "a4b26c84f36e82a0ca8b169ba46ba71a",
"main.dart.js_42.part.js": "0948ff783f7fa473dff95a8c06fb7379",
"main.dart.js_18.part.js": "5726449b52b587865d5cacd89bde4324",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js_15.part.js": "aa25b9005c96edd9fd03e2dd5f118af6",
"main.dart.js_27.part.js": "a14407279d5f3c354da9f15f752c49ae",
"main.dart.js_6.part.js": "40ec4ad3e6d8b85405a1464c020be5a8"
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
