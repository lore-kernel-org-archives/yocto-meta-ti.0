Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.10129.1584461641529475090
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 09:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aQFMB4WD;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02HGE0Lu024246
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2020 11:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584461640;
	bh=ByeJKHb5DYDKaRuz4Gbcu0PcPKwVSgpXMx4nECykaFw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aQFMB4WDoPSo2k1FU7vBT2INk+Jhqyf3bf6cZjd3NQI6iLH/YVDx/8Plkj/kcur1t
	 mhX/9aXofPtLGCe1yaleztK+6gv4+kEejCxpgVb8G/iPhMfniujMe3GWHt9EaV+OOX
	 Gb1/hwYA6v2GjnW2t7Xrgc/pO3XMpW2FW/iDbJJg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02HGE0Lv083922
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2020 11:14:00 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 11:14:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 11:14:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HGE0OI080839;
	Tue, 17 Mar 2020 11:14:00 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] linux-ti-staging: update to the ti2020.00-rc4 tag
Date: Tue, 17 Mar 2020 11:08:07 -0500
Message-ID: <20200317160807.12873-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317160807.12873-1-dmurphy@ti.com>
References: <20200317160807.12873-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 33c6508b..dfe44454 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "a7f0924ffeb3e8dfaefece66aea3ef3d20f6b571"
+SRCREV = "27ac613bbce13841a47fcc7341d7c14333b8e0e9"
 PV = "5.4.20+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index efa1ebe8..49a4c185 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -60,7 +60,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "738552d0b0292e148b35d60ec47ca3c8dd6007b4"
+SRCREV = "70338004346078dd120c51a1cb22ed7d5bfdfca9"
 PV = "5.4.20+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.25.1

