Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.12893.1637345933436595790
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 10:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=b4mYUDV4;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJIIpgZ128653;
	Fri, 19 Nov 2021 12:18:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637345931;
	bh=NDVGjJfajGDbJqTQKIlv/67LO3JimdV8OKHtpl+NQLk=;
	h=From:To:Subject:Date;
	b=b4mYUDV4w/uHetVPPL9/M8n717JRHKDVbENKyzgOzSKXawD97zKtPb26Hf51W6XE7
	 9vjFaYzxZ+xkrgw2D8t4S9/YtjP6iHwPfbvpNyrIykZNB6q8fFtCSVhVKdjf/0cVLe
	 TVlF4CDJGDn+tFcl3+GkfVjZuGzq4/IjwhqkaXyY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJIIpRB102729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Nov 2021 12:18:51 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 19
 Nov 2021 12:18:51 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 19 Nov 2021 12:18:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJIIpDt122030;
	Fri, 19 Nov 2021 12:18:51 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] j7-hs-evm: Correct image boot file causing build error
Date: Fri, 19 Nov 2021 18:18:51 +0000
Message-ID: <20211119181851.10066-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Correct the boot image file that is causing build error

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/j7-hs-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index ab0fa474..f2e3ccf5 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -23,7 +23,7 @@ BBMULTICONFIG += "k3r5-sr1-1"
 
 # Use default IMAGE_BOOT_FILES_LEGACY files
 # Since default sysfw.itb on J7 is for SR1.1, add a version for SR1.0
-IMAGE_BOOT_FILES += "sysfw-j7-hs-evm.itb"
+IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
 do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
 
-- 
2.17.1

