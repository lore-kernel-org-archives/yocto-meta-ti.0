Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE00CE00283
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 12:43:30 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6VJhTS0026678;
	Tue, 31 Jul 2012 14:43:29 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6VJhTRG014524;
	Tue, 31 Jul 2012 14:43:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 31 Jul 2012 14:43:29 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6VJhTf4011388;
	Tue, 31 Jul 2012 14:43:29 -0500
Date: Tue, 31 Jul 2012 15:43:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120731194328.GA21013@edge>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
	<1343581714-20397-12-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1343581714-20397-12-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH][for-denzil 12/12] u-boot 2011.09+git: update to latest version of Tom Rini's tree
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
X-List-Received-Date: Tue, 31 Jul 2012 19:43:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Jul 29, 2012 at 07:08:34PM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-bsp/u-boot/u-boot_2011.10rc.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> index c4b4ca7..7035b4c 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "(ti33x)"
>  DEFAULT_PREFERENCE_ti33x = "99"
>  
>  PV = "2011.09+git"
> -PR = "r28"
> +PR = "r29"
>  
>  # SPL build
>  UBOOT_BINARY = "u-boot.img"
> @@ -26,7 +26,7 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
>             file://2011.09git/0010-am335x-switch-to-ext4-mode.patch \
>            "
>  
> -SRCREV = "ec687252299796639ff9bcb981804fbec7b445a4"
> +SRCREV = "dc52533ccff00a12761f793d66b39e4f6a4a3bba"

Should it go to the master first?

-- 
Denys


>  LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
>  
> -- 
> 1.7.10
> 

