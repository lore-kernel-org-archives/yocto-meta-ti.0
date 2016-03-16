Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9D60E0083D; Wed, 16 Mar 2016 13:07:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7993DE0083D
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 13:07:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9BE8652A86; Wed, 16 Mar 2016 20:07:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160316200718.9BE8652A86@arago-project.org>
Date: Wed, 16 Mar 2016 20:07:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio: Fix issues with driver reference in uio related dts entries
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
X-List-Received-Date: Wed, 16 Mar 2016 20:07:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 9cba7d9c535cec73c131d5f8842e20645acb2933
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9cba7d9c535cec73c131d5f8842e20645acb2933

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Mar 17 01:33:22 2016 +0000

uio: Fix issues with driver reference in uio related dts entries

Correct incorrect driver compatibility key. uio driver implemented with
uio-module-drv for keystone2.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi |    4 ++--
 recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi |    2 +-
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


