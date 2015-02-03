Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81D66E0076F; Tue,  3 Feb 2015 13:33:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 249CAE00757
	for <meta-ti@yoctoproject.org>; Tue,  3 Feb 2015 13:33:50 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t13LXnBV030530
	for <meta-ti@yoctoproject.org>; Tue, 3 Feb 2015 15:33:49 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t13LXm7u015468
	for <meta-ti@yoctoproject.org>; Tue, 3 Feb 2015 15:33:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Feb 2015 15:33:48 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t13LXm1C009827;	Tue, 3 Feb 2015 15:33:48 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Feb 2015 16:33:46 -0500
Message-ID: <1422999226-5198-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ipsecmgr: Add recipe for ipsec manager
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
X-List-Received-Date: Tue, 03 Feb 2015 21:33:53 -0000
Content-Type: text/plain

- Provides module and library to offload IPSec security
 policy & associated security association to NETCP for
 crypto operations

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/ipsecmgr/ipsecmgr_git.bb |   52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 recipes-bsp/ipsecmgr/ipsecmgr_git.bb

diff --git a/recipes-bsp/ipsecmgr/ipsecmgr_git.bb b/recipes-bsp/ipsecmgr/ipsecmgr_git.bb
new file mode 100644
index 0000000..2fb6c1a
--- /dev/null
+++ b/recipes-bsp/ipsecmgr/ipsecmgr_git.bb
@@ -0,0 +1,52 @@
+SUMMARY = "IPSec Manager kernel module and libraries"
+DESCRIPTION = "Provides ability to offload IPSec security policy & associated security association to NETCP for crypto operations"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadca4fb5599f508dc11fa1e752919"
+
+BRANCH="master"
+SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
+#Commit ID corresponding to DEV.IPSECMGR.01.01.00.03
+SRCREV = "1ea8355ae9142311901c842c97a58d2846b308e6"
+PV     = "01.01.00.03"
+
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+DEPENDS = "libnl libnl-xfrm"
+
+S = "${WORKDIR}/git"
+LIB_BUILD_DIR = "${S}/build"
+MODULE_BUILD_DIR = "${S}/src/module"
+LIB_INC_DIR = "${S}/"
+UTILS_LIB_INC_DIR = "${S}/utils/iface/"
+
+EXTRA_OEMAKE += "KDIR="${STAGING_KERNEL_DIR}""
+CFLAGS += "-I${STAGING_INCDIR}/libnl3"
+
+inherit module
+
+do_compile() {
+# Compile the library
+	cd ${LIB_BUILD_DIR}
+	make clean
+	make all
+
+# Compile kernel module
+	cd ${MODULE_BUILD_DIR}
+	oe_runmake clean
+	oe_runmake
+}
+
+do_install() {
+# Install libraries
+	install -d ${D}${libdir}/
+	install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_snoop.a ${D}${libdir}/
+	install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_ipc.a ${D}${libdir}/
+	install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_syslog.a ${D}${libdir}/
+	install -d ${D}${includedir}/
+	install -c -m 666 ${LIB_INC_DIR}/*.h ${D}${includedir}/
+	install -c -m 666 ${UTILS_LIB_INC_DIR}/*.h ${D}${includedir}/
+# Install kernel module
+	cd ${MODULE_BUILD_DIR}
+	oe_runmake INSTALL_MOD_PATH="${D}" install
+}
-- 
1.7.9.5


