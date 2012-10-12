Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03674E0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:12:04 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBS00EXGNZ2ROA1@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 12 Oct 2012 14:11:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D914F200DD; Fri,
	12 Oct 2012 15:11:25 -0400 (EDT)
Date: Fri, 12 Oct 2012 15:11:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-id: <20121012191125.GA32601@denix.org>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-2-git-send-email-ebutera@users.berlios.de>
	<CAOT3mi+4RSMhPhXP5KwuzE1C9eGorJXp=N=NnsxahxbWeS7Cvg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAOT3mi+4RSMhPhXP5KwuzE1C9eGorJXp=N=NnsxahxbWeS7Cvg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/6] libdrm: enable omap experimental api support
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
X-List-Received-Date: Fri, 12 Oct 2012 19:12:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 11, 2012 at 10:07:47AM +0200, Nicolas Dechesne wrote:
> thanks for sending... i have the very same recipe in my local tree ,
> so it's all good timing!
> 
> 
> On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
> > This is needed to build gst-plugin-ducati.
> >
> > Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
> > ---
> >  recipes-graphics/drm/libdrm_2.4.39.bbappend |    3 +++
> >  1 file changed, 3 insertions(+)
> >  create mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend
> >
> > diff --git a/recipes-graphics/drm/libdrm_2.4.39.bbappend b/recipes-graphics/drm/libdrm_2.4.39.bbappend
> > new file mode 100644
> > index 0000000..5842556
> > --- /dev/null
> > +++ b/recipes-graphics/drm/libdrm_2.4.39.bbappend
> > @@ -0,0 +1,3 @@
> > +COMPATIBLE_MACHINE = "pandaboard"
> 
> i am not familiar too much with all the features of bitbake... but it
> seems that 'omap4' should be better for the compatibility. our current
> position is to request all OMAP4 boards/customers to use libdrm with
> OMAP experiemental support, that the only config we (TI) actually
> support.
> 
> at some point, I would be interested to see libdrm-omap +
> xf-video-omap being used on omap3 too.. but that's outside the scope
> of *this* patch!
> 
> and if you want to be proactive, you can add "omap4,omap5", as that's
> what we support on omap5 too.
> 
> having 'omap4' means that anyone that is making an omap4 board/machine
> will benefit from your recipe.

Nicolas,

Your understanding is correct. As a matter of fact, we pushed the support for 
SOC_FAMILY used in overrides and COMPATIBLE_MACHINE into OE/Bitbake some time 
ago, so you can now target the range of platforms based on the same SoC.

You can do things like:

VAR_omap4 = "VAL"

As well as:

COMPATIBLE_MACHINE = "omap4"

Please note, the latter one takes regular expression, so you can do 
"omap4|omap5" or even a more weirder "omap[45]". Come to think of it, if 
there's a recipe that is common to all OMAPs, you can do "omap?" :)

-- 
Denys


> > +EXTRA_OECONF += "--enable-omap-experimental-api"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

