Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95737E002A5
	for <meta-ti@yoctoproject.org>; Wed,  8 Aug 2012 12:42:16 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q78JgFLO007031;
	Wed, 8 Aug 2012 14:42:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q78JgFDk030366;
	Wed, 8 Aug 2012 14:42:15 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 8 Aug 2012 14:42:14 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q78JgEGi024747;
	Wed, 8 Aug 2012 14:42:14 -0500
Date: Wed, 8 Aug 2012 15:42:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120808194211.GE7572@edge>
References: <8F29D6B095ED194EA1980491A5E029710C27E75F@DFLE30.ent.ti.com>
	<102FAACD-FA2C-45CD-B8E8-E1BF93554183@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED10159175366@DLEE12.ent.ti.com>
	<307F2CD6-B16B-4EC7-A670-06361B199D00@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <307F2CD6-B16B-4EC7-A670-06361B199D00@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [branch: master][PATCHES] Porting netbase interfaces file from oe-classic
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
X-List-Received-Date: Wed, 08 Aug 2012 19:42:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 02, 2012 at 05:07:36PM +0200, Koen Kooi wrote:
> 
> Op 2 aug. 2012, om 16:53 heeft "Maupin, Chase" <chase.maupin@ti.com> het volgende geschreven:
> 
> >> -----Original Message-----
> >> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >> bounces@yoctoproject.org] On Behalf Of Koen Kooi
> >> Sent: Wednesday, August 01, 2012 10:59 PM
> >> To: Cooper Jr., Franklin
> >> Cc: meta-ti@yoctoproject.org
> >> Subject: Re: [meta-ti] [branch: master][PATCHES] Porting netbase
> >> interfaces file from oe-classic
> >> 
> >> Please send patches inline to make review easier.
> >> 
> >> Patch 1:
> >> 
> >>> * Add PR_append
> >> 
> >> Don't do that, that's what PRINC is for
> >> 
> >>> * Pull in the base interface file from oe-core
> >> 
> >> Completely unneeded
> > 
> > I actually prefer that the first commit move in the base file he
> > is modifying and then have the second commit make his changes.
> > It is much easier to understand what change he was making to the
> > base file and why he needing to overlay it.
> 
> My point is that you're now *globally* modifying basefiles for *all* 
> machines, including non-TI ones as soon as you have meta-ti in the layer 
> stack, which is unacceptable. If you really want a catch-all interfaces 
> file, put it in meta-arago.

FYI, after discussing this internally, we agreed to not modify basefiles 
globally, but rather provide SOC-specific version where possible, or even 
machine-specific, when needed. In this particular case, we'll have a 
ti33x-specific interfaces file, which will be overwritten by 
beaglebone-specific one. PRINC should also be used in meta-ti bbappends.

Franklin, will you be resending the updated patch?

-- 
Denys

