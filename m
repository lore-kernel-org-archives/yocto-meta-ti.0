Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF80CC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 15:46:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.70491.1680018396634753934
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Mar 2023 08:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E21F40C50;
	Tue, 28 Mar 2023 15:46:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzElap_630xy; Tue, 28 Mar 2023 15:46:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2E4D40ACD;
	Tue, 28 Mar 2023 15:46:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BAD6A1637E5; Tue, 28 Mar 2023 11:45:59 -0400 (EDT)
Date: Tue, 28 Mar 2023 11:45:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] mesa/mesa-gl: remove version from bbappend
 file name
Message-ID: <20230328154559.GU18050@denix.org>
References: <20230328025621.15198-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328025621.15198-1-kai.kang@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Mar 2023 15:46:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16249

NAK

1. https://patchwork.yoctoproject.org/project/ti/patch/20230327170809.2115712-1-theodore_roth@trimble.com/


On Tue, Mar 28, 2023 at 10:56:21AM +0800, Kai Kang wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Remove version from mesa/mesa-gl bbappend file names that no need to
> rename them when mesa update.
> 
> Issue: LINUXEXEC-26101

2. Unknown tag


> (LOCAL REV: NOT UPSTREAM) - Send to meta-ti on 20230328

3. Seems inappropriate here


> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../mesa/{mesa-gl_22.%.bbappend => mesa-gl_%.bbappend}            | 0
>  .../recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_%.bbappend} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-ti-bsp/recipes-graphics/mesa/{mesa-gl_22.%.bbappend => mesa-gl_%.bbappend} (100%)
>  rename meta-ti-bsp/recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_%.bbappend} (100%)

4. PowerVR changes are definitely not version agnostic!


> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_%.bbappend
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> rename to meta-ti-bsp/recipes-graphics/mesa/mesa-gl_%.bbappend
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> rename to meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
> -- 
> 2.17.1

