Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AFE9CE009F6; Mon,  1 Jun 2015 07:30:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7459CE00992
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:30:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 785C552A0A; Mon,  1 Jun 2015 14:30:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601143054.785C552A0A@arago-project.org>
Date: Mon,  1 Jun 2015 14:30:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : gdbserver-c6x: Add version 1.1.0
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
X-List-Received-Date: Mon, 01 Jun 2015 14:30:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b4181e7346f9e4732f801740c22d9f4109254656
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b4181e7346f9e4732f801740c22d9f4109254656

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 20 19:40:30 2015 +0000

gdbserver-c6x: Add version 1.1.0

* c6x DSP development files required to support remote gdb debugging.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb |   50 ++++++++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
new file mode 100644
index 0000000..f4dc51d
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -0,0 +1,50 @@
+DESCRIPTION = "TI gdb-server to be used with c6xgdb."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://../debian/copyright;md5=82c616b6c8f9c11c46feaaf8f9a11495"
+
+DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools"
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/git/gdbserver-c6x/src"
+
+PLATFORM = ""
+PLATFORM_dra7xx = "DRA7xx_PLATFORM"
+PLATFORM_keystone = "KEYSTONE_PLATFORM"
+
+EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"
+
+export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
+export FC_DIR = "${FC_INSTALL_DIR}"
+export TI_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}" 
+export XDC_DIR = "${XDC_INSTALL_DIR}"
+
+# The following is to prevent an unused configure.ac from erroneously
+# triggering the QA check for gettext.
+EXTRA_OECONF = "--disable-nls"
+do_configure() {
+    :
+}
+
+do_install() {
+    install -d ${D}${datadir}/ti/gdbc6x/include
+    install -d ${D}${datadir}/ti/gdbc6x/lib
+    cp -f ../include/* ${D}${datadir}/ti/gdbc6x/include
+    cp -f ../lib/* ${D}${datadir}/ti/gdbc6x/lib
+}
+
+COMPATIBLE_MACHINE = "dra7xx|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN}-dev += "\
+    ${datadir}/ti/gdbc6x \
+"
+
+include gdbc6x.inc
+
+require recipes-ti/includes/ti-paths.inc
+
+ALLOW_EMPTY_${PN} = "1"
+
+PARALLEL_MAKE = ""


