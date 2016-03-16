Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA416E0086B; Wed, 16 Mar 2016 12:33:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56B71E007D2
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 12:33:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2GJXOPa024236
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 14:33:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GJXO7x018739
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 14:33:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Mar 2016 14:33:23 -0500
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2GJXN7Y031723;	Wed, 16 Mar 2016 14:33:24 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 16 Mar 2016 15:33:22 -0400
Message-ID: <1458156802-27817-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] uio: Fix issues with driver reference in uio related dts entries
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
X-List-Received-Date: Wed, 16 Mar 2016 19:33:26 -0000
Content-Type: text/plain

Correct incorrect driver compatibility key. uio driver implemented with
uio-module-drv for keystone2.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
- Updated tile and comment on commit
---
---
 recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi | 4 ++--
 recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi b/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
index 36f41b0..052ae97 100644
--- a/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
+++ b/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
@@ -1,7 +1,7 @@
 / {
 	soc {
 		uio_hyperlink0: hyperlink0 {
-			compatible = "ti,uio-ti-pdrv";
+			compatible = "ti,uio-module-drv";
 			mem  = <0x21400000 0x00001000
 				0x40000000 0x10000000
 				0x0231a000 0x00002000>;
@@ -23,7 +23,7 @@
 			};
 		};
 		uio_srss: srss {
-			compatible = "ti,uio-ti-pdrv";
+			compatible = "ti,uio-module-drv";
 			mem  = <0x02330000 0x0000400>;
 			clocks=<&clksr>;
 			interrupts = <0 0x173 0xf01>;
diff --git a/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi b/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
index 0334483..a1b2e07 100644
--- a/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
+++ b/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
@@ -1,7 +1,7 @@
 / {
 	soc {
 		uio_srss: srss {
-			compatible = "ti,uio-ti-pdrv";
+			compatible = "ti,uio-module-drv";
 			mem  = <0x02330000 0x0000400>;
 			clocks=<&clksr>;
 			interrupts = <0 0x173 0xf01>;
-- 
1.9.1


