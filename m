Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 743D0E013D6
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 11:36:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6BIa8Kj002817;
	Thu, 11 Jul 2013 13:36:08 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6BIa8Sj002966;
	Thu, 11 Jul 2013 13:36:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 11 Jul 2013 13:36:08 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6BIa8S7023162;
	Thu, 11 Jul 2013 13:36:08 -0500
Date: Thu, 11 Jul 2013 14:36:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20130711183607.GR18647@edge>
References: <CAFZh4h8osM3+bExMHS8zP-YU56h=hsSqjRfAC7Vo9Qu1_kze-w@mail.gmail.com>
	<20130710164618.GD16407@edge>
	<CAFZh4h_+1hgc9SJ1WrNgDL07Lj7JjwfHZLecf+RrWcVEyeprPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h_+1hgc9SJ1WrNgDL07Lj7JjwfHZLecf+RrWcVEyeprPQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Which machine type to use for DaVinci DM6446 and TI816x?
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
X-List-Received-Date: Thu, 11 Jul 2013 18:36:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 10, 2013 at 01:28:55PM -0400, Brian Hutchinson wrote:
> On Wed, Jul 10, 2013 at 12:46 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Tue, Jul 09, 2013 at 11:21:13AM -0400, Brian Hutchinson wrote:
> > > Hi,
> >
> > Hey, Brian,
> >
> > Long time no see!
> >
> >
> > > I have to support DaVinci DM6446, AM1808, OMAP-L138 and C6A816x which has
> > > turned into TI816x in later silicon releases.
> > >
> > > I'm trying to figure out what conf/machine to use for the above SoC's.
> > >
> > > In Denzil, I see am389x-evm.conf and c6a816x-evm.conf and both include
> > the
> > > same ti816x.inc file, but I do not see support for this machine in Danny
> > or
> > > Dylan (unless I'm missing something).  How should I go about using Dylan
> > > with the ti816x?
> >
> > http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1544
> >
> >
> > > For DaVinci DM6446, I don't see an obvious machine type that supports it
> > > but I know that the DM6446, AM1808 and OMAP-L138 are all in the same
> > ARM926
> > > family (da850) so should I be using the am1808-evm.conf for DaVinci
> > DM6446?
> >
> > DM6446 is quite different from OMAP-L138. Both AM180x and DA850 are just
> > derivatives of OMAP-L138.
> >
> > Anyway, DM6446 is no longer supported, as it's a very old platform.
> >
> >
> > > I've always used Arago or Angstrom for DM6446 support in the past and so
> > > I'm not sure which .conf I should be using with meta-ti.  My gut says use
> > > am1808-evm.conf but I thought I should ask to be sure.
> >
> > --
> > Denys
> >
> 
> Hey Denys,
> 
> Wow, I wasn't expecting support to be dropped.  I'm sure there is still a
> bunch of people using it.  I guess I could maybe maintain it if someone
> would give pointers on how to go about it.
> 
> OK, so how about this ... I use the same u-boot and kernel that I'm
> currently using (but built with the same toolchain to build the rootfs ...
> meta-toolchain) but use am180x-evm to build the rootfs & packages of other
> stuff I need?  I mainly need to have the packages kept relatively up to
> date (security patches etc.).
> 
> Do you see anything wrong with that approach?  Same ABI right?

Brian,

Unfortunately, keeping support in meta-ti is often seen as entitlement to 
continuously forward-port features to all the new SW components - u-boot, 
kernel, IPC, etc. But that is not true for some platforms, if there are no 
development resources allocated to do so. So, some things get dropped due to 
limited bandwidth, sorry.

Your suggestion might work and you are welcome to try it out. Please let me 
know if you'd be interested in maintaining any of those outdated platforms 
going forward. Thanks.

-- 
Denys

