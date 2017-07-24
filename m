Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91409E00C28; Mon, 24 Jul 2017 15:31:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [198.47.27.80 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FA31E00C19
	for <meta-ti@yoctoproject.org>; Mon, 24 Jul 2017 15:31:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6OMVBoe030127
	for <meta-ti@yoctoproject.org>; Mon, 24 Jul 2017 17:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500935471;
	bh=46gKcjwwOptuj2BYzgo2goJ72g/lHlfKXTXHe0isdkE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YfcX90OhRu8QSibVnWYO1D0z5DGELaHE+FYRq5TWE+yiZIeHxaO24yeCya/fcnF7r
	l7Pxr+kX3N6qlgvQ/ecmQtz+cVQxWFmyPGkGuyQshzLxfGb0r8tv2KTSG79dNCIKuy
	NSw66YlMtkV/2huF7mlPhCu/cA0YnfXa8WtNC4kA=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6OMVBjl008025
	for <meta-ti@yoctoproject.org>; Mon, 24 Jul 2017 17:31:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Jul 2017 17:31:10 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6OMVAtP008103	for <meta-ti@yoctoproject.org>; Mon, 24 Jul 2017 17:31:10
	-0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 24 Jul 2017 17:31:10 -0500
Message-ID: <1500935470-11179-4-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500935470-11179-1-git-send-email-i-pang@ti.com>
References: <1500935470-11179-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] ibl-boot-rtos: added recipe for RTOS IBL
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
X-List-Received-Date: Mon, 24 Jul 2017 22:31:12 -0000
Content-Type: text/plain

This recipe adds the Intermediate Bootloader (IBL) for
c665x-evm and c667x-evm.

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb | 66 +++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb

diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
new file mode 100644
index 0000000..275a050
--- /dev/null
+++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
@@ -0,0 +1,66 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/ibl.h;beginline=1;endline=34;md5=ee7d7a3305d1e524955996d1c5e31cb9"
+
+require recipes-ti/includes/ti-paths.inc
+
+DEPENDS = "ti-cgt6x-7-native"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "c66x"
+
+CLEANBROKEN = "1"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/ibl.git;protocol=git;branch=${BRANCH}"
+SRCREV = "f7ed32cc8911e3353dd01080da9b725b44a12285"
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+IBLTARGETS = ""
+IBLTARGETS_c665x-evm = "evm_c6657_i2c"
+IBLTARGETS_c667x-evm = "evm_c6678_i2c"
+
+IBLENDIAN = ""
+IBLENDIAN_c665x-evm = "little big"
+IBLENDIAN_c667x-evm = "little big"
+
+export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
+export TOOLSC6X="${C6X_BASE_DIR}"
+export TOOLSC6XDOS="${C6X_BASE_DIR}"
+export TOOLSBIOSC6XDOS="${C6X_BASE_DIR}"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+
+do_compile() {
+    cd src/make
+    cp c64x/makedefs.mk c64x/makedefs_save.mk
+    sed -i "s@cl6x@${C6X_BASE_DIR}/bin/cl6x@g" c64x/makedefs.mk
+    sed -i "s@ar6x@${C6X_BASE_DIR}/bin/ar6x@g" c64x/makedefs.mk
+    cp makestg2 makestg2_save
+    sed -i "s@hex6x@${C6X_BASE_DIR}/bin/hex6x@g" makestg2
+    for t in ${IBLTARGETS}
+    do
+        for e in ${IBLENDIAN}
+        do
+            make ${t} ENDIAN=${e} I2C_BUS_ADDR=0x51
+        done
+    done
+    cp -f c64x/makedefs_save.mk c64x/makedefs.mk
+    rm c64x/makedefs_save.mk
+    cp -f makestg2_save makestage2
+    rm makestg2_save
+    cd -
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
+    cp -r * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+INSANE_SKIP_${PN} = "arch file-rdeps"
-- 
1.9.1


