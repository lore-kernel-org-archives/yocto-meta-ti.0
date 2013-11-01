Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB323E016DC
	for <meta-ti@yoctoproject.org>; Fri,  1 Nov 2013 13:18:13 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MVL0073CPOY9LC0@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 01 Nov 2013 15:17:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D331F201AD; Fri,
	01 Nov 2013 16:17:22 -0400 (EDT)
Date: Fri, 01 Nov 2013 16:17:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-id: <20131101201722.GA13402@denix.org>
References: <20131021130016.GA6062@ti.com> <20131030231224.GD24696@edge>
	<CF956B779D819D41BBC043B7082161D545C363@DBDE04.ent.ti.com>
MIME-version: 1.0
In-reply-to: <CF956B779D819D41BBC043B7082161D545C363@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCHv2] linux-ti-glsdk: Update to latest fixes
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
X-List-Received-Date: Fri, 01 Nov 2013 20:18:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 31, 2013 at 08:14:27AM +0000, Hingolikar, Mrinmayee wrote:
> Can you please pull in this patch?

Next time please rebase your patch before submitting, as there were changes to 
the recipe over a month ago and the patch was not applying cleanly...


> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, October 31, 2013 4:42 AM
> > To: Hingolikar, Mrinmayee
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCHv2] linux-ti-glsdk: Update to latest fixes
> > 
> > On Mon, Oct 21, 2013 at 06:30:16PM +0530, Mrinmayee Hingolikar wrote:
> > > v1:
> > >  * Kernel source migration from git.ti.com to omapzoom.org. The
> > development
> > >    tree is shared between the Linux and Android teams.This enables a
> > common
> > >    kernel development platform for both the teams for better
> > alignment.
> > >  * Add support for VIP and VPE
> > >  * Add wilink/wlan support
> > >  * Enable rpmsg/remoteproc driver for multimedia
> > >
> > > v2:
> > >  * Add conditional assignment for BRANCH and SRCREV
> > 
> > I'm not sure why this was needed, but I can take it.
> > 
> > 
> > > Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > > ---
> > >  recipes-kernel/linux/linux-ti-glsdk_3.8.bb |    8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > > b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > > index 9e3e499..35d55df 100644
> > > --- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > > +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > > @@ -18,14 +18,14 @@ DEFAULT_PREFERENCE = "-1"
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > -BRANCH = "master"
> > > +BRANCH ?= "p-ti-glsdk-3.8.y"
> > >
> > > -SRCREV = "6076e6882d1d6a64b104e42e56a3eada36605cb3"
> > > +SRCREV ?= "cc16f99176bf083829c028f9af5b8eb560debcc1"
> > >  PV = "3.8.13"
> > >
> > >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> > > rebuild -MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
> > > +MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
> > >
> > > -SRC_URI =
> > > "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-
> > kernel.git;protocol=g
> > > it;branch=${BRANCH} \
> > > +SRC_URI =
> > >
> > +"git://git.omapzoom.org/kernel/omap.git;protocol=git;branch=${BRANCH}
> > > +\
> > >             file://defconfig \
> > >            "
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

