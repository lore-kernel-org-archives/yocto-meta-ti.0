Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EB2C433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 01:30:11 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5780.1651714210576498971
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 18:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Xd8rGukp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2451U7tu086070;
	Wed, 4 May 2022 20:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651714207;
	bh=cnz3XE7UoJpBOjq2JjVqwWUTYCDm1y/s/1MdzuJhDxA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Xd8rGukp5Z+O4du8beByCa/wcKmk47sa1mdpowCSqy6Mk6qba7jyI3YCXiQUq+vWw
	 XTQbVKF+f9OD3fAFDSivb6T472edvcXwaWPbNZLYRa+wJVxwwqCp7tTCu7yQYjn3VE
	 f1B5uchgBex64JrAMyFCOeY7Azeu8+q/2Xjxn5mM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2451U7Yc043551
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 20:30:07 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 20:30:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 20:30:07 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2451U7HJ018840;
	Wed, 4 May 2022 20:30:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nmQJi-00074Y-OY; Wed, 04 May 2022 20:30:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v3 1/2] trusted-firmware-a: upgrade to v2.6+
Date: Wed, 4 May 2022 20:30:05 -0500
Message-ID: <20220505013006.27140-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220505013006.27140-1-reatmon@ti.com>
References: <20220505013006.27140-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 01:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14702

From: Praneeth Bajjuri <praneeth@ti.com>

upgrade arm-trusted-firmare to master which is currently v2.6+

This upgrade picks up am62x low power mode feature.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
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


