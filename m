Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB852E77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 22:05:14 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.33683.1736373909787281907
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 14:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SgPNzkTv;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508M58733167909
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 16:05:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736373908;
	bh=FMjBt64wZfK/bSyF+MEBG/wmAFMuVIk+4PbdDk5CecI=;
	h=From:To:Subject:Date;
	b=SgPNzkTvUVbu7qbKU1vHWX1W4dAVMppHQB1yhQVk9skr7cpqTr/lAOsKL5++fTt8m
	 sSDJHzs3CMd2NRoyYjg73VwsML2Dcc7j1WoGBB5joAWJesZCvyJWqwcyIwUGy0GAf3
	 s8pXBfMQG3MMznicsOPLjH4fvQr6KEqjXCsNwrhY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508M58vS012247
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 16:05:08 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 16:05:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 16:05:08 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508M58aq103634;
	Wed, 8 Jan 2025 16:05:08 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tVeAm-0002QW-5m; Wed, 08 Jan 2025 16:05:08 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Add patch to use SWIG_AppendOutput
Date: Wed, 8 Jan 2025 16:05:08 -0600
Message-ID: <20250108220508.9197-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jan 2025 22:05:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18172

Missed this recipe with the previous recipe.

Swig has changed language specific AppendOutput functions. The helper
macro SWIG_AppendOutput remains unchanged. Use that instead
of SWIG_Python_AppendOutput, which would require an extra parameter
since swig 4.3.0.

This is a port from oe-core:
https://git.openembedded.org/openembedded-core/commit/?id=4eae7888e91c7c864bf490dee38716267be6202e

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index e1b51ce7..db89fd08 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -6,4 +6,6 @@ PV = "2024.10"
 
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 
+SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
+
 SRCREV = "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
-- 
2.17.1


