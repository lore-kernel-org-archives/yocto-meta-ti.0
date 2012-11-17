Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 974D5E003D6
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 21:09:38 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MDM0009B902PE00@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 16 Nov 2012 23:09:38 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DD75A2008B; Sat,
	17 Nov 2012 00:09:37 -0500 (EST)
Date: Sat, 17 Nov 2012 00:09:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-id: <20121117050937.GC9631@denix.org>
References: <1353093582-11469-1-git-send-email-fcooper@ti.com>
	<1353093582-11469-2-git-send-email-fcooper@ti.com>
	<20121117050759.GB9631@denix.org>
MIME-version: 1.0
In-reply-to: <20121117050759.GB9631@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] libgles-omap3: Verify pvrsrvkm module was found
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
X-List-Received-Date: Sat, 17 Nov 2012 05:09:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Nov 17, 2012 at 12:07:59AM -0500, Denys Dmytriyenko wrote:
> On Fri, Nov 16, 2012 at 01:19:42PM -0600, Franklin S. Cooper Jr wrote:
> > * Check to see if the pvrsrvkm.ko module was found and that the insmod
> >   for that module was successful.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  recipes-graphics/libgles/libgles-omap3.inc    |    2 +-
> >  recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletions(-)
> > 
> > diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
> > index 574cf17..d9f598a 100644
> > --- a/recipes-graphics/libgles/libgles-omap3.inc
> > +++ b/recipes-graphics/libgles/libgles-omap3.inc
> > @@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
> >  # 'TSPA.txt' might not be the best file to md5sum
> >  LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
> >  
> > -PR = "r34"
> > +PR = "r35"
> >  
> >  COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
> >  
> > diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr b/recipes-graphics/libgles/libgles-omap3/rc.pvr
> > index 00cd994..e5a4cd1 100755
> > --- a/recipes-graphics/libgles/libgles-omap3/rc.pvr
> > +++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr
> > @@ -42,6 +42,13 @@ fbset -vyres $(expr $YRES \* 3)
> >  sgxprepare () {
> >  	echo Starting PVR
> >  	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
> > +
> > +    if [ "$?" != "0" ]
> > +    then
> > +        echo "Could not find pvrsrvkm driver"
> > +        exit 1
> > +    fi
> > +
> 
> Yeah, and I didn't pay attention, but the second patch was as bad as the first 
> one...

I meant indentation-wise and space-mixing... The patch itself is fine. Sorry, 
it's too late.

> >  	modprobe omaplfb
> >  	modprobe bufferclass_ti
> >  
> > -- 
> > 1.7.0.4
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

