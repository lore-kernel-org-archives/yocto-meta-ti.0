Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
 by mx.groups.io with SMTP id smtpd.web10.12712.1623161080009062025
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 07:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: h08.hostsharing.net, ip: 83.223.78.240, mailfrom: foo00@h08.hostsharing.net)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id C36072800B3CA;
	Tue,  8 Jun 2021 16:04:36 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id AE4F3429BE2; Tue,  8 Jun 2021 16:04:36 +0200 (CEST)
Date: Tue, 8 Jun 2021 16:04:36 +0200
From: "Lukas Wunner" <lukas@wunner.de>
To: praneeth@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH] linux-ti-staging: Update 5.10 kernel to the latest commit SHA
Message-ID: <20210608140436.GA6013@wunner.de>
References: <20210608000254.12042-1-praneeth@ti.com>
 <20210608000254.12042-2-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210608000254.12042-2-praneeth@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 07, 2021 at 07:02:52PM -0500, praneeth via lists.yoctoproject.org wrote:
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> index 4654d92d..834df5ff 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
>  
>  BRANCH = "ti-rt-linux-5.10.y"
>  
> -SRCREV = "afe9ba17bb94cd226f9e5dc3685e4fe32be28c5c"
> +SRCREV = "433ef931c699f08bef8c67de8458302c5f971c8b"
>  PV = "5.10.35+git${SRCPV}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index 72a6c49c..47f1669e 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.10.y"
>  
> -SRCREV = "72d727fe733f2610e937a063bcebedce329948ec"
> +SRCREV = "ae876c7c91df646ab198331e676f250f06cfdeb5"
>  PV = "5.10.35+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild

This doesn't apply cleanly to any of the dunfell, dunfell-next nor master
branches.  SRCREV is currently 8fbd16658d11 and d85aee3e19aa, respectively
on those branches.

Which branch did you base this patch on?

Thanks,

Lukas
