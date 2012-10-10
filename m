Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36205E00293
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 10:38:35 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBO00EPKUBIJWB0@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 10 Oct 2012 12:38:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D65B4201C7; Wed,
	10 Oct 2012 13:38:04 -0400 (EDT)
Date: Wed, 10 Oct 2012 13:38:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20121010173804.GB16944@denix.org>
References: <20121010173454.99D2D52980@arago-project.org>
	<C3F40184-D594-41BB-944B-AC62FF7EEDC8@ti.com>
MIME-version: 1.0
In-reply-to: <C3F40184-D594-41BB-944B-AC62FF7EEDC8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Arago Project git <git@arago-project.org>
Subject: Re: Franklin S. Cooper Jr : u-boot_2011.09-psp04.06.00.08:	Add PSP v04.06.00. 08 of u-boot
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
X-List-Received-Date: Wed, 10 Oct 2012 17:38:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 10, 2012 at 05:37:07PM +0000, Cooper Jr., Franklin wrote:
> Please pull into Denzil 

Wow, that was super-fast! :)


> On Oct 10, 2012, at 12:35 PM, "Arago Project git" <git@arago-project.org> wrote:
> 
> > Module: meta-ti
> > Branch: master
> > Commit: 80ebdb06c319c5fa9881923e4a158eb048487b66
> > URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=80ebdb06c319c5fa9881923e4a158eb048487b66
> > 
> > Author: Franklin S. Cooper Jr <fcooper@ti.com>
> > Date:   Fri Oct  5 00:07:28 2012 -0500
> > 
> > u-boot_2011.09-psp04.06.00.08: Add PSP v04.06.00.08 of u-boot
> > 
> > * Add the PSP release version 04.06.00.08 of u-boot.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > ---
> > 
> > .../u-boot/u-boot_2011.09-psp04.06.00.08.bb        |   29 ++++++++++++++++++++
> > 1 files changed, 29 insertions(+), 0 deletions(-)
> > 
> > diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> > new file mode 100644
> > index 0000000..1bd4b9e
> > --- /dev/null
> > +++ b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> > @@ -0,0 +1,29 @@
> > +# Use the version of u-boot.inc in oe-core not the meta-ti version
> > +require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> > +
> > +DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> > +
> > +COMPATIBLE_MACHINE = "ti33x|omap3"
> > +
> > +DEFAULT_PREFERENCE = "-1"
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +PR = "r0+gitr${SRCPV}"
> > +
> > +SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
> > +
> > +BRANCH = "AM335XPSP_04.06.00.08"
> > +
> > +# Lock to the commit corresponding to TAG:
> > +# v2011.09_AM335xPSP_04.06.00.08
> > +SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +UBOOT_SUFFIX = "img"
> > +
> > +# Set the name of the SPL that will built so that it is also packaged with u-boot.
> > +SPL_BINARY = "MLO"
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> 

