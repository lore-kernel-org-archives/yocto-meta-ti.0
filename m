Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 380CFE0071C; Thu, 29 Oct 2015 09:09:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88FBBE0071C
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 09:09:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9TG9sus003353
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 11:09:54 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9TG9sB8001389
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 11:09:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Oct 2015 11:09:54 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9TG9qpO013773;	Thu, 29 Oct 2015 11:09:54 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 29 Oct 2015 12:09:49 -0400
Message-ID: <1446134989-3367-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446134989-3367-1-git-send-email-j-stiffler@ti.com>
References: <1446134989-3367-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] pru-icss: Add PRU software package version 4.0.0.0
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
X-List-Received-Date: Thu, 29 Oct 2015 16:09:59 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Remove SRCPV from PV, drop BASE_PV
* Add COMPATIBLE_MACHINES, remove dummy do_install()
* Use ti-paths.inc's "TI_CGT_PRU_INSTALL_DIR" to get toolchain path

 recipes-bsp/pru/pru-icss_git.bb | 66 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 recipes-bsp/pru/pru-icss_git.bb

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
new file mode 100644
index 0000000..75179a5
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
+COMPATIBLE_MACHINE = "am335x-evm|am437x-evm|am57xx-evm"
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
+do_install_am335x-evm() {
+    install -d ${D}/lib/firmware
+    for i in 0 1
+    do
+        install -m 0644 ${S}/examples/am335x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
+                        ${D}/lib/firmware/am335x-pru${i}-fw
+    done
+}
+
+do_install_am437x-evm() {
+    install -d ${D}/lib/firmware
+    for i in 0 1
+    do
+        install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
+                        ${D}/lib/firmware/am437x-pru1_${i}-fw
+    done
+}
+
+do_install_am57xx-evm() {
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
-- 
1.9.1


