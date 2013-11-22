Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97759E006AD
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 20:23:05 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWN00BIIDHL2XY2@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 21 Nov 2013 22:22:48 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4DE852003E; Thu,
	21 Nov 2013 23:22:33 -0500 (EST)
Date: Thu, 21 Nov 2013 23:22:33 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mrinmayee Hingolikar <mrinmayee@ti.com>, meta-ti@yoctoproject.org
Message-id: <20131122042233.GC32354@denix.org>
References: <20131021125642.GA5975@ti.com> <20131030230808.GC24696@edge>
	<20131122031031.GB32354@denix.org>
MIME-version: 1.0
In-reply-to: <20131122031031.GB32354@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCHv2] u-boot-glsdk: Update to latest fixes
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
X-List-Received-Date: Fri, 22 Nov 2013 04:23:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Never mind - ended up fixing it myself, as it's taking way too long...

On Thu, Nov 21, 2013 at 10:10:31PM -0500, Denys Dmytriyenko wrote:
> Ping.
> 
> On Wed, Oct 30, 2013 at 07:08:08PM -0400, Denys Dmytriyenko wrote:
> > On Mon, Oct 21, 2013 at 06:26:42PM +0530, Mrinmayee Hingolikar wrote:
> > >  * Migration of u-boot code to omapzoom.org. The development tree is shared
> > >    between the Linux and Android teams.This enables a common u-boot development
> > >    platform for both the teams for better alignment.
> > >  * Enable UART boot mode for dra7xx
> > >  * Add VIP,VPE and Ethernet crossbar setting for dra7xx
> > >  * Add SPL API, QSPI, and serial flash support of dra7xx
> > > 
> > > v2:
> > > 
> > >  * Update to conditional assignment for BRANCH and SRCREV
> > 
> > Well, I guess I missed why it was necessary... I would understand BRANCH, but 
> > not SRCREV... BTW, patch revision history should be hidden and not go into the 
> > main description, so should appear after the --- delimiter.
> > 
> > 
> > > Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > > ---
> > >  recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb |    6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
> > > index d60ef44..1805020 100644
> > > --- a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
> > > +++ b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
> > > @@ -6,11 +6,11 @@ PR = "r0+gitr${SRCPV}"
> > >  
> > >  DEFAULT_PREFERENCE = "-1"
> > >  
> > > -SRC_URI = "git://git.ti.com/glsdk/glsdk-u-boot.git;protocol=git;branch=${BRANCH}"
> > > +SRC_URI = "git://git.omapzoom.org/repo/u-boot.git;protocol=git;branch=${BRANCH}"
> > >  
> > > -BRANCH ?= "master"
> > > +BRANCH ?= "p-ti-u-boot-2013.04"
> > >  
> > > -SRCREV = "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
> > > +SRCREV ?= "76447484441a4b8e00840a2bde74e66dbac9e631"
> > 
> > One thing is missing - PR bump. You are updating source tree and the commit ID 
> > is lower than the previous one, hence if you would try to share the build 
> > where the old package exists, you may end up with the image that contains the 
> > old package and not the new one. Although, symlink in deploy would probably be 
> > correct...
> > 
> > 
> > >  SPL_BINARY = "MLO"
> > >  SPL_UART_BINARY = "u-boot-spl.bin"
> > > -- 
> > > 1.7.9.5
> > > 
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
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

