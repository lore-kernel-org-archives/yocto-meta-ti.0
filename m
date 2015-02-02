Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CA33E008E5; Mon,  2 Feb 2015 12:39:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7ACE2E008BC
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 12:38:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id ACE6352AA9; Mon,  2 Feb 2015 20:38:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150202203852.ACE6352AA9@arago-project.org>
Date: Mon,  2 Feb 2015 20:38:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-softhsmv2: Add recipe for ti customised softhsm package
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
X-List-Received-Date: Mon, 02 Feb 2015 20:39:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 02faeb98837ac068ff056f8480a5c8e86eb4041b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=02faeb98837ac068ff056f8480a5c8e86eb4041b

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Jan 29 22:11:25 2015 +0000

ti-softhsmv2: Add recipe for ti customised softhsm package

- Provide library, deamon and util for ti customised softhsm

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |   43 +++++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

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


