Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529C8C27C76
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 22:11:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.88714.1674252705944627032
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 14:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E399340C98;
	Fri, 20 Jan 2023 22:11:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EM-cgilJ32Av; Fri, 20 Jan 2023 22:11:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A144E40C52;
	Fri, 20 Jan 2023 22:11:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 43B54163700; Fri, 20 Jan 2023 17:11:20 -0500 (EST)
Date: Fri, 20 Jan 2023 17:11:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Sapp, Randolph" <rs@ti.com>
Cc: denys@ti.com, reatmon@ti.com, detheridge@ti.com,
	meta-ti@lists.yoctoproject.org, k-bhargav@ti.com
Subject: Re: [EXTERNAL] Re: [meta-ti] [master/kirkstone][PATCH] all:
 Graphics recipe overhaul
Message-ID: <20230120221120.GR22689@denix.org>
References: <20230119204026.1297616-1-rs@ti.com>
 <20230120182636.GP22689@denix.org>
 <SBSSOR.I33PHI6LU4AA@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SBSSOR.I33PHI6LU4AA@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 22:11:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15615

On Fri, Jan 20, 2023 at 12:50:16PM -0600, Sapp, Randolph wrote:
> On Fri, Jan 20 2023 at 01:26:36 PM -0500, Denys Dmytriyenko
> <denis@denix.org> wrote:
> >E.g. if you are copying the entire Mesa set of recipes, include
> >files and
> >patches, it should have been a separate patch with just that w/o any
> >modifications, clearly stating that this is a verbatim copy and
> >specify which
> >repo and branch/tag they are being picked up from -
> >openembedded-core repo,
> >kirkstone branch.
> >
> >But then I would argue that a simple mesa_%.bbappend is smaller
> >and much
> >easire to review. For example, I took your previous v4 revision of
> >the patch
> >and dropped all copies of upstream Mesa, replacing it with a bbappend:
> >https://patchwork.yoctoproject.org/project/ti/patch/20230119010333.3414485-1-denis@denix.org/
> 
> Right, sorry about that. You are correct that the duplication of
> mesa and mesa patches should have occurred in a separate patch,
> however it should not be a blanket BB appends. The reason this
> duplication exists is that upstream mesa will move faster than our
> modified versions (as much as I would like to avoid it) and this
> will prevent things from silently creeping forward and breaking. The
> umlibs are still dependent on particular, patched releases of mesa.

Well, there are pros and cons to both approaches. And I would be more inclined 
to agree with you that it is necessary to copy over the entire Mesa recipes, 
if you were trying to apply patches on top of the upstream version. But, you 
are completely changing SRC_URI and SRCREV anyway to point to your own tree, 
so it doesn't matter very much what underlying version of the recipe you start 
with. I do believe it would just work for the master with 22.2.3 version. 
Sure, recipes sometimes change significantly and break your bbappend, but 
that's when it will be the time to consider carrying the full set of older 
version, sometime in the future.

As an example, we've been carrying bbappends in meta-ti for upstream optee and 
trunsted-firmware-a recipes from meta-arm - sometimes we fall behind and stick 
to an older version, but sometimes we update to a newer version earlier than 
upstream. That's been working for several years and quite successful for the 
most part...

On the other side of the spectrum, there's ltp-ddt recipe that is based on top 
of the upstream ltp recipe of a specific version. It's not exactly a bbappend, 
but close enough. When upstream upgrades to a newer version, we end up copying 
the specific previous version locally side-by-side. Later, when we rebase 
ltp-ddt and catch up with the ltp version upstream, we can remove the 
duplicate.

In other words, *IF* we end up duplicating Mesa recipes locally, I'd argue we 
should keep them unmodified and apply any modifications through bbappend. If 
needed, you can make it version-specific, e.g. mesa_22.0.%.bbappend. That way 
in kirkstone you only need this bbappend, but in langdale/mickledore you may 
end up having a local copy of *unmodified* mesa_22.0.3.bb from kirkstone along 
with this mesa_22.0.%.bbappend on top. In other words - if you refrain from 
modifying the local duplicates of upstream files and keep them intact, it 
would be much easier to maintain long term...


> On Fri, Jan 20 2023 at 01:26:36 PM -0500, Denys Dmytriyenko
> <denis@denix.org> wrote:
> >I looked at this repo - it's a personal copy of upstream Mesa with
> >Imagination
> >PVR patches applied on top. Was it reviewed and approved by OSRB?
> >Were the
> >patches made public before and/or permitted to be
> >published/distributed?
> 
> Those patches inherited the license of mesa and therefore did not
> need approval from OSRB.

Oh, you can never ever assume anything when it comes to legal matters!
That's why OSRB was formed in the first place and I was around back then 
and indirectly involved in that...


> I did, however, get IMG's grace to release them anyway.

Ok, this is great!


> The reason why it's a personal repo is there is certain
> functionality that I believe can be upstreamed and I believe hosting
> that process on freedesktop will help reduce friction and be a
> little more transparent about our efforts.

As far as I know, OSRB requires a special exception for official TI software 
to be hosted in personal repos. Please do due diligence and run it by the 
OSRB/Legal! Always CYA... :)


> On Fri, Jan 20 2023 at 01:26:36 PM -0500, Denys Dmytriyenko
> <denis@denix.org> wrote:
> >Only rogue?
> 
> Only rogue. I added all the necessary hooks for sgx but it still
> needs work before it can fall in line with my changes. The mesa
> layer needs some TLC and the umlibs will need some packaging
> changes. Thankfully SGX can now be disabled until we have it working
> by removing powervr-sgx-graphics from the distro features string.

Well, the massive Beagle community would have to suffer longer... :(

-- 
Denys

