Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 348D4E0048B
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 10:30:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7AHUfYU012354;
	Sat, 10 Aug 2013 12:30:41 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7AHUfAN022736;
	Sat, 10 Aug 2013 12:30:41 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 10 Aug 2013 12:30:41 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7AHUfTO025006;
	Sat, 10 Aug 2013 12:30:41 -0500
Date: Sat, 10 Aug 2013 13:30:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20130810173039.GA27433@edge>
References: <alpine.DEB.2.02.1308091920590.10592@oneiric>
	<CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
	<CAFZh4h9V7-06jGW2Sz4ksKRFEBabDchiY2aMdMeriF6NGPxJ8g@mail.gmail.com>
	<alpine.DEB.2.02.1308100611110.2277@oneiric>
	<CAFZh4h-w1MnoXZ-u5592OLDMUADmACSYZb4edncWEprjQ8qHcg@mail.gmail.com>
	<alpine.DEB.2.02.1308100651500.3147@oneiric>
	<CAFZh4h88M0R9dC6-t4F5dgZPFEOJx2dEk_pQxQhpWC-B3R1ubg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h88M0R9dC6-t4F5dgZPFEOJx2dEk_pQxQhpWC-B3R1ubg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: should mesa_9.1.5.bbappend be upgraded to 9.1.6?
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
X-List-Received-Date: Sat, 10 Aug 2013 17:30:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Aug 10, 2013 at 07:21:12AM -0400, Brian Hutchinson wrote:
> >
> > .
> >
> >   anyway, as i said, masking out recipes-graphics was a stopgap
> > measure, but i'd rather do this the "right" way, if someone wants to
> > explain what the "right" way is.
> >
> > rday
> >
> 
> I don't know.  I first renamed mesa_9.1.5.bbappend to messa_9.1.6.bbappend
> and that worked to continue my build but like I said I ran into other
> issues ... if you look back a few days you can see where I posted about
> that.  What worked for me was a clean checkout of the branches.  YMMV I
> guess :)

So, both of you went back and forth for couple days, generating dozens of 
emails, but nobody offered a trivial rename patch to fix it... :)

Anyway, it's fixed now - I just wasn't paying attention to the master for the 
past few days and didn't have time to take care of it right away.

The problem with mesa is that it now gets bumped to every minor version on 
almost a weekly basis and sometimes I just miss the fact that it broke 
meta-ti/master due to the bbappend we have. I need to try to push that change 
we carry to oe-core so we wouldn't need a bbappend...

-- 
Denys

