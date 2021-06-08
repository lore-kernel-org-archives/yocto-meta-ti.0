Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5863.1623110576237689141
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 17:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Nqs62Eld;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15802t2O047642;
	Mon, 7 Jun 2021 19:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623110575;
	bh=ZrQTYt9A5+4c0XReo/5a2JBjXurm9A6dIX/5jR669Do=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Nqs62EldCTbi0ts03rQfcxZlCjJq3wmwwBXmE7XXx9XZolF/gWkOOqfA0zCOrTxaR
	 xGa0iBZ/X2081TmbNMf0mPoHtNZYrDXVjsxYqjZIQ/M1SgyMsTkGk8rKULWN8OoRyV
	 blWawP6g8SOM8yjocl+7l0KFzeMXiujublyvZFoc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15802tXZ082916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Jun 2021 19:02:55 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 19:02:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 7 Jun 2021 19:02:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15802s0X092487;
	Mon, 7 Jun 2021 19:02:54 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] linux-ti-staging: Update 5.10 kernel to the latest commit SHA
Date: Mon, 7 Jun 2021 19:02:52 -0500
Message-ID: <20210608000254.12042-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608000254.12042-1-praneeth@ti.com>
References: <20210608000254.12042-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update 5.10 kernel to the latest commit SHA

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 4654d92d..834df5ff 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "afe9ba17bb94cd226f9e5dc3685e4fe32be28c5c"
+SRCREV = "433ef931c699f08bef8c67de8458302c5f971c8b"
 PV = "5.10.35+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 72a6c49c..47f1669e 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "72d727fe733f2610e937a063bcebedce329948ec"
+SRCREV = "ae876c7c91df646ab198331e676f250f06cfdeb5"
 PV = "5.10.35+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

