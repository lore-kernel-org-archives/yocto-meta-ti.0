Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24753E00E41; Mon,  5 Feb 2018 16:04:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8761E007D1
	for <meta-ti@yoctoproject.org>; Mon,  5 Feb 2018 16:04:16 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDD4620B05;
	Tue,  6 Feb 2018 00:04:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DxX2F84B4HcC; Tue,  6 Feb 2018 00:04:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C98A0208FD;
	Tue,  6 Feb 2018 00:04:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 44D8A1631FD;
	Mon,  5 Feb 2018 19:04:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon,  5 Feb 2018 19:04:13 -0500
Message-Id: <1517875453-37744-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] linux-ti-staging: support multiple kernel packages with KERNEL_PACKAGE_NAME
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
X-List-Received-Date: Tue, 06 Feb 2018 00:04:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.9.bb | 32 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index 467cddc..4cde7d3 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -13,40 +13,40 @@ require recipes-kernel/linux/ti-uio.inc
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 # Pull in the devicetree files into the rootfs
-RDEPENDS_kernel-base += "kernel-devicetree"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base += "kernel-devicetree"
 
 # Add run-time dependency for PM firmware to the rootfs
-RDEPENDS_kernel-base_append_ti33x = " amx3-cm3"
-RDEPENDS_kernel-base_append_ti43x = " amx3-cm3"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " amx3-cm3"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " amx3-cm3"
 
 # Add run-time dependency for VPE VPDMA firmware to the rootfs
-RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx = " vpdma-fw"
 
 # Add run-time dependency for Goodix firmware to the rootfs
-RDEPENDS_kernel-base_append_dra7xx = " goodix-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx = " goodix-fw"
 
 # Install boot-monitor skern file into /boot dir of rootfs
-RDEPENDS_kernel-base_append_keystone = " boot-monitor"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " boot-monitor"
 
 # Install ti-sci-fw into /boot dir of rootfs
-RDEPENDS_kernel-base_append_k2g = " ti-sci-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " ti-sci-fw"
 
 # Add run-time dependency for SerDes firmware to the rootfs
-RDEPENDS_kernel-base_append_keystone = " serdes-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " serdes-fw"
 
 # Add run-time dependency for QMSS PDSP firmware to the rootfs
-RDEPENDS_kernel-base_append_keystone = " qmss-pdsp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " qmss-pdsp-fw"
 
 # Add run-time dependency for NETCP PA firmware to the rootfs
-RDEPENDS_kernel-base_append_k2hk = " netcp-pa-fw"
-RDEPENDS_kernel-base_append_k2e = " netcp-pa-fw"
-RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2hk = " netcp-pa-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2e = " netcp-pa-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2l-evm = " netcp-pa-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
-RDEPENDS_kernel-base_append_am437x-evm = " prueth-fw"
-RDEPENDS_kernel-base_append_am335x-evm = " prueth-fw"
-RDEPENDS_kernel-base_append_k2g = " prueth-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am437x-evm = " prueth-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am335x-evm = " prueth-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-- 
2.7.4


