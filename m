Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2286.1624931440568008199
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 18:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lGmWFXCt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T1oc1F066745;
	Mon, 28 Jun 2021 20:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624931438;
	bh=b2slzYl9CHq6XLZniDOn0EN5CZUw2lgB/p0mucIrvnI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lGmWFXCtE3MUcsVoX3M+H5uvFErBTfB92Kb+DsKFJgEdDSBk08qs1/3To/BchEdkR
	 UZVDdfxczfWVZdBcSWL3OucgxDgzOiofPXYEX8T0uhbIFTOwSd+vYaH7KB3fd0qO0y
	 bAojg8Rle5aXEqt8+wh3kCxKD0XLG5XJz7sUPMRU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T1ocaw042523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 20:50:38 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 20:50:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 20:50:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T1ocCA056490;
	Mon, 28 Jun 2021 20:50:38 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Yogesh Siraswar <yogeshs@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v2 4/4] linux-ti-staging: Update to 08.00.00.001 release tag
Date: Tue, 29 Jun 2021 01:50:38 +0000
Message-ID: <20210629015038.33544-5-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629015038.33544-1-yogeshs@ti.com>
References: <20210629015038.33544-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update to 08.00.00.001 release tag

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index edb42156..ff807108 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "3314837930ce2cf2bbd51a34f32a7494a6aec8c8"
+SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
 PV = "5.10.41+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

