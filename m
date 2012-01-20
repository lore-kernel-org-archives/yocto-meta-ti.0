Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 885A8E00B0A
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 06:10:06 -0800 (PST)
Received: (qmail invoked by alias); 20 Jan 2012 14:10:03 -0000
Received: from p5B0A175F.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.95]
	by mail.gmx.net (mp032) with SMTP; 20 Jan 2012 15:10:03 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/I1oEVFrnIQq4p6CIunwCsVMBLHGq416mhpCDe42
	v8aWytj+2VmebO
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Jan 2012 15:11:31 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1327063792-2685-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1327063792-2685-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201201201511.31737.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] u-boot 2011.12: fix L2 cache on non-omap4 platforms
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
X-List-Received-Date: Fri, 20 Jan 2012 14:10:07 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday, January 20, 2012 01:49:52 PM Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...7-disable-L2-cache-in-cleanup_before_linu.patch |   25
> ++++++++++++++++++++ recipes-bsp/u-boot/u-boot_2011.12.bb               | 
>   7 ++++-
>  2 files changed, 31 insertions(+), 1 deletions(-)
>  create mode 100644
> recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-cl
> eanup_before_linu.patch
> 
> diff --git
> a/recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-
> cleanup_before_linu.patch
> b/recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-
> cleanup_before_linu.patch new file mode 100644
> index 0000000..ea94709
> --- /dev/null
> +++
> b/recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-
> cleanup_before_linu.patch @@ -0,0 +1,25 @@
> +From 9ac047a112d8c6fe25e71a78946dbe9d707abd98 Mon Sep 17 00:00:00 2001
> +From: Philip Balister <philip@opensdr.com>
> +Date: Mon, 16 Jan 2012 09:45:11 -0500
> +Subject: [PATCH] Revert "armv7: disable L2 cache in
> cleanup_before_linux()" +
> +This reverts commit dc7100f4080952798413fb63bb4134b22c57623a.
> +---
> + arch/arm/cpu/armv7/cpu.c |    1 -
> + 1 files changed, 0 insertions(+), 1 deletions(-)
> +
> +diff --git a/arch/arm/cpu/armv7/cpu.c b/arch/arm/cpu/armv7/cpu.c
> +index 662c496..091e3e0 100644
> +--- a/arch/arm/cpu/armv7/cpu.c
> ++++ b/arch/arm/cpu/armv7/cpu.c
> +@@ -65,7 +65,6 @@ int cleanup_before_linux(void)
> + 	 * dcache_disable() in turn flushes the d-cache and disables MMU
> + 	 */
> + 	dcache_disable();
> +-	v7_outer_cache_disable();
How about some #ifdef OMAP3 ( or similar - did not check in detail ) here. As 
far as I understood there was a reason for OMAP4 to disable cache.

Andreas

