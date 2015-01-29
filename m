Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8AA42E00828; Thu, 29 Jan 2015 08:11:31 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B75AE006EF
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 08:11:28 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0TGBRgJ018025
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 10:11:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0TGBQJk028471
	for <meta-ti@yoctoproject.org>; Thu, 29 Jan 2015 10:11:26 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 10:11:26 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0TGBQw8023769;	Thu, 29 Jan 2015 10:11:26 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 29 Jan 2015 11:11:25 -0500
Message-ID: <1422547885-14935-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] ti-softhsmv2: Add recipe for ti customised softhsm package
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
X-List-Received-Date: Thu, 29 Jan 2015 16:11:31 -0000
Content-Type: text/plain

- Provide library, deamon and util for ti customised softhsm

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
- Update LICENSE information
---
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |   43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
new file mode 100644
index 0000000..518508c
--- /dev/null
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "TI softhsmv2 package"
+LICENSE = "BSD-2-Clause | BSD-3-Clause | ISC | IBM-License | FSFULLR | Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=55144a048ba54f211a1aaa38c7fd2424"
+SECTION = "libs"
+
+mntdir = "/mnt"
+
+inherit autotools pkgconfig
+
+DEPENDS = "openssl libdaemon"
+COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
+#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.01
+SRCREV = "c79d93ac2a326567a7245dda1b903ef340b5650c"
+PV = "1.3.0.1"
+
+S = "${WORKDIR}/git"
+
+CFLAGS += " -mno-unaligned-access"
+CPPFLAGS += " -mno-unaligned-access"
+
+INITSCRIPT_NAME = "softhsm-daemon.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
+
+SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION", True).replace("-O2", "-O3")}"
+SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION", True).replace("-ggdb2", "")}"
+
+FILES_${PN} += "${libdir}/softhsm/lib*.so.* ${mntdir}/*"
+FILES_${PN}-dbg += "${libdir}/softhsm/.debug"
+FILES_${PN}-staticdev += "${libdir}/softhsm/*.a "
+FILES_${PN}-dev += "${libdir}/softhsm/*.la ${libdir}/softhsm/lib*.so"
+
+do_install_append() {
+	install -d ${D}${mntdir}/securedbv0
+	install -d ${D}${mntdir}/securedbv1
+
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${S}/src/bin/daemon/softhsm-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
-- 
1.7.9.5


