Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.493.1616865684500127154
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 27 Mar 2021 10:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o9P4QhPs;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12RHLMjP006843;
	Sat, 27 Mar 2021 12:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616865682;
	bh=1YLlxgNOugJpwk55A6VM4DVIHm8qv8vtE2CfNKdmS0w=;
	h=From:To:CC:Subject:Date;
	b=o9P4QhPsX5MolTS/3wlC0wV2wCSdymvEMOwRpl6sIbO2fjmFLeYRNl7zkW1HrTqLA
	 2VjU/6B2v7EvUmAJflR0zJDZdrvDRbRbWeh8UiWZRw22HDvbrzCiRSRob5bsNHuJWj
	 UxZ+lu3i7GIoMjgRTrTwBGubvu5YxUG7t741tyvg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12RHLM6O058490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 27 Mar 2021 12:21:22 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 27
 Mar 2021 12:21:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sat, 27 Mar 2021 12:21:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12RHLM5H000781;
	Sat, 27 Mar 2021 12:21:22 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
Subject: [dunfell/master PATCH] linux-ti-staging: Update 5.4 kernel to 5.4.106
Date: Sat, 27 Mar 2021 12:21:22 -0500
Message-ID: <20210327172122.32709-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update linux 5.4 to 5.4.106 stable.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index e47928db..f30aefc9 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "5b5ca4d6ecedcb05721f0d5a7d753dd01c37b1f8"
-PV = "5.4.93+git${SRCPV}"
+SRCREV = "8572184582e1847404ef440220ed153ef7cae0ee"
+PV = "5.4.106+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 330068b7..b77674fc 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "70781a6b7a782e6433fee618f258d4aba7e2f34b"
-PV = "5.4.93+git${SRCPV}"
+SRCREV = "bb28855570096c462291b1eb865fde34873e1402"
+PV = "5.4.106+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.17.1

