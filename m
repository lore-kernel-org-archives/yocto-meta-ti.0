Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCDD3E00596
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2012 14:05:36 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2Y00K3QAKQ4UO0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Apr 2012 16:05:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CBF9D201A7; Mon,
	23 Apr 2012 17:05:14 -0400 (EDT)
Date: Mon, 23 Apr 2012 17:05:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120423210514.GA25685@denix.org>
References: <1334849614-12816-1-git-send-email-koen@dominion.thruhere.net>
	<728BA01E-6B0C-4FCC-A30F-75B1923B054F@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <728BA01E-6B0C-4FCC-A30F-75B1923B054F@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] cloud9-gnome-image: same as cloud9-image, but with GNOME added to it
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
X-List-Received-Date: Mon, 23 Apr 2012 21:05:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 23, 2012 at 10:25:55PM +0200, Koen Kooi wrote:
> ping on this one, the rest is already in :)

Yeah, I know :)

I was holding on it, since it adds one more systemd and angstrom dependency 
and I was working on restructuring the code to separate those things into 
"extras" sublayer...

But since it's around the release time, this restructuring probably should be 
held until after.

-- 
Denys


> Op 19 apr. 2012, om 17:33 heeft Koen Kooi het volgende geschreven:
> 
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> > recipes-misc/images/cloud9-gnome-image.bb |   19 +++++++++++++++++++
> > 1 files changed, 19 insertions(+), 0 deletions(-)
> > create mode 100644 recipes-misc/images/cloud9-gnome-image.bb
> > 
> > diff --git a/recipes-misc/images/cloud9-gnome-image.bb b/recipes-misc/images/cloud9-gnome-image.bb
> > new file mode 100644
> > index 0000000..13638d7
> > --- /dev/null
> > +++ b/recipes-misc/images/cloud9-gnome-image.bb
> > @@ -0,0 +1,19 @@
> > +# Image with cloud9 ide, gfx and hw tools installed
> > +
> > +require cloud9-image.bb
> > +
> > +# SoC specific packages, mostly 3D or multimedia related
> > +SOCSUPPORT = ""
> > +SOCSUPPORT_omap3 = "xbmc libgles-omap3-x11demos gstreamer-ti omapfbplay"
> > +SOCSUPPORT_ti33x = "xbmc libgles-omap3-x11demos gst-ffmpeg mplayer2 beaglebone-capes"
> > +
> > +IMAGE_INSTALL += " \
> > +                  angstrom-task-gnome gimp abiword gedit midori epiphany firefox matchbox-terminal \
> > +                  ${SOCSUPPORT} \
> > +                  ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
> > +                  xinput-calibrator \
> > +                  xterm \
> > +                 "
> > +
> > +export IMAGE_BASENAME = "Cloud9-IDE-GNOME"
> > +
> > -- 
> > 1.7.2.5
> > 
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

