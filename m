Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36C4C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 17:31:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.89826.1675791052468788976
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 09:30:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 513D540C24;
	Tue,  7 Feb 2023 17:30:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lt1CtGEfjE_d; Tue,  7 Feb 2023 17:30:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 30E9D40BA8;
	Tue,  7 Feb 2023 17:30:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 296B7163749; Tue,  7 Feb 2023 12:30:27 -0500 (EST)
Date: Tue, 7 Feb 2023 12:30:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] linux-bb.org: work around for too few
 arguments to function init_disassemble_info() error
Message-ID: <20230207173027.GU22689@denix.org>
References: <20230207142417.14353-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207142417.14353-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 17:31:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15739

On Tue, Feb 07, 2023 at 08:24:17AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
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
>  meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> index 2e0f2448..35fb40cd 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> @@ -25,7 +25,8 @@ SRCREV:k3 = "11ebcc09f32669fac8254dff56d500f86c4c2caf"
>  PV:k3 = "5.10.153+git${SRCPV}"
>  BRANCH:k3 = "5.10-arm64"
>  
> -SRC_URI = "git://git.beagleboard.org/beagleboard/linux.git;protocol=https;branch=${BRANCH}"
> +SRC_URI = "git://git.beagleboard.org/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
> +           file://init_disassemble_info-signature-changes-causes-compile-failures.patch"

Did you forget to add the patch?


>  DEFCONFIG_NAME = "bb.org_defconfig"
>  KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
> -- 
> 2.17.1

