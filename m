Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6DEC05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 21:56:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.57258.1674511007133306691
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 13:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N6A2678L;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: jm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NLukTQ097383
	for <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 15:56:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674511006;
	bh=/h9GKxHr2XdVMYM/oPlcwTTIqNsHX4kxAGlg4g3B+04=;
	h=From:To:CC:Subject:Date;
	b=N6A2678L5P+GrTGQmZmJ3Pve+5yZVXHwLV9vQEyiOslOtSUrQX4ffjJjDfQrlQNBf
	 6/hOA9mRNFt556Ck33oexAu98P2hUJn6vDnczeysBbY/QkIqWWbgXKH+y3CnT2mXMk
	 2jpvugn9Wl9ax+TeFhnoeUBzAMgikQ0U+xDBXKnQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NLukFj012748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 15:56:46 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 15:56:46 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 15:56:46 -0600
Received: from uda0498204.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NLukOh018459;
	Mon, 23 Jan 2023 15:56:46 -0600
From: Judith Mendez <jm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@ti.com>
CC: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell v4] trusted-firmware-a: upgrade to v2.8+
Date: Mon, 23 Jan 2023 15:56:46 -0600
Message-ID: <20230123215646.24425-1-jm@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 21:56:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15634

Upgrade arm-trusted-firmare to v2.8-226-g2fcd408bb.

This upgrade picks up K3 L2 cache, snoop delayed, and EA
handling updates from upstream master.

Do not update to tip of master due to PSCI system off
support breaking AM62x and AM62q platforms.

Signed-off-by: Judith Mendez <jm@ti.com>
---

v4: Updated PV_append_k3 to PV_K3
v3: v2 was the wrong patch sent with a typo
v2: added PV_append_k3 = "+git${SRCPV}" since SRCREV does not point exactly to
release tag

 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index a5eb9ff8..caf27328 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,6 @@
-PV_k3 = "2.6"
+PV_k3 = "2.8+git${SRCPV}"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
-SRCREV_tfa_k3 = "1309c6c805190bd376c0561597653f3f8ecd0f58"
+SRCREV_tfa_k3 = "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.17.1


