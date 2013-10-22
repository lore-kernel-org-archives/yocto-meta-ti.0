Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEA02E01743
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 13:20:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9MKK5gt000426
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 15:20:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9MKK5JU019617
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 15:20:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 22 Oct 2013 15:20:05 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9MKK2KY017105;
	Tue, 22 Oct 2013 15:20:03 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 22 Oct 2013 16:12:02 -0500
Message-ID: <1382476322-15188-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] dra7xx-evm: remove u-boot preferred provider
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
X-List-Received-Date: Tue, 22 Oct 2013 20:20:11 -0000
Content-Type: text/plain

* Now the DRA7xx support is fully merged into upstream u-boot
  then we can remove setting the PREFERRED_PROVIDER for
  u-boot and virtual/bootloader to u-boot-dra7xx and instead
  pick up the default setting from the omap-a15.inc file.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/dra7xx-evm.conf |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 5897a5f..14253cf 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -8,9 +8,6 @@ IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-dra7xx"
-PREFERRED_PROVIDER_u-boot = "u-boot-dra7xx"
-
 UBOOT_MACHINE = "dra7xx_evm_config"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
-- 
1.7.0.4


