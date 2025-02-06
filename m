Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF133C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:40:45 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.42564.1738852844452611008
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 06:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=r5mjBucV;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516EehFp3568005
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 08:40:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738852843;
	bh=xq+od4fOTn17lkYhgz3T6x+Mg88rvab+Rny3CCfObCA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r5mjBucVQevaNa49qkCNXCb+1FEWbZFh9FK/8tATwKJuRy2sFOoKEJXQTxR7Q5GqS
	 MoDTVbWC+lSvVllmf3MVB4Ja37lbkMCsPVDl1NEG/bb8SkH9yFw1rG3C4ao0MGEL7R
	 CtFPv5zsXW7/1q2GPTC7dyY+Vx52K6B6qRy/ctxE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516Eehs3013667
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 08:40:43 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 08:40:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 08:40:43 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516Eeg01070725;
	Thu, 6 Feb 2025 08:40:42 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master][PATCH v3 2/5] trusted-firmware-a: Update to v2.12 release tag
Date: Thu, 6 Feb 2025 20:10:18 +0530
Message-ID: <20250206144021.3007831-3-c-shilwant@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Feb 2025 14:40:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18282

Bump up to latest release tag (i.e. v2.12)

Commit: https://github.com/ARM-software/arm-trusted-firmware/commit/4ec2948fe3f65dba2f19e691e702f7de2949179c

Tag: https://github.com/ARM-software/arm-trusted-firmware/releases/tag/v2.12

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index ebb13bbd..df3cea23 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,5 +1,5 @@
-PV:k3 = "2.11+git"
-SRCREV_tfa:k3 = "58b25570c9ef91753b14c2103f45f4be9dddb696"
+PV:k3 = "2.12+git"
+SRCREV_tfa:k3 = "4ec2948fe3f65dba2f19e691e702f7de2949179c"
 LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 COMPATIBLE_MACHINE:k3 = "k3"
-- 
2.34.1


