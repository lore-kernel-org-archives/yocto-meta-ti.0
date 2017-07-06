Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15962E00B57; Thu,  6 Jul 2017 09:37:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B096CE00B57
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:37:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66GbUCS009085
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499359050;
	bh=P27CLyM/tQ41ovwJDGBsc0qe4qUqOy1yd7kj/KNverE=;
	h=From:To:CC:Subject:Date;
	b=UO2c8GYjgX8z7j1Xe7ZSe+XQ6Gdlv6ZoxeNvFlMMsJxTMHH+tdf9z3BUQ/jYYGeDe
	f97lhQxgvRs3sQ2zJP2P0ZrZ29gfDys/84TmallCMlsEwsEB9XVQpS4VoPImGgVM9N
	qTRxfS0owbrcAT0uPXNXVBhvEk1+sIUgUanq1lQ0=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66GbU6M004764
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:37:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:37:29 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66GbTRi008430;	Thu, 6 Jul 2017 11:37:29 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:37:28 -0400
Message-ID: <1499359048-35341-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] audk2g-addon-rtos: Added recipe for audk2g-addon-rtos
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
X-List-Received-Date: Thu, 06 Jul 2017 16:37:35 -0000
Content-Type: text/plain

---
 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb | 42 +++++++++++++++++++++++
 recipes-bsp/audk2g-addon/audk2g-addon.inc         | 22 ++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
 create mode 100644 recipes-bsp/audk2g-addon/audk2g-addon.inc

diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
new file mode 100644
index 0000000..c6065ac
--- /dev/null
+++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
@@ -0,0 +1,42 @@
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+require audk2g-addon.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = " ti-cgt6x-native \
+            ti-sysbios \
+            ti-xdctools \
+            ti-pdk-build-rtos \
+            common-csl-ip-rtos \
+            gpio-lld-rtos \
+            i2c-lld-rtos \
+            board-rtos \
+"
+
+export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
+
+export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
+
+LIMSOCS = "k2g"
+LIMBOARDS = "evmK2G"
+
+export PDK_AUDK2G_ROOT_PATH = "${WORKDIR}/git"
+
+do_compile() {
+    cd ${S}
+
+    make release LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
+}
+
+do_install() {
+    cd ${S}
+
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/audk2g
+    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
diff --git a/recipes-bsp/audk2g-addon/audk2g-addon.inc b/recipes-bsp/audk2g-addon/audk2g-addon.inc
new file mode 100644
index 0000000..eced255
--- /dev/null
+++ b/recipes-bsp/audk2g-addon/audk2g-addon.inc
@@ -0,0 +1,22 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://audk2gaddonver.h;beginline=8;endline=47;md5=7a3996aaf1a3d3ca87358cf9b89bce3d"
+
+COMPATIBLE_MACHINE = "k2g"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+AUDK2G_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/audk2g-addon.git"
+AUDK2G_ADDON_GIT_PROTOCOL = "git"
+AUDK2G_ADDON_GIT_BRANCH = "master"
+AUDK2G_ADDON_GIT_DESTSUFFIX = "git/ti/addon/audk2g"
+
+# Below commit ID corresponds to "DEV.AUDK2G.01.04.00.00"
+AUDK2G_ADDON_SRCREV = "815180b45ceb1fa3c110f9979106c7f5aa8b3ca2"
+
+BRANCH = "${AUDK2G_ADDON_GIT_BRANCH}"
+SRC_URI = "${AUDK2G_ADDON_GIT_URI};destsuffix=${AUDK2G_ADDON_GIT_DESTSUFFIX};protocol=${AUDK2G_ADDON_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${AUDK2G_ADDON_SRCREV}"
+PV = "01.04.00.00"
+INC_PR = "r0"
+
+S = "${WORKDIR}/git/ti/addon/audk2g"
-- 
1.9.1


