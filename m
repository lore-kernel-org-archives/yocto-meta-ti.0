Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E0AC27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 20:22:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.57504.1718914931535002090
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 13:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E538140CAA;
	Thu, 20 Jun 2024 20:22:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCzEnpw9jIAs; Thu, 20 Jun 2024 20:22:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD33C40BA8;
	Thu, 20 Jun 2024 20:22:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 93C16163FC2; Thu, 20 Jun 2024 16:22:09 -0400 (EDT)
Date: Thu, 20 Jun 2024 16:22:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: sabeeh-khan@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 2/4] cc33calibrator:
 add new cc33calibrator tool for cc33xx devices
Message-ID: <20240620202209.GE18231@denix.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-3-sabeeh-khan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620032202.169122-3-sabeeh-khan@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 20:22:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17782

On Wed, Jun 19, 2024 at 10:22:00PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
> cc33calibrator is a tool provided by TI to manually control the
> radio frontend of the cc33xx device. This tool can also be used
> for production line testing of the radio.
> Documentation for this tool is provided within the following link:
> https://www.ti.com/tool/CC33XX-SOFTWARE
> 
> Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
> ---
>  .../cc33calibrator/cc33calibrator_git.bb      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
> 
> diff --git a/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb b/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
> new file mode 100644
> index 00000000..da2d0453
> --- /dev/null
> +++ b/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "The calibrator utility for TI wireless solution based on cc33xx driver"

SUMMARY


> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d5fc448a36efe573623542dcb989afc4"
> +
> +SRCREV = "a2f84140b8d67cfc94472cf92676a409d1e47d86"
> +SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-utils.git;branch=master;protocol=https"
> +
> +PV = "1.0.0.50"
> +
> +DEPENDS = "libnl"
> +
> +S = "${WORKDIR}/git/cc33calibrator"
> +
> +export CROSS_COMPILE = "${TARGET_PREFIX}"
> +
> +EXTRA_OEMAKE = "CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -DCONFIG_LIBNL32 " \
> +		LDFLAGS="${LDFLAGS} -L${STAGING_LIBDIR}" \
> +		CC="${CC}" \
> +		NLVER=3"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 cc33calibrator ${D}${bindir}/
> +}
> -- 
> 2.34.1

