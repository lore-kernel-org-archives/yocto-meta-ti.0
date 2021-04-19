Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.1210.1618867005615515592
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 14:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R2VXX9cF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGig9043839;
	Mon, 19 Apr 2021 16:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618867004;
	bh=Cmjjvfw0JZjw+DJVJnlKOrqHXVKB5Er31ivQ3o/JKFg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R2VXX9cFVoMJm+HmKibKERg8YukOml8KF3Vkc3OC/uLSLkc/f7QpukNN6Hex0l/Bp
	 gCnuBsqZkneINYQltRAa3xGS6ypa/omMwgVVyl6HX8pOxOi1FPDLn0dVsKmy6+o8+s
	 jmbovATa8N+2ewpKD/3dcYvpp+xVwBpB3zmaSSvI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JLGijH104669
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 16:16:44 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 19
 Apr 2021 16:16:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 19 Apr 2021 16:16:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGi3U050756;
	Mon, 19 Apr 2021 16:16:44 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v3 6/8] conf: am437xx-evm: Remove non-existent dtb* from 5.10
Date: Mon, 19 Apr 2021 16:16:41 -0500
Message-ID: <20210419211643.3942-7-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419211643.3942-1-praneeth@ti.com>
References: <20210419211643.3942-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove the non-existent dtb* , as they are not currently present on
ti-linux-5.10.y.

-    am437x-gp-evm-hdmi.dtb
-    am43x-epos-evm-hdmi.dtb

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/ti43x.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 524b0b2c..b1a27f93 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -27,9 +27,9 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 KERNEL_IMAGETYPE = "zImage"
 
 KERNEL_DEVICETREE = " \
-    am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb \
+    am437x-gp-evm.dtb \
     am437x-sk-evm.dtb am437x-idk-evm.dtb \
-    am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb \
+    am43x-epos-evm.dtb \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.17.1

