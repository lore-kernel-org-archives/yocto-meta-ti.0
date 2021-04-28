Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7396.1619583948537089942
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 21:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CFFtAYrm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13S4PlhO106396;
	Tue, 27 Apr 2021 23:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619583947;
	bh=tglMU8B7Jjody1eHFV0Kfx0gY/c5DgywLNke3msBK+k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CFFtAYrmHzlQbjqnVW1i4ivvbhaEqXsICEY2toApu4n/Wp98Hw7GbBTBA2Uq1xYE2
	 c3LeffjnDZ1oBTdnHzRaBByzC+LVLOYchGcYxRIWVP6NMK6o38h9wR4nFbZov2naFJ
	 nxpl0ZMqHOhkfAX/kRDrUl4t+887IqCI/+tzkFmE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13S4PlvM122585
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Apr 2021 23:25:47 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Apr 2021 23:25:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 27 Apr 2021 23:25:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13S4PkHs070853;
	Tue, 27 Apr 2021 23:25:46 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 2/3] linux-ti-staging: Update 5.10 kernel to the latest commit SHA
Date: Tue, 27 Apr 2021 23:25:35 -0500
Message-ID: <20210428042536.6478-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428042536.6478-1-praneeth@ti.com>
References: <20210428042536.6478-1-praneeth@ti.com>
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
index e97aca3b..d4104b6d 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "79bfe5400b3fe9350cca6a009d8fdafcfc59879f"
+SRCREV = "00634c794573abb7fcbbf44437b2969214edfc7a"
 PV = "5.10.21+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 698ec871..b4de40de 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "b53d877300ae60870b85823c6bfabb3aa643933b"
+SRCREV = "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
 PV = "5.10.21+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

