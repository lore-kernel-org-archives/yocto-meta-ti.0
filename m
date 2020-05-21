Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1943.1590022145874477497
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 17:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C06140C13;
	Thu, 21 May 2020 00:49:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odGYGCpqKvzA; Thu, 21 May 2020 00:49:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E8DB740AD5;
	Thu, 21 May 2020 00:49:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7C16716F347;
	Wed, 20 May 2020 20:49:02 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] ti-sysbios: c7x hot fix backport from .17_eng
Date: Wed, 20 May 2020 20:49:02 -0400
Message-Id: <1590022142-32257-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sysbios/0001-c7x-hot-fix-backport.patch     | 90 ++++++++++++++++++++++
 recipes-ti/bios/ti-sysbios_6.82.00.16.bb           |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 recipes-ti/bios/ti-sysbios/0001-c7x-hot-fix-backport.patch

diff --git a/recipes-ti/bios/ti-sysbios/0001-c7x-hot-fix-backport.patch b/recipes-ti/bios/ti-sysbios/0001-c7x-hot-fix-backport.patch
new file mode 100644
index 0000000..f64eb89
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios/0001-c7x-hot-fix-backport.patch
@@ -0,0 +1,90 @@
+From 33f246ee91c9e22ac540a12acfab6930225940e8 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Wed, 20 May 2020 14:49:31 -0400
+Subject: [PATCH] c7x hot fix backport
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ packages/ti/sysbios/family/c7x/Hwi_disp_always.s71 | 32 +++++++++++-----------
+ packages/ti/sysbios/family/c7x/boot.c              |  1 +
+ 2 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/packages/ti/sysbios/family/c7x/Hwi_disp_always.s71 b/packages/ti/sysbios/family/c7x/Hwi_disp_always.s71
+index 789fd08..ed5c058 100644
+--- a/packages/ti/sysbios/family/c7x/Hwi_disp_always.s71
++++ b/packages/ti/sysbios/family/c7x/Hwi_disp_always.s71
+@@ -362,21 +362,21 @@ ti_sysbios_family_c7x_Hwi_dispatchAlways:
+ ||      mvpb.s2   p7, b7
+         std.d1x   b6, *SP[Hwi_SFP6]
+ ||      std.d2    b7, *SP[Hwi_SFP7]
+-||      mvc.c2    stracntr0, vb15
++||      mvc.c2    sa0cntr0, vb15
+         vst8d.d2 vb15, *SP[Hwi_SFSTRACNTR0]
+-||      mvc.c2    stracntr1, vb15
++||      mvc.c2    sa1cntr0, vb15
+         vst8d.d2 vb15, *SP[Hwi_SFSTRACNTR1]
+-||      mvc.c2    stracntr2, vb15
++||      mvc.c2    sa2cntr0, vb15
+         vst8d.d2 vb15, *SP[Hwi_SFSTRACNTR2]
+-||      mvc.c2    stracntr3, vb15
++||      mvc.c2    sa3cntr0, vb15
+         vst8d.d2 vb15, *SP[Hwi_SFSTRACNTR3]
+-||      mvc.c2    stracr0, vb15
++||      mvc.c2    sa0cr, vb15
+         vst8d.d2 vb15, *SP[Hwi_SFSTRACR0]
+-||      mvc.c2    stracr1, vb15
++||      mvc.c2    sa1cr, vb15
+         vst8d.d2 vb15, *SP[Hwi_SFSTRACR1]
+-||      mvc.c2    stracr2, vb15
++||      mvc.c2    sa2cr, vb15
+         vst8d.d2 vb15, *SP[Hwi_SFSTRACR2]
+-||      mvc.c2    stracr3, vb15
++||      mvc.c2    sa3cr, vb15
+         vst8d.d2 vb15, *SP[Hwi_SFSTRACR3]
+ ||      sesave.l2 3, 1, vb15
+         vst8d.d2 vb15, *SP[Hwi_SFSE1_3]
+@@ -425,21 +425,21 @@ ti_sysbios_family_c7x_Hwi_dispatchAlways:
+         saclose.c2 3
+ 
+         vld8d.d1 *SP[Hwi_SFSTRACNTR0], vb15
+-        mvc.c2    vb15, stracntr0
++        mvc.c2    vb15, sa0cntr0
+ ||      vld8d.d1 *SP[Hwi_SFSTRACNTR1], vb15
+-        mvc.c2    vb15, stracntr1
++        mvc.c2    vb15, sa1cntr0
+ ||      vld8d.d1 *SP[Hwi_SFSTRACNTR2], vb15
+-        mvc.c2    vb15, stracntr2
++        mvc.c2    vb15, sa2cntr0
+ ||      vld8d.d1 *SP[Hwi_SFSTRACNTR3], vb15
+-        mvc.c2    vb15, stracntr3
++        mvc.c2    vb15, sa3cntr0
+ ||      vld8d.d1 *SP[Hwi_SFSTRACR0], vb15
+-        mvc.c2    vb15, stracr0
++        mvc.c2    vb15, sa0cr
+ ||      vld8d.d1 *SP[Hwi_SFSTRACR1], vb15
+-        mvc.c2    vb15, stracr1
++        mvc.c2    vb15, sa1cr
+ ||      vld8d.d1 *SP[Hwi_SFSTRACR2], vb15
+-        mvc.c2    vb15, stracr2
++        mvc.c2    vb15, sa2cr
+ ||      vld8d.d1 *SP[Hwi_SFSTRACR3], vb15
+-        mvc.c2    vb15, stracr3
++        mvc.c2    vb15, sa3cr
+ 
+         ldd.d1    *SP[Hwi_SFP7], b7
+         ldd.d1    *SP[Hwi_SFP6], b6
+diff --git a/packages/ti/sysbios/family/c7x/boot.c b/packages/ti/sysbios/family/c7x/boot.c
+index 5ee80c7..8c229bc 100644
+--- a/packages/ti/sysbios/family/c7x/boot.c
++++ b/packages/ti/sysbios/family/c7x/boot.c
+@@ -42,6 +42,7 @@ register volatile uint64_t __SP;
+ /*****************************************************************************/
+ /* C_INT00() - C ENVIRONMENT ENTRY POINT                                     */
+ /*****************************************************************************/
++#pragma CODE_SECTION(_c_int00_secure, ".text:_c_int00_secure")
+ void _c_int00_secure()
+ {
+    /*------------------------------------------------------------------------*/
+-- 
+2.7.4
+
diff --git a/recipes-ti/bios/ti-sysbios_6.82.00.16.bb b/recipes-ti/bios/ti-sysbios_6.82.00.16.bb
index 270e9a1..87fb465 100644
--- a/recipes-ti/bios/ti-sysbios_6.82.00.16.bb
+++ b/recipes-ti/bios/ti-sysbios_6.82.00.16.bb
@@ -11,3 +11,4 @@ TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
 
 BINFILE = "bios_${PV}.run"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/${BINFILE};name=sysbiosbin"
+SRC_URI += "file://0001-c7x-hot-fix-backport.patch"
-- 
2.7.4

