Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1860.1586898473872055006
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 14:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VOQApFL4;
 spf=none, err=permanent DNS error (domain: ula0866189, ip: 198.47.19.142, mailfrom: a0866189local@ula0866189)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03EL7qEh072995
	for <meta-ti@lists.yoctoproject.org>; Tue, 14 Apr 2020 16:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586898472;
	bh=8v4QCiAwOs9RY+H6tn+u9bD9AxpZt5vGky+ehPpNRd0=;
	h=From:To:CC:Subject:Date;
	b=VOQApFL4W6hOqORCOQVWA4l2LkP35Pi7ARLIiBQwu7WdBWdUr829mr5aGMRVJa9wJ
	 aMp60puFNAr2htqSzIc3851wmPVP7B0bWt3CjMGGgc2WvEK6QGS5BKT67DkKr/MVo7
	 rIdtYRfCDdzdNZbyWY/tDShVTd0TQSzY1J6qf2mE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03EL7qFJ001269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 14 Apr 2020 16:07:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 14
 Apr 2020 16:07:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 14 Apr 2020 16:07:52 -0500
Received: from ula0866189 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03EL7q3B048637;
	Tue, 14 Apr 2020 16:07:52 -0500
Received: from a0866189local by ula0866189 with local (Exim 4.90_1)
	(envelope-from <a0866189local@ula0866189>)
	id 1jOSmd-0003Ej-IK; Tue, 14 Apr 2020 16:07:51 -0500
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <sam.nelson@ti.com>, Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][thud][PATCH] ti-ipc: Update commit for release 3.50.04.08
Date: Tue, 14 Apr 2020 16:07:35 -0500
Message-ID: <20200414210735.12382-1-angelabaker@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc | 2 +-
 recipes-ti/ipc/ti-ipc.inc        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 07b380fd..50a3eca1 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,5 +1,5 @@
 PV = "3.50.04.08"
-INC_PR = "r1"
+INC_PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST ?= "null"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 4f68e31d..c1e475f3 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.50"
 
-#Corresponds to 3.50.04.08A
-TI_IPC_SRCREV = "5e72155431e955c5fcba34d844812d234093c846"
+#Corresponds to 3.50.04.08B
+TI_IPC_SRCREV = "292e171b24f7c0f4d2fc20ec53bba17e970552f1"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
2.17.1

