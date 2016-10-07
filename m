Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16D9FE00C28; Fri,  7 Oct 2016 10:46:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCE26E00C15
	for <meta-ti@yoctoproject.org>; Fri,  7 Oct 2016 10:46:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u97Hkrvn025282
	for <meta-ti@yoctoproject.org>; Fri, 7 Oct 2016 12:46:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u97HkrrD019072
	for <meta-ti@yoctoproject.org>; Fri, 7 Oct 2016 12:46:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Oct 2016 12:46:52 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u97Hkq89022691;	Fri, 7 Oct 2016 12:46:52 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 7 Oct 2016 13:44:24 -0400
Message-ID: <1475862264-11623-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] linux: cmem: k2e, k2l-evm: update reserved memory
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2016 17:46:57 -0000
Content-Type: text/plain

* The MSMC region needs to be relocated as it was conflicting with the
  boot monitor's persistent memory.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/files/k2e/cmem.dtsi     | 4 ++--
 recipes-kernel/linux/files/k2l-evm/cmem.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/files/k2e/cmem.dtsi b/recipes-kernel/linux/files/k2e/cmem.dtsi
index 236b0ba..4c8e785 100644
--- a/recipes-kernel/linux/files/k2e/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2e/cmem.dtsi
@@ -12,8 +12,8 @@
 			status = "okay";
 		};
 
-		cmem_block_mem_1: cmem_block_mem@00c100000 {
-			reg = <0x00000000 0x0c000000 0x00000000 0x00180000>;
+		cmem_block_mem_1: cmem_block_mem@00c080000 {
+			reg = <0x00000000 0x0c080000 0x00000000 0x000c0000>;
 			no-map;
 			status = "okay";
 		};
diff --git a/recipes-kernel/linux/files/k2l-evm/cmem.dtsi b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
index 236b0ba..4c8e785 100644
--- a/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2l-evm/cmem.dtsi
@@ -12,8 +12,8 @@
 			status = "okay";
 		};
 
-		cmem_block_mem_1: cmem_block_mem@00c100000 {
-			reg = <0x00000000 0x0c000000 0x00000000 0x00180000>;
+		cmem_block_mem_1: cmem_block_mem@00c080000 {
+			reg = <0x00000000 0x0c080000 0x00000000 0x000c0000>;
 			no-map;
 			status = "okay";
 		};
-- 
2.7.4


