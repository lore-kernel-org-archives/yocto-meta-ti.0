Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97B36E00A4D; Mon,  1 Jun 2015 07:49:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D6A7E00A4D
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:49:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 84E4C52A81; Mon,  1 Jun 2015 14:49:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601144910.84E4C52A81@arago-project.org>
Date: Mon,  1 Jun 2015 14:49:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : common-csl-ip-rtos: Add CSL RTOS package.
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
X-List-Received-Date: Mon, 01 Jun 2015 14:49:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 29eeee9ff4d602a65cd92c4aa95900ae3d46ca42
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=29eeee9ff4d602a65cd92c4aa95900ae3d46ca42

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 20:10:38 2015 +0000

common-csl-ip-rtos: Add CSL RTOS package.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../common-csl-ip/common-csl-ip-rtos_git.bb        |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
new file mode 100644
index 0000000..5d4a552
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -0,0 +1,33 @@
+require common-csl-ip.inc
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+DEPENDS = "ti-xdctools ti-cgt6x-native ti-sysbios"
+
+S = "${WORKDIR}/ti/csl"
+
+export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr"
+export XDCCGROOT="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export XDCPATH="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
+
+do_configure() {
+    sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
+    find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
+    find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
+    find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
+    find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
+}
+
+do_compile() {
+    ${XDC_INSTALL_DIR}/xdc .make
+    ${XDC_INSTALL_DIR}/xdc clean
+    ${XDC_INSTALL_DIR}/xdc release
+}
+
+do_install () {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"


