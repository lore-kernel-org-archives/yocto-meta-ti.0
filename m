Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B959E7C4D6
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 15:50:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.22090.1696434610933103504
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 08:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wMO9PExe;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: kamlesh@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 394Fo9kW099678;
	Wed, 4 Oct 2023 10:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696434609;
	bh=ocR0fmZkrQ3mNoYvJKmaV36sC3TLSVWzG+9s5+YziAY=;
	h=From:Date:Subject:To:CC;
	b=wMO9PExey5BmpvEiQ5MFvKAzaIptaLIs48S2tMG6aKeDkKAzTmI7qsFOh3NfcN3tf
	 XAFGfmkYGkXcvATblDZf3eJv80sejyS+aA14uhao6qBwKG1qaK7rSTuERX8histKeN
	 0xvGH7i3XhRrrtXyZL3YCjwGr1K2T72eV6tEPpVE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 394Fo9F7053592
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Oct 2023 10:50:09 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 10:50:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 10:50:09 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 394Fo83O019169;
	Wed, 4 Oct 2023 10:50:08 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Wed, 4 Oct 2023 21:19:50 +0530
Subject: [PATCH] trusted-firmware-a: Update to sha fixing deep sleep on
 AM62x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231004-atf-bump-lpm-v1-1-66ebc652e365@ti.com>
X-B4-Tracking: v=1; b=H4sIAJ2JHWUC/x2NywqDMBAAf0X23IWYitD+Sukhj01drDHspkUQ/
 72xx4EZZgclYVK4dzsIfVl5zQ36SwdhcvlFyLExWGOvvTEDuprQf5aC77JgSLdoxzimIRC0xDs
 l9OJymM5oZpm1rpkw01ZPoQgl3v6/x/M4fuNtUdt/AAAA
To: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696434607; l=1247;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=8Ux/U+J2viufeMPMZ1s/JQ19882J7quv72nOuN1nTTk=;
 b=WRwYsa2U4lM2Qk8Y3/OFNXgz4uItokNxU0JwrbJFLtLmfYA3LucN1dOLEEtuwFYhSt7vVjw91
 zXfUpoBFvetBja8CtqoGsu5EjICeRJmXONetrUxivvw6b8EycqcRouM
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 15:50:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17052

Update to commit d7a7135d32a8c7da004c0c19b75bd4e2813f9759,
which fixes deep sleep bug on AM62x

https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 64bfec67..b2787005 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,5 +1,5 @@
 PV:k3 = "2.9+git${SRCPV}"
-SRCREV_tfa:k3 = "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
+SRCREV_tfa:k3 = "d7a7135d32a8c7da004c0c19b75bd4e2813f9759"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"

---
base-commit: 771e12cfb7a9ffedb40395632bc123cd4ce5fb9a
change-id: 20231004-atf-bump-lpm-cf9d26d6f4ce

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


