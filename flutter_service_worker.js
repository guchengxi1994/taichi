'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js_37.part.js": "23379ca59cc631fd039ac2a5d76cf07e",
"main.dart.js_44.part.js": "67d0e14197dc857d019e5968489c77c3",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js_19.part.js": "81a8ff05108548a4df88774e27cd3b58",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"main.dart.js_6.part.js": "856fbbd3d741adf88d2d06926033483f",
"main.dart.js_32.part.js": "2d254e706e0449868fa09ed026056d87",
"main.dart.js_64.part.js": "195825199a66d0ee63ad267f44e76cdd",
"main.dart.js_14.part.js": "549480bc8b9a5c7dbc29f6d08fa814b2",
"main.dart.js_70.part.js": "f2c247a7ea10855f943785c4d6c2b911",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_17.part.js": "24fd65ea0ba9d57dec71f1078bc1c23d",
"main.dart.js_58.part.js": "52ffd325860def9997d84200118ebfe5",
"main.dart.js_7.part.js": "33b0a16ddb213dfc14403d0e7484ee07",
"main.dart.js_52.part.js": "3a4a2f9f1960daba4f8b097cf7f2eb6d",
"main.dart.js_11.part.js": "c2d89863d6e3451ed3b55dadc26885cf",
"main.dart.js_67.part.js": "266356b2ea4b4f496ade580a44bc112a",
"main.dart.js_16.part.js": "40922f959d640a2369d0e6fd515414de",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_65.part.js": "dcfc002c79158595f3b71096dd1e26fd",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"main.dart.js_27.part.js": "6efd5af0b47b53cec6e35b1112c11096",
"main.dart.js_47.part.js": "372c0227da90a60b5c5afffc67a3d738",
"main.dart.js_50.part.js": "1f54533800a4ae6787249207d4cb9c37",
"main.dart.js_23.part.js": "f91b7dad186ef81aa879be4b23523b10",
"main.dart.js_48.part.js": "2d34a3729023375eeb55ee8ac1f2dc4b",
"main.dart.js_20.part.js": "eb83f80bdf882db9ed9190d59214b71d",
"manifest.json": "035a521ac78dbe41644399f73366b6ac",
"version.json": "b1352d85895503aba1fcdd29e31f2066",
"main.dart.js_35.part.js": "acc4af65fe4c0d9f44f2e49f03f06e8e",
"main.dart.js_56.part.js": "9a901d5067b627b202b92064f8efdd15",
"main.dart.js_18.part.js": "984390653722321a29e6c029503318b0",
"main.dart.js_33.part.js": "56880cfa5c71e1ae8b4ed26ad0ce5f9a",
"main.dart.js_2.part.js": "c0cf661626f15533bb83a573cc6fc44f",
"main.dart.js_43.part.js": "959b16e1c33515ef5ada4f41d25b98de",
"main.dart.js_10.part.js": "402b76b9536bb0d974aeab91b1e86c9c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/AssetManifest.json": "309c416f3d0cf5750989b17b37bd35ec",
"assets/assets/images/demo.png": "13e9c72ec37fac220397aa819fa1ef2d",
"assets/assets/images/0.jpg": "92d1545d90ec7ead183bf75ac146d213",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/NOTICES": "3de8165d0401b91162634d9a441a274f",
"main.dart.js_36.part.js": "79e1cc26d8feb49c36607ac16eca3271",
"main.dart.js_26.part.js": "dcc9c51ff68f3850d0b0a4182532d05a",
"main.dart.js_41.part.js": "4d38b0b8635c98c7bf245d72bd91a48f",
"main.dart.js": "36608a23cf2ff0392177fc7052a9ddca",
"main.dart.js_22.part.js": "59fefc0ff5f21cb3a53ce837b6104c49",
"main.dart.js_31.part.js": "cfe04988e406fdff5839dc86cf723b30",
"main.dart.js_28.part.js": "0df4aaf67c2c5d987f9e11d4e208dfa8",
"main.dart.js_25.part.js": "b4e61cb3d0175dfd77a172003d6308ea",
"main.dart.js_53.part.js": "d6f21a16a9c42f9215169464d1b78d7f",
"main.dart.js_1.part.js": "10db623aef7f7b16acff77cd77900b2c",
"main.dart.js_8.part.js": "7000c49948499f16811770fc47307f37",
"main.dart.js_66.part.js": "96d44880a1d89c68cdb1b6f4d20aaeca",
"main.dart.js_69.part.js": "dfbbb48cc7481d21d4ee7f902c72bc10",
"main.dart.js_45.part.js": "f7d8dcdd7c02df0d4278f46b2abbd23c",
"main.dart.js_24.part.js": "2ad7bf4d94df98cd8f357ef717ff2a1d",
"main.dart.js_54.part.js": "bcc433be6dcacdf206829cb8cba3fd7a",
"main.dart.js_59.part.js": "c82ab07bca848b9c5fe58ad5e37b7cea",
"main.dart.js_63.part.js": "1cacd86a29856bc2aad517895cd42829",
"main.dart.js_38.part.js": "1b0a9bf18e272b6bcb2592fd90398ce2",
"main.dart.js_3.part.js": "841bb8bbd309ca07e895b5e793b90dc1",
"main.dart.js_12.part.js": "ce8a6a98ea0494f70b209b6af7311191",
"main.dart.js_62.part.js": "4c0bbfc47503925e86c4069c214dcf9a",
"main.dart.js_21.part.js": "3db1842e7dc09f32f1e24701d9f91113"
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
