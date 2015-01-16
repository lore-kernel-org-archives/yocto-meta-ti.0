Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B441E00948; Fri, 16 Jan 2015 10:50:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5ADCE008DE
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 10:50:35 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0GIoYMe024599
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 12:50:34 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0GIoYYd002065
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 12:50:34 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 Jan 2015 12:50:34 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0GIoYEJ020338;	Fri, 16 Jan 2015 12:50:34 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Jan 2015 13:50:33 -0500
Message-ID: <1421434233-395-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-softhsmv2: Add recipe for ti customised softhsm package
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
X-List-Received-Date: Fri, 16 Jan 2015 18:50:49 -0000
Content-Type: text/plain

- Provide library, deamon and util for ti customised softhsm

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |   44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
new file mode 100644
index 0000000..fef6500
--- /dev/null
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "TI softhsmv2 package"
+LICENSE = "BSD-2-Clause | BSD-3-Clause | Others"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=55144a048ba54f211a1aaa38c7fd2424"
+SECTION = "libs"
+PRIORITY = "optional"
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


