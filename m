Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2675.1638909270021644359
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 12:34:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Zrk1a5Jt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B7KYSWH053230;
	Tue, 7 Dec 2021 14:34:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638909268;
	bh=mIwDO54SHoJXO5ltytiAliFeiYVCicFnO+bsZF+S32I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Zrk1a5JtQaa0t3xHjPQT2r3LLjoIIemZ5PWobkHpm8lPI7YchqdruOvOfQa/HbXuk
	 m1HsuRxMVfCnJ7tYYht0MP4iuUuSK8v96wD7PCcPnDwBzY43r0Y6C0u2djLK63CFbj
	 2TSW2y3YXi2f9E7qL3H/7IVh8DALnWSN2JZsEDjM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B7KYSFH058711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Dec 2021 14:34:28 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Dec 2021 14:34:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Dec 2021 14:34:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B7KYRMo111711;
	Tue, 7 Dec 2021 14:34:27 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <denys@konsulko.com>, <yogeshs@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        <praneeth@ti.com>, <aouledameur@baylibre.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell][PATCH 2/2] Revert "ti-sci-fw: k3-image-gen: Revert SPL address change for mainline"
Date: Tue, 7 Dec 2021 14:34:26 -0600
Message-ID: <20211207203426.19776-3-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211207203426.19776-1-nm@ti.com>
References: <20211207203426.19776-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This reverts commit d5db41417295fe05a293f6d4d77a65ef6563f6ed.

We should'nt have to carry patches for u-boot or kernel, since the
upstream is now fixed since 5.14 kernel and u-boot 2021.10 tag onwards,
lets revert the patch to allow upstream to work with 5.15+ kernel and
2021.10 u-boot (from the already applied commit cae609388f19
"recipes-bsp: u-boot-ti-mainline: Update to v2021.10 release").

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       | 11 ------
 ...-Makefile-Move-the-SPL-Load-address-.patch | 36 -------------------
 2 files changed, 47 deletions(-)
 delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index d224f3535826..f16076865479 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -32,15 +32,4 @@ SRC_URI = " \
 	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
-# This is a protection in case the definition is not present in other distros.
-ARAGO_BRAND ?= ""
-
-# Mainline u_boot 2021.07 and upstream kernel v5.13 tag cannot use new SPL address
-# in K3-Imagegen
-SRC_URI += "\
-	${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '\
-	file://0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch;patchdir=../imggen \
-	', '', d)} \
-"
-
 S = "${WORKDIR}/git"
diff --git a/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch b/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
deleted file mode 100644
index 63a5796d6b82..000000000000
--- a/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 83d29d5e346083254e71fbe483cb14f6657b9965 Mon Sep 17 00:00:00 2001
-From: Nishanth Menon <nm@ti.com>
-Date: Tue, 29 Jun 2021 12:03:29 -0500
-Subject: [PATCH] Revert "soc: am64x: Makefile: Move the SPL Load address to
- 0x70000000"
-
-This reverts commit e411dc16862b5bb2d8befb12496b03d7b01c87b2.
-
-Mainline is NOT ready for the change yet as of u-boot 2021.07 + v5.13,
-So, this patch reverts the SPL address change.
-
-This patch needs to be dropped once mainline u-boot and kernel have
-migrated over to newer releases.
-
-Upstream-Status: Not applicable
-Signed-off-by: Nishanth Menon <nm@ti.com>
----
- soc/am64x/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
-index 45425428f9c6..e8747376f153 100644
---- a/soc/am64x/Makefile
-+++ b/soc/am64x/Makefile
-@@ -30,7 +30,7 @@
- #  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #
- 
--SBL_LOADADDDR ?= 0x70000000
-+SBL_LOADADDDR ?= 0x70020000
- COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x70000
- LOADADDR  ?= 0x44000
- SCIFS = sci
--- 
-2.32.0
-
-- 
2.31.1

