Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BA1C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 15:24:35 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.471.1651591473484202608
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 08:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eWeflDDu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 243FOSXb125449;
	Tue, 3 May 2022 10:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651591468;
	bh=rHpRya51Sik4l4wje8ps+5JKFDp/WA2GzjBRc0Cmlbg=;
	h=From:To:CC:Subject:Date;
	b=eWeflDDuL/FYeIH5ejErPN1os4VbQYqPdfvRoANlpTFTIJ+79bm+bbIu77z0pqoTc
	 BOFybB7zNLTABE1sA7iq7la/1ZYOIe6XGFubyZKzSuJF7gcHVJ3LSC0fuoCbZw6Rrl
	 k2dFeDru7xyiXCdyrh8/1ROmvUJxzTdI154BA/I4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 243FOSa4026818
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 May 2022 10:24:28 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 3
 May 2022 10:24:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 3 May 2022 10:24:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 243FOScS014717;
	Tue, 3 May 2022 10:24:28 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell-next RFC PATCH] trusted-firmware-a: upgrade to v2.6+
Date: Tue, 3 May 2022 10:24:28 -0500
Message-ID: <20220503152428.25598-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 15:24:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14680

upgrade arm-trusted-firmare to master which is currently v2.6+

This upgrade picks up am62x low power mode feature.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---

AM62 low power mode support:
https://review.trustedfirmware.org/q/topic:%22ti-k3-system-suspend-base-support%22

 .../trusted-firmware-a/trusted-firmware-a_%.bbappend        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index b84da1f3..4476d23e 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,8 +1,8 @@
-PV_k3 = "2.5"
+PV_k3 = "2.6"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
-BRANCH_k3 = "ti-atf"
+BRANCH_k3 = "ti-atf-next"
 SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "0693f356eb2a25adf8758d98058120bed082cc73"
+SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.17.1


