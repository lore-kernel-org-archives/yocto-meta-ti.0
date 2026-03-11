Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289E4112588E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 20:07:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5676.1773259625426294908
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 13:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B331140C79;
	Wed, 11 Mar 2026 20:07:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PL8rUgjl9u67; Wed, 11 Mar 2026 20:07:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7AAA040B05;
	Wed, 11 Mar 2026 20:07:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DD582179DFA; Wed, 11 Mar 2026 16:07:00 -0400 (EDT)
Date: Wed, 11 Mar 2026 16:07:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: s-sadik@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Prudhvi Veeramachaneni <prudhvi@ti.com>
Subject: Re: [meta-ti] [master][PATCH v4 0/3] jailhouse: Fix build issues
 and QA warnings
Message-ID: <20260311200700.GU11121@denix.org>
References: <20260311190537.3340422-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311190537.3340422-1-s-sadik@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 20:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19709

On Thu, Mar 12, 2026 at 12:35:34AM +0530, Sadik via lists.yoctoproject.org wrote:
> This series fixes build failures and QA warnings in the jailhouse recipes:
> 
> 1. Fix JH_RAMFS image path to match current naming convention
> 2. Fix buildpaths QA warning and remove do_compile override
> 3. Inhibit debug package split for bare-metal inmate binaries
> 
> These changes resolve build failures when searching for initramfs images
> and eliminate QA warnings related to buildpaths and debug packages.
> 
> v3 <-> v4:
>   - Fix EXTRA_OEMAKE and USER_SPACE_CFLAGS formatting per Ryan's feedback

LGTM - Ack for the series.


> Link to V3-:https://lists.yoctoproject.org/g/meta-ti/message/19701
> 
> v2 <-> v3:
>   - Move V=1 into EXTRA_OEMAKE as suggested by Denys
>   - Switch from 'module' to 'module-base' + 'kernel-module-split' inheritance
>   - Remove setuptools3 inherit (not needed)
>   - Remove do_compile() override as suggested by Denys
> 
> Link to V2-:https://lists.yoctoproject.org/g/meta-ti/message/19680
> 
> v1 <-> v2:
>   - Split buildpaths fix into separate commit
>   - Improved commit message descriptions
>   - Added KCFLAGS with -ffile-prefix-map for reproducible builds
> 
> Link to V1-:https://lists.yoctoproject.org/g/meta-ti/message/19674
> 
> Mahammed Sadik Shaik (3):
>   jailhouse: Fix JH_RAMFS image path
>   jailhouse-inmate: Inhibit debug package split
>   ti-jailhouse: Fix buildpaths QA warning and cleanup
> 
>  .../recipes-ti/jailhouse/jailhouse-inmate.bb  |  3 ++
>  .../recipes-ti/jailhouse/jailhouse_git.bb     |  8 ++---
>  .../recipes-ti/jailhouse/ti-jailhouse.inc     | 36 +++++++++++--------
>  3 files changed, 28 insertions(+), 19 deletions(-)
> 
> -- 
> 2.34.1

