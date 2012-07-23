Return-Path: <Vladimir_Zapolskiy@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A42F0E0034A
	for <meta-ti@yoctoproject.org>; Mon, 23 Jul 2012 03:08:31 -0700 (PDT)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1StFZ1-0003xH-21 from Vladimir_Zapolskiy@mentor.com 
	for meta-ti@yoctoproject.org; Mon, 23 Jul 2012 03:08:31 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 23 Jul 2012 03:08:30 -0700
Received: from eyas.fin.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.1.289.1; Mon, 23 Jul 2012 11:08:28 +0100
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 23 Jul 2012 13:08:39 +0300
Message-ID: <1343038119-18176-1-git-send-email-vladimir_zapolskiy@mentor.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 23 Jul 2012 10:08:30.0604 (UTC)
	FILETIME=[1C448CC0:01CD68BB]
Subject: [PATCH] linux-omap-psp 2.6.32: fix am37x-evm build
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 10:08:31 -0000
Content-Type: text/plain

This change removes two supplementary patches from the list of applied
patches, the functionality of the patches isn't valuable, and the
unmodified provided sources can't be compiled with recent toolchains.

The change fixes a compilation problem with binutils-2.21 or higher:

  Error: selected processor does not support ARM mode `smc #0'

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 recipes-kernel/linux/linux-omap-psp_2.6.32.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
index 61fc24f..a2815d0 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
@@ -51,10 +51,10 @@ SRC_URI += "git://arago-project.org/git/projects/linux-omap3.git;protocol=git;br
            file://0035-RTC-add-support-for-backup-battery-recharge.patch \
            file://0036-ARM-Add-prompt-for-CONFIG_ALIGNMENT_TRAP.patch \
            file://0037-ARM-Print-warning-on-alignment-trap-in-kernel-mode.patch \
-           file://0038-ARM-Expose-some-CPU-control-registers-via-sysfs.patch \
+           file://0038-ARM-Expose-some-CPU-control-registers-via-sysfs.patch;apply=no \
            file://0039-ARM-Add-option-to-allow-userspace-PLE-access.patch \
            file://0040-ARM-Add-option-to-allow-userspace-access-to-performa.patch \
-           file://0041-ARM-Expose-some-PMON-registers-through-sysfs.patch \
+           file://0041-ARM-Expose-some-PMON-registers-through-sysfs.patch;apply=no \
            file://0042-musb-allow-host-io-without-gadget-module.patch \
            file://0043-MTD-silence-ecc-errors-on-mtdblock0.patch \
            file://0044-ARM-OMAP-beagle-every-known-beagle-except-revB-uses-.patch \
-- 
1.7.10.4


