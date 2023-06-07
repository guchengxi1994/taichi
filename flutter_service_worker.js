'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"main.dart.js_78.part.js": "72910ea99eed051660452100b3f85992",
"main.dart.js_54.part.js": "350b364308d40aaddb594937326e34d5",
"main.dart.js_67.part.js": "ccd4e389144e58fb9f6c3eee2c9208b0",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_57.part.js": "664f32e762386a6336e476c09b755423",
"main.dart.js_56.part.js": "a175d8457c66208e77292634f53d932a",
"main.dart.js_74.part.js": "8a7e9b81fc531a740c5703b24cdb74ac",
"main.dart.js_37.part.js": "787890fa0b4b58ab0dd9828689913d2a",
"main.dart.js_3.part.js": "a742dcc45ee4b2ac6e9c792ebdfcb60e",
"main.dart.js_44.part.js": "015ce4c39876c131f28d850ddfb78f60",
"main.dart.js_28.part.js": "90e963ae056a8ad1e52de731a8f703f8",
"main.dart.js_59.part.js": "aa796d70585be8012dc5bbd669eaf3e3",
"main.dart.js_16.part.js": "7d6da2ac19a64f2c2e56c63844dd2712",
"main.dart.js_33.part.js": "834fa738862d7ff55466f027353de2a6",
"main.dart.js_72.part.js": "f6e4890ab03aa70b320953eaa4636bf6",
"main.dart.js_12.part.js": "89ad7e1899fbde1564ea752fb01adcc0",
"main.dart.js_26.part.js": "465df95d0698d6eec086c8a6f7cda924",
"main.dart.js_50.part.js": "7a648142085176c5f163b4b540ed4a11",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_13.part.js": "424c0a5dce51834d6a6c1ab326345647",
"main.dart.js_53.part.js": "21e0b71ead8223138d7cec69ab039c8a",
"main.dart.js_24.part.js": "b25029ec6ea4710a2ec79ba181909cc7",
"main.dart.js_10.part.js": "5a89178f935e613cde9afc04dfe85f17",
"main.dart.js_25.part.js": "449a7eb519c144648c44e16e56fd7f9d",
"main.dart.js_5.part.js": "447e7b3a01ae4e493a3ee4bf6f04de42",
"main.dart.js_61.part.js": "518e0a4b9607f6102628178d3e8c2588",
"main.dart.js_32.part.js": "0c9118a3d833f4a5a93d92f98e6e7828",
"main.dart.js_9.part.js": "5ee38ca5d480f95db228303cfeae12db",
"main.dart.js_30.part.js": "fcd0320fc07b7966fca20db57026076c",
"version.json": "7fc003be6a5600e6759a5a1fe1fb2f61",
"main.dart.js_52.part.js": "310ae0e6c91e60dfd80c23d2a2148f0b",
"main.dart.js_45.part.js": "7e172cd5249e775b45ff1aad196c9d77",
"main.dart.js_21.part.js": "d2f4667c28469fa7b97152608ecd2adb",
"main.dart.js_23.part.js": "13b31b17a4f5f90526a9a0dafdd6e6fc",
"main.dart.js_18.part.js": "7f686f8d9b1e786fd4f1a952e299b7ff",
"main.dart.js_63.part.js": "39de847ac99c16695c60dc2bc4d03c8d",
"main.dart.js_76.part.js": "9a1fa06ea5c0c354c39891508f1bd87a",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "86e71beb2a17ea59984c03cb0e20a57c",
"assets/assets/role.yaml": "2cd5d9075129d202d172ad12bcf24a5a",
"assets/assets/images/demo.png": "13e9c72ec37fac220397aa819fa1ef2d",
"assets/assets/images/0.jpg": "92d1545d90ec7ead183bf75ac146d213",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.json": "873bd10cfa1cba52413c74cfacbce508",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"main.dart.js_69.part.js": "b33d38e82dee54299d45c4239d6bad3e",
"main.dart.js_1.part.js": "7b0da0a87c3914e2bb59e480b6333683",
"main.dart.js": "58464dbfd49b014c4fb1a3680a723af1",
"main.dart.js_38.part.js": "c5fc7718143e2fc365c3392fe3121fc5",
"main.dart.js_48.part.js": "80c2ebc2e798ebd01efb4e168f7a664b",
"main.dart.js_36.part.js": "429898e4bf72b97bc8aba5d7724f894e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"main.dart.js_41.part.js": "726a6f5bc9e1255c71cfe5a619f7c0ad",
"main.dart.js_70.part.js": "30f8a1f6fd3cd95d3bac28fc2d883eb2",
"favicon.png": "01af07fe42c9538d879c86362e586b53",
"main.dart.js_4.part.js": "2735f930e70af73640e5018f09cc3512",
"main.dart.js_15.part.js": "e31b5448260e7b6b76c98013acc144f2",
"manifest.json": "035a521ac78dbe41644399f73366b6ac",
"main.dart.js_55.part.js": "414499abcae797c837f7951f4649d4f7",
"main.dart.js_34.part.js": "1de75e290190e7261fb3b15e1c200047",
"main.dart.js_66.part.js": "b184047f2e8ddd0dad2c23ddcb935cb4",
"main.dart.js_27.part.js": "d95edc87b5156cc8f1eef31cde54c425",
"main.dart.js_68.part.js": "8b100b63406381e2965f72f924b75570",
"main.dart.js_11.part.js": "43731b667603098a057bd66897b02a27",
"main.dart.js_43.part.js": "749c9ad9d38531cb423ae5ce2f769905",
"main.dart.js_46.part.js": "5b3c2db2233e821760ee918da6f186a0"
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
