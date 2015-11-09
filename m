Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F387EE00803; Mon,  9 Nov 2015 09:09:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BD6AE007C9
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 09:09:25 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA9H9Oid012594
	for <meta-ti@yoctoproject.org>; Mon, 9 Nov 2015 11:09:25 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA9H9OnN007735
	for <meta-ti@yoctoproject.org>; Mon, 9 Nov 2015 11:09:24 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Nov 2015 11:09:24 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA9H9OuI031598;	Mon, 9 Nov 2015 11:09:24 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 9 Nov 2015 12:09:22 -0500
Message-ID: <1447088962-9815-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] linux: cmem: k2hk-evm: Reduce reserved memory
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
X-List-Received-Date: Mon, 09 Nov 2015 17:09:28 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/files/k2hk-evm/cmem.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi b/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
index 7e897ab..98e9e7c 100644
--- a/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
+++ b/recipes-kernel/linux/files/k2hk-evm/cmem.dtsi
@@ -7,7 +7,7 @@
                 };
 
                 cmem_block_mem_0: cmem_block_mem@829000000 {
-                        reg = <0x00000008 0x29000000 0x00000000 0x57000000>;
+                        reg = <0x00000008 0x29000000 0x00000000 0x17000000>;
                         no-map;
                         status = "okay";
                 };
@@ -37,7 +37,7 @@
                 cmem_block_0: cmem_block@0 {
                         reg = <0>;
                         memory-region = <&cmem_block_mem_0>;
-                        cmem-buf-pools = <1 0x00000000 0x57000000>;
+                        cmem-buf-pools = <1 0x00000000 0x17000000>;
                 };
 
                 cmem_block_1: cmem_block@1 {
-- 
1.9.1


