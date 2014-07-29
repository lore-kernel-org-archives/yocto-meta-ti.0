Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5602E007B5; Tue, 29 Jul 2014 16:43:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC466E003FA
	for <meta-ti@yoctoproject.org>; Tue, 29 Jul 2014 16:43:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6TNhaP6020395;
	Tue, 29 Jul 2014 18:43:36 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6TNha0b000572;
	Tue, 29 Jul 2014 18:43:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 29 Jul 2014 18:43:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6TNhZeV008875;
	Tue, 29 Jul 2014 18:43:35 -0500
Date: Tue, 29 Jul 2014 19:43:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140729234335.GM15788@edge>
References: <1406673559-12578-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6EDABC@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6EDABC@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] u-boot-ti-staging: add TI staging version of u-boot 2014.07
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
X-List-Received-Date: Tue, 29 Jul 2014 23:43:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 29, 2014 at 11:35:30PM +0000, Cooper Jr., Franklin wrote:
> Do we need the DEPENDS += "dtc-native" that was added to the mainline 
> 2014.07 u-boot recipe?

Yeah, wouldn't hurt.


> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Tuesday, July 29, 2014 5:39 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH] u-boot-ti-staging: add TI staging version of u-boot
> > 2014.07
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Mainline version of 2014.07 will be pushed to mainline OE-Core soon.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
> > 
> > diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bsp/u-
> > boot/u-boot-ti-staging_2014.07.bb
> > new file mode 100644
> > index 0000000..3baab66
> > --- /dev/null
> > +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
> > @@ -0,0 +1,18 @@
> > +require u-boot-ti.inc
> > +
> > +DESCRIPTION = "u-boot bootloader for TI devices"
> > +
> > +LIC_FILES_CHKSUM =
> > "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
> > +
> > +PV = "2014.07"
> > +PR = "r0+gitr${SRCPV}"
> > +
> > +SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-
> > boot.git;protocol=git;branch=${BRANCH}"
> > +
> > +BRANCH ?= "ti-u-boot-2014.07"
> > +
> > +# Corresponds to tag ti2014.07
> > +SRCREV = "053adddee4c97315059e08d4b3f5ebd264ed295f"
> > +
> > +SPL_BINARY = "MLO"
> > +SPL_UART_BINARY = "u-boot-spl.bin"
> > --
> > 2.0.2
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

