Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC8DC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:40:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.121047.1669650034337564081
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 07:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5749F40CF2;
	Mon, 28 Nov 2022 15:40:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4f6jlrimGepK; Mon, 28 Nov 2022 15:40:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B88340CDD;
	Mon, 28 Nov 2022 15:40:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0448016368F; Mon, 28 Nov 2022 10:40:24 -0500 (EST)
Date: Mon, 28 Nov 2022 10:40:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] linux-ti-staging: work around for too
 few arguments to function init_disassemble_info() error
Message-ID: <20221128154023.GN22689@denix.org>
References: <20221128042919.16102-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128042919.16102-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Nov 2022 15:40:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15370

On Sun, Nov 27, 2022 at 10:29:19PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> binutils 2.39 changed the signature of init_disassemble_info(),
> which now causes perf and bpftool to fail to compile.
> 
> Relevant binutils commit: [1]
> 
> There is a proper fix in development upstream[2].
> This is a work-around for older kernels.
> 
> Inspired by a patch by Anton Antonov to fix this issue on meta-arm
> kernels. [3]
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
> [2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.156015-1-andres@anarazel.de/
> [3] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.4888-1-jon.mason@arm.com/#5104
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...ture-changes-causes-compile-failures.patch | 109 ++++++++++++++++++
>  ...ture-changes-causes-compile-failures.patch | 109 ++++++++++++++++++
>  ...ture-changes-causes-compile-failures.patch | 109 ++++++++++++++++++
>  .../linux/linux-ti-staging_5.10.bb            |   1 +
>  4 files changed, 328 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch

This is incorrect - you should not have 3 identical copies of the same patch.

-- 
Denys

