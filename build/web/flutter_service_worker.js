'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "8cad354c8976e6bf61c70c7204186a69",
".git/config": "b3faa8806c5852e6503eef95f566515a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "8c423ba92d884a33c0a403d35f8ab9ae",
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
".git/index": "66c4aa75e2ccd1a034370a71d0d828ee",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "367620ec2063e02279caf5e2dbfb75d6",
".git/logs/refs/heads/master": "367620ec2063e02279caf5e2dbfb75d6",
".git/logs/refs/remotes/origin/HEAD": "c597216058212f0b049343470a04503f",
".git/logs/refs/remotes/origin/master": "5219ba5af210bded0dd95a706577ef98",
".git/objects/08/f171d5c4c178e96b7656b94d12988a30595567": "6ac9541bbbdff90a761a4db3bbfe4881",
".git/objects/1b/4b455b80aa22c576f14e962015099ec13de4e9": "ec304a3a7294aadccf468b9ca7230696",
".git/objects/1c/2d6cd5af2ea52657839518ec529b19d40fe6a5": "706eda091b85008e229b1a7f8f8fbdc6",
".git/objects/29/80464577adf478abd7999cfe8a6e2f8dd9011e": "a937cf0bf534fe9e440b325577d1f8e8",
".git/objects/2f/057dd0aaefa5dbcec3c59357660038d6e93229": "f55f375f5fd72a3d443951f860d4a05b",
".git/objects/3b/fbf298781b6433ce23439cab0f630162fd4055": "2891445c14bc2ca281c512aef411b7c9",
".git/objects/42/e42f79a324d3cd46a51bbf15c5679ba10545a7": "6474cde01bf32330a4eb3d0923d9f22a",
".git/objects/4c/bb4da3e59c969cb67788f5ded9393dc00a999e": "e64fecf86a2b6a3b9980ab6541b5c4fb",
".git/objects/4d/4c698a773205a2155bd795ce18dd52213a9764": "d930c09799ccddc7318acbcddb182415",
".git/objects/53/4d474bcfa48329043989c123563d48f491341c": "3a421896d32d4ae34f572f15df3915af",
".git/objects/5a/7a57ccf7b63f784651bfa0d06e3205b04d761b": "b80a867b5f50904d0cdf124f1b6148e9",
".git/objects/60/9fd4487a77faeefae5696c88e5a25798707853": "7920598efc6f9366e30abcc3142d2495",
".git/objects/65/5a476b0abdd89362ab8c97839bb8c3a51473f4": "16a19f6e3f1a1857a27a69e6381db063",
".git/objects/68/fddf176a4732d7136dddae129075c502b32d12": "295cdcc569dd54246c0ae16583a3441e",
".git/objects/6e/381b891f0ae09165c5d1f2abae564c352e3931": "2d72d260592c23f3a048983d93b21025",
".git/objects/6f/2c03c692a58a0f2d25db38b9480a12de850c09": "3f3b699b0cd70c5d3bb5b120bb8de9b8",
".git/objects/78/7f304059490e28e9d95a85b11426ae18b0fd7c": "f74a2d69bc2d263c3177a6eebf572f7f",
".git/objects/82/0665f7601b588a5839cd5eefaf054455eb15e1": "e6504546f25e3b56fe20115891e10244",
".git/objects/92/13ece78a08386d14af26d6f185c69911f74b8f": "b386688a51b72cfeae8c381f8540e825",
".git/objects/94/41edfc9431e3a25441e9704203112d7cab7730": "c8d6cbc40c9284499898c59a8cf1bcdc",
".git/objects/a0/0c3b4667eba4b04f2883d225374f6e3d6c9a4a": "da2866f604a20782c582593e26c1104e",
".git/objects/a2/ea830030a75a7cb91b35a50d6cd4e36aa54af1": "4b62b919643e81c68e1408a851fc2af1",
".git/objects/a3/bb5350a6e8490dcae73b76e674605b5578c0d0": "939665a5eceac1155fe62be74a1896dd",
".git/objects/ad/218563e431cdeee90cd2f070ccd08f85caaa8a": "4971c0343d79e879d4b0a6310db44734",
".git/objects/af/94379a8ccede48e7db3f3c218ec4d08e7e9759": "25debff948f7c885e8d16da734b28c76",
".git/objects/b2/e98c34e27e4f4192c0bc5dfa7cbb14989359bc": "efc89d5868d4ec4ec97858da99cdec19",
".git/objects/b3/580bae3141527d8cc99a38ade93b5a808d5775": "69219d4dc27f2d79e4c9a05fcf544d74",
".git/objects/b6/09581f2672eaf714ad9a963b0d1bf44766d7e4": "c98d45b801f2a95b74ea7282b411e8c7",
".git/objects/ba/23bbbbc00a840396bfa920c94ec54c9a31e111": "a2388cb19480f9208f47bc618c849d97",
".git/objects/bb/da8bcf276fb17ac87bc0da8a3231474de4b132": "9c4b85f3319da451d22a02dc6b16c086",
".git/objects/c2/5b25f8709161afd6a1a9da61d69826272c9f3e": "82905e60af5ffcdbf171f52af855b0f2",
".git/objects/c7/0edb9f738b3da88448961fda811040ad174852": "87c2fcc5563dcc35876ef28a1d60a82f",
".git/objects/c8/b8d5fa506c2bbf834c518f49fe410c535fac27": "2b22c9a8d0640a33e18e69386a2f5273",
".git/objects/ca/68c4aa846aa607f30922dba7cd3c5027c48102": "a9d3f16670f1a93575f454c77017e811",
".git/objects/d0/c454b2fb5c1e66902c280572bbeb7ca98a0bda": "af7248887e1f6c8a3f91f66fd9d7a92f",
".git/objects/d3/e2f9d40f4f404faf35e7ff417e6a74538741a2": "f8e626af171894625b103490277c673c",
".git/objects/d9/1d4a41c0de91b51460abe4f1b773cc6c81a24a": "0d9c5e7dd9e0581e366317aad6beba53",
".git/objects/fa/5a64976092ee7cb76f03c8aa948224b9323097": "ac30925fa9ed84c7a7fee5becd158218",
".git/objects/fb/0d59fb1eb041b7d899c581d864456cf77c135d": "abd9f5cab12b8b8bb78b7c3772c4c3af",
".git/objects/pack/pack-98ee4845703aa50b62e09ddbc8d5c06d893f69d5.idx": "9c549e5dcdcafd2d494c1db9b2eb37ce",
".git/objects/pack/pack-98ee4845703aa50b62e09ddbc8d5c06d893f69d5.pack": "bf7c6040da5a6a612adfd4078fd88515",
".git/ORIG_HEAD": "cf3fd19362a7f93710e7d52f1a40b29c",
".git/packed-refs": "c243698c3d6725e9148e430c0842ccf7",
".git/refs/heads/master": "a4440a00c1e366bef307122e6ce46ccd",
".git/refs/remotes/origin/HEAD": "73a00957034783b7b5c8294c54cd3e12",
".git/refs/remotes/origin/master": "a4440a00c1e366bef307122e6ce46ccd",
"assets/AssetManifest.json": "11c97e9ed6427a4aa7a5ec1475f2db50",
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
"assets/icon_android.png": "febea6f689d5f971245754b1cba8e83d",
"assets/icon_blueprint.png": "4654f41a04b1e5179fcaa2c4ce5c228a",
"assets/icon_email.png": "cd11655d5af7b911aef5de4dec350897",
"assets/icon_instagram.png": "ef1ba6f51764c8c8a70cd5762768ea70",
"assets/icon_photoshop.png": "e2c6eb0320487fd2b2f6aab33d3e93a0",
"assets/icon_smartphone.png": "45116e325784e538476124ff2a983afd",
"assets/icon_teacher.png": "b6e082d47d965ef608cd4c394356773d",
"assets/icon_twitter.png": "f8498b086823a485947ef37bb023c0b6",
"assets/icon_web.png": "55af6869621f3c88e75b90054c6b9b48",
"assets/icon_youtube.png": "d7e54ed2ec94f5f8d5ae54b2a26628f4",
"assets/NOTICES": "8206a19ee65ad95b26911edcc5bd18b2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "c8b633e1e02043f81b37dccb28837456",
"icons/Icon-192.png": "0795fcfbce815666217cec0cbc20feab",
"icons/Icon-512.png": "870114fb9818457fda34adac24a40cfb",
"index.html": "cf7d40a6d1d0188ed06818d8e1a800ec",
"/": "cf7d40a6d1d0188ed06818d8e1a800ec",
"main.dart.js": "886b8c1932b9aacb3580f21062881ba4",
"manifest.json": "370847913173b5d2e414f47088740b02",
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
