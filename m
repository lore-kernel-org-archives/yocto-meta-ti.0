Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C595C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 16:33:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.18659.1713371581046426055
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 09:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 67B3A40C81;
	Wed, 17 Apr 2024 16:33:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geeO8P1hexJH; Wed, 17 Apr 2024 16:33:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1D5EC40A2F;
	Wed, 17 Apr 2024 16:32:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D32DD163F21; Wed, 17 Apr 2024 12:32:56 -0400 (EDT)
Date: Wed, 17 Apr 2024 12:32:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 0/3] Plan to better support non-LTS
 branches
Message-ID: <20240417163256.GN28791@denix.org>
References: <20240417161129.9697-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417161129.9697-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 16:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17580

Thanks for doing this! This is pretty much exactly as we discussed yesterday, 
so besides a minor comment/issue in patch #3, you have my Ack for the series.


On Wed, Apr 17, 2024 at 11:11:26AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Since we do not directly support the non-LTS branches, customers are
> forced to rely on master for projects that make use of those branches.
> We are not going to start creating branches for all of the non-LTS
> releases, but we can do a better job of having master continue to
> support the  branches that are still supported by the Yocto project [1].
> 
> Recently we added and removed a patch to support the uboot mainline that
> required the python3-yamllint package.  We were not thinking about
> customers trying to use the uboot mainline who might be currently locked
> into nanbield and not master.
> 
> This series seeks to restore that reverted patch and create a system by
> which we can schedule the removal of these temporary patches.
> Additionaly it updates the compatible layer list to those with active
> support by the Yocto project [1].
> 
> [1] https://wiki.yoctoproject.org/wiki/Releases
> 
> Ryan Eatmon (3):
>   python3-yamllint: Temporarily carry this new recipe
>   TODO: Add TODO list
>   conf/layer.conf: Update LAYERSERIES_COMPAT
> 
>  TODO                                              |  9 +++++++++
>  meta-ti-bsp/conf/layer.conf                       |  2 +-
>  meta-ti-extras/conf/layer.conf                    |  2 +-
>  .../python-yamllint/python3-yamllint_1.33.0.bb    | 15 +++++++++++++++
>  4 files changed, 26 insertions(+), 2 deletions(-)
>  create mode 100644 TODO
>  create mode 100644 meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb
> 
> -- 
> 2.17.1

