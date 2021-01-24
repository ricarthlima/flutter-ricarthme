'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/config": "b3faa8806c5852e6503eef95f566515a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ecbb0cb5ffb7d773cd5b2407b210cc3b",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/index": "034c80fc7b14444bd51ab97d2efbc453",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "c597216058212f0b049343470a04503f",
".git/logs/refs/heads/master": "c597216058212f0b049343470a04503f",
".git/logs/refs/remotes/origin/HEAD": "c597216058212f0b049343470a04503f",
".git/objects/pack/pack-98ee4845703aa50b62e09ddbc8d5c06d893f69d5.idx": "9c549e5dcdcafd2d494c1db9b2eb37ce",
".git/objects/pack/pack-98ee4845703aa50b62e09ddbc8d5c06d893f69d5.pack": "bf7c6040da5a6a612adfd4078fd88515",
".git/packed-refs": "c243698c3d6725e9148e430c0842ccf7",
".git/refs/heads/master": "e680d76f105816bee644cc9b79b840af",
".git/refs/remotes/origin/HEAD": "73a00957034783b7b5c8294c54cd3e12",
"assets/AssetManifest.json": "5f56b0c7db3c8f589d17768d0b68a024",
"assets/assets/assets/coding_bg.jpg": "3a8418a2714a361b1ff86735eb16d16d",
"assets/assets/assets/construction.gif": "c94f1b33c9208adbb3163c483f3d82c3",
"assets/assets/assets/contact_bg.jpg": "b45c8dbae84434e1562a007c6632cc52",
"assets/assets/assets/flutter_me.png": "0c93a065ae68b1f3f64a07b7aabe07d8",
"assets/assets/assets/icon_android.png": "febea6f689d5f971245754b1cba8e83d",
"assets/assets/assets/icon_blueprint.png": "4654f41a04b1e5179fcaa2c4ce5c228a",
"assets/assets/assets/icon_email.png": "cd11655d5af7b911aef5de4dec350897",
"assets/assets/assets/icon_instagram.png": "ef1ba6f51764c8c8a70cd5762768ea70",
"assets/assets/assets/icon_photoshop.png": "e2c6eb0320487fd2b2f6aab33d3e93a0",
"assets/assets/assets/icon_smartphone.png": "45116e325784e538476124ff2a983afd",
"assets/assets/assets/icon_teacher.png": "b6e082d47d965ef608cd4c394356773d",
"assets/assets/assets/icon_twitter.png": "f8498b086823a485947ef37bb023c0b6",
"assets/assets/assets/icon_web.png": "55af6869621f3c88e75b90054c6b9b48",
"assets/assets/assets/icon_youtube.png": "d7e54ed2ec94f5f8d5ae54b2a26628f4",
"assets/assets/assets/ricarth.png": "dd6966b19df25364cb94721673fd523a",
"assets/assets/coding_bg.jpg": "3a8418a2714a361b1ff86735eb16d16d",
"assets/assets/construction.gif": "c94f1b33c9208adbb3163c483f3d82c3",
"assets/assets/contact_bg.jpg": "b45c8dbae84434e1562a007c6632cc52",
"assets/assets/flutter_me.png": "0c93a065ae68b1f3f64a07b7aabe07d8",
"assets/assets/icon_android.png": "febea6f689d5f971245754b1cba8e83d",
"assets/assets/icon_blueprint.png": "4654f41a04b1e5179fcaa2c4ce5c228a",
"assets/assets/icon_email.png": "cd11655d5af7b911aef5de4dec350897",
"assets/assets/icon_instagram.png": "ef1ba6f51764c8c8a70cd5762768ea70",
"assets/assets/icon_photoshop.png": "e2c6eb0320487fd2b2f6aab33d3e93a0",
"assets/assets/icon_smartphone.png": "45116e325784e538476124ff2a983afd",
"assets/assets/icon_teacher.png": "b6e082d47d965ef608cd4c394356773d",
"assets/assets/icon_twitter.png": "f8498b086823a485947ef37bb023c0b6",
"assets/assets/icon_web.png": "55af6869621f3c88e75b90054c6b9b48",
"assets/assets/icon_youtube.png": "d7e54ed2ec94f5f8d5ae54b2a26628f4",
"assets/assets/ricarth.png": "dd6966b19df25364cb94721673fd523a",
"assets/FontManifest.json": "7e9433d5386f1e47ab22f0afd8e7a4f9",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/fonts/NotoSans-Regular.ttf": "5a87cce84010f7cea085ae218d44a64b",
"assets/NOTICES": "8206a19ee65ad95b26911edcc5bd18b2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "c8b633e1e02043f81b37dccb28837456",
"icons/Icon-192.png": "0795fcfbce815666217cec0cbc20feab",
"icons/Icon-512.png": "870114fb9818457fda34adac24a40cfb",
"index.html": "5c0f5affe745c7fd5d808ffdf24e3482",
"/": "5c0f5affe745c7fd5d808ffdf24e3482",
"main.dart.js": "3eddd305cd85a4401282a9955ab895a8",
"manifest.json": "732b340f3cc552ff95f0801601d9b73f",
"version.json": "86de147ee5343277ac37765a035c711d"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
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
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
  for (var resourceKey in Object.keys(RESOURCES)) {
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
