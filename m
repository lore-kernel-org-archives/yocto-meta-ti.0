Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1154.1623365832020472218
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 15:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gBDoi7xq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15AMvBiY122112;
	Thu, 10 Jun 2021 17:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623365831;
	bh=E+Reo+1w8gV4XHDBmjKL3Ia3duZ+z6XJ1VDjXd3d1Qg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gBDoi7xq+E00br9iGgpfbAX6v88mnygt/bML3C8Vp0e72H9D/NT4sh9EHtt7iXt5s
	 94gADSfyerGDb+8Af3T91cvV/U15PLDK/nEaIk5jmECoyrz1ddVfnNlabQQKal/7YW
	 CsieQBOG3wb/LyIg2d/wtlB9xpiXv1QBZc/6YJ2Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15AMvBdk055938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Jun 2021 17:57:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 10
 Jun 2021 17:57:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 10 Jun 2021 17:57:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15AMvAhL101554;
	Thu, 10 Jun 2021 17:57:10 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-sci-fw: Update image gen to latest
Date: Thu, 10 Jun 2021 17:57:10 -0500
Message-ID: <20210610225710.1259-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210610225710.1259-1-praneeth@ti.com>
References: <20210610225710.1259-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

update image get to latest.
This commit also picks AM64x boot critical fix.
commit e411dc16862b ("soc: am64x: Makefile: Move the SPL Load address to 0x70000000")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 72430ab6..dbf63ef5 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -7,7 +7,7 @@ PV = "2021.01a"
 
 SRCREV = "34062b5670aac524ce3074b184ef2ef62daafca0"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "7b6f3832af6d334d335309d66d206ab829765c0e"
+SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

