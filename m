Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.752.1585870062831966768
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 16:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a4IWxFbL;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: sam.nelson@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 032NRgAM127452
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Apr 2020 18:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1585870062;
	bh=BTeHt4YuME9gDZ6BnaVsFxHOpHFmyzbb0beX7zmm1QU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a4IWxFbLmKx0JNkMTijvXZbKZMPoZMuYOUN6wPP5l+D8EDUDG/b1RTwMLfdybJK25
	 kDaAZStvOTOeLzbtrsyCPs1pMvVjus5dQCy+VRLfsOyrDC8xlI4Wrzm3I2XfHxbOZ8
	 49FzIlAKp/QNocUkql7uBN6GcEiFLrqaZa2OECPY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 032NRgdk095320
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Apr 2020 18:27:42 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Apr
 2020 18:27:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Apr 2020 18:27:41 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 032NRdMS100706;
	Thu, 2 Apr 2020 18:27:41 -0500
From: "Sam Nelson" <sam.nelson@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sam Nelson <sam.nelson@ti.com>
Subject: [meta-ti][thud][PATCH 2/3] ti-pdk-fetch: SRCREV Update to 2020.4.2
Date: Thu, 2 Apr 2020 19:27:35 -0400
Message-ID: <1585870056-13775-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585870056-13775-1-git-send-email-sam.nelson@ti.com>
References: <1585870056-13775-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 7108d00..6c1e919 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "5ddf121a09af4ac58a18103848d4ab8e741e23d6"
+TI_PDK_SRCREV ?= "773b514be5d5c40d6aa8c8ffa94a312185fcae4a"
 
-TI_PDK_VERSION ?= "2020.1.22"
+TI_PDK_VERSION ?= "2020.4.2"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
1.9.1

