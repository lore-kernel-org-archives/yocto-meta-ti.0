Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5CCD6A22A
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 19:17:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2580.1731611869922486139
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 11:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E25AE40A03;
	Thu, 14 Nov 2024 19:17:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pmk2AZF3236y; Thu, 14 Nov 2024 19:17:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 914CD40031;
	Thu, 14 Nov 2024 19:17:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EAE911640DD; Thu, 14 Nov 2024 14:17:41 -0500 (EST)
Date: Thu, 14 Nov 2024 14:17:41 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-shenai@ti.com
Cc: meta-ti@lists.yoctoproject.org, c-shilwant@ti.com, reatmon@ti.com,
	praneeth@ti.com, vigneshr@ti.com, kamlesh@ti.com
Subject: Re: [meta-ti][master/scarthgap][PATCH v1] meta-ti: Linux configs:
 Bring selinux related configs
Message-ID: <20241114191741.GS20070@denix.org>
References: <20241114054808.2945905-1-a-shenai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114054808.2945905-1-a-shenai@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Nov 2024 19:17:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18067

There are several issues with the patch itself, but that is secondary.

The primary issue is that this adds a new layer dependency to meta-ti-bsp 
(which is also not explicitly configured in layer.conf) - that is a very 
undesirable thing for a BSP layer.

This should be done in a Distro or Product layer (I'm not even shure 
meta-arago-distro should have this by default, to be honest).


On Thu, Nov 14, 2024 at 11:18:08AM +0530, Aashvij Shenai via lists.yoctoproject.org wrote:
> Kernel configs that are important for SELinux to be included in the
> Linux kernel are present in the meta-selinux layer.
> 
> Ideally, we wouldn't want to be calling a file from another
> layer since it would become messy. However, bringing those configs
> into meta-ti layer would hit maintainbility issues.
> 
> The root cause of this problem lies in the recipe name. While
> meta-selinux names their bbapend as linux_yocto_%.bbappend, TI has their
> recipe named as linux-ti-staging_%.bb
> 
> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
> ---
>  .../linux/linux-ti-staging_%.bbappend             | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
> new file mode 100644
> index 00000000..460df5de
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
> @@ -0,0 +1,15 @@
> +# The meta-selinux layer includes an selinux.cfg file containing
> +# configs necessary for the Linux kernel to enable SELinux
> +
> +# In order to reduce maintainability issues, the file will 
> +# be retained in meta-selinux layer
> +
> +FILESEXTRAPATHS:prepend := "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', '${TOPDIR}/../sources/meta-selinux/recipes-kernel/linux/files:', '', d)}"
> +
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'file://selinux.cfg', '', d)}"
> +
> +do_configure:append() {
> +    if echo "${DISTRO_FEATURES}" | grep -q "selinux"; then
> +        cat ${WORKDIR}/selinux.cfg >> ${B}/.config
> +    fi
> +}
> \ No newline at end of file
> -- 
> 2.34.1
> 

