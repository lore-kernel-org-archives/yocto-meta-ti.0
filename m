Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60A46E0084E; Wed, 21 Jan 2015 12:38:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7F0EE008EC
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 12:38:00 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2BACA5297F; Wed, 21 Jan 2015 20:38:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150121203800.2BACA5297F@arago-project.org>
Date: Wed, 21 Jan 2015 20:38:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr: Update to new version of MPM 2.0.1.7
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
X-List-Received-Date: Wed, 21 Jan 2015 20:38:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a9fe62d130146ed94dc248f35c563c1e76206517
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a9fe62d130146ed94dc248f35c563c1e76206517

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Jan 16 18:20:26 2015 +0000

multiprocmgr: Update to new version of MPM 2.0.1.7

- Recipe split into main and test recipes.
- Added dependency on mpm-transport & libdaemon & syslog-ng
- Added startup scripts for daemon
- Removed PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb |   18 +++++++++++
 recipes-ti/multiprocmgr/multiprocmgr.inc         |   14 +++++++++
 recipes-ti/multiprocmgr/multiprocmgr_git.bb      |   34 +++++++++++++++-------
 3 files changed, 55 insertions(+), 11 deletions(-)

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


