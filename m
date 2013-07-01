Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B29C6E013EC
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 08:41:51 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61FfokW032416
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 10:41:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61FfotG005083
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 10:41:50 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 10:41:50 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r61FfnO5015393;
	Mon, 1 Jul 2013 10:41:49 -0500
Date: Mon, 1 Jul 2013 21:11:48 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130701154148.GA1062@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Mon, 01 Jul 2013 15:41:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* The OMAP5 Audio Backend requires a 'firmware' to enable
  sound. This recipe installs a prebuilt firmware. This
  part is a hack, as in the current form, the firmware
  cannot be cross-compiled. There is a plan to fix this
  and hopefully, this recipe is short-lived. Once the code
  is fixed, we should have new recipes that build the firmware
  and clean up this recipe.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes-bsp/abefw/abefw.inc       |    8 ++++++++
 recipes-bsp/abefw/abefw_1.0.14.bb |   14 ++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/abefw/abefw.inc
 create mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb

diff --git a/recipes-bsp/abefw/abefw.inc b/recipes-bsp/abefw/abefw.inc
new file mode 100644
index 0000000..4b6e9dc
--- /dev/null
+++ b/recipes-bsp/abefw/abefw.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Firmware for OMAP5 ABE"
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=923db086ed9463ab3215b24d87e05ec5"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE = "omap5-evm"
diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.0.14.bb
new file mode 100644
index 0000000..df68080
--- /dev/null
+++ b/recipes-bsp/abefw/abefw_1.0.14.bb
@@ -0,0 +1,14 @@
+require abefw.inc
+
+SRC_URI = "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "ceccc0332264e39bdc51e54f80ea7256a3886c58"
+
+do_install() {
+        mkdir -p ${D}/lib/firmware
+        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
+}
+
+FILES_${PN} += "/lib/firmware/omap4_abe_new"
-- 
1.7.0.4


