Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8367.1582291894798853900
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 05:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=F1R4yfeX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-stiffler@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LDVXpW002267
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2020 07:31:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582291894;
	bh=CTdin/Xg0VdbvPHDACplLsIyFtpfxsyLTivOSTOEspg=;
	h=From:To:CC:Subject:Date;
	b=F1R4yfeXHRdCjVL9rWwOvg9+kB5+eS4dYqSxOk8WxBW6XK6bzCGItsGfNzpH0T03H
	 TigW5znBXSFUUhapTYguczTIr2Wsqlpy2SVXHEBZn7XzCAKoea7TCVp64deN6ceJ81
	 yW1AiAbnN0IwHfTfQEFzEkZ1ZgQEIv0VryrI9kRQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LDVXWm009795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2020 07:31:33 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 07:31:33 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 07:31:33 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LDVXup015148;
	Fri, 21 Feb 2020 07:31:33 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/zeus/thud][PATCH] ti-cgt-arm: skip file-rdeps as this package is precompiled
Date: Fri, 21 Feb 2020 08:10:57 -0500
Message-ID: <1582290657-5351-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cgt-arm_18.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb b/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
index eecde58..e4e1c48 100644
--- a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
+++ b/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
@@ -38,6 +38,6 @@ INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INSANE_SKIP_${PN} += "arch staticdev"
+INSANE_SKIP_${PN} += "arch staticdev file-rdeps"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

