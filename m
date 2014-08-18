Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AAA6CE00563; Mon, 18 Aug 2014 12:37:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.192.238 listed in list.dnswl.org]
X-Greylist: delayed 91 seconds by postgrey-1.32 at yocto-www;
	Mon, 18 Aug 2014 12:37:57 PDT
Received: from p3plsmtpa07-09.prod.phx3.secureserver.net
	(p3plsmtpa07-09.prod.phx3.secureserver.net [173.201.192.238])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 403DCE004F5
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 12:37:57 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-09.prod.phx3.secureserver.net with 
	id gKcM1o00A1mTNtu01KcMsv; Mon, 18 Aug 2014 12:36:25 -0700
Message-ID: <53F255B4.5010600@pabigot.com>
Date: Mon, 18 Aug 2014 14:36:20 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1408388920-21650-1-git-send-email-denis@denix.org>
In-Reply-To: <1408388920-21650-1-git-send-email-denis@denix.org>
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
X-List-Received-Date: Mon, 18 Aug 2014 19:37:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2014 02:08 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Since we are re-using the Linux cross-compiler to compile Cortex-M3 firmware
> code and not a dedicated bare-metal compiler, we have to match the float ABI
> for the compiler to find the correct gnu/stubs.h files. In other words, if we
> built a hardfp compiler, it doesn't have the corresponding gnu/stubs-soft.h
> header and fails when building anything non-hardfp. Even though float ABI
> flag doesn't make any sense for Cortex-M3 build. The error looks like this:

Just as a heads-up:  A recent patch to OE core might affect this re-use 
of the cross-compiler.

See: 
http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg55590.html

If you're using the cross-compiler to build applications for a less 
capable architecture than the target you might need to provide an 
explicit -mcpu=cortex-m3 parameter as it won't default to armv5t anymore.

There's some background on why this change was made at: 
http://www.mail-archive.com/openembedded-core%40lists.openembedded.org/msg55489.html

Peter

>
> |      CC       src/sys_exec/trace.o
> |      CC       src/sys_exec/sys_init.o
> | In file included from /OE/sysroots/am335x-evm/usr/include/features.h:402:0,
> |                  from /OE/sysroots/am335x-evm/usr/include/stdint.h:25,
> |                  from /OE/sysroots/x86_64-linux/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/include/stdint.h:9,
> |                  from src/sys_exec/rsc_table.h:13,
> |                  from src/sys_exec/sys_init.c:19:
> | /OE/sysroots/am335x-evm/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or directory
> |  # include <gnu/stubs-soft.h>
> |                              ^
> | compilation terminated.
> | Makefile:51: recipe for target 'src/sys_exec/sys_init.o' failed
> | make: *** [src/sys_exec/sys_init.o] Error 1
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   recipes-bsp/am33x-cm3/am33x-cm3_git.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> index 51ec9bd..7731992 100644
> --- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> +++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> @@ -14,8 +14,10 @@ SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=
>   
>   S = "${WORKDIR}/git"
>   
> +FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
> +
>   do_compile() {
> -	make CROSS_COMPILE="${TARGET_PREFIX}"
> +	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}"
>   }
>   
>   do_install() {


