Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B2EC433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 23:49:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.4814.1651708174589264912
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 16:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CuXbLiDQ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244NnUaZ023695;
	Wed, 4 May 2022 18:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651708170;
	bh=JxljB+a/UWnvnI/1Y+OJjYhKVrTLCM0xeDjt4Uk2lHk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CuXbLiDQvp3NT5+f0kDdyM1MV5QqA9N4uuaG3sl7iEasop66gXDK+VD0CWK3zFUFr
	 Cmh62E1B5NGa9NNNU3zjkXpKPMahxKiB3RxITvX1K2/TR0raM5JJZVgipQ5Eb31pQu
	 m9Xk8iOzPtLsX3vCS+wbc6/BXeVmdyhNjsi1A+VM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244NnUs8007193
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 18:49:30 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 18:49:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 18:49:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244NnUKs022111;
	Wed, 4 May 2022 18:49:30 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Dave
 Gerlach <d-gerlach@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell PATCH v2 1/2] trusted-firmware-a: upgrade to v2.6+
Date: Wed, 4 May 2022 18:49:29 -0500
Message-ID: <20220504234930.6508-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220504234930.6508-1-praneeth@ti.com>
References: <20220504234930.6508-1-praneeth@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 May 2022 23:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14698

upgrade arm-trusted-firmare to master which is currently v2.6+

This upgrade picks up am62x low power mode feature.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index b84da1f3..80b1d664 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,8 +1,8 @@
-PV_k3 = "2.5"
+PV_k3 = "2.6"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
 BRANCH_k3 = "ti-atf"
 SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "0693f356eb2a25adf8758d98058120bed082cc73"
+SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.17.1


