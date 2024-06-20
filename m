Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC9AC2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 18:35:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.55263.1718908518885561077
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 11:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EFD7040CAA;
	Thu, 20 Jun 2024 18:35:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82Bopu1kDHjY; Thu, 20 Jun 2024 18:35:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC59940BA8;
	Thu, 20 Jun 2024 18:35:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F26ED163FBF; Thu, 20 Jun 2024 14:35:15 -0400 (EDT)
Date: Thu, 20 Jun 2024 14:35:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: sabeeh-khan@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 3/4] cc33xx-fw:
 install cc33xx firmware
Message-ID: <20240620183515.GC18231@denix.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-4-sabeeh-khan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620032202.169122-4-sabeeh-khan@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 18:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17779

On Wed, Jun 19, 2024 at 10:22:01PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
> Download and install the cc33xx firmware and binaries
> to be used with the cc33xx drivers.
> 
> FW Version: 1.7.0.120
> 
> Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
> ---
>  .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb    | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
> 
> diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
> new file mode 100644
> index 00000000..152e3501
> --- /dev/null
> +++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Firmware files for use with TI cc33xx"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=df68504cbd0a4da1643ebcfd5783dbc9"
> +
> +SRC_URI = " \
> +	git://git.ti.com/git/cc33xx-wlan/cc33xx-fw.git;protocol=https;branch=${BRANCH} 
> +"
> +
> +PV = "1.7.0.120"
> +
> +SRCREV = "988ded3a7d4d0e46de62e9ebfcb685c502bd9edf"
> +BRANCH = "master"
> +
> +CLEANBROKEN = "1"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +    :
> +}

do_compile[noexec] = "1"


> +do_install() {
> +    oe_runmake 'DEST_DIR=${D}' install
> +}
> +
> +FILES:${PN} = "${nonarch_base_libdir}/firmware/ti-connectivity/*"
> -- 
> 2.34.1

