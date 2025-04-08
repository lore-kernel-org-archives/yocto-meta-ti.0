Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6750C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 08:28:58 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.70378.1744100935310148514
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 01:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HIK5GsZc;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5388SrOx1155373
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 03:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744100933; i=@ti.com;
	bh=o/2KLaXxwELH7HtR909No8jBofdId4wObkWHMz9w3ek=;
	h=From:To:Subject:Date;
	b=HIK5GsZcThtSfDddE4iN9TD44z0QwPetBKJIw9ETTMjvuV/ppHDPCcacT6U3hmSm5
	 xSkHQ+uwsQgd/3EYZPlEFaXojKWhMGxNDOXFDCGEI31GZmDnm549MZNe4+0DQl/p8M
	 Fo8XC2rcYeLkpS/SyTZutFmwkYKYVV6scDVBlNDM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5388Sr01071204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 03:28:53 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 03:28:53 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 03:28:53 -0500
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.64.72.49])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5388SriG060023;
	Tue, 8 Apr 2025 03:28:53 -0500
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id 8CBA39E450; Tue,  8 Apr 2025 03:28:52 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2025.04
Date: Tue, 8 Apr 2025 03:28:52 -0500
Message-ID: <20250408082852.2067305-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Apr 2025 08:28:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18448

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index c58511f3..7afd02c5 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,10 +2,10 @@ require u-boot-ti.inc
 
 SUMMARY = "Mainline U-Boot for TI devices"
 
-PV = "2025.01"
+PV = "2025.04"
 
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 
 SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
 
-SRCREV = "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
+SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
-- 
2.43.5


