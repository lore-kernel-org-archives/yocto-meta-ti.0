Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F504E00563; Mon, 18 Aug 2014 12:09:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05B7CE004F5
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 12:09:18 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAI00A9HNUHV430@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Aug 2014 14:08:56 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 27D2120120; Mon,
	18 Aug 2014 15:08:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Aug 2014 15:08:40 -0400
Message-id: <1408388920-21650-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] am33x-cm3: pass float ABI flag to fix gcc-4.9.1 issue with stubs
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
X-List-Received-Date: Mon, 18 Aug 2014 19:09:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since we are re-using the Linux cross-compiler to compile Cortex-M3 firmware
code and not a dedicated bare-metal compiler, we have to match the float ABI
for the compiler to find the correct gnu/stubs.h files. In other words, if we
built a hardfp compiler, it doesn't have the corresponding gnu/stubs-soft.h
header and fails when building anything non-hardfp. Even though float ABI
flag doesn't make any sense for Cortex-M3 build. The error looks like this:

|      CC       src/sys_exec/trace.o
|      CC       src/sys_exec/sys_init.o
| In file included from /OE/sysroots/am335x-evm/usr/include/features.h:402:0,
|                  from /OE/sysroots/am335x-evm/usr/include/stdint.h:25,
|                  from /OE/sysroots/x86_64-linux/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/include/stdint.h:9,
|                  from src/sys_exec/rsc_table.h:13,
|                  from src/sys_exec/sys_init.c:19:
| /OE/sysroots/am335x-evm/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or directory
|  # include <gnu/stubs-soft.h>
|                              ^
| compilation terminated.
| Makefile:51: recipe for target 'src/sys_exec/sys_init.o' failed
| make: *** [src/sys_exec/sys_init.o] Error 1

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/am33x-cm3/am33x-cm3_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
index 51ec9bd..7731992 100644
--- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
+++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
@@ -14,8 +14,10 @@ SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=
 
 S = "${WORKDIR}/git"
 
+FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
+
 do_compile() {
-	make CROSS_COMPILE="${TARGET_PREFIX}"
+	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}"
 }
 
 do_install() {
-- 
2.0.4


