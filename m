Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1164FE00AEB; Thu, 29 Oct 2015 05:27:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C5B3E009D9
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 05:27:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9TCRHRu005642
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 07:27:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9TCRHUr004112
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 07:27:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Oct 2015 07:27:17 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9TCRFmj024842;	Thu, 29 Oct 2015 07:27:16 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 29 Oct 2015 08:27:13 -0400
Message-ID: <1446121633-4283-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446121633-4283-1-git-send-email-j-stiffler@ti.com>
References: <1446121633-4283-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] pru-icss: Add PRU software package version 4.0.0.0
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
X-List-Received-Date: Thu, 29 Oct 2015 12:27:47 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 recipes-bsp/pru/pru-icss_git.bb

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
new file mode 100644
index 0000000..2e90b65
--- /dev/null
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -0,0 +1,69 @@
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
+BASE_PV = "4.0.0.0"
+PV = "${BASE_PV}+git${SRCPV}"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "ti-cgt-pru-native"
+
+S = "${WORKDIR}/git"
+
+export PRU_CGT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-pru"
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
+# By default, do not install anything
+do_install() {
+    :
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


