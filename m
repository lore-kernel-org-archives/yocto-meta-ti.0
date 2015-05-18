Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47DB2E00A04; Mon, 18 May 2015 10:33:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAE6BE0094C
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 10:33:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IHX2ka015731
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:33:02 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IHX2bv031190
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:33:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 12:33:01 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4IHWx5Q023023;	Mon, 18 May 2015 12:33:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 May 2015 13:32:55 -0400
Message-ID: <1431970376-24163-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431970376-24163-1-git-send-email-j-stiffler@ti.com>
References: <1431970376-24163-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gdbserver-c6x: Add version 1.1.0
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
X-List-Received-Date: Mon, 18 May 2015 17:33:20 -0000
Content-Type: text/plain

* c6x DSP development files required to support remote gdb debugging.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb |   46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb

diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
new file mode 100644
index 0000000..d21f03f
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -0,0 +1,46 @@
+DESCRIPTION="TI gdb-server to be used with c6xgdb."
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://../debian/copyright;md5=82c616b6c8f9c11c46feaaf8f9a11495"
+
+include gdbc6x.inc
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "${INC_PR}.0"
+
+require recipes-ti/includes/ti-paths.inc
+
+DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools"
+
+export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
+export FC_DIR = "${FC_INSTALL_DIR}"
+export TI_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}" 
+export XDC_DIR = "${XDC_INSTALL_DIR}"
+
+PLATFORM = ""
+PLATFORM_dra7xx = "DRA7xx_PLATFORM"
+
+EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"
+
+PARALLEL_MAKE = ""
+
+S = "${WORKDIR}/git/gdbserver-c6x/src"
+
+do_install() {
+    install -d ${D}${datadir}/ti/gdbc6x/include
+    install -d ${D}${datadir}/ti/gdbc6x/lib
+    cp -f ../include/* ${D}${datadir}/ti/gdbc6x/include
+    cp -f ../lib/* ${D}${datadir}/ti/gdbc6x/lib
+}
+
+ALLOW_EMPTY_${PN} = "1"
+
+FILES_${PN}-dev += "\
+    ${datadir}/ti/gdbc6x \
+"
+
+do_configure[noexec] = "1"
+do_qa_configure[noexec] = "1"
-- 
1.7.9.5


