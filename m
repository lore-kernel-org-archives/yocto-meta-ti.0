Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38537FF6E8F
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:27:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1559.1773786422517371368
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB68B40C3A;
	Tue, 17 Mar 2026 22:27:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2cXshBlrY99; Tue, 17 Mar 2026 22:27:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A198D40A20;
	Tue, 17 Mar 2026 22:26:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0603F17A354; Tue, 17 Mar 2026 18:26:59 -0400 (EDT)
Date: Tue, 17 Mar 2026 18:26:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] linux-bb.org_6.12: Backport C23
 compile fix from linux-stable
Message-ID: <20260317222658.GG11121@denix.org>
References: <20260317222406.1972700-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317222406.1972700-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19749

On Tue, Mar 17, 2026 at 05:24:06PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent change in oe-core [1] to glibc 2.43 has introduced a build
> error with 6.12 kernels.  Backport a patch [2] from linux-stable to
> address this.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=f791d6c52870f3571e740ff7818d45bb0a717934
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.12.y&id=3dedeeecd1ae42a751721d83dc21877122cc1795
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reviewed-by: Denys Dmytriyenko (TI) <denys@konsulko.com>


> ---
>  .../files/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch | 0
>  meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb           | 2 ++
>  2 files changed, 2 insertions(+)
>  copy {meta-ti-bsp => meta-beagle}/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch (100%)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch b/meta-beagle/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
> similarity index 100%
> copy from meta-ti-bsp/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
> copy to meta-beagle/recipes-kernel/linux/files/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
> diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> index 64b11045..77097d83 100644
> --- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> +++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> @@ -65,3 +65,5 @@ PV:aarch64 = "6.12.43+git"
>  BRANCH:aarch64 = "v6.12.43-ti-arm64-r54"
>  
>  KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
> +
> +SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
> -- 
> 2.43.0

