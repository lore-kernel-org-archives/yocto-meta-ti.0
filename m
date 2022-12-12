Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F6CC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 05:56:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.36644.1670824574756736144
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 21:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ACEEF40AB7;
	Mon, 12 Dec 2022 05:56:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfishW9SPJ-Y; Mon, 12 Dec 2022 05:56:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 72C5640A3F;
	Mon, 12 Dec 2022 05:56:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6AED61636AE; Mon, 12 Dec 2022 00:55:58 -0500 (EST)
Date: Mon, 12 Dec 2022 00:55:58 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: m-chawdhry@ti.com
Cc: meta-ti@lists.yoctoproject.org, Andrew Davis <afd@ti.com>,
	Ryan Eatmon <reatmon@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH v2] optee: update optee-client,
 optee-test, optee-examples to 3.19 tag
Message-ID: <20221212055558.GD22689@denix.org>
References: <20221212054705.94060-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212054705.94060-1-m-chawdhry@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 05:56:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15448

On Mon, Dec 12, 2022 at 11:17:05AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> optee-os was updated to 3.19 tag but the others were still outdated.
> 
> Updates other optee components to 3.19 tag
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
> v1->v2:
> - Fix build by adding depends
> 
>  recipes-security/optee/optee-client_%.bbappend   | 6 ++++--
>  recipes-security/optee/optee-examples_%.bbappend | 4 ++--
>  recipes-security/optee/optee-test_%.bbappend     | 4 ++--
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
> index 5675570a..19feaf6d 100644
> --- a/recipes-security/optee/optee-client_%.bbappend
> +++ b/recipes-security/optee/optee-client_%.bbappend
> @@ -1,2 +1,4 @@
> -PV_ti-soc = "3.17.0+git${SRCPV}"
> -SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
> +PV_ti-soc = "3.19.0+git${SRCPV}"
> +SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
> +
> +DEPENDS += "pkgconfig"

NAK - any unconditional change of the upstream package will break YP compat 
for meta-ti. Please see how it's done correctly - this patch actually captures 
2 such cases below...


> diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
> index 9941b345..dda7cbbf 100644
> --- a/recipes-security/optee/optee-examples_%.bbappend
> +++ b/recipes-security/optee/optee-examples_%.bbappend
> @@ -1,5 +1,5 @@
> -PV_ti-soc = "3.17.0+git${SRCPV}"
> -SRCREV_ti-soc = "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
> +PV_ti-soc = "3.19.0+git${SRCPV}"
> +SRCREV_ti-soc = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
>  SRC_URI_ti-soc = "git://github.com/linaro-swg/optee_examples.git;protocol=https"
>  
>  DEPENDS_append_ti-soc = " python3-cryptography-native"
> diff --git a/recipes-security/optee/optee-test_%.bbappend b/recipes-security/optee/optee-test_%.bbappend
> index d81ae521..79b4b4d6 100644
> --- a/recipes-security/optee/optee-test_%.bbappend
> +++ b/recipes-security/optee/optee-test_%.bbappend
> @@ -1,5 +1,5 @@
> -PV_ti-soc = "3.17.0+git${SRCPV}"
> -SRCREV_ti-soc = "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
> +PV_ti-soc = "3.19.0+git${SRCPV}"
> +SRCREV_ti-soc = "ab9863cc187724e54c032b738c28bd6e9460a4db"
>  SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_test.git;protocol=https"
>  
>  DEPENDS_append_ti-soc = " python3-cryptography-native"
> -- 
> 2.34.1
> 

