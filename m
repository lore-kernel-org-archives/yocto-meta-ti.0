Return-Path: <vomegaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06EEEE00D69; Wed,  7 Dec 2016 11:40:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.49 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CB91E0073D
	for <meta-ti@yoctoproject.org>; Wed,  7 Dec 2016 11:40:04 -0800 (PST)
Received: by mail-wm0-f49.google.com with SMTP id g23so184441166wme.1
	for <meta-ti@yoctoproject.org>; Wed, 07 Dec 2016 11:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=fodPsr/6qYGxk/h7nDaVDk+zD3sZtUH2CeH3qD/4c+8=;
	b=gXylTPwtEzMUKiEUz8v2HhNVsxq95KNP0t5+BQ9RaIQIxEA9vIfo1ixj5v80nH9vLA
	Qixrvk2i0kd7GMtdT0wytlP1JwmT1timp2BsTcQZWqRUUfoqysX8pFjn8k+Iea7B/uwa
	xXdcxBOuPGbxls5Y52T9gLWKcuB28csyTAA2xA9n/2Edg8K1/zIy9MjqeEontK1lMWX0
	K5i+HhjKOIrpAfvEHkzZ0FEj3DklY9KWVjZ7rZFR77V6B1kgv/cyMFl25UKhrzl17/bb
	6nP4wXcdjnkU6QxoMLK95iDFFj/ffY2jn82xdUN09FwbJFv7VZJlN863937QrCjvWpT5
	JHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=fodPsr/6qYGxk/h7nDaVDk+zD3sZtUH2CeH3qD/4c+8=;
	b=UdZrI8U1JL8+/hePfGTRm8SVlIKC8MaXsHWkDfZty1HaCqDchu9xo3ffBfO3nLlqje
	VOGviuPTzSa0jHXBe00hEymuGmJYmQrjrLnFhyEGwFLuq+gAV3eBa9vr9M+HYVGofXOL
	CJU9G28s+cJ2eCLtv3Vvq7yY6bgJ25kaqOUvBsThDvlPnmRcTQLYryum9Ldyv9qNSEZw
	mzyc3N8xkQu6vxED5UM23BXrP3WaeJFGLfpEbSKVc6c7k5J6HzSzKwMkQOBAlS1PltNk
	yDpgNhfu5EEb/jUqjbt2pVZKvyLkQKINzekiMBCTPhKO+G9+dLLT69nsj5TC2h34zdNM
	VVXQ==
X-Gm-Message-State: AKaTC01OYqTSCkS97BP0CTUhuI4X8mh9U4WyUocbBKKr6gblwMe86N9z0gB3kOMTAeGQQQ==
X-Received: by 10.28.168.70 with SMTP id r67mr4007739wme.19.1481139603297;
	Wed, 07 Dec 2016 11:40:03 -0800 (PST)
Received: from sgxcmp483.sigfox.com (ram31-1-82-234-79-177.fbx.proxad.net.
	[82.234.79.177]) by smtp.gmail.com with ESMTPSA id
	r7sm33018166wjp.43.2016.12.07.11.40.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Dec 2016 11:40:02 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: meta-ti@yoctoproject.org
Date: Wed,  7 Dec 2016 20:39:49 +0100
Message-Id: <20161207193949.13288-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] Fix build issue due at the use of bb.data instead of d: Exception: AttributeError: module 'bb.data' has no attribute 'getVar'
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2016 19:40:08 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb     | 6 +++---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 6 +++---
 recipes-ti/devtools/ti-cgt6x_8.1.0.bb                  | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 45c8d519..394d1e4a 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -14,11 +14,11 @@ SRCREV = "ab0ca5bff345f6c13807fea3c4acabf5f2b9b10a"
 
 # There's only hardfp version available
 python __anonymous() {
-    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+    tunes = d.getVar("TUNE_FEATURES", d, 1)
     if not tunes:
         return
-    pkgn = bb.data.getVar("PN", d, 1)
-    pkgv = bb.data.getVar("PV", d, 1)
+    pkgn = d.getVar("PN", d, 1)
+    pkgv = d.getVar("PV", d, 1)
     if "callconvention-hard" not in tunes:
         bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
         raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 770cda21..5cec40e8 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -12,11 +12,11 @@ SRCREV = "a5152f0b90bf3916eb1f478ac9fefe7d7ebe8bd9"
 
 # There's only hardfp version available
 python __anonymous() {
-    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+    tunes = d.getVar("TUNE_FEATURES", d, 1)
     if not tunes:
         return
-    pkgn = bb.data.getVar("PN", d, 1)
-    pkgv = bb.data.getVar("PV", d, 1)
+    pkgn = d.getVar("PN", d, 1)
+    pkgv = d.getVar("PV", d, 1)
     if "callconvention-hard" not in tunes:
         bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
         raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
diff --git a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb b/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
index 79b562a9..5e97927b 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
@@ -13,14 +13,14 @@ COMPATIBLE_HOST_class-target = "arm.*-linux"
 
 # For now we only have hardfp version for target class
 python __anonymous() {
-    c = bb.data.getVar("CLASSOVERRIDE", d, 1)
+    c = d.getVar("CLASSOVERRIDE", d, 1)
 
     if c == "class-target":
-        tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+        tunes = d.getVar("TUNE_FEATURES", d, 1)
         if not tunes:
             return
-        pkgn = bb.data.getVar("PN", d, 1)
-        pkgv = bb.data.getVar("PV", d, 1)
+        pkgn = d.getVar("PN", d, 1)
+        pkgv = d.getVar("PV", d, 1)
         if "callconvention-hard" not in tunes:
             bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
             raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
-- 
2.11.0


