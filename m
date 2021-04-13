Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4713.1618289148877124770
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 21:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GO/scmxh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13D4jlhV034788;
	Mon, 12 Apr 2021 23:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618289147;
	bh=LtvwPoyuW8iq1NwfBKZn2U2p1P7KmlvC7CWTuk+OTIM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GO/scmxhcEdHyUelBug2oW/Ged50VXXXLDseaAq2oR4y6APTwaoLG4sOc1DR5/HNB
	 YSxxSMeqUu2RTcFsnItOtj30lrxf8z75tBgv66rUUmQbN5rCo5u4b1lT8y2/i1UgnT
	 eSxq1EG7KAQfLDYpU3LJycaeT2qyWOonLUeQ+jag=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13D4jl0Y107912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Apr 2021 23:45:47 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 12
 Apr 2021 23:45:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 12 Apr 2021 23:45:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13D4jkt1069235;
	Mon, 12 Apr 2021 23:45:47 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 1/4] Revert "linux-ti-staging, u-boot-ti-staging: lower default preference"
Date: Mon, 12 Apr 2021 23:45:43 -0500
Message-ID: <20210413044546.12409-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413044546.12409-1-praneeth@ti.com>
References: <20210413044546.12409-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit a0e26c1caf7d36953bd41f6a763101f5a65919e2.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 2 --
 recipes-kernel/linux/linux-ti-staging_5.10.bb   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 9c95449c..299a6cd8 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -8,5 +8,3 @@ PR = "r1"
 BRANCH = "ti-u-boot-2021.01"
 
 SRCREV = "c4fddedc48f336eabc4ce3f74940e6aa372de18c"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 82a6c20e..fc115958 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -41,5 +41,3 @@ module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg
 module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
 KERNEL_MODULE_AUTOLOAD_append_j7 = " rpmsg_kdrv_switch"
-
-DEFAULT_PREFERENCE = "-1"
-- 
2.17.1

