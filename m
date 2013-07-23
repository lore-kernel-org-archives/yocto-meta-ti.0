Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 880A0E0152B
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 10:28:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NHSdAt009088;
	Tue, 23 Jul 2013 12:28:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NHSdD1024877;
	Tue, 23 Jul 2013 12:28:39 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 12:28:38 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NHScjn007077;
	Tue, 23 Jul 2013 12:28:39 -0500
Date: Tue, 23 Jul 2013 13:28:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20130723172837.GS31158@edge>
References: <CAFZh4h8osM3+bExMHS8zP-YU56h=hsSqjRfAC7Vo9Qu1_kze-w@mail.gmail.com>
	<20130710164618.GD16407@edge>
	<CAFZh4h-W=557rBxsehQhzpgJuxk+Z5BmKeboNk2eAGnBt8vBUQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015965BBDC@DLEE11.ent.ti.com>
	<CAFZh4h-eQBem7qVQnE_=Hf_bccvONrFA174Xr3AdpGw7-5dawQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h-eQBem7qVQnE_=Hf_bccvONrFA174Xr3AdpGw7-5dawQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Tue, 23 Jul 2013 17:28:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 17, 2013 at 09:25:37AM -0400, Brian Hutchinson wrote:
> On Wed, Jul 17, 2013 at 9:14 AM, Maupin, Chase <chase.maupin@ti.com> wrote:
> 
> > [CEM] Generally not too hard.  You can often start with the old arago
> > machine and move that in with some cleanup.  Then you will need to
> > move/create the bootloader and kernel recipes as well, again looking for
> > cleanup.  That should give you a basic working system.  The main issue is
> > that someone needs to be signed up to keep those recipes working and up to
> > date.  That is what is missing in most cases is a maitainer.****
> 
> Thanks Chase,  I kind of figured it was a (people) bandwidth problem.  At
> the moment I'm using a custom board based on the ti816x so I don't need
> kernel or u-boot (already have those working for the board and since the
> kernel for this platform was never mainlined, it doesn't have much churn)
> but simply need packages built using all the Cortex-A8 flags.  I guess I
> could be lazy and just build for Beagleboard or something since the ABI's
> would be the same but I thought I would ask how to go about it the right
> way.  Also, there have been several revs of silicon for that part and I'm
> about to acquire the most up-to-date EVM so I could add machine support for
> that.
> 
> I'll check out that commit you mentioned and start coming up to speed on
> what is involved.

Brian,

So, are you willing to become a maintainer for that platform? I've heard from 
several other people in the community before, who expressed interest, but 
never came back with the final decision yet... Let me know what you decide. 
Thanks.

-- 
Denys

