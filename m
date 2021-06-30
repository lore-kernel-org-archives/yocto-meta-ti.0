Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.498.1625075679773299981
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 10:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HtoZR5Lc;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15UHsbIc077011;
	Wed, 30 Jun 2021 12:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625075677;
	bh=W3GS/r5gPvexaDL8bxEsg/g7NJelmyZeRkJEGbDOUyw=;
	h=From:To:CC:Subject:Date;
	b=HtoZR5LcBPlUXgAOT62YZkWwWCHJQPLdmK/CKZ74n30AwwIf3BXQTfguc5PcUNFRO
	 oq/ESeZTa9Pr5XUt6uvc0luA6+uwi1Avb7GpxtoMLScxKAinO2fv+iWf+yOok0QTU3
	 TTR7WUU5dku1nqSW6ne0B0klAVDgPZ797CtCQmHE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15UHsbZ8122832
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Jun 2021 12:54:37 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 30
 Jun 2021 12:54:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 30 Jun 2021 12:54:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15UHsbsF045541;
	Wed, 30 Jun 2021 12:54:37 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denys@konsulko.com>
CC: Tom Rini <trini@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Nishanth
 Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2] ti-sci-fw: k3-image-gen: Revert SPL address change for mainline
Date: Wed, 30 Jun 2021 12:54:36 -0500
Message-ID: <20210630175436.11343-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit 02a2433c ("ti-sci-fw: Update image gen to latest") switched to a
newer commit in k3-image-gen that also picked up TISCI firmware release,
However, does include a change where the SPL address changed.

This switch in address has been queued for upstream in a future release
(v5.14 + u-boot 2021.10) and current mainline formal tags do not support
this address change. As a result, we have a broken AM64x mainline
support.

Revert this specific change from k3-image-gen for mainline alone for
now.

NOTE: This uses ARAGO_BRAND=mainline which is NOT accurate for meta-ti
which is distro independent, hence without appropriate changes while
using alternate distros, this change will not take effect.

Reported-by: Tom Rini <trini@konsulko.com>
Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
* Added empty ARAGO_BRAND in case someone is using non-arago based
  builds.

V1: https://lists.yoctoproject.org/g/meta-ti/topic/dunfell_master_patch/83878039?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83878039

 ...-Makefile-Move-the-SPL-Load-address-.patch | 36 +++++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc           | 11 ++++++
 2 files changed, 47 insertions(+)
 create mode 100644 recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch

diff --git a/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch b/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
new file mode 100644
index 000000000000..63a5796d6b82
--- /dev/null
+++ b/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
@@ -0,0 +1,36 @@
+From 83d29d5e346083254e71fbe483cb14f6657b9965 Mon Sep 17 00:00:00 2001
+From: Nishanth Menon <nm@ti.com>
+Date: Tue, 29 Jun 2021 12:03:29 -0500
+Subject: [PATCH] Revert "soc: am64x: Makefile: Move the SPL Load address to
+ 0x70000000"
+
+This reverts commit e411dc16862b5bb2d8befb12496b03d7b01c87b2.
+
+Mainline is NOT ready for the change yet as of u-boot 2021.07 + v5.13,
+So, this patch reverts the SPL address change.
+
+This patch needs to be dropped once mainline u-boot and kernel have
+migrated over to newer releases.
+
+Upstream-Status: Not applicable
+Signed-off-by: Nishanth Menon <nm@ti.com>
+---
+ soc/am64x/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
+index 45425428f9c6..e8747376f153 100644
+--- a/soc/am64x/Makefile
++++ b/soc/am64x/Makefile
+@@ -30,7 +30,7 @@
+ #  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #
+ 
+-SBL_LOADADDDR ?= 0x70000000
++SBL_LOADADDDR ?= 0x70020000
+ COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x70000
+ LOADADDR  ?= 0x44000
+ SCIFS = sci
+-- 
+2.32.0
+
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 4004d93f47c9..9e22e461354d 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -15,4 +15,15 @@ SRC_URI = " \
 	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
+# This is a protection in case the definition is not present in other distros.
+ARAGO_BRAND ?= ""
+
+# Mainline u_boot 2021.07 and upstream kernel v5.13 tag cannot use new SPL address
+# in K3-Imagegen
+SRC_URI += "\
+	${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '\
+	file://0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch;patchdir=../imggen \
+	', '', d)} \
+"
+
 S = "${WORKDIR}/git"
-- 
2.32.0

