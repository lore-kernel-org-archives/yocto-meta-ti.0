Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9286BCA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 19:36:34 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.21944.1756928185718280068
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 12:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Rjx3qkb5;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583JaOif3339829;
	Wed, 3 Sep 2025 14:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756928185;
	bh=5pcDCn500pKpMKkpy2E0NjTWwYgVhl8jz670Wae3baE=;
	h=From:To:Subject:Date;
	b=Rjx3qkb5zpYwjiyErXfooFfCuqkUmdjEp6NYeRxxxpLN02ix6D8RhxO20ti0QAW0L
	 e/B0f4ltw1yQa1t1ROkcrayfgybbeihnsj2ovTv11aCEYsIzU/1Q5AVY/iGC+HkAxE
	 j63dFHI+/ZGPyk/JtxpXIaFnenEWgCsOCgbepYuY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583JaOXJ314925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 14:36:24 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 14:36:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 14:36:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583JaOOO2085437;
	Wed, 3 Sep 2025 14:36:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uttHM-00043x-Bm; Wed, 03 Sep 2025 14:36:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] optee-ftpm: Add TI version override for ftpm
Date: Wed, 3 Sep 2025 14:36:24 -0500
Message-ID: <20250903193624.15577-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Sep 2025 19:36:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18977

We are missing the optee-ftpm package verson override along with our
other optee-* overrides.  This resulted in a build error when meta-arm
moved to 4.7.0 while we are still sitting on 4.6.0.  The 4.7.0
optee-ftpm is using some new header info that the 4.6.0
optee-os-tadevkit is not providing.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc    | 2 ++
 .../optee/{optee-client_%.bbappend => optee-ftpm_%.bbappend}    | 0
 2 files changed, 2 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
 copy meta-ti-bsp/recipes-security/optee/{optee-client_%.bbappend => optee-ftpm_%.bbappend} (100%)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
new file mode 100644
index 00000000..119795c4
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
@@ -0,0 +1,2 @@
+PV = "4.6.0+git"
+SRCREV_optee-ta = "6f99e783eb9bb57c314a881433d4ec970de87959"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-ftpm_%.bbappend
similarity index 100%
copy from meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
copy to meta-ti-bsp/recipes-security/optee/optee-ftpm_%.bbappend
-- 
2.17.1


