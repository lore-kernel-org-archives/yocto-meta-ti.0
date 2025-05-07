Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B07C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 17:35:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1893.1746639344283929846
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 May 2025 10:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Et213U9w;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547HZgu31438615
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 12:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746639342;
	bh=FBv3LJO6UcvkV/rnBuKTvuNNG+vi52clpAuQHGyhTXc=;
	h=From:To:CC:Subject:Date;
	b=Et213U9wZ+NIqnEyPKzGsT5W0ywahuHoNX+bJcD/rAtefinyivRu1jME67UDoIsIv
	 3wnBtZpcgcjyDCAN7A/91GoriLywULT0i6C0YmemCgiezM064iUwlGvF/Z0SMXtZ4l
	 EhmVdwrlvTkXQdt3JMxcKYLPsF+xSqFAXKfYZjMI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547HZgEr097039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 12:35:42 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 12:35:42 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 12:35:42 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547HZgqc049901;
	Wed, 7 May 2025 12:35:42 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] conf: machine: k3: Add OP-TEE firmware TPM example TA
Date: Wed, 7 May 2025 12:35:41 -0500
Message-ID: <20250507173541.401243-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 May 2025 17:35:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18542

This OP-TEE fTPM is a TA from Microsoft containing the reference
implementation of the TPM 2.0 Specification. As K3 OP-TEE now has the
necessary features supported to run this fTPM, enable it here. This will
serve as an example of using OP-TEE on K3 as a TPM without needing an
external harware TPM.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index ea6a5028..ff66c5a5 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -39,7 +39,7 @@ TFA_PLATFORM = "k3"
 UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci"
+MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
-- 
2.39.2


