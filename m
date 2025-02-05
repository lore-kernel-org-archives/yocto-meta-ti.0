Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734C3C02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 11:12:27 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.9680.1738753946335169494
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 03:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=u7MtNcIP;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515BCOSQ2521534
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 5 Feb 2025 05:12:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738753944;
	bh=xq+od4fOTn17lkYhgz3T6x+Mg88rvab+Rny3CCfObCA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=u7MtNcIP3GIWzsyBzicN3pSxTgghFyTwvbTEDoM51ITSX0ZqglIoE7x1OfeUWQ/ao
	 HCLD+6v6dNvv8TBRTu+VOc8CumPEkp1223nAsamLYc6D0DLc9bUHnw37XEojgnrmQP
	 r9iqlc/ebxVjHcp6JWFaLQgof5q5Ex7qo4Y+PNo0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BCO59117453;
	Wed, 5 Feb 2025 05:12:24 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 05:12:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 05:12:24 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BCNde012679;
	Wed, 5 Feb 2025 05:12:24 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 2/5] trusted-firmware-a: Update to v2.12 release tag
Date: Wed, 5 Feb 2025 16:42:08 +0530
Message-ID: <20250205111211.1847450-3-c-shilwant@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 11:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18274

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


