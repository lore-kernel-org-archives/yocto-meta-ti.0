Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135AFC64EC7
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 14:54:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8829.1676386435449743567
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 06:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=swrU1YqM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31EErs2L101082;
	Tue, 14 Feb 2023 08:53:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676386434;
	bh=a3kJmEwpVdnL6tkAejHERTgRw+I/36IAZx4GBZ6VGo8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=swrU1YqMdn3VHeoPyJyzsfXxZQKzzM24uLEjTskPIo2c5XVFwcLj+mnOJSMGcM3Jw
	 9+ay9qQokpPLyZDrRAgMyE8GVanEl/f3qQ6o2W2+LFcUQFMZAy9J6gnpOAWzkGyABQ
	 FSrlGPlzi0sM9Tsl8wTwF8pbZrh3d/TLmzqp2Kns=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31EErsth033605
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Feb 2023 08:53:54 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Feb 2023 08:53:54 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Feb 2023 08:53:54 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31EErqPg048291;
	Tue, 14 Feb 2023 08:53:53 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 4/4] ti-sci-fw: Make split TIFS and DM the default
Date: Tue, 14 Feb 2023 08:53:52 -0600
Message-ID: <20230214145352.12093-4-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214145352.12093-1-afd@ti.com>
References: <20230214145352.12093-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 14:54:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15837

Going forward, the split TIFS/DM is going to be more common. Only
AM65x and AM64x still use the combined SYSFW.

Set SYSFW_PREFIX for split "fs" firmware and override only for the
two combined "sci" platforms. This makes it easier to add new platforms
as no change will be needed to this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index e9c90a76..70311cbb 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -24,12 +24,9 @@ SYSFW_SOC ?= "unknown"
 SYSFW_SUFFIX ?= "unknown"
 SYSFW_CONFIG ?= "unknown"
 
-SYSFW_PREFIX = "sci"
-SYSFW_PREFIX:j721e = "fs"
-SYSFW_PREFIX:j7200 = "fs"
-SYSFW_PREFIX:j721s2 = "fs"
-SYSFW_PREFIX:j784s4 = "fs"
-SYSFW_PREFIX:am62xx = "fs"
+SYSFW_PREFIX = "fs"
+SYSFW_PREFIX:am65xx = "sci"
+SYSFW_PREFIX:am64xx = "sci"
 
 SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 
-- 
2.39.1


