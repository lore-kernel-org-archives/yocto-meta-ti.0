Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88A52E016F4
	for <meta-ti@yoctoproject.org>; Sun, 13 Oct 2013 15:58:50 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM005QWQHWC150@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 13 Oct 2013 17:58:45 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9415820101; Sun,
	13 Oct 2013 18:58:44 -0400 (EDT)
Date: Sun, 13 Oct 2013 18:58:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-id: <20131013225844.GC27046@denix.org>
References: <CAFZh4h9H3bTQveLafJY-3rCz-qy=dqhVq36CTqFt4RCPqJWDcQ@mail.gmail.com>
	<20131009180902.GB15357@edge>
	<CAFZh4h8zkeU6JysvkAuHDPMES9NdQFPkbxxXPPcOQwO61r32PQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFZh4h8zkeU6JysvkAuHDPMES9NdQFPkbxxXPPcOQwO61r32PQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Kernel recipe that works with OECore + meta-ti fails with Poky + meta-ti
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
X-List-Received-Date: Sun, 13 Oct 2013 22:58:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 09, 2013 at 03:15:17PM -0400, Brian Hutchinson wrote:
> On Wed, Oct 9, 2013 at 2:09 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> >
> > 1. Which bitbake you use when building oe-core+meta-ti? Since Poky comes
> > with
> > own copy of bitbake, you may want to compare them.
> >
> 
> Poky is: BitBake Build Tool Core version 1.20.0, bitbake version 1.20.0
> OECore is:  BitBake Build Tool Core version 1.19.1, bitbake version 1.19.1

Have you tried matching them up? If you update bitbake in oe-core to 1.20 will 
it hang too?


> > 2. Not that it would affect packaging, but where in bblayer.conf did you
> > add
> > meta-ti?
> >
> 
> My bblayers.conf in Poky is:
> BBLAYERS ?= " \
>   /home/hutch/yocto_master_wcs_10_4_2013/poky/meta \
>   /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-yocto \
>   /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-yocto-bsp \
>   /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti \
>   /home/hutch/yocto_master_wcs_10_4_2013/layers/meta-oe/meta-oe \
>   /home/hutch/yocto_master_wcs_10_4_2013/layers/meta-oe/meta-networking \
>   /home/hutch/yocto_master_wcs_10_4_2013/layers/meta-oe/meta-webserver \

I'm wondering who's insisting on this somewhat upside-down order of layers in 
the stack? Unfortunately, layer priority is not the only mechanism to control 
parsing order... You may find this thread useful"

http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/2726/focus=2744


>   "
> BBLAYERS_NON_REMOVABLE ?= " \
>   /home/hutch/yocto_master_wcs_10_4_2013/poky/meta \
>   /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-yocto \
> 
> My bblayers.conf in OECore (that works) is:
> BBLAYERS ?= " \
>   /home/hutch/oe_core_beagleboard/oe-core/meta \
>   /home/hutch/oe_core_beagleboard/oe-core/meta-ti \
>   /home/hutch/oe_core_beagleboard/oe-core/meta-openembedded/meta-oe \
>   /home/hutch/oe_core_beagleboard/oe-core/meta-openembedded/meta-networking \
>   /home/hutch/oe_core_beagleboard/oe-core/meta-openembedded/meta-webserver \

Is it distro-less?


>   "
> 
> BBLAYERS_NON_REMOVABLE ?= " \
>   /home/hutch/oe_core_beagleboard/oe-core/meta \
>   "
> 
> I killed the build.  I can't afford to tie up the server that long.  Looks
> like I'll have to go back to using Poky for only building my rootfs and
> build kernel with poky generated sdk outside of bitbake.  The other problem
> I saw was in OECore, I added the linux-libc-headers for 2.6.37.2 so
> packages would be built with headers that matched my TI PSP based kernel
> and I was able to get that to work.  In Poky, I made the same mods to try
> and build everything against 2.6.37.2 headers and no matter what I tried it
> would always use 3.10 headers.  Probably OK but I still worry it could
> cause a problem.
> 
> 
> > And one more suggestion - you may want to compare classes between oe-core
> > and
> > poky/meta to see if there are any big differences, especially in the
> > packaging
> > area...
> >
> 
> Will do.  Thanks!

Any updates?

-- 
Denys

