Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F300E00655; Mon, 18 Aug 2014 12:46:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31AA3E004F5
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 12:46:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7IJkHns031492;
	Mon, 18 Aug 2014 14:46:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7IJkHhT012379;
	Mon, 18 Aug 2014 14:46:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 18 Aug 2014 14:46:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7IJkGi6032118;
	Mon, 18 Aug 2014 14:46:16 -0500
Date: Mon, 18 Aug 2014 15:46:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20140818194615.GJ23523@edge>
References: <1408388920-21650-1-git-send-email-denis@denix.org>
	<53F255B4.5010600@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <53F255B4.5010600@pabigot.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] am33x-cm3: pass float ABI flag to fix gcc-4.9.1 issue with stubs
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
X-List-Received-Date: Mon, 18 Aug 2014 19:46:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 18, 2014 at 02:36:20PM -0500, Peter A. Bigot wrote:
> On 08/18/2014 02:08 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Since we are re-using the Linux cross-compiler to compile Cortex-M3 firmware
> >code and not a dedicated bare-metal compiler, we have to match the float ABI
> >for the compiler to find the correct gnu/stubs.h files. In other words, if we
> >built a hardfp compiler, it doesn't have the corresponding gnu/stubs-soft.h
> >header and fails when building anything non-hardfp. Even though float ABI
> >flag doesn't make any sense for Cortex-M3 build. The error looks like this:
> 
> Just as a heads-up:  A recent patch to OE core might affect this
> re-use of the cross-compiler.
> 
> See: http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg55590.html
> 
> If you're using the cross-compiler to build applications for a less
> capable architecture than the target you might need to provide an
> explicit -mcpu=cortex-m3 parameter as it won't default to armv5t
> anymore.
> 
> There's some background on why this change was made at: 
> http://www.mail-archive.com/openembedded-core%40lists.openembedded.org/msg55489.html

Indeed, -mcpu=cortex-m3 is already specified in the Makefile, otherwise the 
firmware won't work at all, as our defaults are set to -mcpu=cortex-a8, 
cortex-a9 and cortex-a15 based on the paltform.

And thanks for the heads-up! It looks like a slightly different issue, but 
seems to stem from the same core changes in gcc-4.9.1...

-- 
Denys


> >
> >|      CC       src/sys_exec/trace.o
> >|      CC       src/sys_exec/sys_init.o
> >| In file included from /OE/sysroots/am335x-evm/usr/include/features.h:402:0,
> >|                  from /OE/sysroots/am335x-evm/usr/include/stdint.h:25,
> >|                  from /OE/sysroots/x86_64-linux/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/include/stdint.h:9,
> >|                  from src/sys_exec/rsc_table.h:13,
> >|                  from src/sys_exec/sys_init.c:19:
> >| /OE/sysroots/am335x-evm/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or directory
> >|  # include <gnu/stubs-soft.h>
> >|                              ^
> >| compilation terminated.
> >| Makefile:51: recipe for target 'src/sys_exec/sys_init.o' failed
> >| make: *** [src/sys_exec/sys_init.o] Error 1
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  recipes-bsp/am33x-cm3/am33x-cm3_git.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> >index 51ec9bd..7731992 100644
> >--- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> >+++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> >@@ -14,8 +14,10 @@ SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=
> >  S = "${WORKDIR}/git"
> >+FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
> >+
> >  do_compile() {
> >-	make CROSS_COMPILE="${TARGET_PREFIX}"
> >+	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}"
> >  }
> >  do_install() {
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

