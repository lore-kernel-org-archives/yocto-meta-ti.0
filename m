Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F055E0030B
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 13:47:35 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4E00DJW4ET76F1@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 21 May 2012 15:47:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 63F4B201AD; Mon,
	21 May 2012 16:47:17 -0400 (EDT)
Date: Mon, 21 May 2012 16:47:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Monk, Roger" <r-monk@ti.com>
Message-id: <20120521204717.GA13482@denix.org>
References: <1336651467-17102-1-git-send-email-koen@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B755661@DNCE05.ent.ti.com>
	<F6B9E80B-34AA-44B6-99BA-C875C3589CC1@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B75582C@DNCE05.ent.ti.com>
	<8452F6A8-6078-4C3A-80A9-96528007111B@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B75598B@DNCE05.ent.ti.com>
MIME-version: 1.0
In-reply-to: <4C82F39BABFE6A429733A300DEBF52240B75598B@DNCE05.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Dmytriyenko,
	Denys" <denys@ti.com>
Subject: Re: [PATCH] omapfbplay: import from OE classic
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
X-List-Received-Date: Mon, 21 May 2012 20:47:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 10, 2012 at 02:23:35PM +0000, Monk, Roger wrote:
> On Thu, May 10, 2012 at 15:20:31, Koen Kooi wrote:
> > Subject: Re: [meta-ti] [PATCH] omapfbplay: import from OE classic
> >
> >
> > Op 10 mei 2012, om 16:13 heeft Monk, Roger het volgende geschreven:
> >
> > > On Thu, May 10, 2012 at 15:09:36, Koen Kooi wrote:
> > >> Subject: Re: [meta-ti] [PATCH] omapfbplay: import from OE classic
> > >>
> > >>
> > >> Op 10 mei 2012, om 15:42 heeft Monk, Roger het volgende geschreven:
> > >>
> > >>> Hi Koen,
> > >>>
> > >>> Think we've still got some API incompatibility here.  I needed to
> > >> roll
> > >>> back to an earlier omapfbplay commit
> > >>> (34293052c5a2ae328eac6903512e6b4ce19b5639) and patch CODEC_TYPE :-
> > >>>
> > >>> -        if (afc->streams[i]->codec->codec_type == CODEC_TYPE_VIDEO
> > >> && !st)
> > >>> +        if (afc->streams[i]->codec->codec_type ==
> > >>> + AVMEDIA_TYPE_VIDEO && !st)
> > >>>
> > >>> to get this working on beagleboard-xm, so I suspect there may have
> > >> been an API change after Aug11, or
> > >> d03f042ecac0a231bedeadc7a6c67f0102d5505a was rebased against 0.8
> > >> branch?  I guess we should ask Mans...
> > >>
> > >> We still use libav 0.7.4 in meta-oe, I suspect Mans updated to
> > >> 0.8.x or even newer. I only build tested it, so I'm open for fixes
> > >> that make it run :) Upgrading libav might be an option as well, but
> > >> I'm not sure of that will get accepted for the meta-oe release branch.
> > >
> > > See attached for now - probably ok as reasonable known working
> > baseline before we upgrade other bits?
> >
> > The patch looks good to me. Once the beaglebone a6 release it out I'll
> > have time to look at libav. I'll need it for a customer project in
> > that timeframe as well. Thanks for updating the patch!
> 
> Np! - you gave me great head-start! - I'll re-send via git send-email.

BTW, do we want to have PROVIDES and PREFERRED_PROVIDER for all those 
different variants of omapfbplay?

-- 
Denys

