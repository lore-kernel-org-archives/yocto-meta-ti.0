Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C762C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 20:17:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11840.1700511465028762831
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Nov 2023 12:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 07C1340C2E
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Nov 2023 20:17:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TkG7fen0u4v for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Nov 2023 20:17:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E646C40A46
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Nov 2023 20:17:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 23BA6163D64; Mon, 20 Nov 2023 15:17:43 -0500 (EST)
Date: Mon, 20 Nov 2023 15:17:43 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH] k3r5: ensure separate
 TMPDIR used for this multiconfig
Message-ID: <20231120201743.GU2408@denix.org>
References: <1796F5B6A516DB9F.29291@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1796F5B6A516DB9F.29291@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Nov 2023 20:17:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17316

Ping.


On Sun, Nov 12, 2023 at 07:07:43PM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> This k3r5 multiconfig builds baremetal components (and corresponding native,
> nativesdk and cross tools) and sets TCLIBC accordingly to "baremetal". The
> expectation is that those components and tools will use a separate TMPDIR
> to isolate from the main Linux build that uses "glibc" TCLIBC and to avoid
> potential conflicts.
> 
> OE-Core "nodistro" default configuration already sets TCLIBCAPPEND facility
> to automatically add a suffix to TMPDIR, resulting in "tmp-baremetal" temp
> directory for this multiconfig and "tmp-glibc" for the main Linux one. Other
> distros like Arago follow this convention and even extend a bit (e.g. Arago
> also adds TCMODE suffix to TMPDIR for external toolchain support separation).
> 
> But Poky (and derivative distros, like AGL or YoE) disable TCLIBCAPPEND and
> result in a combined TMPDIR, leading to potential conflicts, such as:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15273
> 
> And that's just the beginning, there were other conflicts observed later in
> the build, e.g. during nativesdk builds - that's why we also set a unique
> SDKPKGSUFFIX here.
> 
> To force a separate TMPDIR for k3r5 multiconfig, we have to directly append
> a suffix to it. Multiple other options were tested in hopes of making it
> slightly cleaner, but they either didn't work or were dismissed. For example,
> trying to override TCLIBCAPPEND getting cleared by a distro would require
> using a machine/soc-override, which doesn't have enough scope (nativesdk)
> or forcing it with :forcevariable would also change the main Linux TMPDIR
> and affect existing CI flows. Also, using TCLIBC itself as a suffix to add
> to TMPDIR may result in getting it appended twice (tmp-baremetal-baremetal)
> when normal TCLIBCAPPEND facility is used. Hence the least invasive/confusing
> option is to always append "-k3r5" suffix to this multiconfig TMPDIR. That
> results in "tmp-k3r5" in Poky (leaving main TMPDIR as "tmp"), while OE-Core
> "nodistro" and Arago would end up with "tmp-baremetal-k3r5" (and "tmp-glibc"
> for the main).
> 
> Also note, meta-ti-bsp layer.conf sets up images and sdks to be deployed
> into a common location outside of TMPDIRs, but TI_COMMON_DEPLOY variable
> that controls it is set weakly, allowing to be modified from a distro
> configuration or local.conf. It means that all images and sdks can be
> deployed into the main TMPDIR if one's CI flow expects tmp/deploy/ as
> the final destination, by using := for immediate variable expansion:
> TI_COMMON_DEPLOY := "${TMPDIR}/deploy"
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> index 04b9a746..e36c87ed 100644
> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> @@ -4,4 +4,6 @@ DEPLOY_DIR_IMAGE:k3r5 = "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
>  
>  MACHINE:append = "-k3r5"
>  TCLIBC = "baremetal"
> +TMPDIR:append = "-k3r5"
> +
>  SDKPKGSUFFIX = "k3r5-nativesdk"
> -- 
> 2.25.1

