Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51BC2E0095C; Wed, 20 May 2015 06:40:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3B8AE0027F
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 06:40:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4KDeWUh024998
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 08:40:32 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4KDeW8g004297
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 08:40:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 May 2015 08:40:31 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4KDeVB5020581;	Wed, 20 May 2015 08:40:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 May 2015 09:40:30 -0400
Message-ID: <1432129230-20275-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3 2/3] gdbserver-c6x: Add version 1.1.0
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
X-List-Received-Date: Wed, 20 May 2015 13:40:38 -0000
Content-Type: text/plain

* c6x DSP development files required to support remote gdb debugging.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
* v3 changes:
  - Use the more generic "keystone" soc family as opposed to the
    specific k2hk-evm machine.

* v2 changes:
  - Add support for k2hk-evm
  - Reorganize file based on oe-stylize.
  - Fix do_qa_configure check.

 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb |   50 ++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb

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
-- 
1.7.9.5


