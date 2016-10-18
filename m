Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8AFC5E00D45; Tue, 18 Oct 2016 10:17:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14517E00D3D
	for <meta-ti@yoctoproject.org>; Tue, 18 Oct 2016 10:17:33 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0292D20992;
	Tue, 18 Oct 2016 17:17:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zxeUdZQfVGym; Tue, 18 Oct 2016 17:17:30 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5A87200CC;
	Tue, 18 Oct 2016 17:17:29 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 356C8162175; Tue, 18 Oct 2016 13:17:29 -0400 (EDT)
Date: Tue, 18 Oct 2016 13:17:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>, meta-ti@yoctoproject.org
Message-ID: <20161018171729.GI2494@denix.org>
References: <93e07642-1cc5-40eb-ac40-2debe67d0c72@email.android.com>
	<212371ab-9b66-e313-9cf3-9b9ce3578807@mlbassoc.com>
	<20161018163138.GW12745@edge>
MIME-Version: 1.0
In-Reply-To: <20161018163138.GW12745@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 18 Oct 2016 17:17:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 18, 2016 at 12:31:38PM -0400, Denys Dmytriyenko wrote:
> On Sun, Oct 16, 2016 at 12:46:19PM +0200, Gary Thomas wrote:
> > On 2016-10-11 12:47, Denys Dmytriyenko wrote:
> > >Yeah, I'm also getting this in master. Works fine in krogoth. Haven't yet looked close at it though...
> > 
> > There seem to be two things wrong here.
> > 
> > *) Yocto has moved most recipes to use a split source/build tree,
> >    thus ${S} != ${B}
> 
> Well, that actually happened quite a long time ago for most of recipes. U-boot 
> was in the unconverted minority for a while, until couple months ago:
> 
> http://cgit.openembedded.org/openembedded-core/commit/?id=36f110594506fbee5dc18de3a04981f019f2024d
> 
> 
> As of UBOOT_LOCALVERSION - not sure if generating it fails or rather 
> consumption of it fails inside U-boot Makefiles...

Ok, trying to fix things while attending ELCE last week proved to be futile! 
The issue was Python3 related and I already had the same exact one fixed for 
the kernel, d'oh! The patch is out now.

-- 
Denys


> > *) There is some issue with generating the UBOOT_LOCALVERSION that
> >    causes problems.
> > 
> > This patch [sort of] addresses both.  At least it lets me build a
> > working U-Boot for the BeagleBone from master.  I know it's not
> > perfect, but I couldn't figure out the why the UBOOT_LOCALVERSION
> > stuff wasn't working.
> > 
> > -- 
> > ------------------------------------------------------------
> > Gary Thomas                 |  Consulting for the
> > MLB Associates              |    Embedded world
> > ------------------------------------------------------------
> 
> > diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> > index b0054c9..a854243 100644
> > --- a/recipes-bsp/u-boot/u-boot-ti.inc
> > +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> > @@ -8,7 +8,7 @@ def get_git_revision(p):
> >      except OSError:
> >          return None
> >  
> > -UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
> > +#UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
> >  
> >  UBOOT_SUFFIX ?= "img"
> >  
> > @@ -36,7 +36,7 @@ SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
> >  do_install_append () {
> >      if [ "x${SPL_UART_BINARY}" != "x" ]
> >      then
> > -        install ${S}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
> > +        install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
> >          ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
> >      fi
> >  }
> > @@ -45,7 +45,7 @@ do_deploy_append () {
> >      cd ${DEPLOYDIR}
> >      if [ "x${SPL_UART_BINARY}" != "x" ]
> >      then
> > -        install ${S}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
> > +        install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
> >          rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
> >          ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
> >          ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
> 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

