Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05BEC02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:40:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.42566.1738852848347131235
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 06:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FDF+jaxl;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516Eekgd2745997
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 08:40:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738852846;
	bh=kYxW4erkBs5IjVMTc/T1DL/cBMGnQIO6tH6lk2Z6XWw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FDF+jaxltVVgOKOeyfuKs7QyRm1hX91KeSx794JEZb3Tz6/0DX9CLrT1e7WikvKSG
	 NLocsZGxP6gK4ZoggzQse88dT8EYDJXLIHKrXu5upZegSMJxY/a/8Plq6wZ8zwbAJn
	 tDmUWbm0Hwk5ypcocOJ+AtNqfhZjqlG8JCBsxh5g=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516Eeke6013014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 08:40:46 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 08:40:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 08:40:46 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516EejDL070747;
	Thu, 6 Feb 2025 08:40:45 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master][PATCH v3 3/5] trusted-firmware-a: Switch TFA to TI fork
Date: Thu, 6 Feb 2025 20:10:19 +0530
Message-ID: <20250206144021.3007831-4-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206144021.3007831-1-c-shilwant@ti.com>
References: <20250206144021.3007831-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Feb 2025 14:40:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18283

- While TFA patches for K3-based AM62L platform are under
review upstream, temporarily switch to TI's GitHub fork
for all K3 platforms to prevent disruptions and ensure timely bringup

- Also update the LIC_FILES_CHKSUM since the license file changed between
upstream TFA v2.12 [1] & the SRCREV in this commit [2][3]

[1]: https://github.com/ARM-software/arm-trusted-firmware/blob/v2.12/docs/license.rst

[2]: https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/license.rst

[3]: https://github.com/TexasInstruments/arm-trusted-firmware/blob/ti-master/docs/license.rst

License-Update: Updates w.r.t TFA Hob creation code

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


