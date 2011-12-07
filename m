Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27103E0030C
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Dec 2011 09:04:14 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LVU005QLFEDH0Q1@vms173019.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Wed, 07 Dec 2011 11:03:54 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 425B014AF5D; Wed,
	07 Dec 2011 12:03:49 -0500 (EST)
Date: Wed, 07 Dec 2011 12:03:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111207170349.GT20602@denix.org>
References: <1323248018-31873-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1323248018-31873-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux-omap 2.6.3[79]: fix SRC_URI after	kernel.org changes
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
X-List-Received-Date: Wed, 07 Dec 2011 17:04:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Dec 07, 2011 at 09:53:38AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-kernel/linux/linux-omap_2.6.37.bb |    2 +-
>  recipes-kernel/linux/linux-omap_2.6.39.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-omap_2.6.37.bb b/recipes-kernel/linux/linux-omap_2.6.37.bb
> index a79393f..aa7d2fc 100644
> --- a/recipes-kernel/linux/linux-omap_2.6.37.bb
> +++ b/recipes-kernel/linux/linux-omap_2.6.37.bb
> @@ -12,7 +12,7 @@ SRCREV = "fa3b4e23ec20cfc944db7cc2b30b0d82c20e4472"
>  
>  FILESPATHPKG_prepend = "linux-omap-2.6.37:"
>  
> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
>  	   file://defconfig"
>  
>  SRC_URI_append = " \
> diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-kernel/linux/linux-omap_2.6.39.bb
> index 3204fbe..34e24e7 100644
> --- a/recipes-kernel/linux/linux-omap_2.6.39.bb
> +++ b/recipes-kernel/linux/linux-omap_2.6.39.bb
> @@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "o"
>  
>  FILESPATHPKG_prepend = "linux-omap-2.6.39:"
>  
> -SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
> +SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
>              file://defconfig"
>  
>  SRC_URI_append = " \
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

