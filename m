Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D78BBE007A2; Mon, 18 Aug 2014 15:57:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 964C2E00655
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 15:57:44 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E696B52A5D; Mon, 18 Aug 2014 22:57:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140818225740.E696B52A5D@arago-project.org>
Date: Mon, 18 Aug 2014 22:57:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: pass float ABI flag to fix gcc-4.9. 1 issue with stubs
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
X-List-Received-Date: Mon, 18 Aug 2014 22:57:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 7b8ee4026e0e3b69a8ce5526be24ba70321e88dc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7b8ee4026e0e3b69a8ce5526be24ba70321e88dc

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug 19 01:08:40 2014 +0000

am33x-cm3: pass float ABI flag to fix gcc-4.9.1 issue with stubs

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

 recipes-bsp/am33x-cm3/am33x-cm3_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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


