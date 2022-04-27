Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C279C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 14:44:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9125.1651070645204403788
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 07:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2057440BE9;
	Wed, 27 Apr 2022 14:44:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lo36IvsJTYcp; Wed, 27 Apr 2022 14:44:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D9E4640BD6;
	Wed, 27 Apr 2022 14:43:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1A96D1748EC; Wed, 27 Apr 2022 10:43:55 -0400 (EDT)
Date: Wed, 27 Apr 2022 10:43:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: devarsht@ti.com
Cc: Nishanth Menon <nm@ti.com>, meta-ti@lists.yoctoproject.org,
	praneeth@ti.com, nikhil.nd@ti.com, nsekhar@ti.com, vigneshr@ti.com,
	Ryan Eatmon <reatmon@ti.com>, a-m1@ti.com
Subject: Re: [meta-ti][dunfell][PATCH] u-boot-ti: Use SRCREV to get short
 commit ID
Message-ID: <20220427144355.GK9834@denix.org>
References: <20220419154734.6346-1-devarsht@ti.com>
 <20220419233421.ngbixhxdyjqr7hbc@penholder>
 <851dcd0d-5a62-bf19-2c86-f228ccccede8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <851dcd0d-5a62-bf19-2c86-f228ccccede8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 27 Apr 2022 14:44:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14621

On Wed, Apr 27, 2022 at 07:50:13PM +0530, Devarsh Thakkar via lists.yoctoproject.org wrote:
> 
> On 20/04/22 05:04, Nishanth Menon wrote:
> > On 21:17-20220419, Devarsh Thakkar wrote:
> >> Due to recent security update in git, we are
> >> not able to fetch revision currently using existing method:
> >> https://github.blog/2022-04-12-git-security-vulnerability-announced/
> >>
> >> So instead, use the SRCREV to parse the short commit ID
> >> and set the UBOOT_LOCALVERSION variable.
> >>
> >> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> >> ---
> >>  recipes-bsp/u-boot/u-boot-ti.inc | 10 +---------
> >>  1 file changed, 1 insertion(+), 9 deletions(-)
> >>
> >> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> >> index 231b7647..cc775e2e 100644
> >> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> >> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> >> @@ -1,14 +1,6 @@
> >>  # UBOOT_LOCALVERSION can be set to add a tag to the end of the
> >>  # U-boot version string.  such as the commit id
> >> -def get_git_revision(p):
> >> -    import subprocess
> >> -
> >> -    try:
> >> -        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE, universal_newlines=True).communicate()[0].rstrip()
> >
> > I see a similar logic in
> > recipes-kernel/linux/setup-defconfig.inc as well.
> >
> > Considering similar problem
> >
> > https://lore.kernel.org/all/20220413155249.3458236-2-raj.khem@gmail.com/
> >
> > was wondering as to what might be a better way to solve this?
> >
> > There is also git rev-parse HEAD instances in oe-core as well and
> > bitbake(lib/layerindexlib/cooker.py) as well.
> >
> > I wonder since we know cwd=p, could we use that to set
> > https://git-scm.com/docs/git/2.35.2#Documentation/git.txt-codeGITCEILINGDIRECTORIEScode
> >  (which if my understanding is right, came in around v1.5.5.1-319-g0454dd93bfb2)
> >
> > OR maybe just set it to the base conf similar to what was done on
> > master oe-core/meta/conf/bitbake.conf (commit
> > 02ecf3e2a98a614805f6f2574c2bf14162192d01 "bitbake.conf: Prevent git from
> > detecting parent repo in recipe")?
> >
> > I am not sure if we should considering just side stepping this issue via
> > just not using the git to get the version string.. just my 2 cents.
> 
> My top level understanding was the security update was suggesting to avoid
> 
> doing what we were doing already i.e. calling git from
> 
> a sub-process through a recipe due to security concerns and so avoided
> using git
> 
> and also I think below change also achieves same what was achieved
> before with SRCREV, I have
> 
> similar fix on the kernel bb too which was failing with same error.
> 
> >> -    except OSError:
> >> -        return None
> >> -
> >> -UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
> >> +UBOOT_LOCALVERSION = "-g${@d.getVar("SRCREV", False).__str__()[:10]}"

You should probably use SRCPV here to also work with AUTOREV.


> >>  UBOOT_SUFFIX ?= "img"
> >>  SPL_BINARY ?= "MLO"
> >> -- 
> >> 2.17.1
> >>

