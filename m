Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E655CE00803; Mon,  9 Nov 2015 09:19:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC4AEE007C9
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 09:19:37 -0800 (PST)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXK0038S5FRBM60@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 09 Nov 2015 11:19:04 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=MHww2-gYTvL2n0Cw6EYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6FF36161CEC;	Mon,
	9 Nov 2015 12:19:03 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 09 Nov 2015 12:19:03 -0500
Message-id: <1447089543-21239-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] multi-kernel: don't fail removing symlinks when config or commit changes
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
X-List-Received-Date: Mon, 09 Nov 2015 17:19:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/multi-kernel.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 64701ed..0b7de91 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -84,8 +84,8 @@ do_compileconfigs () {
             do_install
 
             # Remove unused symlinks specific to configname
-            rm "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/build"
-            rm "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/source"
+            rm -f "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/build"
+            rm -f "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/source"
             # In case no modules were installed, remove empty dirs
             rmdir --ignore-fail-on-non-empty "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/kernel"
             rmdir --ignore-fail-on-non-empty "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)"
-- 
2.2.0


