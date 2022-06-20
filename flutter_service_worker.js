'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "898ea0731458a3ac7d1581c6f852f2d0",
"main.dart.js_34.part.js": "6dfc252530ddd075367a530c07f13196",
"main.dart.js_54.part.js": "07eb1945ce361024dcee3ccf3263f706",
"main.dart.js_22.part.js": "dfc6b64d499f69da8381ddb7528efea4",
"main.dart.js_12.part.js": "c81e7e045c8ee35afcf5550fa974126c",
"main.dart.js_10.part.js": "90664cc3aa16991c156c27dfae4a73ae",
"main.dart.js_60.part.js": "74f5dfd46678e347579143ddd2d7c4de",
"main.dart.js_49.part.js": "969f3df8fccc074e18c08984c093df39",
"main.dart.js_1.part.js": "2c5275449be613807c2865730ce08849",
"main.dart.js_33.part.js": "db02c34b47447ef720222c33f4864ece",
"main.dart.js_7.part.js": "8c351d50e279f4b4c9a019fa87ad8d68",
"main.dart.js_59.part.js": "27f8f98852b616877dcd8c2cf081a8b9",
"main.dart.js_28.part.js": "aa2559faf372b94447167d50a5858671",
"main.dart.js_48.part.js": "8f9fee2231caa69ad04180b5b3c2047e",
"main.dart.js_3.part.js": "61495b8547ad98e146582e7e203ca3ca",
"main.dart.js_23.part.js": "8461317f63a9b6824d8c436209203361",
"main.dart.js_43.part.js": "e4f19019d28f54fb928295fe13d082b6",
"main.dart.js_11.part.js": "e7cf97e1e01bfb7344ab59a58048af27",
"main.dart.js_21.part.js": "57ed61acf370a5ddd5bc8fc607e21d94",
"manifest.json": "035a521ac78dbe41644399f73366b6ac",
"main.dart.js_29.part.js": "c145d08cbc917404d9eeee01bc432279",
"main.dart.js_62.part.js": "789985c9259f5708ecd18a146c144eeb",
"main.dart.js_17.part.js": "32242ac13a3ff4c2e7081bc5c6250183",
"version.json": "b1352d85895503aba1fcdd29e31f2066",
"main.dart.js_32.part.js": "782f804ae678eb212a19580c3a543dea",
"main.dart.js_58.part.js": "df5cebac8728155583cc3e550032600c",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_20.part.js": "63b360f66569228538a35deeced6c36a",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_19.part.js": "90de678a15cadeed30a554997a9c016e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"main.dart.js_16.part.js": "e66708a2af67f727e747c0e91e16d2a0",
"main.dart.js_36.part.js": "3eb35da6fc110a5f001d98442bf030df",
"main.dart.js_25.part.js": "1be2b584f68374a9c80a31322599975a",
"main.dart.js_8.part.js": "5bd8ed6812b135dce7a6861977e3856d",
"main.dart.js_40.part.js": "b0676b9d47530e0ee4ddbb9f97d5fdcf",
"main.dart.js_45.part.js": "5bba6c3f6ded6242f83a2f090fe13764",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"assets/AssetManifest.json": "309c416f3d0cf5750989b17b37bd35ec",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/assets/images/0.jpg": "92d1545d90ec7ead183bf75ac146d213",
"assets/assets/images/demo.png": "13e9c72ec37fac220397aa819fa1ef2d",
"assets/NOTICES": "f5825f11af247f07c1915f10a9620f2e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"main.dart.js_39.part.js": "d6947cf01533d0b02c12ee5879675586",
"main.dart.js_2.part.js": "022cc879ccd65121676969bc15032f53",
"main.dart.js_47.part.js": "a102075817704e19726577f547c89137",
"main.dart.js_31.part.js": "65465633c5779d23d5c47fa500cb46ee",
"main.dart.js_38.part.js": "d2217c61e802a69a5180399ad3f4edf3",
"main.dart.js_61.part.js": "f850fc3a35db28fcb2ce930d3a55869c",
"main.dart.js_52.part.js": "632a5d8ee9c5ec16875e3ea2fb1e3109",
"main.dart.js_24.part.js": "637baff6b559f195f25b1378f47af0b2",
"main.dart.js_42.part.js": "9cdb8fffbbbe71766d7cc8e8e69b639f",
"main.dart.js_55.part.js": "6bde4b23287209d242bc29382fdbfb05",
"main.dart.js_18.part.js": "ef4a778ca1bcd8fb211844dfc15853c7",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js_15.part.js": "ab60c0d3af2ab5721b588ceed606f337",
"main.dart.js_27.part.js": "8f974008f729966e62535ce923a82ed7",
"main.dart.js_6.part.js": "00fdcce94e4d1fca8a2088a45db6ba06"
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
