Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40539E00A92; Mon,  9 Nov 2015 11:34:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B9E3E00927
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 11:34:08 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C4EB152AB8; Mon,  9 Nov 2015 19:34:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151109193407.C4EB152AB8@arago-project.org>
Date: Mon,  9 Nov 2015 19:34:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux: cmem: k2hk-evm: Reduce reserved memory
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
X-List-Received-Date: Mon, 09 Nov 2015 19:34:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 6e76e3476d2117ecefc79f56ee8c557154fcd58a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6e76e3476d2117ecefc79f56ee8c557154fcd58a

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon Nov  9 23:09:22 2015 +0000

linux: cmem: k2hk-evm: Reduce reserved memory

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/files/k2hk-evm/cmem.dtsi |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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


