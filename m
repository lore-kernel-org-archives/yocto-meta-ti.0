Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2995.1607667212182183782
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 22:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=itsUyCnd;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BB6DUId043033
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 00:13:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607667210;
	bh=sAr1f7It9O90n/CL7bmq7eP5Rhw+t9y5CySlyi8g9Dg=;
	h=From:To:CC:Subject:Date;
	b=itsUyCnd6QxRU6xFqJnIEcGusKPSssyGWGbRN1ulPOahXwNuLtp9cKJcXoiTcyiYj
	 0t4Vna/8u6OsPDYtOAESokJ+KC4up4UwrXi8WCKfxeFHasmRD5SksalaTV09HDs8lY
	 6qJDklxQeDlVmesG5DncRgGea8ske0lQ8ebmi1sA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BB6DUSs120964
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 00:13:30 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 00:13:30 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 00:13:30 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BB6DUnx084738;
	Fri, 11 Dec 2020 00:13:30 -0600
Received: from localhost ([10.250.64.202])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0BB6DUkt058492;
	Fri, 11 Dec 2020 00:13:30 -0600
From: "Suman Anna" <s-anna@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: Ming Wei <mwei@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Suman Anna
	<s-anna@ti.com>
Subject: [meta-ti][dunfell/master PATCH] ipc: ti-rpmsg-char: Update library to 0.3.0
Date: Fri, 11 Dec 2020 00:13:27 -0600
Message-ID: <20201211061327.18837-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the ti-rpmsg-char library to 0.3.0 version that enables
the support for the various R5F remote processors on AM64x SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
index b37672a6b8af..c404f9262074 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "git"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# Initial 0.2.0 release
-SRCREV = "ecee54d2bd5125d4e78028013433b568a2b72d07"
+# Initial 0.3.0 release
+SRCREV = "0e76d13d08f0df5c7e70d58bbf76f7e299906ae1"
 
-PV = "0.2.0+git${SRCPV}"
+PV = "0.3.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0

