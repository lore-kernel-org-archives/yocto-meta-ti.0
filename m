Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1515.1639602666642249090
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 13:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5819240C5D
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktCtA14Vwyj0 for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F45540C90
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D0FC8174723
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 16:11:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 11/11] Revert "ti-sci-fw: k3-image-gen: Revert SPL address change for mainline"
Date: Wed, 15 Dec 2021 16:11:03 -0500
Message-Id: <1639602663-32787-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639602663-32787-1-git-send-email-denis@denix.org>
References: <1639602663-32787-1-git-send-email-denis@denix.org>

From: Nishanth Menon <nm@ti.com>

This reverts commit d5db41417295fe05a293f6d4d77a65ef6563f6ed.

We should'nt have to carry patches for u-boot or kernel, since the
upstream is now fixed since 5.14 kernel and u-boot 2021.10 tag onwards,
lets revert the patch to allow upstream to work with 5.15+ kernel and
2021.10 u-boot (from the already applied commit cae609388f19
"recipes-bsp: u-boot-ti-mainline: Update to v2021.10 release").

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc            | 11 -------
 ...am64x-Makefile-Move-the-SPL-Load-address-.patch | 36 ----------------------
 2 files changed, 47 deletions(-)
 delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index d224f35..f160768 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -32,15 +32,4 @@ SRC_URI = " \
 	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
-# This is a protection in case the definition is not present in other distros.
-ARAGO_BRAND ?= ""
-
-# Mainline u_boot 2021.07 and upstream kernel v5.13 tag cannot use new SPL address
-# in K3-Imagegen
-SRC_URI += "\
-	${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '\
-	file://0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch;patchdir=../imggen \
-	', '', d)} \
-"
-
 S = "${WORKDIR}/git"
diff --git a/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch b/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
deleted file mode 100644
index 63a5796..0000000
--- a/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 83d29d5e346083254e71fbe483cb14f6657b9965 Mon Sep 17 00:00:00 2001
-From: Nishanth Menon <nm@ti.com>
-Date: Tue, 29 Jun 2021 12:03:29 -0500
-Subject: [PATCH] Revert "soc: am64x: Makefile: Move the SPL Load address to
- 0x70000000"
-
-This reverts commit e411dc16862b5bb2d8befb12496b03d7b01c87b2.
-
-Mainline is NOT ready for the change yet as of u-boot 2021.07 + v5.13,
-So, this patch reverts the SPL address change.
-
-This patch needs to be dropped once mainline u-boot and kernel have
-migrated over to newer releases.
-
-Upstream-Status: Not applicable
-Signed-off-by: Nishanth Menon <nm@ti.com>
----
- soc/am64x/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
-index 45425428f9c6..e8747376f153 100644
---- a/soc/am64x/Makefile
-+++ b/soc/am64x/Makefile
-@@ -30,7 +30,7 @@
- #  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #
- 
--SBL_LOADADDDR ?= 0x70000000
-+SBL_LOADADDDR ?= 0x70020000
- COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x70000
- LOADADDR  ?= 0x44000
- SCIFS = sci
--- 
-2.32.0
-
-- 
2.7.4

