Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB6BAE016E2
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 06:07:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9ID7a2U029514
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 08:07:36 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ID7aA0032464
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 08:07:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 18 Oct 2013 08:07:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ID7aRM021018;
	Fri, 18 Oct 2013 08:07:36 -0500
Date: Fri, 18 Oct 2013 09:07:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20131018130735.GA32736@edge>
References: <1382099263-18561-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1382099263-18561-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCHv2] u-boot-ti-staging: update to 2013.10 release
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
X-List-Received-Date: Fri, 18 Oct 2013 13:07:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack, will push today.

On Fri, Oct 18, 2013 at 07:27:43AM -0500, Chase Maupin wrote:
> * Update the U-Boot LICENSE md5sum for the new release.
> 
> * Update the PV for the new U-Boot release
> 
> * Add the SRCREV that points to the 2013.10 release
> 
> * Use the ti-u-boot-2013.10 branch
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> * Updated in version 2
>     * Changed BRANCH to ti-u-boot-2013.10
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_git.bb |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
> index a5882b0..ab6b038 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
> @@ -2,16 +2,17 @@ require u-boot-ti.inc
>  
>  DESCRIPTION = "u-boot bootloader for TI devices"
>  
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=bc069111b5e5b1ed8bed98ae73b596ec"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
>  
> -PV = "2013.07+2013.10-rc4"
> +PV = "2013.10"
>  PR = "r0+gitr${SRCPV}"
>  
>  SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
>  
> -BRANCH ?= "master"
> +BRANCH ?= "ti-u-boot-2013.10"
>  
> -SRCREV = "0c5274e6f3231a3a28dafc1204b3f71a3534c520"
> +# Corresponds to 2013.10
> +SRCREV = "183acb700378a8cfc5d50a01a65de93fb2c24586"
>  
>  SPL_BINARY = "MLO"
>  SPL_UART_BINARY = "u-boot-spl.bin"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

