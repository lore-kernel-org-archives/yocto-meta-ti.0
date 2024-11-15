Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80685D68BD6
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 20:36:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1711.1731702966323182299
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 12:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 616C940C21;
	Fri, 15 Nov 2024 20:36:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xoq2sJOFVCMd; Fri, 15 Nov 2024 20:36:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 40229407DA;
	Fri, 15 Nov 2024 20:36:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6B8891640DB; Fri, 15 Nov 2024 15:36:02 -0500 (EST)
Date: Fri, 15 Nov 2024 15:36:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap/kirkstone][PATCH] SECURITY: Add file
Message-ID: <20241115203602.GT20070@denix.org>
References: <20241115201509.23655-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115201509.23655-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Nov 2024 20:36:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18071

On Fri, Nov 15, 2024 at 02:15:09PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add a SECURITY file with hints for security researchers and other
> parties who might report potential security vulnerabilities.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/SECURITY    | 21 +++++++++++++++++++++
>  meta-ti-extras/SECURITY | 21 +++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta-ti-bsp/SECURITY
>  create mode 100644 meta-ti-extras/SECURITY
> 
> diff --git a/meta-ti-bsp/SECURITY b/meta-ti-bsp/SECURITY
> new file mode 100644
> index 00000000..784bb209
> --- /dev/null
> +++ b/meta-ti-bsp/SECURITY
> @@ -0,0 +1,21 @@
> +How to Report a Potential Vulnerability?
> +========================================
> +
> +If you would like to report a public issue (for example, one with a released
> +CVE number), please report it to the mailing list:
> +
> +  https://lists.yoctoproject.org/g/meta-ti
> +
> +If you are dealing with a not-yet released or urgent issue, please send a
> +message to one of the maintainers listed in the README.  Include as many
> +details as possible:
> +  - the layer or software module affected
> +  - the recipe and its version
> +  - any example code, if available
> +
> +Branches maintained with security fixes
> +---------------------------------------
> +
> +See https://wiki.yoctoproject.org/wiki/Releases for the list of current
> +releases.  We only accept patches for the LTS releases and the master branch.
> +
> diff --git a/meta-ti-extras/SECURITY b/meta-ti-extras/SECURITY
> new file mode 100644
> index 00000000..784bb209
> --- /dev/null
> +++ b/meta-ti-extras/SECURITY
> @@ -0,0 +1,21 @@
> +How to Report a Potential Vulnerability?
> +========================================
> +
> +If you would like to report a public issue (for example, one with a released
> +CVE number), please report it to the mailing list:
> +
> +  https://lists.yoctoproject.org/g/meta-ti
> +
> +If you are dealing with a not-yet released or urgent issue, please send a
> +message to one of the maintainers listed in the README.  Include as many
> +details as possible:
> +  - the layer or software module affected
> +  - the recipe and its version
> +  - any example code, if available
> +
> +Branches maintained with security fixes
> +---------------------------------------
> +
> +See https://wiki.yoctoproject.org/wiki/Releases for the list of current
> +releases.  We only accept patches for the LTS releases and the master branch.
> +
> -- 
> 2.17.1

