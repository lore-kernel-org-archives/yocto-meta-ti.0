Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC628E009EA; Wed, 27 May 2015 07:10:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73592E009E5
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 07:10:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4REApVL031862
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 09:10:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4REAokp013815
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 09:10:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 May 2015 09:10:50 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4REAgJL027888;	Wed, 27 May 2015 09:10:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 May 2015 10:10:38 -0400
Message-ID: <1432735838-7207-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1432735838-7207-1-git-send-email-j-stiffler@ti.com>
References: <1432735838-7207-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] common-csl-ip-rtos: Add CSL RTOS package.
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
X-List-Received-Date: Wed, 27 May 2015 14:10:55 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../common-csl-ip/common-csl-ip-rtos_git.bb        |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb

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
-- 
1.7.9.5


