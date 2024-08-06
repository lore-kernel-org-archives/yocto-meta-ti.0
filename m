Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8985EC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 09:55:09 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3796.1722938105407713599
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Aug 2024 02:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VTFbgz6N;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: kamlesh@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4769t4S2123936;
	Tue, 6 Aug 2024 04:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722938104;
	bh=kziS8WPV47A/BW/xEcnTnX1S/n477YXHtahB0nkqgZ0=;
	h=From:Date:Subject:To:CC;
	b=VTFbgz6NMQpDCivWwLe52PEHjhf0dXky4MnlHS4XzssSA+AjEt4h8E6C0UCprCvxk
	 XiSaFwbtRDbQtZ/fuL7PNajG4zne7Y4oetwlPQdVt3rDlPEN+wVFiBG0iWhpTZ3oTL
	 kmVJ66TG3QQXYonK6vcKKd8SK+9seSrzpdo4GKPg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4769t4Fo114525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Aug 2024 04:55:04 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 04:55:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 04:55:04 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4769t36D009604;
	Tue, 6 Aug 2024 04:55:03 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Tue, 6 Aug 2024 15:24:38 +0530
Subject: [PATCH [meta-ti][Scarthgap/Master]] meta-ti-bsp:
 trusted-firmware-a: Update to v2.11 release tag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240806-atf-2-11-upgrade-v1-1-666f4b5bc161@ti.com>
X-B4-Tracking: v=1; b=H4sIAN3ysWYC/zWNQQqDMBAAvyJ77lINakv/0FOPksNm3cQcmsomL
 YL492qhx4EZZoUsGiXDrVpB5RNzfKUdmlMFPFEKgnHcGUxt2vpa90jFo8GmwfcclEbBC3PvuPP
 ccgd75igLOqXE0xFmJi1ToBmTLOUQZhUfl99zgOEphbBEOzz+4vlOuYhasNv2BTY4lQSgAAAA
To: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722938102; l=1293;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=yN6e2BZ3FHgnDyTB9y5R6bP/E3rjvh8vt2Od4bhCHYs=;
 b=JytfHFGjt7zrH15WTVp+eDgfkj94X8NvKN8Q7iqLvWSuNQZ49Mo60OAhC9pF29u7OxHKii6AD
 wKQlYM9GZukDL3vMv0llZ4eA52v1p8veuYvocumHxJQHLZPcY9PCR1Z
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Aug 2024 09:55:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17926

Update to latest release tag, i.e. v2.11

Commit:
https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/f2735ebccf5173f74c0458736ec526276106097e

Tag:
https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/refs/tags/v2.11

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 291259c0..8d61907a 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,5 +1,5 @@
-PV:k3 = "2.10+git"
-SRCREV_tfa:k3 = "00f1ec6b8740ccd403e641131e294aabacf2a48b"
+PV:k3 = "2.11+git"
+SRCREV_tfa:k3 = "f2735ebccf5173f74c0458736ec526276106097e"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"

---
base-commit: 44c411e544b2393cff7df7edeae9a8bdb7bc9b0e
change-id: 20240806-atf-2-11-upgrade-7cc6bc5fc4c5

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


