Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67D7AE00E6A; Mon,  9 Jul 2018 09:35:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22B89E00E4F
	for <meta-ti@yoctoproject.org>; Mon,  9 Jul 2018 09:35:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w69GZsvP079031
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 11:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531154154;
	bh=poWyppTXDCzcOCi5mP4LEGR1CRi2f331CYJK0H94lts=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fjKC6bUFhZaT1OKjAFUN40RDZQydW14uVkPpN4fFOt0KQzJEMY+BRKRWPYnkUdG2n
	BHMdFusnh5h1OT/mhgz4/ZiLfvPCaYvy11UEjccTPrRo7M7k3oq26Syj/KDAoavGuZ
	DZ93NuDoTnRrxjJ5jqDsoqPEHL/YpAmCA6npOAsU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69GZsmJ028243
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 11:35:54 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 11:35:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 11:35:54 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69GZrLh002933
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 11:35:54 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 9 Jul 2018 12:35:47 -0400
Message-ID: <1531154148-30707-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531154148-30707-1-git-send-email-e-ruei1@ti.com>
References: <1531154148-30707-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/3] ti-sgx-ddk-um: add k3 (AM654x) support
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
X-List-Received-Date: Mon, 09 Jul 2018 16:35:56 -0000
Content-Type: text/plain

- add COMPATIBLE_MACHINE to distinguish AM3/4/5 with K3 (AM654x)
- add k3 support based on SGX DDK 1.17

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |  2 +
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb          | 84 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 282a4ab..354e081 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
 
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BRANCH = "ti-img-sgx/rocko/${PV}"
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
new file mode 100644
index 0000000..016709a
--- /dev/null
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -0,0 +1,84 @@
+DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
+
+COMPATIBLE_MACHINE = "k3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH = "ti-img-sgx/rocko/${PV}"
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
+SRCREV = "a564d20ec1b6aed55b3e60aa9ff35f3809eca110"
+
+# There's only hardfp version available
+python __anonymous() {
+    tunes = d.getVar("TUNE_FEATURES", d, 1)
+    if not tunes:
+        return
+    pkgn = d.getVar("PN", d, 1)
+    pkgv = d.getVar("PV", d, 1)
+    if "callconvention-hard" not in tunes:
+        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+}
+
+TARGET_PRODUCT_k3 = "ti654x"
+
+
+INITSCRIPT_NAME = "rc.pvr"
+INITSCRIPT_PARAMS = "defaults 8"
+
+inherit update-rc.d
+
+PR = "r29"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
+
+DEPENDS += "libdrm udev libgbm wayland libffi"
+RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
+
+RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+
+RCONFLICTS_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+
+# The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
+RPROVIDES_${PN} += "libGLESv2.so.1"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
+    mkdir -p ${D}${libdir}/gbm
+    ln -sf ../libpvrGBMWSEGL.so.${PV} ${D}${libdir}/gbm/gbm_pvr.so
+    ln -sf libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
+    chown -R root:root ${D}
+}
+
+FILES_${PN} =  "${bindir}/*"
+FILES_${PN} += " ${libdir}/*"
+FILES_${PN} +=  "${includedir}/*"
+FILES_${PN} +=  "${sysconfdir}/*"
+
+PACKAGES =+ "${PN}-plugins"
+FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libGLES_CM.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
+RDEPENDS_${PN} += "${PN}-plugins"
+
+ALLOW_EMPTY_${PN}-plugins = "1"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+
+INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
+INSANE_SKIP_${PN}-plugins = "dev-so"
+INSANE_SKIP_${PN} += "already-stripped"
+
+CLEANBROKEN = "1"
-- 
1.9.1


