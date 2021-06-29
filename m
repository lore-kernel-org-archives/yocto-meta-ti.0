Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2348.1624931440571728446
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 18:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o7rLI0o1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T1ocBK015462;
	Mon, 28 Jun 2021 20:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624931438;
	bh=RAO1O5f9Pwprz2/QxDcCN88E4B/11TZPnTaMYiMRXzk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o7rLI0o1FT3QPAIzCtofgmMsMNBMHBW3/g1xL9ELMszjiHfVudlDe9NPoAYchGVWD
	 Y37l3lycG75+Hti16sT61kHsgSEhmwozYO5DMDaqkzDVfukqafMwJM9JhTOfnLUKQa
	 Iu96hpoXplPq+s8Dbm4fTCC4BDvGRgxJCCK84MW0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T1oci6042480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 20:50:38 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 20:50:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 20:50:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T1oc7l072765;
	Mon, 28 Jun 2021 20:50:38 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Yogesh Siraswar <yogeshs@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v2 1/4] ti-sci-fw: Update imggen to release 08.00.00.001 tag
Date: Tue, 29 Jun 2021 01:50:35 +0000
Message-ID: <20210629015038.33544-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629015038.33544-1-yogeshs@ti.com>
References: <20210629015038.33544-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update imggen for release 08.00.00.001 tag

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 7ec074c8..4004d93f 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2021.01a"
+PV = "2021.05"
 
 SRCREV = "0468c7a78cd26f9190d374e198e37c63c7660ba9"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
+SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

