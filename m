Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2300C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 20:27:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.57624.1718915256125829514
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 13:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D53540CAA;
	Thu, 20 Jun 2024 20:27:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bu_TwZD1WhRq; Thu, 20 Jun 2024 20:27:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61A0340BA8;
	Thu, 20 Jun 2024 20:27:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CD7E1163FC2; Thu, 20 Jun 2024 16:27:33 -0400 (EDT)
Date: Thu, 20 Jun 2024 16:27:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: sabeeh-khan@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 4/4]
 cc33xx-target-scripts: add cc33xx scripts to control TI cc33xx WLAN device
Message-ID: <20240620202733.GF18231@denix.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-5-sabeeh-khan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620032202.169122-5-sabeeh-khan@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 20:27:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17783

On Wed, Jun 19, 2024 at 10:22:02PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
> Add scripts and conf files to be used to control and configure
> the cc33xx WLAN device. Documentation for these scripts can be found here:
> https://www.ti.com/tool/CC33XX-SOFTWARE
> 
> Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
> ---
>  .../cc33xx-target-scripts.bb                  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
> 
> diff --git a/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
> new file mode 100644
> index 00000000..2f13f911
> --- /dev/null
> +++ b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Scripts and configuration files for TI cc33xx wireless drivers"

SUMMARY


> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=904443cf7fae5c09c3d5f83f8557c265"
> +
> +SRCREV = "4371c93ea01b339f6f73f77d6d6bfcc185def8c0"
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-target-scripts.git;protocol=https;branch=${BRANCH} \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +FILES:${PN} += "${datadir}/cc33xx/"
> +
> +do_install() {
> +	install -d ${D}${datadir}/cc33xx/
> +
> +	scripts=`find ./* -type f -name "*.*"`

Is this find command necessary?


> +	for s in $scripts
> +	do
> +		install -m 0755 $s ${D}${datadir}/cc33xx/
> +	done
> +}
> -- 
> 2.34.1

