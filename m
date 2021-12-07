Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2680.1638909273146145887
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 12:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UNaJDuiR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B7KYRER042829;
	Tue, 7 Dec 2021 14:34:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638909267;
	bh=Sjzm3DKLcRa8UZk8fX5QJUgQeDqTHS4gOC4AT9njGu8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UNaJDuiRekK8zAsYDzkMuuWGgp43QP/mOB9qbdvC67cn7lR9426G+VGFljRlOTPOa
	 qYAaxogBBMOXxPUsDmc9jSYfw01BcTFDXUseRg0E/Ux4S5mmE7PeqkrG3bHCUOr84e
	 XwywjHMhAH2Uurc4vgUiSVxoxn1fhWbYBmSoCUI4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B7KYRRb106856
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Dec 2021 14:34:27 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Dec 2021 14:34:27 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Dec 2021 14:34:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B7KYRHw116769;
	Tue, 7 Dec 2021 14:34:27 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <denys@konsulko.com>, <yogeshs@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        <praneeth@ti.com>, <aouledameur@baylibre.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell][PATCH 1/2] linux-ti-mainline: Bump kernel version to v5.15
Date: Tue, 7 Dec 2021 14:34:25 -0600
Message-ID: <20211207203426.19776-2-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211207203426.19776-1-nm@ti.com>
References: <20211207203426.19776-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Eatmon <reatmon@ti.com>

This adds up numerous fixes for various k3 platforms.

While at it, bump the ti-upstream-tools repo as this sync up gives us:
config: audio_display: Update cdns-mhdp configs

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index 5d043da7fee1..7491dae08218 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
 BRANCH = "master"
 TOOLS_BRANCH = "master"
 
-# 5.13 Mainline version
-SRCREV = "62fb9874f5da54fdb243003b386128037319b219"
-PV = "5.13+git${SRCPV}"
+# 5.15 Mainline version
+SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
+PV = "5.15+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "b"
@@ -36,7 +36,7 @@ SRC_URI += " \
     file://defconfig \
 "
 
-SRCREV_ti-upstream-tools = "c9b8150cb00a5beb7b7f3e42d0d817aa9392fabd"
+SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
 SRCREV_FORMAT = "linux"
 
 KERNEL_DEVICETREE = ""
-- 
2.31.1

