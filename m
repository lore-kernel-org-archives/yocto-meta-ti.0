Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B9F9E00BFE; Mon, 19 May 2014 12:20:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84CC6E00BDF
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 12:20:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKJv5012418
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKJmZ020591
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:18 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJJogB019914;	Mon, 19 May 2014 14:20:17 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 14:19:48 -0500
Message-ID: <1400527188-16951-10-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] omap5-sgx-ddk-um-linux: Add version 1.9.0.12
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
X-List-Received-Date: Mon, 19 May 2014 19:20:23 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Pulled in latest version 1.9.0.12 from meta-ti-gsldk and
  preserved authorship for Mrinmayee
* Mark this recipe as providing the gles1, gles2, and egl
  libraries so that it doesn't conflict with other recipes like
  mesa and will be pulled in to satisfy those dependencies

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
new file mode 100644
index 0000000..e36cc58
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Userspace libraries for SGX"
+HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git"
+SRCREV = "994922a5655c63b05343a9238cb30e6ef61744be"
+
+PR = "r2"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
+
+PACKAGES =+ "${PN}-${PV}"
+
+FILES_${PN} =  "${bindir}/*"
+FILES_${PN} += " ${libdir}/*"
+FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+INSANE_SKIP_${PN} += "dev-so"
-- 
1.7.9.5


