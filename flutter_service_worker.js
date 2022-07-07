'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js_13.part.js": "424c0a5dce51834d6a6c1ab326345647",
"main.dart.js_37.part.js": "1a1dbc5955728f517d899b909fa2ea7a",
"main.dart.js_44.part.js": "d584f669f02e48182f6fb61eb8a2125b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"main.dart.js_32.part.js": "0c9118a3d833f4a5a93d92f98e6e7828",
"main.dart.js_9.part.js": "e99f97c1f1cab62b7b556b302d0233e7",
"main.dart.js_70.part.js": "a33c692110dee52d42bb7db3145162c0",
"index.html": "199ee05d0cc8f918f3db059258ce3496",
"/": "199ee05d0cc8f918f3db059258ce3496",
"main.dart.js_52.part.js": "5ea080fa3fd6873e137ad2044177e331",
"main.dart.js_11.part.js": "0234d31128582e12a8bd59a003e1cb07",
"main.dart.js_67.part.js": "1fc4500e9b3d3cea7378aba5679e20f4",
"main.dart.js_16.part.js": "3da7e9061068eb55d7219a75a574d532",
"main.dart.js_68.part.js": "18cb70e30231f465b895f439712fea63",
"main.dart.js_34.part.js": "d9c68fb225704efb52942c768d68cdb1",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"main.dart.js_27.part.js": "4314b8bf9aa6302032eb787544cf1cf7",
"main.dart.js_50.part.js": "7a648142085176c5f163b4b540ed4a11",
"main.dart.js_23.part.js": "13b31b17a4f5f90526a9a0dafdd6e6fc",
"main.dart.js_48.part.js": "9bc36f284515fcb1163ccf935dcccf69",
"main.dart.js_15.part.js": "17661f45b2549028709a7f0452bcf33c",
"manifest.json": "035a521ac78dbe41644399f73366b6ac",
"main.dart.js_76.part.js": "f1cdb2f03f40eb1536e346c781779ef6",
"version.json": "74906722f3ddbfef153a564e9de80ac5",
"main.dart.js_61.part.js": "8f19292198839ce56b3480b2f1d5cefa",
"main.dart.js_55.part.js": "3353922021c19bb1167973b94ad051b6",
"main.dart.js_56.part.js": "a175d8457c66208e77292634f53d932a",
"main.dart.js_18.part.js": "7f686f8d9b1e786fd4f1a952e299b7ff",
"main.dart.js_33.part.js": "be910486974b8c193449c031ab2e85a4",
"main.dart.js_43.part.js": "749c9ad9d38531cb423ae5ce2f769905",
"main.dart.js_72.part.js": "d521ea571015971f8d48769aef8f6658",
"main.dart.js_10.part.js": "f3184ec60195a01bfdc9d8e013f24ecc",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/AssetManifest.json": "873bd10cfa1cba52413c74cfacbce508",
"assets/assets/images/demo.png": "13e9c72ec37fac220397aa819fa1ef2d",
"assets/assets/images/0.jpg": "92d1545d90ec7ead183bf75ac146d213",
"assets/assets/role.yaml": "2cd5d9075129d202d172ad12bcf24a5a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/NOTICES": "a3c73c630b8010a2e322d41819757bda",
"main.dart.js_5.part.js": "d165daea4d2487712ee0a23972b60784",
"main.dart.js_36.part.js": "04747a694b8a542953bee8c5b4d01290",
"main.dart.js_26.part.js": "670772edc0cf32c2ef763e1ae01f0c75",
"main.dart.js_78.part.js": "25ce02faae1f49da9b588ffda1b75833",
"main.dart.js_41.part.js": "b1fb83ad90ba50b9ebb09bfa07f53d85",
"main.dart.js_30.part.js": "fcd0320fc07b7966fca20db57026076c",
"main.dart.js": "270011cb41c5e51b27b52b9205a5045e",
"main.dart.js_28.part.js": "426c4b714a620bd947a269e46beab984",
"main.dart.js_25.part.js": "cbbbea101eded487d5ef05473e309fc7",
"main.dart.js_53.part.js": "c21100bcf64cbf0f82a1fe2b6411edc2",
"main.dart.js_1.part.js": "cb6eb1b4b387d57366d2510048a32c30",
"main.dart.js_66.part.js": "f085aa96be8b73fcf3ec503584dd579e",
"main.dart.js_69.part.js": "b33d38e82dee54299d45c4239d6bad3e",
"main.dart.js_45.part.js": "dd34a3a3b36c12713c112d7a2008462d",
"main.dart.js_24.part.js": "b25029ec6ea4710a2ec79ba181909cc7",
"main.dart.js_74.part.js": "65601e6d13cc2b582a22846937101771",
"main.dart.js_57.part.js": "e44dc737f2fe55be0413f7d61d4d0316",
"main.dart.js_46.part.js": "2f1873d0ebc3601c506524644c0d2517",
"main.dart.js_54.part.js": "315cef15722db6852cc0726a1fad7717",
"main.dart.js_59.part.js": "91ecb5bbb8baeaa9703c78b51e650bb9",
"main.dart.js_63.part.js": "fd25571bf73932460de1ab81ac9fc951",
"main.dart.js_38.part.js": "30dcf5255b2f939f6722fa4ccde1f2ed",
"main.dart.js_3.part.js": "4404b79c2bdf6e35d828e0cc4daea300",
"main.dart.js_12.part.js": "89ad7e1899fbde1564ea752fb01adcc0",
"main.dart.js_21.part.js": "925013fd2989b234adbae716fac46d0b",
"main.dart.js_4.part.js": "2735f930e70af73640e5018f09cc3512"
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
