Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3199.1588795471279909798
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 13:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=B+4BO9qQ;
 spf=none, err=permanent DNS error (domain: ula0866189, ip: 198.47.19.142, mailfrom: a0866189local@ula0866189)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046K4UMt078901
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 May 2020 15:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588795470;
	bh=QB9YZyc4HmFSNlAchakETNFWdUSIzHsvhuq5WMo7H3k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=B+4BO9qQBi90y2BKGDnrdPzaFKLOw6/xZd42U59viUD8RBzkJ8256MFCQXDjjM6wT
	 yGH/4enaLsf6nTbkIG/xhyKYSnWH/v/AVWm76wNj3JvJKQkC0Gsp0Q+oXTJyljyBVJ
	 0qjA+xP633jrgeQt3GCGK9gzYSW2bl+WAdnUb4r8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 046K4UWF073054
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 May 2020 15:04:30 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 15:04:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 15:04:30 -0500
Received: from ula0866189 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046K4U8c002246;
	Wed, 6 May 2020 15:04:30 -0500
Received: from a0866189local by ula0866189 with local (Exim 4.90_1)
	(envelope-from <a0866189local@ula0866189>)
	id 1jWQHO-0005qz-0r; Wed, 06 May 2020 15:04:30 -0500
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <s-anna@ti.com>, Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][master][PATCH 2/3] ti-pdk: SRCREV update to 2020.5.6
Date: Wed, 6 May 2020 15:04:14 -0500
Message-ID: <20200506200415.22380-2-angelabaker@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506200415.22380-1-angelabaker@ti.com>
References: <20200506200415.22380-1-angelabaker@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 7c3d2b07..7a27e374 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "9c04a8f4ac2ed95100ee50163b3189d28b9680f1"
+TI_PDK_SRCREV ?= "a1ace885998e9adbcbbd0abf8b9ded6ba9ec54ff"
 
-TI_PDK_VERSION ?= "2020.4.16"
+TI_PDK_VERSION ?= "2020.5.6"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.17.1

