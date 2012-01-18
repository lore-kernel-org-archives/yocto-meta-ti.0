Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B9DEE00307
	for <meta-ti@yoctoproject.org>; Wed, 18 Jan 2012 09:44:07 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LY0000OZ98T3J9X@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 18 Jan 2012 11:43:51 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0D4BD200A1; Wed,
	18 Jan 2012 12:43:40 -0500 (EST)
Date: Wed, 18 Jan 2012 12:43:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20120118174340.GE17838@denix.org>
References: <1326907639-31710-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1326907639-31710-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-3.0: Fix perf compile failure with eglibc 2.15
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2012 17:44:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jan 18, 2012 at 09:27:19AM -0800, Khem Raj wrote:
> There is a conflict with eglibc headers since
> new headers added the defines that compiler.h
> was redefining without undefining them
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...Undef-before-redefining-__attribute_const.patch |   28 ++++++++++++++++++++
>  ...Undef-before-redefining-__attribute_const.patch |   28 ++++++++++++++++++++
>  recipes-kernel/linux/linux-3.0/patch.sh            |    2 +-
>  recipes-kernel/linux/linux_3.0.bb                  |    4 ++-
>  4 files changed, 60 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-kernel/linux/linux-3.0/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
>  create mode 100644 recipes-kernel/linux/linux-3.0/misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch

Khem,

Do we need 2 copies of the patch - one in linux-3.0 and one in linux-3.0/misc? 
I see the first copy is not being used...

Also, does it need to be submitted upstream? Should there be an 
Upstream-Status field?

-- 
Denys


> diff --git a/recipes-kernel/linux/linux-3.0/0001-compiler.h-Undef-before-redefining-__attribute_const.patch b/recipes-kernel/linux/linux-3.0/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
> new file mode 100644
> index 0000000..92fe004
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-3.0/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
> @@ -0,0 +1,28 @@
> +From 6f92ab6de9d8daeb575949bbbcbc7bcdcebc60af Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 5 Jan 2012 11:42:35 -0800
> +Subject: [PATCH] compiler.h: Undef before redefining __attribute_const__
> +
> +This is required to avoid warnings like
> +util/include/linux/compiler.h:8:0: error: "__attribute_const__" redefined [-Werror]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + tools/perf/util/include/linux/compiler.h |    4 +++-
> + 1 files changed, 3 insertions(+), 1 deletions(-)
> +
> +--- a/tools/perf/util/include/linux/compiler.h
> ++++ b/tools/perf/util/include/linux/compiler.h
> +@@ -4,9 +4,11 @@
> + #ifndef __always_inline
> + #define __always_inline	inline
> + #endif
> ++#undef __user
> + #define __user
> ++#undef __attribute_const__
> + #define __attribute_const__
> +-
> ++#undef __used
> + #define __used		__attribute__((__unused__))
> + 
> + #endif
> diff --git a/recipes-kernel/linux/linux-3.0/misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch b/recipes-kernel/linux/linux-3.0/misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
> new file mode 100644
> index 0000000..92fe004
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-3.0/misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
> @@ -0,0 +1,28 @@
> +From 6f92ab6de9d8daeb575949bbbcbc7bcdcebc60af Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 5 Jan 2012 11:42:35 -0800
> +Subject: [PATCH] compiler.h: Undef before redefining __attribute_const__
> +
> +This is required to avoid warnings like
> +util/include/linux/compiler.h:8:0: error: "__attribute_const__" redefined [-Werror]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + tools/perf/util/include/linux/compiler.h |    4 +++-
> + 1 files changed, 3 insertions(+), 1 deletions(-)
> +
> +--- a/tools/perf/util/include/linux/compiler.h
> ++++ b/tools/perf/util/include/linux/compiler.h
> +@@ -4,9 +4,11 @@
> + #ifndef __always_inline
> + #define __always_inline	inline
> + #endif
> ++#undef __user
> + #define __user
> ++#undef __attribute_const__
> + #define __attribute_const__
> +-
> ++#undef __used
> + #define __used		__attribute__((__unused__))
> + 
> + #endif
> diff --git a/recipes-kernel/linux/linux-3.0/patch.sh b/recipes-kernel/linux/linux-3.0/patch.sh
> index 885db09..dc19a9e 100755
> --- a/recipes-kernel/linux/linux-3.0/patch.sh
> +++ b/recipes-kernel/linux/linux-3.0/patch.sh
> @@ -13,7 +13,7 @@ git reset --hard ${TAG}
>  rm export -rf
>  
>  previous=${TAG}
> -PATCHSET="pm-wip/voltdm pm-wip/cpufreq beagle madc sakoman sgx ulcd omap4"
> +PATCHSET="pm-wip/voltdm pm-wip/cpufreq beagle madc sakoman sgx ulcd omap4 misc"
>  
>  # apply patches
>  for patchset in ${PATCHSET} ; do
> diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
> index 2796304..70ca7cc 100644
> --- a/recipes-kernel/linux/linux_3.0.bb
> +++ b/recipes-kernel/linux/linux_3.0.bb
> @@ -10,7 +10,7 @@ PV = "3.0.17"
>  SRCREV_pn-${PN} = "e9d23be2708477feeaec78e707c80441520c1ef6"
>  
>  # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  
>  FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
>  
> @@ -221,6 +221,8 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
>              \
>              file://omap4/0001-OMAP-Fix-linking-error-in-twl-common.c-for-OMAP2-3-4.patch \
>              \
> +            file://misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch \
> +            \
>              file://defconfig"
>  
>  SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
> -- 
> 1.7.8.3
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

