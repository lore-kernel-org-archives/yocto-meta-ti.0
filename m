Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45C31E003E4
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 00:23:52 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0A00E10VBQY800@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 03 Mar 2012 02:23:51 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B60B920272; Sat,
	03 Mar 2012 03:23:50 -0500 (EST)
Date: Sat, 03 Mar 2012 03:23:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20120303082350.GF24667@denix.org>
References: <20120301212837.C08F852A8A@arago-project.org>
	<50999BC3-EC35-4F51-BD1E-9F35FD9AD78C@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F049DD6@DLEE12.ent.ti.com>
	<351DB87E-545E-479E-8183-C5072355906C@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F04A6C0@DLEE12.ent.ti.com>
	<20120302221439.GD24667@denix.org>
MIME-version: 1.0
In-reply-to: <20120302221439.GD24667@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Chase Maupin : linux-ti33x-psp: add am335x-evm support
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
X-List-Received-Date: Sat, 03 Mar 2012 08:23:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 02, 2012 at 05:14:39PM -0500, Denys Dmytriyenko wrote:
> On Fri, Mar 02, 2012 at 08:31:36PM +0000, Maupin, Chase wrote:
> > I'll make a patch this afternoon to put configs in both directories.  Still 
> > don't know why it isn't finding the normal configs directory and keeps 
> > looking in the MACHINE directory.
> 
> I've been trying to debug it and looks like it's broken in bitbake's fetcher, 
> which is not very obvious, but it tries to unpack there and for some reason 
> defaults to machine-specific directory. Maybe it doesn't like * in the path... 
> I'll keep looking into it for now, but if I can't fix it, I'll push a 
> workaround.

Ok, please test the latest "fix":

    BitBake's fetch2 unpack() seems to be picky about multi-kernel's
    file://configs/* and defaults to only looking into machine-specific
    location. This fixes the issue, as tested by building these platforms:
    beaglebone, am335x-evm and am180x-evm.

Seems to build those platforms, when multi-kernel configs reside in 
machine-specific directories and outside. But more testing is definitely 
needed.

As a side note, sstate seems to be really broken, as building the first 
machine in a clean setup works fine, but then trying to build a second machine 
in the same setup leads to weird breakages in perl, gcc-cross-initial, 
gcc-cross-intermediate, then binutils etc. Even though both machines are 
armv7a and supposed to share those packages w/o rebuilding them... Cleaning 
sstate and/or entire build takes too much time and is really painful 
switching between platforms.

-- 
Denys


> > > -----Original Message-----
> > > From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> > > Sent: Friday, March 02, 2012 2:30 PM
> > > To: Maupin, Chase
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] Chase Maupin : linux-ti33x-psp: add am335x-
> > > evm support
> > > 
> > > Any ETA on a fix? If it will take a few days I suggest reverting
> > > the cset that moved the configs/ dir so I won't have to deal with
> > > the weekend workers hitting this bug :)
> > > 
> > > regards,
> > > 
> > > Koen
> > > 
> > > Op 2 mrt. 2012, om 16:49 heeft Maupin, Chase het volgende
> > > geschreven:
> > > 
> > > > Koen,
> > > >
> > > > Looks like my build was not clean.  I see now that when I clean
> > > everything even the am335x-evm build will fail to find the configs.
> > > So now the question is why this happens.  I'm used to if the
> > > configs wasn't found in the beaglebone or am335x-evm directory, you
> > > would fall back to looking in the base linux-ti33x-psp-3.2
> > > directory.  However, it looks like this fallback does not happen.
> > > My reading of FILESPATH is that the linux/linux-ti33x-psp-3.2
> > > directory is in the FILESPATH.
> > > >
> > > > Sincerely,
> > > > Chase Maupin
> > > > Software Applications
> > > > ARM MPU
> > > >
> > > > For support:
> > > > Forums - http://community.ti.com/forums/
> > > > Wiki - http://wiki.davincidsp.com/
> > > >
> > > >
> > > >> -----Original Message-----
> > > >> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> > > >> Sent: Friday, March 02, 2012 8:58 AM
> > > >> To: Maupin, Chase
> > > >> Cc: meta-ti@yoctoproject.org
> > > >> Subject: Re: [meta-ti] Chase Maupin : linux-ti33x-psp: add
> > > am335x-
> > > >> evm support
> > > >>
> > > >>
> > > >> Op 1 mrt. 2012, om 22:28 heeft Arago Project git het volgende
> > > >> geschreven:
> > > >>
> > > >>> Module: meta-ti
> > > >>> Branch: master
> > > >>> Commit: 8172b803e73126c2e336050d43251538bdc4d09b
> > > >>> URL:    http://arago-project.org/git/meta-
> > > >> ti.git?a=commit;h=8172b803e73126c2e336050d43251538bdc4d09b
> > > >>>
> > > >>> Author: Chase Maupin <Chase.Maupin@ti.com>
> > > >>> Date:   Tue Feb 28 17:28:14 2012 -0600
> > > >>>
> > > >>> linux-ti33x-psp: add am335x-evm support
> > > >>>
> > > >>> * Added a defconfig file for the am335x-evm and moved the
> > > common
> > > >>> configs directory from the beaglebone directory to the top
> > > >>> of the kernel files tree.
> > > >>>
> > > >>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > >>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > >>>
> > > >>> ---
> > > >>>
> > > >>> .../linux/linux-ti33x-psp-3.2/am335x-evm/defconfig | 2640
> > > >> ++++++++++++++++++++
> > > >>> .../{beaglebone => }/configs/empty                 |    0
> > > >>> 2 files changed, 2640 insertions(+), 0 deletions(-)
> > > >>
> > > >> As Gary points out, this breaks the beaglebone kernel build
> > > >>
> > > >> regards,
> > > >>
> > > >> Koen
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> > 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

