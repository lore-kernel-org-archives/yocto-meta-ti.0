Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CF1ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 18:07:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2594.1662487637548473001
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 11:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S9bdTPfx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 286I7G8b055801;
	Tue, 6 Sep 2022 13:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662487636;
	bh=+xpKwdLEK2DFvZozMzETmdM0l8D+RpQ68Dy7DDrcZsQ=;
	h=From:To:CC:Subject:Date;
	b=S9bdTPfx4lZdmSS9jxIm6NT3s/zawN//ngPwUJPpnNpQt9CmV0mNNufpVGh1trehg
	 0ARYntt+V5ajdPPQOGmjQRSRkR0RGtybt6wKGeRN/i5hcxu8zJvet0PLSesXXUBdXP
	 mBgTzIlqPvHti/Zw/3PmK1kEh7x/Rzmplw3Ff0Z0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 286I7G5V127190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Sep 2022 13:07:16 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 6 Sep
 2022 13:07:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 6 Sep 2022 13:07:15 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 286I7FTr004377;
	Tue, 6 Sep 2022 13:07:15 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH v2 1/2] optee-os: Upgrade to upstream 3.18.0
Date: Tue, 6 Sep 2022 13:07:14 -0500
Message-ID: <20220906180715.18109-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Sep 2022 18:07:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14995

Update to the latest upstream master which is 3.18.0.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index cc9857e0..c715d47d 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,5 +1,5 @@
-PV_ti-soc = "3.17.0+git${SRCPV}"
-SRCREV_ti-soc = "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
+PV_ti-soc = "3.18.0+git${SRCPV}"
+SRCREV_ti-soc = "8e155bae3a5eb9d1a3ed9260bd7281a7a35f5086"
 SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.36.1


