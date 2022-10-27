Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D6EECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 23:30:32 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.459.1666913430679244437
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 16:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nNj4GJwJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29RNURa3097102;
	Thu, 27 Oct 2022 18:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666913427;
	bh=ItgxoL/wRAS4utKvNWGZA5s/Ml4cHPSh//ykzlbZEsQ=;
	h=From:To:CC:Subject:Date;
	b=nNj4GJwJMv1yk6m9XGk6xFW1FBMP4Bz6fdy1kcz2UGe3jMpbJAiNxhMdpNl9TW0AK
	 PMt5cMou9s13Sy8RvLfx8RF3s0icAwtzoTW+SRDYnOCqFp1ZA2b3wURmDPbfae6rvg
	 jPhzSNv1qDHw+0ka62wmhja+COyPgIXDjQ+D7O2Q=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29RNURGC003082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Oct 2022 18:30:27 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 27
 Oct 2022 18:30:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 27 Oct 2022 18:30:27 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29RNURd1127661;
	Thu, 27 Oct 2022 18:30:27 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Jayesh Choudhary <j-choudhary@ti.com>, Andrew Davis <afd@ti.com>
Subject: [dunfell PATCH] optee-os: Upgrade to upstream 3.19.0
Date: Thu, 27 Oct 2022 18:30:27 -0500
Message-ID: <20221027233027.29967-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Oct 2022 23:30:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15209

Update to the latest upstream master which is 3.19.0.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 38d1ce50..4a4ebfd7 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,5 +1,5 @@
-PV_ti-soc = "3.18.0+git${SRCPV}"
-SRCREV_ti-soc = "6bf4a81a8f5388e6cb6b1d7e8ebe57c5089c0954"
+PV_ti-soc = "3.19.0+git${SRCPV}"
+SRCREV_ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
 SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.17.1


