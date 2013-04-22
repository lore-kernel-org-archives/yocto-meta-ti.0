Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E477E013C3
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 13:02:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MK2txq021164
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 15:02:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MK2twp019272
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 15:02:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Apr 2013 15:02:54 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3MK2sK5022634;
	Mon, 22 Apr 2013 15:02:54 -0500
Date: Mon, 22 Apr 2013 16:02:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130422200253.GB11889@edge>
References: <1366647702-24282-1-git-send-email-fcooper@ti.com>
	<1366647702-24282-3-git-send-email-fcooper@ti.com>
	<20130422193024.GA28316@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C42E0D9@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C42E0D9@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 3/3] u-boot-am33x: Update u-boot recipe to 2013.01.01
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
X-List-Received-Date: Mon, 22 Apr 2013 20:02:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 22, 2013 at 03:58:23PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, April 22, 2013 2:30 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH 3/3] u-boot-am33x: Update u-boot recipe to
> > 2013.01.01
> > 
> > On Mon, Apr 22, 2013 at 11:21:42AM -0500, Franklin S. Cooper Jr wrote:
> > > * Update to latest version of u-boot that supports the 3.2 kernel.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  recipes-bsp/u-boot/u-boot-am33x_2012.10.bb    |   17 -----------------
> > >  recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb |   20
> > ++++++++++++++++++++
> > >  2 files changed, 20 insertions(+), 17 deletions(-)  delete mode
> > > 100644 recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> > >  create mode 100644 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
> > >
> > > diff --git a/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> > > b/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> > > deleted file mode 100644
> > > index 7320e02..0000000
> > > --- a/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> > > +++ /dev/null
> > > @@ -1,17 +0,0 @@
> > > -require u-boot-ti.inc
> > > -
> > > -DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> > > -
> > > -COMPATIBLE_MACHINE = "ti33x|omap3"
> > 
> > You are removing the old 2012.10 recipe that is also used for "omap3" SoCs.
> > Since you are adding the new one only for "ti33x" SoCs, there won't be any
> > compatible u-boot for AM37x...
> 
> The COMPATIBLE_MACHINE is incorrect. It really should only be ti33x. 
> 
> AM37x is using u-boot-am37x_2012.04.01 anyway.
> I don't know why am3517 is using this u-boot.
> I will need to add the proper 3517 u-boot recipe.

Ah, right, AM3517, not sure why I said AM37x :)

Ok, as long as you will be submitting the updated recipe for it, I'll go 
ahead and push this set.

-- 
Denys


> > > -
> > > -DEFAULT_PREFERENCE = "-1"
> > > -
> > > -PR = "r7+gitr${SRCPV}"
> > > -
> > > -SRC_URI = "git://arago-project.org/git/projects/u-boot-
> > am33x.git;protocol=git;branch=${BRANCH}"
> > > -
> > > -BRANCH = "amsdk-05.06.00.00"
> > > -
> > > -SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
> > > -
> > > -SPL_BINARY = "MLO"
> > > diff --git a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb b/recipes-
> > bsp/u-boot/u-boot-am33x_2013.01.01.bb
> > > new file mode 100644
> > > index 0000000..19ec34e
> > > --- /dev/null
> > > +++ b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
> > > @@ -0,0 +1,20 @@
> > > +require u-boot-ti.inc
> > > +
> > > +DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> > > +
> > > +COMPATIBLE_MACHINE = "ti33x"
> > > +
> > > +DEFAULT_PREFERENCE = "-1"
> > > +
> > > +PR = "r5+gitr${SRCPV}"
> > > +
> > > +SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-
> > boot.git;protocol=git;branch=${BRANCH}"
> > > +
> > > +# This version of u-boot is meant for 3.2 kernel which doesn't support
> > device tree.
> > > +BRANCH = "ti-u-boot-2013.01.01-amsdk-05.07.00.00"
> > > +
> > > +# Commit corresponds to tag "v2013.01.01_amsdk-05.07.00.00"
> > > +SRCREV = "8eb15a787c558fee98b0fa2a66ff0849c732edcc"
> > > +
> > > +# Set the name of the SPL that will built so that it is also packaged with u-
> > boot.
> > > +SPL_BINARY = "MLO"
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >

