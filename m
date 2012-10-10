Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E068E00717
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 15:16:53 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBP006FH77HZDU1@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 10 Oct 2012 17:16:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2FB5B200D7; Wed,
	10 Oct 2012 18:16:29 -0400 (EDT)
Date: Wed, 10 Oct 2012 18:16:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20121010221629.GI16944@denix.org>
References: <1349843304-18507-1-git-send-email-fcooper@ti.com>
	<1349843304-18507-2-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED101592555C0@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C300D21@DFLE09.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101592561F6@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED101592561F6@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2][for-comments] omap3-sgx-modules:	Add v4.08.00.01 of the SGX modules
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
X-List-Received-Date: Wed, 10 Oct 2012 22:16:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 10, 2012 at 07:29:23PM +0000, Maupin, Chase wrote:
> > > +++ b/recipes-bsp/powervr-drivers/omap3-sgx-
> > modules_4.08.00.01.bb
> > > @@ -0,0 +1,55 @@
> > > +DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset
> > found
> > > in the omap3 SoCs"
> > > +LICENSE = "GPLv2"
> > > +LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
> > > +
> > > +TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> > > +require ../../recipes-ti/includes/ti-eula-unpack.inc
> > > +
> > > +SGXPV = "4_08_00_01"
> > > +IMGPV = "1.7.867897"
> > > +BINFILE = "Graphics_SDK_setuplinux_${SGXPV}.bin"
> > > +
> > > +inherit module
> > > +
> > > +MACHINE_KERNEL_PR_append = "a"
> > 
> > As we learned the other day MACHINE_KERNEL_PR adds a dependency
> > on the kernel.bbclass in meta-openembedded.  Should this check if
> > MACHINE_KERNEL_PR is defined before doing the append?
> > 
> > Franklin: MACHINE_KERNEL_PR is used by 25+ include files,patches
> > and machine files within meta-ti as of today. With that being
> > said your change does make sense. I can add that to v2
> 
> Denys,
> 
> As I asked before, what should we do about MACHINE_KERNEL_PR in general for 
> meta-ti?  I know we want to move away from meta-oe dependencies, so should 
> we be trying to add MACHINE_KERNEL_PR to oe-core?  I see a patch for this 
> was submitted back in 2011 but not picked up 
> (http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/010193.html).  
> There was a lot of discussion but still no conclusion.  There was talk about 
> the autoPR making this unneeded, but I think people skipped the issue of 
> recipes that should be re-built when the kernel changes. 

Well, PR service didn't get finished in time and is now scheduled for 1.4 
release...

But, since MACHINE_KERNEL_PR got moved to its own class[1], it should be 
slightly easier to "push" its acceptance to oe-core, as it is now "optional". 
BSP layers that want to use it, would need to inherit such class, while 
everyone else will not be bothered by it. As a matter of fact, meta-smartphone 
BSP layer already uses it this way, so can we. Although for now it's still 
only available from meta-oe, not oe-core... And not in denzil, due to the 
block on other kernel.bbclass patches pending...

[1] http://cgit.openembedded.org/meta-openembedded/commit/?id=d94c80615c39f707373978b4df5df423d9781051

> So for now should we leave this alone but take the question back to oe-core 
> about why not to use this feature?

For now, leave it alone, as it doesn't break things much, it just gets ignored 
when used w/o meta-oe layer in the stack...

-- 
Denys

