Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431D4CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 18:39:27 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.40993.1761590357249138909
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 11:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=V9TlTMzJ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: sabeeh-khan@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RIdGFH2486197
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761590356;
	bh=25mquYuDFGrk6VXNC9dWg6R9yWNTcrVOGyWE+2bO3tg=;
	h=From:To:CC:Subject:Date;
	b=V9TlTMzJGT+l9S2XS/0nS1bS99lH3Vu7dGcqWdM07NAfhUj89PDYYtNK2uVzx7Ztr
	 yKUfN2JDUPtVY4ZwHGv5iI/rmID+JVqQuM7QDItB9marganloy8C6rlENQq7ILoTIB
	 z27IjLaKdEOhDI7VpA/x5VlTgomyVtwGWRYCURRo=
Received: from DFLE205.ent.ti.com (dfle205.ent.ti.com [10.64.6.63])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RIdGmS1575586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:39:16 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 13:39:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 13:39:16 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RIdGdD1099818;
	Mon, 27 Oct 2025 13:39:16 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [scarthgap][PATCH] meta-ti-extras: cc33xx-fw: update cc33xx firmware to 1.7.0.323
Date: Mon, 27 Oct 2025 13:39:14 -0500
Message-ID: <20251027183914.3955321-1-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 18:39:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19184

Major Updates since 1.7.0.120:
- Added WPA1 support
- Addressed many stability issues in WiFi and BLE
- Enabled thermal protection for operation up to 105C

SHA1 checksum:
c364c4d89802bcac769ee6eebc08ae1c4ef5a205  cc33xx_2nd_loader.bin
b39bfac65e0300e81dfcfee7301e07b4289df448  cc33xx-conf.bin
821fa40f608e350baa9e4cdfea6719bf469c5220  cc33xx_fw.bin

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
index 9f1de766..75a1c85f 100644
--- a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
@@ -2,10 +2,10 @@ SUMMARY = "Firmware files for use with TI cc33xx"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=df68504cbd0a4da1643ebcfd5783dbc9"
 
-SRCREV = "988ded3a7d4d0e46de62e9ebfcb685c502bd9edf"
+SRCREV = "0b4f850d6c0fd8e0fe0ae1d3e80ac6733aced29b"
 SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-fw.git;protocol=https;branch=master"
 
-PV = "1.7.0.120"
+PV = "1.7.0.323"
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


