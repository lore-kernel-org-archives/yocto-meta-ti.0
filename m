Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 529BDE00734
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:31:55 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJI00J5NJOO5IV1@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 11 Mar 2013 15:31:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 15906200A9; Mon,
	11 Mar 2013 16:31:35 -0400 (EDT)
Date: Mon, 11 Mar 2013 16:31:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20130311203135.GB31635@denix.org>
References: <1363033043-21593-1-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED10159454A48@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED10159454A48@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] u-boot-ti-staging: Add TI staging U-Boot recipe
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
X-List-Received-Date: Mon, 11 Mar 2013 20:31:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 11, 2013 at 08:18:36PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Maupin, Chase
> > Sent: Monday, March 11, 2013 3:17 PM
> > To: meta-ti@yoctoproject.org
> > Cc: Maupin, Chase
> > Subject: [PATCH 1/3] u-boot-ti-staging: Add TI staging U-Boot
> > recipe
> > 
> 
> Denys,
> 
> I know you are working on something here too.  I just wanted to give you an 
> idea of what I was using for comparison.

Thanks for the heads up! I'll try to incorporate this in my work.

-- 
Denys


> > * Pull the TI staging U-Boot tree for use with ti33x devices and
> >   the omap-a15 devices.
> > * Used the PN u-boot-ti-staging to make it easy to set a
> >   PREFERRED_PROVIDER in the machine configuration to point to
> >   this recipe instead of the default u-boot recipe since TI
> > devices
> >   should point to the TI staging trees by default.
> > 
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  ...> u-boot-ti-staging_2013.01.01-ti2013.2Q.00.bb} |   12
> > ++++++------
> >  1 files changed, 6 insertions(+), 6 deletions(-)
> >  copy recipes-bsp/u-boot/{u-boot_2011.09-psp04.06.00.08.bb => u-
> > boot-ti-staging_2013.01.01-ti2013.2Q.00.bb} (61%)
> > 
> > diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> > b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01-ti2013.2Q.00.bb
> > similarity index 61%
> > copy from recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> > copy to recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01-
> > ti2013.2Q.00.bb
> > index 1bd4b9e..67e1988 100644
> > --- a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> > +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01-
> > ti2013.2Q.00.bb
> > @@ -1,11 +1,11 @@
> >  # Use the version of u-boot.inc in oe-core not the meta-ti
> > version
> >  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> > 
> > -DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> > +DESCRIPTION = "u-boot bootloader for TI devices"
> >  LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> > 
> > -COMPATIBLE_MACHINE = "ti33x|omap3"
> > +COMPATIBLE_MACHINE = "ti33x|omap3|omap-a15"
> > 
> >  DEFAULT_PREFERENCE = "-1"
> > 
> > @@ -13,13 +13,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> >  PR = "r0+gitr${SRCPV}"
> > 
> > -SRC_URI = "git://arago-project.org/git/projects/u-boot-
> > am33x.git;protocol=git;branch=${BRANCH}"
> > +SRC_URI = "git://gitorious.ti.com/ti-u-boot/ti-u-
> > boot.git;protocol=git;branch=${BRANCH}"
> > 
> > -BRANCH = "AM335XPSP_04.06.00.08"
> > +BRANCH = "ti-u-boot-2013.01.01"
> > 
> >  # Lock to the commit corresponding to TAG:
> > -# v2011.09_AM335xPSP_04.06.00.08
> > -SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
> > +# TBD
> > +SRCREV = "c44c35e24b1532272118c58c57f658f21b72a4dd"
> > 
> >  S = "${WORKDIR}/git"
> > 
> > --
> > 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

