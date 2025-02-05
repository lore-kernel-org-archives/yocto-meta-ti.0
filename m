Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FDFC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 11:12:37 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.9868.1738753949005788951
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 03:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RAjNjSo4;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515BCRJJ2521538
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 05:12:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738753947;
	bh=EjvnNAdgy/4EcUrU5cisPDhtvfycojvixOR1R+UTu7w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RAjNjSo4wG5c55aMhPA9NSPC8QOi/iqZLdDXEngmHgPHHlOy4csMi5ch1Pz6KI2do
	 zifMU3vOcSgtC57Lb5SadZTzou6gR7LDS+iENrcmocTLpN+6Rop46aUFZJODveKDCG
	 DgIioDC2vPiqb4oRjMIWtxJWkjAO6ct5bcRjUYLI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515BCRnI012437
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 05:12:27 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 05:12:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 05:12:27 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BCQfJ007938;
	Wed, 5 Feb 2025 05:12:26 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 3/5] trusted-firmware-a: Switch TFA to TI fork
Date: Wed, 5 Feb 2025 16:42:09 +0530
Message-ID: <20250205111211.1847450-4-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205111211.1847450-1-c-shilwant@ti.com>
References: <20250205111211.1847450-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 11:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18275

- While TFA patches for K3-based AM62L platform are under
review upstream, temporarily switch to TI's GitHub fork
for all K3 platforms to prevent disruptions and ensure timely bringup

- Also update the LIC_FILES_CHKSUM since the license file changed between
upstream TFA v2.12 [1] & the SRCREV in this commit [2][3]

[1]: https://github.com/ARM-software/arm-trusted-firmware/blob/v2.12/docs/license.rst

[2]: https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/license.rst

[3]: https://github.com/TexasInstruments/arm-trusted-firmware/blob/ti-master/docs/license.rst

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../trusted-firmware-a/trusted-firmware-a-ti.inc            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index df3cea23..c628eb15 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,7 +1,7 @@
 PV:k3 = "2.12+git"
-SRCREV_tfa:k3 = "4ec2948fe3f65dba2f19e691e702f7de2949179c"
-LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
-SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
+SRCREV_tfa:k3 = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
+LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
+SRC_URI:k3 = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https;name=tfa;branch=ti-master"
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
-- 
2.34.1


