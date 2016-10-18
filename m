Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C013FE00D40; Tue, 18 Oct 2016 09:31:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEABAE00D35
	for <meta-ti@yoctoproject.org>; Tue, 18 Oct 2016 09:31:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9IGVeD3016553;
	Tue, 18 Oct 2016 11:31:40 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9IGVd17022193;
	Tue, 18 Oct 2016 11:31:39 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Oct 2016 11:31:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9IGVdwH020265;
	Tue, 18 Oct 2016 11:31:39 -0500
Date: Tue, 18 Oct 2016 12:31:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20161018163138.GW12745@edge>
References: <93e07642-1cc5-40eb-ac40-2debe67d0c72@email.android.com>
	<212371ab-9b66-e313-9cf3-9b9ce3578807@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <212371ab-9b66-e313-9cf3-9b9ce3578807@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Can't build for BeagleBone
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
X-List-Received-Date: Tue, 18 Oct 2016 16:31:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Oct 16, 2016 at 12:46:19PM +0200, Gary Thomas wrote:
> On 2016-10-11 12:47, Denys Dmytriyenko wrote:
> >Yeah, I'm also getting this in master. Works fine in krogoth. Haven't yet looked close at it though...
> 
> There seem to be two things wrong here.
> 
> *) Yocto has moved most recipes to use a split source/build tree,
>    thus ${S} != ${B}

Well, that actually happened quite a long time ago for most of recipes. U-boot 
was in the unconverted minority for a while, until couple months ago:

http://cgit.openembedded.org/openembedded-core/commit/?id=36f110594506fbee5dc18de3a04981f019f2024d


As of UBOOT_LOCALVERSION - not sure if generating it fails or rather 
consumption of it fails inside U-boot Makefiles...

-- 
Denys


> *) There is some issue with generating the UBOOT_LOCALVERSION that
>    causes problems.
> 
> This patch [sort of] addresses both.  At least it lets me build a
> working U-Boot for the BeagleBone from master.  I know it's not
> perfect, but I couldn't figure out the why the UBOOT_LOCALVERSION
> stuff wasn't working.
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------

> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index b0054c9..a854243 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -8,7 +8,7 @@ def get_git_revision(p):
>      except OSError:
>          return None
>  
> -UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
> +#UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
>  
>  UBOOT_SUFFIX ?= "img"
>  
> @@ -36,7 +36,7 @@ SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
>  do_install_append () {
>      if [ "x${SPL_UART_BINARY}" != "x" ]
>      then
> -        install ${S}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
> +        install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
>          ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
>      fi
>  }
> @@ -45,7 +45,7 @@ do_deploy_append () {
>      cd ${DEPLOYDIR}
>      if [ "x${SPL_UART_BINARY}" != "x" ]
>      then
> -        install ${S}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
> +        install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
>          rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
>          ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
>          ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


