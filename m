Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621C2C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 21:24:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.22243.1741728242072751352
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 14:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WTRN/Amx;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: b-brnich@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BLO0YW1304400
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 16:24:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741728240;
	bh=TBBJ+Ng3OzBhdrN6fqXFZ0ePHUa1DBMzovDYqOmJ6JQ=;
	h=From:To:CC:Subject:Date;
	b=WTRN/Amx570+71WOZxsvHgrlxwNvQeXth38c5PA2QM8c34Vchc0gplimJZX4jMsUf
	 0KLqW0qLheV/TzlZ0Hxb9z7Ry3Y1DHWc4O9iN6LHF1WMCPvJyABdB0J8FqC66T8Afk
	 khK1JHcTzhMDka3utFdLZdzxD2RuG62YTU0r7Adg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BLO0nj001167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 16:24:00 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 16:24:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 16:24:00 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.249])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BLO0fr072943;
	Tue, 11 Mar 2025 16:24:00 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>,
        Darren
 Etheridge <detheridge@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH] ti-bsp: ti-img-encode-decode: Out-of-Tree Recipe Cleanup
Date: Tue, 11 Mar 2025 16:24:00 -0500
Message-ID: <20250311212400.275443-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Mar 2025 21:24:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18373

Module recipe is missing SUMMARY and a proper SRC_URI leading to
warnings during the build process.

Fixes: 296344c8 ("ti-bsp: ti-img-encode-decode: Add Recipe for Building VXE-VXD Out-of-Tree Module")
Reported-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
index fa2d3792..20417704 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION =  "Kernel drivers for the VXE384 and D5500 Video Accelerators found in the J721E TI SoC"
+SUMMARY =  "Kernel drivers for Video Accelerators found in the J721E TI SoC"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=11;endline=12;md5=ad10b552e357ac443ec5dd2e02912b1b"
 
@@ -12,7 +12,7 @@ DEPENDS += "virtual/kernel"
 
 BRANCH = "scarthgap/k${PV}"
 
-SRC_URI = "git://git.ti.com/multimedia/img-vxe-vxd.git;protocol=https;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/multimedia/img-vxe-vxd.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "99d063aa0ef53633057042570411b84bd967624b"
 
-- 
2.34.1


