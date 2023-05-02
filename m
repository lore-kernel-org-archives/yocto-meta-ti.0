Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF40C77B75
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 22:48:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5382.1683067720670847181
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 May 2023 15:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9906240C5D;
	Tue,  2 May 2023 22:48:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6yRI8bE1S02Q; Tue,  2 May 2023 22:48:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6277740C1C;
	Tue,  2 May 2023 22:48:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EB8E91638BC; Tue,  2 May 2023 18:47:53 -0400 (EDT)
Date: Tue, 2 May 2023 18:47:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: afd@ti.com, detheridge@ti.com, reatmon@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re:
 [meta-ti][master/kirkstone][PATCH] all: http to https everything
Message-ID: <20230502224753.GE9226@denix.org>
References: <20230428002809.1930898-1-rs@ti.com>
 <3d1cd334-740c-936e-ad61-3c02131dfd09@ti.com>
 <20230428015903.GS9226@denix.org>
 <7f53699d-3fac-da19-2340-89cca2c668d0@ti.com>
 <20230502190921.GB9226@denix.org>
 <927650ff-ff22-d64a-2aa4-988de3f0a8fb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <927650ff-ff22-d64a-2aa4-988de3f0a8fb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 22:48:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16476

On Tue, May 02, 2023 at 04:49:28PM -0500, Randolph Sapp wrote:
> On 5/2/23 14:09, Denys Dmytriyenko wrote:
> >On Fri, Apr 28, 2023 at 11:24:11AM -0500, Randolph Sapp wrote:
> >>On 4/27/23 20:59, Denys Dmytriyenko wrote:
> >>>On Thu, Apr 27, 2023 at 07:31:16PM -0500, Randolph Sapp wrote:
> >>>>On 4/27/23 19:28, rs@ti.com wrote:
> >>>>>From: Randolph Sapp <rs@ti.com>
> >>>>>
> >>>>>All of the software-dl links 302 to https urls anyway. Just jump
> >>>>>straight to the secure version.
> >>>>>
> >>>>>Signed-off-by: Randolph Sapp <rs@ti.com>
> >>>>>---
> >
> ><snip>
> >
> >
> >>>>>diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
> >>>>>index f0992aa7..77d23b6d 100644
> >>>>>--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
> >>>>>+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
> >>>>>@@ -11,7 +11,7 @@ require ../includes/ti-eula-unpack.inc
> >>>>>  S = "${WORKDIR}/cgt470_${PV}"
> >>>>>-SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
> >>>>>+SRC_URI = "https://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
> >>>>
> >>>>Don't actually merge this. Wanted to take this opportunity to ask
> >>>>what on earth theses SRC_URIs are. What do these mean, what's the
> >>>>story?
> >>>
> >>>Heh, these were placeholders for "clickwrap" packages, which at some point
> >>>long time ago TI Legal considered a "great" way to distribute software...
> >>>Basically, there was no direct download URL - you must have downloaded them
> >>>manually by filling out an online form and signing some sort of an agreement,
> >>>which would trigger the download. Then you "install the source into the local
> >>>downloads dir" (hence the name) by copying what you've downloaded manually
> >>>into your ${DL_DIR} and Bitbake would be able to find it there regardless of
> >>>the actual SRC_URI.
> >>>
> >>
> >>Oh cool, I hate it. (Thanks for the explanation, I just really don't
> >>like this idea.) Can we drop these (install methods or packages if
> >>necessary) or will policy not allow it?
> >
> >Nobody likes it on the engineering side! :) But it was forced back in the day
> >by sales/marketing/legal and took a lot of effort to convince everyone that
> >this clickwrap stuff doesn't bring much benefit, but causes damage...
> >
> >Since then most if not all of TI packages dropped clickwrap and allowed direct
> >download. Hence you don't see a lot of these weird URLs in recipes any more.
> >
> >Not sure about CodeGen Tool for TMS470 MCU and if there were newer releases or
> >if it's still active - nobody cared to update this recipe in over 10 years.
> >Other CGT recipes for ARM, PRU, C6x, C7x etc. in that recipes-ti/devtools
> >directory were kept mostly up to date, but not for TMS470. Not sure if there
> >are any downstream users anymore, maybe time to remove it...
> >
> 
> I'll add a patch to drop codegen then. It'll be a little bit of a
> scream test but I'm sure it's fine. The C7 / C6 components I know
> still have a few dependents in meta-arago though, so I don't think
> those can be dropped. Will see if there is a non-clickwrapped source
> for those yet.

Ah, there's still an older C6x CGT 7.4.16 that is clickwrapped - at some point 
there was one component remaining that required it, while everything else got 
migrated to C6x CGT 8.x, which enabled direct download and we have a recipe 
for version 8.3.2 already. And the recipe for older 7.x was specifically in 
its own namespace to allow both of them in the same build, until the last 
dependency for it goes away.

C7x CGT never was clickwrapped, as the arch is newer than those dark times :)

BTW, assuming that meta-arago is the only consumer of meta-ti components is 
not very safe. But I think dropping CGT for TMS740 and old CGT 7.x for C6x 
should be fine and those are the only remaining clickwrapped recipes.

IIRC, TMS740 arch was an old ARM MCU, so generic ARM CGT should probably also 
work, I guess.


> >>Also, is this URI
> >>functionality baked into the http fetcher or is this just leaning on
> >>bitbake being unable to resolve the domain and then falling back on
> >>the local copy?
> >
> >This is basic Bitbake fetcher functionality and is well documented. High level
> >order of operations to locate sources:
> >
> >1. Check if you already have them in your local DL_DIR
> >2. Go through the list of configured PREMIRRORS to locate the sources there
> >3. Actually hit the upstream SRC_URI and try to download the original src
> >4. If everything else fails, check through the list of "post" MIRRORS
> >
> >So, requiring user to pre-download the sources manually and placing them in
> >their local DL_DIR per the original documentation would shortcut the process
> >at step 1.
> >
> >Otherwise it would break at step 3 (and 4) and hopefully the weird URL would
> >give user some clues or at least force to read the docs...
> >
> >There's nothing special about the URL, besides the convention that .local is
> >reserved - https://en.wikipedia.org/wiki/.local - and the entire name
> >suggesting to install the sources in local dir :)
> >
> 
> Ah, alright. At least this isn't that bad then. I still don't like
> the idea of being able to reach steps 3&4 in this case as it will
> check http sources. Local is reserved but it's still not a great
> idea to allow this fetch to go through, even if *ideally* it should
> fail to resolve.

You can try adding do_fetch[network] = "0" to that recipe...

-- 
Denys

