Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A692C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 09:42:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.29169.1701164529152000863
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Nov 2023 01:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j8/ZQ2pN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AS9g88S073459
	for <meta-ti@lists.yoctoproject.org>; Tue, 28 Nov 2023 03:42:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701164528;
	bh=9A9wmBlnPnTxV/ECOJcnhWNrInJLtFKMASyk2e5Kdjg=;
	h=From:To:CC:Subject:Date;
	b=j8/ZQ2pN0kX81EQEP97sCyY4ws7IubYzZYdfoy6gQg23RGXJRDi2OPLMcM/4Hh4VF
	 p/YYO36EJKycSzchrt3EQXeIromX+C6/i54M7b1MS0Sq4eb60qXMTz/oZuzakAgpB3
	 qN7lTE6Ff8X6qS30jqE0EIVD4gWna657zfoF8Gi0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AS9g8Tb028131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 28 Nov 2023 03:42:08 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Nov 2023 03:42:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Nov 2023 03:42:08 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AS9g6vU099620;
	Tue, 28 Nov 2023 03:42:07 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] Update SRCREV for ti-jailhouse
Date: Tue, 28 Nov 2023 15:11:56 +0530
Message-ID: <20231128094156.2282828-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Nov 2023 09:42:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17337

Update SRCREV for ti-jailhouse. All the patches which was being applied via yocto
have been moved to ti-jailhouse repo now. So remove the patches from SRC_URI and
files.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 ...k3-am625-sk-Add-crypto-memory-region.patch | 52 --------------
 ...001-configs-k3-use-intx-for-bar_mask.patch | 72 -------------------
 ...-am625-sk-Switch-inmate-boot-console.patch | 62 ----------------
 ...64-k3-am625-sk-Add-VTM-memory-region.patch | 53 --------------
 ...4-k3-am625-sk-Add-GPMC-memory-region.patch | 51 -------------
 .../recipes-ti/jailhouse/jailhouse_git.bb     |  7 +-
 6 files changed, 1 insertion(+), 296 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch
 delete mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-k3-use-intx-for-bar_mask.patch
 delete mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch
 delete mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch
 delete mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch

diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch
deleted file mode 100644
index bfb57ae3..00000000
--- a/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 723ca87d25c1f8bac68d2608dbc3b5e8caba69ca Mon Sep 17 00:00:00 2001
-From: Andreas Dannenberg <dannenberg@ti.com>
-Date: Mon, 12 Sep 2022 13:22:04 -0500
-Subject: [PATCH] configs: arm64: k3-am625-sk: Add crypto memory region
-
-Add the memory region for the AM62x crypto accelerator to the device-
-specific config file. This fixes a runtime exception when the kernel
-accesses that memory region:
-
-<snip>
-Unhandled data read at 0x40910010(4)
-
-FATAL: unhandled trap (exception class 0x24)
-<snip>
-
-Upstream-Status: Submitted [jailhouse-dev@googlegroups.com]
-
-Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
-Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
----
- configs/arm64/k3-am625-sk.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
-index 2e5c3aef..4b0b8043 100644
---- a/configs/arm64/k3-am625-sk.c
-+++ b/configs/arm64/k3-am625-sk.c
-@@ -18,7 +18,7 @@
- struct {
-	struct jailhouse_system header;
-	__u64 cpus[1];
--	struct jailhouse_memory mem_regions[31];
-+	struct jailhouse_memory mem_regions[32];
-	struct jailhouse_irqchip irqchips[5];
-	struct jailhouse_pci_device pci_devices[2];
- } __attribute__((packed)) config = {
-@@ -231,6 +231,13 @@ struct {
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-+		/* CRYPTO */ {
-+			.phys_start = 0x40900000,
-+			.virt_start = 0x40900000,
-+			.size = 0x0030000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO,
-+		},
-		/* First Wake Up Domain */ {
-			.phys_start = 0x2b000000,
-			.virt_start = 0x2b000000,
---
-2.34.1
diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-k3-use-intx-for-bar_mask.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-k3-use-intx-for-bar_mask.patch
deleted file mode 100644
index c29baed5..00000000
--- a/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-k3-use-intx-for-bar_mask.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 84ea5e9f65fc8082d520267258784cae32c8b499 Mon Sep 17 00:00:00 2001
-From: Ricardo Salveti <ricardo@foundries.io>
-Date: Wed, 1 Mar 2023 22:14:35 -0300
-Subject: [PATCH] configs/k3: use intx for bar_mask
-
-Fixes pci probe failure:
-
-[   46.795840] pci 0001:00:00.0: BAR 0: no space for [mem size 0x00010000]
-[   46.802516] pci 0001:00:00.0: BAR 0: failed to assign [mem size 0x00010000]
-[   46.809512] pci 0001:00:01.0: BAR 0: no space for [mem size 0x00010000]
-[   46.816158] pci 0001:00:01.0: BAR 0: failed to assign [mem size 0x00010000]
-
-Upstream-Status: Pending
-
-Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
-
-This patch was imported from foundriesio/meta-lmp
-(https://github.com/foundriesio/meta-lmp) as of commit id
-70d419bfd54a99d3591e5a22622fc67f7de82b94.
-
-Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
----
- configs/arm64/k3-am625-sk-linux-demo.c | 4 ++--
- configs/arm64/k3-am625-sk.c            | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configs/arm64/k3-am625-sk-linux-demo.c b/configs/arm64/k3-am625-sk-linux-demo.c
-index 6dac8859..dcc5f026 100644
---- a/configs/arm64/k3-am625-sk-linux-demo.c
-+++ b/configs/arm64/k3-am625-sk-linux-demo.c
-@@ -197,7 +197,7 @@ struct {
-		/* 00:00.0 */ {
-			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0 << 3,
--			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
-+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
-			.shmem_dev_id = 2,
-			.shmem_peers = 3,
-@@ -206,7 +206,7 @@ struct {
-		/* 00:01.0 */ {
-			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 1 << 3,
--			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
-+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 5,
-			.shmem_dev_id = 1,
-			.shmem_peers = 2,
-diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
-index 69ab12a4..dcea42e0 100644
---- a/configs/arm64/k3-am625-sk.c
-+++ b/configs/arm64/k3-am625-sk.c
-@@ -325,7 +325,7 @@ struct {
-			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
-			.bdf = 0 << 3,
--			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
-+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
-			.shmem_dev_id = 0,
-			.shmem_peers = 3,
-@@ -335,7 +335,7 @@ struct {
-			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
-			.bdf = 1 << 3,
--			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
-+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 5,
-			.shmem_dev_id = 0,
-			.shmem_peers = 2,
---
-2.34.1
diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch
deleted file mode 100644
index 3634c415..00000000
--- a/meta-ti-extras/recipes-ti/jailhouse/files/0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From dbc02104bb469f68034b84f293583df413b8ca56 Mon Sep 17 00:00:00 2001
-From: Andreas Dannenberg <dannenberg@ti.com>
-Date: Mon, 12 Sep 2022 16:08:12 -0500
-Subject: [PATCH] configs: arm64: k3-am625-sk: Switch inmate boot console alias
- to serial3
-
-Traditionally the serial3 DTS alias is used for the 2nd main-domain UART
-on K3 devices so go ahead and update the alias and its usage accordingly
-for better consistency.
-
-While at it also do a minor cleanup of the UART's DTS node to use the
-TISCI standard definitions as used in the corresponding Kernel DTS files.
-
-Upstream-Status: Submitted [jailhouse-dev@googlegroups.com]
-
-Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
-Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
----
- configs/arm64/dts/inmate-k3-am625-sk.dts | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/configs/arm64/dts/inmate-k3-am625-sk.dts b/configs/arm64/dts/inmate-k3-am625-sk.dts
-index c1455073..8e1bebb8 100644
---- a/configs/arm64/dts/inmate-k3-am625-sk.dts
-+++ b/configs/arm64/dts/inmate-k3-am625-sk.dts
-@@ -1,6 +1,7 @@
- /dts-v1/;
-
- #include <dt-bindings/interrupt-controller/arm-gic.h>
-+#include <dt-bindings/soc/ti,sci_pm_domain.h>
-
- / {
-	model = "Texas Instruments AM625 Inmate Model";
-@@ -10,11 +11,11 @@
-	#size-cells = <2>;
-
-	aliases {
--		serial1 = &main_uart1;
-+		serial3 = &main_uart1;
-	};
-
-	chosen {
--		stdout-path = "serial1:115200n8";
-+		stdout-path = "serial3:115200n8";
-	};
-
-	memory@e0000000 {
-@@ -91,9 +92,9 @@
-			compatible = "ti,am64-uart", "ti,am654-uart";
-			reg = <0x00 0x02810000 0x00 0x100>;
-			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
--			power-domains = <&k3_pds 152 1>;
--			current-speed = <115200>;
--			clock-frequency = <48000000>;
-+			power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
-+			clocks = <&k3_clks 152 0>;
-+			clock-names = "fclk";
-		};
-
-		pci@76000000 {
---
-2.34.1
diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch
deleted file mode 100644
index c2b68e8d..00000000
--- a/meta-ti-extras/recipes-ti/jailhouse/files/0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 9c9bba78b5635531fc8946914233af8c8ac8a6f3 Mon Sep 17 00:00:00 2001
-From: Andreas Dannenberg <dannenberg@ti.com>
-Date: Fri, 4 Nov 2022 12:58:48 -0500
-Subject: [PATCH] configs: arm64: k3-am625-sk: Add VTM memory region
-
-Add the memory region for VTM to the device-specific config
-file. This fixes a runtime exception when the kernel accesses
-that memory region:
-
-<snip>
-Unhandled data read at 0xb00308(4)
-
-FATAL: unhandled trap (exception class 0x24)
-<snip>
-
-Upstream-Status: Submitted [jailhouse-dev@googlegroups.com]
-
-written by: Ricardo Salveti <ricardo@foundries.io>
-Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
-Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
----
- configs/arm64/k3-am625-sk.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
-index 4b0b8043..fac4eaa6 100644
---- a/configs/arm64/k3-am625-sk.c
-+++ b/configs/arm64/k3-am625-sk.c
-@@ -18,7 +18,7 @@
- struct {
-	struct jailhouse_system header;
-	__u64 cpus[1];
--	struct jailhouse_memory mem_regions[32];
-+	struct jailhouse_memory mem_regions[33];
-	struct jailhouse_irqchip irqchips[5];
-	struct jailhouse_pci_device pci_devices[2];
- } __attribute__((packed)) config = {
-@@ -154,6 +154,13 @@ struct {
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-+		/* Wake Up Domain VTM0 */ {
-+			.phys_start = 0x00b00000,
-+			.virt_start = 0x00b00000,
-+			.size = 0x00001000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO,
-+		},
-		/* First peripheral window, 1 of 2 */ {
-			.phys_start = 0x01000000,
-			.virt_start = 0x01000000,
---
-2.34.1
diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch
deleted file mode 100644
index 800470bf..00000000
--- a/meta-ti-extras/recipes-ti/jailhouse/files/0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c0e85959637a1de61170d1025e1bac8da283ddb9 Mon Sep 17 00:00:00 2001
-From: Andreas Dannenberg <dannenberg@ti.com>
-Date: Thu, 19 Jan 2023 09:43:55 -0600
-Subject: [PATCH] configs: arm64: k3-am625-sk: Add GPMC memory region
-
-Add the memory region for GPMC, used by the AM62Q NAND card.
-
-Upstream-Status: Submitted [jailhouse-dev@googlegroups.com]
-
-Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
-Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
----
- configs/arm64/k3-am625-sk.c | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
-index fac4eaa6..10b5a8f3 100644
---- a/configs/arm64/k3-am625-sk.c
-+++ b/configs/arm64/k3-am625-sk.c
-@@ -18,7 +18,7 @@
- struct {
-	struct jailhouse_system header;
-	__u64 cpus[1];
--	struct jailhouse_memory mem_regions[33];
-+	struct jailhouse_memory mem_regions[35];
-	struct jailhouse_irqchip irqchips[5];
-	struct jailhouse_pci_device pci_devices[2];
- } __attribute__((packed)) config = {
-@@ -231,6 +231,20 @@ struct {
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-+		/* GPMC */ {
-+			.phys_start = 0x3b000000,
-+			.virt_start = 0x3b000000,
-+			.size = 0x00001000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO,
-+		},
-+		/* GPMC */ {
-+			.phys_start = 0x50000000,
-+			.virt_start = 0x50000000,
-+			.size = 0x08000000,
-+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-+				JAILHOUSE_MEM_IO,
-+		},
-		/* CPSW */ {
-			.phys_start = 0x08000000,
-			.virt_start = 0x08000000,
---
-2.34.1
diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index ca829986..387b0806 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -15,16 +15,11 @@ COMPATIBLE_MACHINE = "am62xx|am62pxx"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 PV = "0.12+git${SRCPV}"
-SRCREV = "e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560"
+SRCREV = "0b29ad90f6f54105b98d6bbf35cc47fb244f7799"
 BRANCH = "master"
 
 SRC_URI = " \
     git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
-    file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch \
-    file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch \
-    file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch \
-    file://0001-configs-k3-use-intx-for-bar_mask.patch \
-    file://0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch \
 "
 
 DEPENDS = "virtual/kernel dtc-native python3-mako-native python3-mako make-native"
-- 
2.34.1


