Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.612.1634592484475359070
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 14:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QblE+E6F;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: hnagalla@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19ILS3Gm037667
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Oct 2021 16:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634592483;
	bh=ljHg6cemH1lnS38hf7gmupsEPj8sVR1FjnD16PHd2v0=;
	h=From:To:CC:Subject:Date;
	b=QblE+E6FCAlGJnMJIk/UU5N4kOgCkXlttcdNOnwL5aIvSiVTGAF2RpJW5oSCg/URv
	 HddpcgniMVdDqHX8PC174oj1yJJv8duDLkIFiM+vtxrYSOmn6OBpDgn1bTuunHKPCD
	 3nLNuEB19DlIrpOtZbfWb8AiMuO0IEsPg5Vfun0c=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19ILS2Nd115725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Oct 2021 16:28:03 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 16:28:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 16:28:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19ILS3tt119081;
	Mon, 18 Oct 2021 16:28:03 -0500
From: hnagalla@ti.com
To: <meta-ti@lists.yoctoproject.org>
CC: <hnagalla@ti.com>
Subject: [dunfell/master] ipc: ti-rpmsg-char: Update library to 0.3.1
Date: Mon, 18 Oct 2021 16:28:01 -0500
Message-ID: <20211018212801.14426-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the ti-rpmsg-char library to 0.3.1 version that enables the
support for the M4F remote processor on AM64x SoCs.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
index df14d63f..140536e7 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "git"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# Initial 0.3.0 release
-SRCREV = "0e76d13d08f0df5c7e70d58bbf76f7e299906ae1"
+# Initial 0.3.1 release
+SRCREV = "0824546f61bda7715519841d9b9f0fb030ddfaf2"
 
-PV = "0.3.0+git${SRCPV}"
+PV = "0.3.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

