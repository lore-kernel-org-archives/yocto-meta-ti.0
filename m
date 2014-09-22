Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B722E005BD; Mon, 22 Sep 2014 09:49:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6553BE0034C
	for <meta-ti@yoctoproject.org>; Mon, 22 Sep 2014 09:49:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F12E752A57; Mon, 22 Sep 2014 16:49:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140922164930.F12E752A57@arago-project.org>
Date: Mon, 22 Sep 2014 16:49:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Khem Raj : am33x-cm3: Add TOOLCHAIN_OPTIONS to redefined CC
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
X-List-Received-Date: Mon, 22 Sep 2014 16:49:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3735bc41089cc7ba32f5550ce18c3bb0d20f3a32
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3735bc41089cc7ba32f5550ce18c3bb0d20f3a32

Author: Khem Raj <raj.khem@gmail.com>
Date:   Sun Sep 21 13:05:38 2014 +0000

am33x-cm3: Add TOOLCHAIN_OPTIONS to redefined CC

This error will show up when using sstate which was generated
using a different buiid time sysroot. Since we override CC we
still need to honor --sysroot which is specified via TOOLCHAIN_OPTIONS

Fixes

| DEBUG: Executing shell function do_compile
|      CC       src/sys_exec/sys_init.o
| In file included from src/sys_exec/rsc_table.h:13:0,
|                  from src/sys_exec/sys_init.c:19:
|
/home/ubuntu/work/angstrom/build/tmp-angstrom_next-glibc/sysroots/x86_64-linux/usr/lib/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.9.2/include/stdint.h:9:26:
fatal error: stdint.h: No such file or directory
|  # include_next <stdint.h>
|                           ^
| compilation terminated.
| make: *** [src/sys_exec/sys_init.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/am33x-cm3/am33x-cm3_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
index e5728ab..0b0a776 100644
--- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
+++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
 
 do_compile() {
-	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}"
+	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}"
 }
 
 do_install() {


