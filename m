Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3220CC25B7A
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 17:59:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.600.1716487138695791340
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 May 2024 10:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Pq31zlsB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44NHwv3w079565;
	Thu, 23 May 2024 12:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716487137;
	bh=8Jrg1isKzEOnxmaTaxY7jlOx61aPPXUfsa5D1nlXrrw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Pq31zlsBRTGqKj7HASV8Vg+srMCINLc45bd25RLcTspa85ZjacBsuZbypnmj3JFiI
	 +xOQ/EYn/Lzv5Okg/MIBkoO/hIu/fFq8aQTEef95jXySlYX3fYHnnkDie6WAetGzYt
	 6BHCHurcR/yc1L8lJfN0WedrezjIP36sQZxAx2ZA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44NHwvLq051013
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 May 2024 12:58:57 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 May 2024 12:58:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 May 2024 12:58:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44NHwuAk046453;
	Thu, 23 May 2024 12:58:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sACiO-0000AZ-JZ; Thu, 23 May 2024 12:58:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 2/2] recipes: Remove DEFAULT_PREFERENCE
Date: Thu, 23 May 2024 12:58:56 -0500
Message-ID: <20240523175856.602-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240523175856.602-1-reatmon@ti.com>
References: <20240523175856.602-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 May 2024 17:59:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17679

Now that are past the inital stages of our LTS migration, we can remove
the DEFAULT_PREFERENCE settings that prevented these recipes from being
the default.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb         | 2 --
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb     | 2 --
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb            | 2 --
 .../powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb          | 2 --
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb     | 2 --
 .../recipes-kernel/linux/linux-ti-staging-systest_6.6.bb        | 2 --
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb        | 2 --
 7 files changed, 14 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
index a1b76d27..fdb8b51d 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
@@ -3,8 +3,6 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
 LICENSE = "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
 
-DEFAULT_PREFERENCE = "-1"
-
 inherit module
 
 PROVIDES = "virtual/gpudriver"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index d268c8a5..fa8a790c 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -1,7 +1,5 @@
 require u-boot-ti.inc
 
-DEFAULT_PREFERENCE = "-1"
-
 include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
 PR = "r0"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
index 1e66acd2..a137f452 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
@@ -2,8 +2,6 @@
 # upstream yet. This allows us to build the shims we need without completely
 # clobbering mesa.
 
-DEFAULT_PREFERENCE = "-1"
-
 require recipes-graphics/mesa/mesa.inc
 
 SUMMARY += " (with PowerVR support for TI platforms)"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
index d43d1635..6d8e65ff 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
@@ -3,8 +3,6 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 
-DEFAULT_PREFERENCE = "-1"
-
 inherit bin_package
 
 INHIBIT_DEFAULT_DEPS = ""
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index bccd856c..3870f9be 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -1,7 +1,5 @@
 require linux-ti-staging_6.6.bb
 
-DEFAULT_PREFERENCE = "-1"
-
 KERNEL_LOCALVERSION:append = "-rt"
 
 # Look in the generic major.minor directory for files
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb
index 21090904..a17b744b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.6.bb
@@ -1,7 +1,5 @@
 require linux-ti-staging_6.6.bb
 
-DEFAULT_PREFERENCE = "-1"
-
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 14fabb81..3adf9b7f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 inherit ti-secdev
 inherit kernel
 
-DEFAULT_PREFERENCE = "-1"
-
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
-- 
2.17.1


