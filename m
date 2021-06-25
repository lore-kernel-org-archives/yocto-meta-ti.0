Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.7347.1624626477062423701
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Jun 2021 06:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=O1IkYJux;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: grygorii.strashko@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15PD7u2L069784
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Jun 2021 08:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624626476;
	bh=7SctNglOCS4vd+3Tamxu4dkDbhIPFx/k32Xg5thqoOs=;
	h=From:To:CC:Subject:Date;
	b=O1IkYJux3/eVhCcaP496+i8xFC6F3EmsK7JUdF8itSJuEoVGxSTIF5iTc7BeHmjnx
	 Mc2+Fy60+1G2AhPkIGlmF70F0LYX+AAywS3e8zMa8bZGKfwSNKnBJ2jalOwUbHceFJ
	 4pjKbCrm/0qcoZs2+KsP1+mFiBe2w0uiUZLZHKPI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15PD7uL0099534
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Jun 2021 08:07:56 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 25
 Jun 2021 08:07:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 25 Jun 2021 08:07:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15PD7s0l070590;
	Fri, 25 Jun 2021 08:07:55 -0500
From: "Grygorii Strashko" <grygorii.strashko@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko
	<grygorii.strashko@ti.com>
Subject: [PATCH dunfell/master] prueth-fw-am65x-sr2: Updating firmware to 02.02.09.02
Date: Fri, 25 Jun 2021 16:07:43 +0300
Message-ID: <20210625130743.16823-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update AM65x SR2.0 prueth firmware to 02.02.09.02

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 9d579fa4..9ab40536 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "02.02.08.02"
+PV = "02.02.09.02"
 
 CLEANBROKEN = "1"
 
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm|am64xx-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "31e626d84a3f8a5dc7175b79440972ce90a23de0"
+SRCREV = "c0bbbc44fee68f2a3eba1ca98c340e34e759624d"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.17.1

