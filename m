Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A29D5E00294;
	Wed, 21 Nov 2012 15:39:56 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qALNdsJ1024700;
	Wed, 21 Nov 2012 17:39:54 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qALNdsXg003603;
	Wed, 21 Nov 2012 17:39:54 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 21 Nov 2012 17:39:54 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qALNdsv8024400;
	Wed, 21 Nov 2012 17:39:54 -0600
Date: Wed, 21 Nov 2012 18:39:54 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-ID: <20121121233953.GD11734@edge>
References: <CAOT3miJ73uAvR0Qij3+-q3B6K46=J5ZoFZDzW79YCSUfPbLeAA@mail.gmail.com>
	<CAJTo0LYLf=296eEZznK7vnFTJZhAS_u1opuXdyJ=MUvRYF1Asw@mail.gmail.com>
	<CAOT3miJf7yh=1c-xxfZ-sxZt4RUvufcgVTMv0Dzw=kSbz5wXaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOT3miJf7yh=1c-xxfZ-sxZt4RUvufcgVTMv0Dzw=kSbz5wXaA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, rob@ti.com, "Burton,
	Ross" <ross.burton@intel.com>, yocto <yocto@yoctoproject.org>
Subject: Re: [yocto] build failure with xf86-video-omap
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
X-List-Received-Date: Wed, 21 Nov 2012 23:39:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 22, 2012 at 12:26:12AM +0100, Nicolas Dechesne wrote:
> looping rob clark (upstream author)
> 
> 
> On Thu, Nov 22, 2012 at 12:07 AM, Burton, Ross <ross.burton@intel.com>wrote:
> 
> > On 21 November 2012 22:52, Nicolas Dechesne <ndec13@gmail.com> wrote:
> > > since xf86-video-omap was recently merged in oe-core and poky, i am
> > trying
> > > to remove the recipes we had staged in meta-ti trees for some weeks
> > > (
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=410dc026f2ee24a2346e7563a83f0181c79809cf
> > ).
> > > so i was trying to build  poky/master with meta-ti/master, for
> > pandaboard,
> > > and I get build failures in xf86-video-omap [1] and [2].
> > >
> > > so [1] is actually trivial, as we are missing a DEPENDS in the recipe, i
> > can
> > > send a patch in oe-core for that.
> >
> > Please do.
> >
> 
> sure, will do.
> 
> >
> > > [2] is a bit more cryptic to me.. so I quickly tried to build with danny
> > ( i
> > > just cherry picked the commit that introduced xf86-video-omap from
> > master)
> > > and this time it built fine.
> > >
> > > has anyone actually tested this recipe? if so I must be doing something
> > > wrong, any hint would be helpful.
> >
> > This was discussed a few hours ago.  It's caused by a) the
> > configure.ac being broken and b) the workaround for this being removed
> > by me in e828faf027540bc5def8b7371a959884caad9557 (which is in master
> > only).  Presumably this code was test built before that patch landed.
> >
> > As this is a genuine upstream bug (ARM-specific driver that doesn't
> > cross-compile?!) I've just filed fdo #57386.
> >
> 
> i suspect you opened a OE bug, since I can't find it in yocto BZ, however
> bugs.openembedded.org doesn't seem to answer at the moment..

AFAIK, OE bugzilla was deprecated some time ago. We were considering taking it 
down, as a matter of fact. OE-Core issues are logged into Yocto bugzilla. Not 
sure where Ross filed this one though.


> so, I checked our configure.ac , and clearly, that needs some love...
> 
> Rob: any chance you can look into that? it's the xf86-video-omap
> configure.ac file that's wrong, we should mimic what's in the
> xf-video-intel one i guess..  otherwise i can try later this week.

-- 
Denys

