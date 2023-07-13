Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B7FC001B0
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 15:18:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.11221.1689261483858975660
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Jul 2023 08:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NRc4o26F;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: kamlesh@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36DFI2Rd043876;
	Thu, 13 Jul 2023 10:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689261482;
	bh=budrmSAoMvZd5YLBmX3kn17aeE4AtDKhk8paujp5hYU=;
	h=From:Date:Subject:To:CC;
	b=NRc4o26F6JzdaWS7JXFKdY+7T5zyb87SBIrEBzbAj7JgJOIeBW8RPoEcZYd+Fr67+
	 eMz2wUO2H7Boev18WzLe7QcZuXwt4iOLL8o/nnwg/3T/vrs4cGhIGoRqqlYwzAII+G
	 BrafaQ+DhaKNL4kvmLLjHpDb/mTH//D9aD63OVXE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36DFI2TL054970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Jul 2023 10:18:02 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jul 2023 10:18:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jul 2023 10:18:02 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36DFI11s022044;
	Thu, 13 Jul 2023 10:18:01 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Thu, 13 Jul 2023 20:47:43 +0530
Subject: [PATCH ][meta-ti] [kirkstone/master] trusted-firmware-a: Update to
 v2.9 release tag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230713-atf-bump-kirk-v1-1-f23cdc4f7f66@ti.com>
X-B4-Tracking: v=1; b=H4sIAJYVsGQC/z2NQQqDMBAAvyJ77lKNFaFfCTmsZq2LGGWTFkH8e
 5MeehyYYU6IrMIRntUJyh+JsoUMza2CcabwYhSfGUxt2rpvWqQ04fBed1xEF/QPY3j0fdt1HeR
 moMg4KIVxLlVxYtoCY+AjFWFXnuT4DS04u3IiTOIq+1fvK8XECu66vq4hJwSeAAAA
To: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <jm@ti.com>,
        Kamlesh Gurudasani
	<kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689261481; l=1224;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=asbHT0f2BQdrqXLGdFRWmo1mdZAUkeDIzuFKYGiXIZ0=;
 b=sXbApziv9u6Q0yOqqLA0piA5NPgH/FubW6csfcVJBrRkduxZGtV5SfoXOWxaoDMJgtunYyFnT
 30LFSPjpr7sAEd/yftXfDQzp6XeIJCgRuLSu7nU586Y+a3lx/CCSYMg
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Jul 2023 15:18:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16839

Update to latest release tag, i.e. v2.9

https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d3e71ead6ea5bc3555ac90a446efec84ef6c6122

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index cc99f50c..64bfec67 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,5 +1,5 @@
-PV:k3 = "2.8+git${SRCPV}"
-SRCREV_tfa:k3 = "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
+PV:k3 = "2.9+git${SRCPV}"
+SRCREV_tfa:k3 = "d3e71ead6ea5bc3555ac90a446efec84ef6c6122"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"

---
base-commit: 30c3aed3641c80f514801fce33baa502d1bc508c
change-id: 20230713-atf-bump-kirk-d422ecd73555

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


