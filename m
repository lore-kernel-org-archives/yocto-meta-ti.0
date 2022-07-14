Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DBFC43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 16:30:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.9948.1657816210528040318
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Jul 2022 09:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oytyqOld;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26EGU9vU037993;
	Thu, 14 Jul 2022 11:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657816209;
	bh=Gwe0apySZI/P27Blpw6mKEOahXaBqGW06H+e8pmpRy0=;
	h=From:To:Subject:Date;
	b=oytyqOld1l2QIhYV7YkFmhTbVPeCZ/FhNv0xx7Qs17tMCE2jADvnUni7J10075Ky8
	 erN5ci/KE/Csa1+AKKfi9LdgwgGU1p8c5BOYZKmjkdAY77/4aMPGX5KB3MgWxS5/GO
	 Xs2K1ZElJ+GeGpZAxXQf09+uSqHi5x0Gebne+aNc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26EGU9Wx076517
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Jul 2022 11:30:09 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 14
 Jul 2022 11:30:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 14 Jul 2022 11:30:08 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26EGU8Vq018725;
	Thu, 14 Jul 2022 11:30:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oC1j6-0008BK-4Z; Thu, 14 Jul 2022 11:30:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] ti-img-encode-decode: Lock test app to
 j7-evm
Date: Thu, 14 Jul 2022 11:30:08 -0500
Message-ID: <20220714163008.31409-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Jul 2022 16:30:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14878

The test app is not compatible with later versions of j7, so
add COMPATIBLE_MACHINE to lock these recipes down to just
j7-evm and j7-hs-evm.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb | 2 ++
 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
index 48a17537..2fe95cb8 100644
--- a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
@@ -6,6 +6,8 @@ DEPENDS = "libdrm ffmpeg"
 
 inherit autotools pkgconfig
 
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm"
+
 PR = "r1"
 SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
 
diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
index 3bb5d745..35dacd12 100644
--- a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -6,6 +6,8 @@ DEPENDS = "libdrm"
 
 inherit autotools pkgconfig
 
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm"
+
 PR = "r0"
 SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
 
-- 
2.17.1


