Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50A7EE00753; Fri, 16 Jan 2015 05:10:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E9A8E004D6
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 05:10:08 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0GDA75g024197
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 07:10:07 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0GDA7ta021112
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 07:10:07 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 Jan 2015 07:10:07 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0GD7tWJ016606;	Fri, 16 Jan 2015 07:10:07 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Jan 2015 07:20:26 -0500
Message-ID: <1421410826-27466-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421410826-27466-1-git-send-email-sam.nelson@ti.com>
References: <1421410826-27466-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] multiprocmgr: Update to new version of MPM 2.0.1.7
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
X-List-Received-Date: Fri, 16 Jan 2015 13:10:13 -0000
Content-Type: text/plain

- Recipe split into main and test recipes.
- Added dependency on mpm-transport & libdaemon & syslog-ng
- Added startup scripts for daemon
- Removed PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb |   18 ++++++++++++
 recipes-ti/multiprocmgr/multiprocmgr.inc         |   14 +++++++++
 recipes-ti/multiprocmgr/multiprocmgr_git.bb      |   34 +++++++++++++++-------
 3 files changed, 55 insertions(+), 11 deletions(-)
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr.inc

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
new file mode 100644
index 0000000..b05cd44
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "TI Multiproc Manager test code"
+
+include multiprocmgr.inc
+
+DEPENDS = "multiprocmgr cmem"
+RDEPENDS_${PN} = "multiprocmgr mpm-transport cmem"
+
+CC += "-I${STAGING_KERNEL_DIR}/include"
+
+do_compile() {
+	make -C ${S} test
+}
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/test/filetestdemo/host/bin/demo_filetest ${D}${bindir}/mpm_demo_filetest
+	install -c -m 755 ${S}/test/sync_test/host/bin/sync_test ${D}${bindir}/mpm_sync_test
+}
diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
new file mode 100644
index 0000000..26c8959
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -0,0 +1,14 @@
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/multi-proc-manager.git"
+LICENSE = "BSD-3-Clause & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+
+BRANCH = "master"
+# The following commits correspond to DEV.MPM-2.00.01.07
+SRCREV = "b79e1cdaed78014569d82cf2f748d3f5f91623ee"
+PV = "2.0.1.7"
+
+SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index 3f2e52c..e1c4f2f 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -1,20 +1,32 @@
 DESCRIPTION = "TI Multiproc Manager for KeyStone II"
-HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
-LICENSE = "BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
-SECTION = "console"
-COMPATIBLE_MACHINE = "keystone"
+SUMMARY = "Provides download, debug and other utilities for other cores in the SOC like DSP"
 
-PR = "r1"
+include multiprocmgr.inc
 
-BRANCH ?= "master"
-SRCREV = "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
+DEPENDS = "mpm-transport libdaemon"
+RDEPENDS_${PN} = "syslog-ng"
 
-SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
+CC += "-I${STAGING_KERNEL_DIR}/include"
+
+INITSCRIPT_NAME = "mpmsrv-daemon.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
 
 do_install() {
 	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
+	install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv
+	install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl
+
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${S}/scripts/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+	install -d ${D}${sysconfdir}/mpm/
+	install -c -m 755 ${S}/scripts/crash_callback.sh ${D}${sysconfdir}/mpm/crash_callback.sh
+
+	install -d ${D}${includedir}/
+	install -c -m 755 ${S}/include/* ${D}${includedir}/
+
+	install -d ${D}${libdir}/
+	cp -a ${S}/lib/* ${D}${libdir}/
 }
-- 
1.7.9.5


