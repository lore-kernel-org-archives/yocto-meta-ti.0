Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7D96E01421
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 19:13:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4700FKA4TTX102@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 17 May 2012 21:13:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B94752009F; Thu,
	17 May 2012 22:13:04 -0400 (EDT)
Date: Thu, 17 May 2012 22:13:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20120518021304.GO6829@denix.org>
References: <1337306511-1065-1-git-send-email-otavio@ossystems.com.br>
MIME-version: 1.0
In-reply-to: <1337306511-1065-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: fix fetch for 2011.12 specific patches
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
X-List-Received-Date: Fri, 18 May 2012 02:13:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

NAK - https://lists.yoctoproject.org/pipermail/meta-ti/2012-May/001111.html

-- 
Denys


On Thu, May 17, 2012 at 11:01:51PM -0300, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes-bsp/u-boot/u-boot_2011.12.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
> index 39f77bd..45c64a6 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.12.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
> @@ -30,9 +30,9 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
>             ${CACHEFIX} \
>             file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
>             file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
> -           file://0011-ext2load-increase-read-speed.patch \
> -           file://0012-ext4fs-ls-load-support.patch \
> -           file://0013-beagleboard-switch-mmcroots-to-ext4.patch \
> +           file://2011.12/0011-ext2load-increase-read-speed.patch \
> +           file://2011.12/0012-ext4fs-ls-load-support.patch \
> +           file://2011.12/0013-beagleboard-switch-mmcroots-to-ext4.patch \
>             ${FWENV} \
>            "
>  
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

