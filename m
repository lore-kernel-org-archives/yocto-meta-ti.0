Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AADC54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 17:18:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.47360.1675099117368933934
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 09:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2584140BA8;
	Mon, 30 Jan 2023 17:18:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_MTk9Oe-k-e; Mon, 30 Jan 2023 17:18:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EE826408CD;
	Mon, 30 Jan 2023 17:18:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 19B95163712; Mon, 30 Jan 2023 12:18:11 -0500 (EST)
Date: Mon, 30 Jan 2023 12:18:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>, meta-ti@lists.yoctoproject.org,
	ricardo@foundries.io, Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-ti][master/kirkstone][PATCH] bsp: multiconfig: k3r5:
 allow customization by donwstream layers
Message-ID: <20230130171811.GJ22689@denix.org>
References: <20230130152000.705123-1-jose.quaresma@foundries.io>
 <74d5bfd6-556b-6194-ca78-771d86509e5f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74d5bfd6-556b-6194-ca78-771d86509e5f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 17:18:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15702

On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 1/30/2023 9:20, Jose Quaresma wrote:
> >This patch adds the possibility to change some bitbake variable
> >that cannot be changed anywhere else, one of then is the TMPDIR.
> >
> >Using the same TMPDIR it is very sensitive and prone to several errors
> >when used in more complex situations.
> >This configuration forces that all native packages have to be the same between all
> >machines and this requirement is very easy to break.
> >Suppose you use a macinhe override somewhere on a native recipe

Even w/o multiconfig, this will break for multi-machine builds. Native 
packages are for the build host and have no knowledge about the target. 
You should probably look into cross packages instead of native ones for 
this use case.

Altering native packages between different targets will cause them to 
rebuild, which they shouldn't. Moreover, it will mess up your sstate 
and lead to weird issues down the road when trying to re-use your 
sstate mirror/cache.


> >and this requirement is no longer met.
> >Many of these anomalies can be verified with the use of the rm_work and
> >create-spdx bitbake classes.
> >
> >A previous attempt [1] had already been made but was refused
> >but this way it can be done without side effects for other users.
> >
> >[1] https://lists.yoctoproject.org/g/meta-ti/message/14767
> 
> 
> So the difference between this patch and the previous one, is that
> you are now included a file that is not there normally so that you
> can put the contents of the previous patch in the new include file
> to get around the issue in the archiver.
> 
> I'm not saying I'm opposed to this approach (yet), I'm just trying
> to understand the entire story.
> 
> Did you find anything in looking at fixing the archiver to better
> support the multi-config issue?
> 
> 
> 
> >Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >---
> >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> >diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >index deb07210..b69c5d6d 100644
> >--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >@@ -3,3 +3,5 @@ MAINMACHINE := "${MACHINE}"
> >  DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
> >  MACHINE:append = "-k3r5"
> >+
> >+include conf/multiconfig/k3r5.inc

