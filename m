Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4574E00985; Thu, 29 Oct 2015 12:40:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14B9EE00A26
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 12:40:46 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3EC9152A3A; Thu, 29 Oct 2015 19:40:43 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151029194043.3EC9152A3A@arago-project.org>
Date: Thu, 29 Oct 2015 19:40:43 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : pru-icss: Add PRU software package version 4.0.0.0
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
X-List-Received-Date: Thu, 29 Oct 2015 19:40:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 644ab65a9ee8426b63537811c7bec41039bc4a5a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=644ab65a9ee8426b63537811c7bec41039bc4a5a

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Oct 29 22:29:08 2015 +0000

pru-icss: Add PRU software package version 4.0.0.0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pru/pru-icss_git.bb |   66 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 66 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
new file mode 100644
index 0000000..b756713
--- /dev/null
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -0,0 +1,66 @@
+DESCRIPTION = "Programmable Real-time Unit Software Package"
+HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
+LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
+
+LIC_FILES_CHKSUM = "file://PRU-Package-v4.0-Manifest.html;md5=5ea937e4ff2c924a735d42e61ad8cbe3"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
+SRCREV = "476289eb7c3a91977bae84aea55c56f3120b48ea"
+
+PV = "4.0.0.0"
+PR = "r0"
+
+require recipes-ti/includes/ti-paths.inc
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "ti-cgt-pru-native"
+
+S = "${WORKDIR}/git"
+
+export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"
+
+SUBDIRS = "examples pru_cape/pru_fw lib/src labs"
+
+do_compile() {
+    for dir in ${SUBDIRS}
+    do
+        make -C ${S}/$dir
+    done
+}
+
+do_install_ti33x() {
+    install -d ${D}/lib/firmware
+    for i in 0 1
+    do
+        install -m 0644 ${S}/examples/am335x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
+                        ${D}/lib/firmware/am335x-pru${i}-fw
+    done
+}
+
+do_install_ti43x() {
+    install -d ${D}/lib/firmware
+    for i in 0 1
+    do
+        install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
+                        ${D}/lib/firmware/am437x-pru1_${i}-fw
+    done
+}
+
+do_install_omap-a15() {
+    install -d ${D}/lib/firmware
+    for i in 1 2
+    do
+        for j in 0 1
+        do
+            install -m 0644 ${S}/examples/am572x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}/lib/firmware/am57xx-pru${i}_${j}-fw
+        done
+    done
+}
+
+FILES_${PN} += "/lib/firmware"
+
+INSANE_SKIP_${PN} = "arch"


