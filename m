Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5664BE0073D; Wed, 18 Jun 2014 12:32:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E19A9E003DA
	for <meta-ti@yoctoproject.org>; Wed, 18 Jun 2014 12:32:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5IJWKLA016791;
	Wed, 18 Jun 2014 14:32:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5IJWKma026303;
	Wed, 18 Jun 2014 14:32:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 18 Jun 2014 14:32:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5IJWKTg006838;
	Wed, 18 Jun 2014 14:32:20 -0500
Date: Wed, 18 Jun 2014 15:32:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140618193219.GJ1825@edge>
References: <20140616223845.9FDB052A66@arago-project.org>
	<8F29D6B095ED194EA1980491A5E029710C6D3DE3@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6D3DE3@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Arago Project git <git@arago-project.org>
Subject: Re: Maupin, Chase : u-boot: Add mainline u-boot version 2014.07-rc3
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
X-List-Received-Date: Wed, 18 Jun 2014 19:32:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 18, 2014 at 07:28:13PM +0000, Cooper Jr., Franklin wrote:
> Can we pull this into dora also?
> 
> I know meta-arago is currently migrating to daisy but in the mean time 
> without this patch in dora it is causing errors.

Yes, I'm aware of the errors, but was hoping to get Arago on Daisy up and 
running very soon... I'll consider merging this to Dora if Daisy causes more 
problems.

-- 
Denys


> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Arago Project git
> > Sent: Monday, June 16, 2014 5:39 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] Maupin, Chase : u-boot: Add mainline u-boot version
> > 2014.07-rc3
> > 
> > Module: meta-ti
> > Branch: daisy
> > Commit: ca565599c2e5906bbe5325ee2e204e2344ecef72
> > URL:    http://arago-project.org/git/meta-
> > ti.git?a=commit;h=ca565599c2e5906bbe5325ee2e204e2344ecef72
> > 
> > Author: Maupin, Chase <chase.maupin@ti.com>
> > Date:   Sat Jun 14 03:55:54 2014 +0000
> > 
> > u-boot: Add mainline u-boot version 2014.07-rc3
> > 
> > * The latest mainline u-boot works well for most TI devices and
> >   we want to enable more people to use and test it.  Adding
> >   version 2014.07-rc3 will allow more people to build and use this
> >   u-boot version
> > * Add a dependency on dtc-native since the latest mainline of u-boot
> >   now requires this and not every build host will have the right
> >   version.
> > 
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > ---
> > 
> >  recipes-bsp/u-boot/u-boot_2014.07.bb |   27 +++++++++++++++++++++++++++
> >  1 files changed, 27 insertions(+), 0 deletions(-)
> > 
> > diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-
> > boot_2014.07.bb
> > new file mode 100644
> > index 0000000..b326aa1
> > --- /dev/null
> > +++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
> > @@ -0,0 +1,27 @@
> > +require u-boot-ti.inc
> > +
> > +# DEPEND on dtc-native for mainline u-boot because the mainline u-boot
> > +depends # on some of the latest syntax constructs for an appended in
> > +dtb used for # items like secure boot/image signing.
> > +DEPENDS += "dtc-native"
> > +
> > +DESCRIPTION = "Mainline u-boot bootloader"
> > +
> > +DEFAULT_PREFERENCE = "-1"
> > +
> > +LIC_FILES_CHKSUM =
> > "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
> > +
> > +# This is still an RC so set the PV accordingly to allow proper version
> > +# ordering when the RC is dropped.
> > +PV = "2014.04+2014.07-rc3"
> > +PR = "r0"
> > +
> > +SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
> > +
> > +BRANCH ?= "master"
> > +
> > +# Corresponds to tag v2014.07-rc3
> > +SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
> > +
> > +SPL_BINARY = "MLO"
> > +SPL_UART_BINARY = "u-boot-spl.bin"
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

