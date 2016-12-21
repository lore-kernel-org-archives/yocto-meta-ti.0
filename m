Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FC18E00E43; Tue, 20 Dec 2016 17:13:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5CC5E00E35
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 17:13:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 00F2020A39;
	Wed, 21 Dec 2016 01:13:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BNj_d-AunCZZ; Wed, 21 Dec 2016 01:13:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D546F208B1;
	Wed, 21 Dec 2016 01:13:46 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id CEE7E1621D8;
	Tue, 20 Dec 2016 20:13:45 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 20 Dec 2016 20:13:45 -0500
Message-Id: <1482282825-2304-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cmem.inc: only mangle SRC_URI in do_unpack instead of anon function
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
X-List-Received-Date: Wed, 21 Dec 2016 01:13:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Avoid taskhash mismatch errors.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/cmem.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 4541185..a61b899 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -27,7 +27,7 @@ CMEM_DEVICETREE_dra74x = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb
 RESERVE_CMEM ?= "0"
 
 # Add correct cmem.dtsi to SRC_URI for each variant for a given machine
-python() {
+python do_unpack() {
     old_overrides = d.getVar('OVERRIDES', False)
 
     # Initialize with empty string to simplify logic to append to SRC_URI
@@ -42,6 +42,7 @@ python() {
         cmem_dtsi.add(localdata.getVar('CMEM_DTSI', True))
 
     d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
+    bb.build.exec_func('base_do_unpack', d)
 }
 
 python do_setup_cmem() {
-- 
2.7.4


