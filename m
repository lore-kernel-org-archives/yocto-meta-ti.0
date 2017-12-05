Return-Path: <eyalr@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58717E00D69; Tue,  5 Dec 2017 01:28:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F03EE00C97
	for <meta-ti@yoctoproject.org>; Tue,  5 Dec 2017 01:28:26 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB59SPDj001582
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 03:28:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512466105;
	bh=34Aru0JPdbivTs8+k7bf+3lHw1r9Do7q/0vgKqkUAv8=;
	h=From:To:CC:Subject:Date;
	b=ieGFEVuA9Fs4UEjH1Lmr5ZEui+MQehIDym8bdJCBZOdK4V9ql7NxFeIVm6rUEtQ4i
	hL3OdUbKuzhhzez/9YVTFJPjOM52qzEUofTJHptP0kVQ87+IekdKAIDm2ckndPNpUn
	00PMRshm/ygjFPPxrMUj8+tMl7g7BSQY8DMHxQks=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB59SP1I016686
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 03:28:25 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Tue, 5 Dec 2017 10:28:24 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [v2 1/4] wl18xx-fw: update recipe for version R8.7_SP3
Thread-Index: AdNtq1+HiIIGZwO2QE+ZM6gGbK66Hw==
Date: Tue, 5 Dec 2017 09:28:24 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364AAE9D@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.93]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [v2 1/4] wl18xx-fw: update recipe for version R8.7_SP3
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
X-List-Received-Date: Tue, 05 Dec 2017 09:28:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb | 26 --------------------------
 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb
 create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb

diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb b/recipes-bsp/wl18xx-=
fw/wl18xx-fw_8.7.1.bb
deleted file mode 100644
index ec360fe..0000000
--- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION =3D "Firmware files for use with TI wl18xx"
-LICENSE =3D "TI-TSPA"
-LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D4977a0fe767ee17765ae63c435a32a9=
e"
-
-SRC_URI =3D " \
-	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=3Dgit;branch=3D${BRA=
NCH} \
-	file://0001-Add-Makefile-to-install-firmware-files.patch \
-"
-
-# Tag: R8.7-SP1 (8.7.1)
-SRCREV =3D "fe3909e93d15a4b17e43699dde2bba0e9a3c0abc"
-BRANCH =3D "master"
-
-S =3D "${WORKDIR}/git"
-
-CLEANBROKEN =3D "1"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    oe_runmake 'DEST_DIR=3D${D}' install
-}
-
-FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-=
fw/wl18xx-fw_8.7.3.bb
new file mode 100644
index 0000000..a52ec89
--- /dev/null
+++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
@@ -0,0 +1,26 @@
+DESCRIPTION =3D "Firmware files for use with TI wl18xx"
+LICENSE =3D "TI-TSPA"
+LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D4977a0fe767ee17765ae63c435a32a9=
e"
+
+SRC_URI =3D " \
+	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=3Dgit;branch=3D${BRA=
NCH} \
+	file://0001-Add-Makefile-to-install-firmware-files.patch \
+"
+
+# Tag: R8.7-SP3 (8.7.3)
+SRCREV =3D "f659be25473e4bde8dc790bff703ecacde6e21da"
+BRANCH =3D "master"
+
+S =3D "${WORKDIR}/git"
+
+CLEANBROKEN =3D "1"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    oe_runmake 'DEST_DIR=3D${D}' install
+}
+
+FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
--=20
2.7.4


