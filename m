Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C6CECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 16:10:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14322.1662048633146029422
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 09:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 18AA240D64;
	Thu,  1 Sep 2022 16:10:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTAbQtHqof4e; Thu,  1 Sep 2022 16:10:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E029B40D62;
	Thu,  1 Sep 2022 16:10:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1D3E11749C9; Thu,  1 Sep 2022 12:10:27 -0400 (EDT)
Date: Thu, 1 Sep 2022 12:10:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 1/3] meta-ti: Rename j7-evm to
 j721e-evm
Message-ID: <20220901161027.GK18429@denix.org>
References: <20220831175315.15942-1-afd@ti.com>
 <20220831175315.15942-2-afd@ti.com>
 <f5281106-4ac9-a76b-1a3c-44d87e46733b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5281106-4ac9-a76b-1a3c-44d87e46733b@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Sep 2022 16:10:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14985

On Thu, Sep 01, 2022 at 10:31:42AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 8/31/2022 12:53, Andrew Davis wrote:
> >In many places we use "j7" (the family name) when we should be using a
> >specific SoC or EVM and vice-versa. For instance when including graphics
> >drivers we add for all the "j7" family, but what we really want is only
> >for some specific j7 SoCs.
> >
> >First step in untangling this is to make it clear that there is no SoC
> >called "j7". There is a SoC called j721e with a j721e-evm.
> >
> >Fix up this naming here.
> >
> >Signed-off-by: Andrew Davis <afd@ti.com>
> >---
> >  .../{j7-evm-k3r5.conf => j721e-evm-k3r5.conf}  |  4 ++--
> >  conf/machine/{j7-evm.conf => j721e-evm.conf}   |  4 ++--
> >  ...sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} |  6 +++---
> >  ...hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} |  4 ++--
> >  .../{j7-hs-evm.conf => j721e-hs-evm.conf}      |  6 +++---
> >  .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb     |  2 +-
> >  .../ti-img-rogue-driver_1.15.6133109.bb        | 10 +++++-----
> >  recipes-bsp/sciclient/sciclient-rtos_git.bb    |  6 +++---
> >  .../viddec-test-app_1.0.0.bb                   |  2 +-
> >  .../videnc-test-app_1.0.0.bb                   |  2 +-
> >  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         | 18 +++++++++---------
> >  .../trusted-firmware-a_%.bbappend              |  2 +-
> >  .../ti-img-rogue-umlibs_1.15.6133109.bb        |  6 +++---
> >  recipes-kernel/linux/kernel-rdepends.inc       |  4 ++--
> >  recipes-security/optee/optee-os_%.bbappend     |  2 +-
> >  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb     |  2 +-
> >  16 files changed, 40 insertions(+), 40 deletions(-)
> >  rename conf/machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf} (81%)
> >  rename conf/machine/{j7-evm.conf => j721e-evm.conf} (87%)
> >  rename conf/machine/{j7-hs-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} (53%)
> >  rename conf/machine/{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} (81%)
> >  rename conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf} (85%)
> >
> >diff --git a/conf/machine/j7-evm-k3r5.conf b/conf/machine/j721e-evm-k3r5.conf
> >similarity index 81%
> >rename from conf/machine/j7-evm-k3r5.conf
> >rename to conf/machine/j721e-evm-k3r5.conf
> 
> 
> So this changes the name of the yocto build machine label...  This
> will be impactful to users used to building j7-evm and for our build
> and testing scripts.  I will need to test this and work with Minas
> to make changes on the testing side before I can merge it in.

Right. This was a good and timely change for kirkstone, but is it worth the 
effort for dunfell? Supposed to be a stable release branch and avoid breakages 
like this...

-- 
Denys

