'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "1c8e9c0f2b53427e3a8310233bcf3276",
"assets/assets/img/contact.svg": "81728bc98a64dafb3b02f50bf2cec000",
"assets/assets/img/fb.svg": "3bd2b84cbaad7f04725681b5f900234e",
"assets/assets/img/locatie.svg": "5b507eee5f921641ffc780aa05fb2b42",
"assets/assets/img/logo.svg": "883dbcb4b524e7b633f790d6aad9fa07",
"assets/assets/img/logo_agressione.jpg": "7ad3fb1541656d1edf09b2f7a3f60ccf",
"assets/assets/img/logo_ambient.png": "b318713d4842ee3c0201cafecb07326d",
"assets/assets/img/logo_artpoint.png": "3b139a465f8b673f3c1573262c0528a7",
"assets/assets/img/logo_austral.png": "c2b5d806729486576bfe4d9bd0e4afd8",
"assets/assets/img/logo_brinel.png": "121f46b0ac1cf884a3634aaf5fb40d2f",
"assets/assets/img/logo_cp.jpg": "285e17403750ef8d49264ee65ca40279",
"assets/assets/img/logo_delonghi.webp": "bc900a22c2af55ee7dcc1ee9dea6b689",
"assets/assets/img/logo_downcer.png": "383c70c6aca0528aaaba0a3ba297e728",
"assets/assets/img/logo_emerson.png": "7a13a7cd7bd0c88887a6123ed9c26aa5",
"assets/assets/img/logo_frh.png": "2a0401968a8d2732501586b90b26d8e4",
"assets/assets/img/logo_nspyre.png": "74590ce0a85d6b3830941e78e6616977",
"assets/assets/img/logo_ribeit.jpg": "ef05cecd40e8781abb7779f618e43f36",
"assets/assets/img/logo_rpw.jpg": "8333f73df5054e07d7251c4b2ec80d4d",
"assets/assets/img/logo_salesconsulting.png": "378c6ef148052932dde39fd9a3f21967",
"assets/assets/img/logo_skep.png": "487e4d1488828af0a5499c90811ab816",
"assets/assets/img/logo_starlubricants.jpg": "90ad4051ac9905ba0ec0c462c940fe39",
"assets/assets/img/logo_sunimprof.png": "4ca091e4345a1545ed3163316062f78f",
"assets/assets/img/logo_techsoup.jpg": "b2103ac547e4e8b56da6f26ace9d09ad",
"assets/assets/img/logo_text.svg": "9a0f54731d4b6a78ab5c254cbbd12b04",
"assets/assets/img/poza1.jpg": "73b5b618706afd5b0573a74c23ee91f3",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "a225f5bd464958125a4fcdf2df2e0082",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "45f5c290d4b574b73e70d9054fa3417f",
"/": "45f5c290d4b574b73e70d9054fa3417f",
"main.dart.js": "f8609d16783f862b47d3d74ff22faa42",
"manifest.json": "2dae1bb9f0e4bce459d4622e201ca4b5",
"version.json": "104e299ee734e33fccb2da53b94c7ae1"
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
