Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13351E01389
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 09:47:53 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA7HlqWj029503;
	Thu, 7 Nov 2013 11:47:52 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA7HlqU0003562;
	Thu, 7 Nov 2013 11:47:52 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 7 Nov 2013 11:47:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA7Hlqg5027718;
	Thu, 7 Nov 2013 11:47:52 -0600
Date: Thu, 7 Nov 2013 12:47:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20131107174751.GR4510@edge>
References: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
	<7D46E86EC0A8354091174257B2FED101597FE834@DLEE11.ent.ti.com>
	<CAMKF1spDWuAjV6Uf=XWBUUYM=f+C+nDzt_7iePjUfktTQ44OkA@mail.gmail.com>
	<20131107165950.GH4510@edge>
	<C8830048-B8B8-4303-90D6-3EB1EBE10E4C@gmail.com>
	<20131107173726.GO4510@edge>
	<516AB7DB-4F1D-4040-A6D7-65413466DBF5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <516AB7DB-4F1D-4040-A6D7-65413466DBF5@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] adjust BBPATH to be a good citizen of layer world
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
X-List-Received-Date: Thu, 07 Nov 2013 17:47:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 07, 2013 at 09:42:50AM -0800, Khem Raj wrote:
> 
> On Nov 7, 2013, at 9:37 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Thu, Nov 07, 2013 at 09:15:40AM -0800, Khem Raj wrote:
> >> 
> >> On Nov 7, 2013, at 8:59 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> >> 
> >>> On Wed, Nov 06, 2013 at 08:55:55PM -0800, Khem Raj wrote:
> >>>> On Wed, Nov 6, 2013 at 8:29 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
> >>>>> This seems like a reversal of http://arago-project.org/git/meta-ti.git?a=commit;h=dabd83e96fe99d0c3d1a88be4d1637831526d217
> >>>>> 
> >>>>> Looks like there may be a need to cover the different use cases and 
> >>>>> understand what each person is trying to do :)
> >>>>> 
> >>>> 
> >>>> ah I see what caused this all pain. So now meta-ti is odd ball out.
> >>>> this patch should have never gone in.
> >>> 
> >>> Khem,
> >>> 
> >>> If you remember, we discussed this with Richard and he suggested this as a 
> >>> solution to the ordering problem. Otherwise people tend to append any extra 
> >>> layers _after_ oe-core, which should be the other way around in order to 
> >>> override anything in there…
> >> 
> >> I think the problem is when you have many other layers then the whole 
> >> paradigm changes to it and you end up with same issue upside down. I think 
> >> how you order bblayer.conf can control the override of oe-core, I wish if 
> >> distro’s could control the layer.conf for each bsp layer then it wouldnt 
> >> matter as much
> > 
> > I agree this is a bigger issue. I looked at some layers and found few that 
> > prepend themselves, while most of others just append.
> > 
> > The order inside bblayers.conf is much more important than people let to 
> > believe. For example, if multiple layers define the machine config, the first 
> > one listed in bblayers.conf wins - this is a real problem for beagleboard.conf 
> > that is currently being defined in meta-ti as well as meta-yocto-bsp (as a 
> > reference platform) and meta-beagleboard too. Very soon the same problem will 
> > happen to beaglebone.conf, when meta-yocto-bsp picks it up as a reference...
> > 
> > Anyway, the biggest issue I'm trying to work around with this change is the 
> > "shadowing" of the new-style DTBs that I ported from Dora to Dylan. If meta-ti 
> > is not in front of oe-core, the old-style DTBs come into play and DTBs are not 
> > built at all. So, this is not really an issue for Dora or master, and those 
> > don't need to be prepended after all…
> 
> 
> Now its even more intriguing since you changed meta-ti/master and I would 
> have expected this change to show up in meta-ti/dylan or are you claiming 
> all sort of oe-core branches to work with meta-ti/master thats a perilous 
> path.

It's in meta-ti/dylan AND meta-ti/master, as I thought the change was 
rather safe. But what I'm saying now is that it's not really needed in 
meta-ti/master, only dylan.

As of meta-ti/master, it should work with oe-core/master and maybe dora, but 
probably it's time to branch of meta-ti/dora, since there were some changes in 
oe-core/master no longer compatible with dora...


> >>>>>> -----Original Message-----
> >>>>>> From: meta-ti-bounces@yoctoproject.org[mailto:meta-ti-
> >>>>>> bounces@yoctoproject.org] On Behalf Of Khem Raj
> >>>>>> Sent: Thursday, November 07, 2013 7:55 AM
> >>>>>> To: meta-ti@yoctoproject.org
> >>>>>> Subject: [meta-ti] [PATCH] adjust BBPATH to be a good citizen of
> >>>>>> layer world
> >>>>>> 
> >>>>>> Currently, meta-ti appears as first path in BBPATH
> >>>>>> rest of layers append so lets do the same
> >>>>>> 
> >>>>>> helps distros with multiple BSP layers to include meta-ti
> >>>>>> 
> >>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>>>> ---
> >>>>>> conf/layer.conf | 2 +-
> >>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>> 
> >>>>>> diff --git a/conf/layer.conf b/conf/layer.conf
> >>>>>> index e39bd85..faa4ac0 100644
> >>>>>> --- a/conf/layer.conf
> >>>>>> +++ b/conf/layer.conf
> >>>>>> @@ -1,5 +1,5 @@
> >>>>>> # We have a conf and classes directory, append to BBPATH
> >>>>>> -BBPATH =. "${LAYERDIR}:"
> >>>>>> +BBPATH .= ":${LAYERDIR}"
> >>>>>> 
> >>>>>> # We have a recipes directory, add to BBFILES
> >>>>>> BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> >>>>>> ${LAYERDIR}/recipes*/*/*.bbappend"
> >>>>>> --
> >>>>>> 1.8.3.2
> >>>>>> 
> >>>>>> _______________________________________________
> >>>>>> meta-ti mailing list
> >>>>>> meta-ti@yoctoproject.org
> >>>>>> https://lists.yoctoproject.org/listinfo/meta-ti
> >>>> _______________________________________________
> >>>> meta-ti mailing list
> >>>> meta-ti@yoctoproject.org
> >>>> https://lists.yoctoproject.org/listinfo/meta-ti
> 

