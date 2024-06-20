Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B675DC2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 20:20:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.57461.1718914804861511746
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 13:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 148BD40CAA;
	Thu, 20 Jun 2024 20:20:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNHmS9psBBzi; Thu, 20 Jun 2024 20:20:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E79CB40BA8;
	Thu, 20 Jun 2024 20:20:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 38EFE163FC2; Thu, 20 Jun 2024 16:20:02 -0400 (EDT)
Date: Thu, 20 Jun 2024 16:20:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: sabeeh-khan@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 1/4] cc33conf: add new
 cc33conf tool for cc33xx devices
Message-ID: <20240620202002.GD18231@denix.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-2-sabeeh-khan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620032202.169122-2-sabeeh-khan@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 20:20:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17781

On Wed, Jun 19, 2024 at 10:21:59PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
> cc33conf is a tool provided by TI to configure
> cc33xx WLAN devices. It can be used to change
> the RF parameters and other features of the target.
> Documentation for this tool is provided within the following link:
> https://www.ti.com/tool/CC33XX-SOFTWARE
> 
> Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
> ---
>  .../cc33conf/cc33conf_git.bb                  | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
> 
> diff --git a/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
> new file mode 100644
> index 00000000..1e4faa77
> --- /dev/null
> +++ b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "Configuration utility for TI CC33xx wireless devices"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d5fc448a36efe573623542dcb989afc4"
> +
> +SRCREV = "a2f84140b8d67cfc94472cf92676a409d1e47d86"
> +SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-utils.git;branch=master;protocol=https"
> +
> +PV = "1.7.0.120"
> +
> +S = "${WORKDIR}/git/cc33conf"
> +
> +EXTRA_OEMAKE = "CC="${CC}""
> +
> +do_install() {
> +	install -d ${D}${sbindir}
> +	install -d ${D}${sbindir}/cc33conf/
> +
> +	install -m 0755 cc33xxconf ${D}${sbindir}/cc33conf/
> +	install -m 0755 dictionary.txt ${D}${sbindir}/cc33conf/
> +	install -m 0755 default.conf ${D}${sbindir}/cc33conf/
> +	install -m 0755 README ${D}${sbindir}/cc33conf/
> +	install -m 0755 cc33xx-conf.conf ${D}${sbindir}/cc33conf/
> +	install -m 0755 cc33xx-conf.ini ${D}${sbindir}/cc33conf/
> +	install -m 0755 conf.h ${D}${sbindir}/cc33conf/

Should all these files really go into sbindir?


> +}
> +
> +FILES:${PN} += " \
> +	${sbindir}/cc33conf \
> +"
> -- 
> 2.34.1

