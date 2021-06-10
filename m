Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
 by mx.groups.io with SMTP id smtpd.web10.1379.1623352618914941012
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 12:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: h08.hostsharing.net, ip: 83.223.95.100, mailfrom: foo00@h08.hostsharing.net)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 97A4530011E18;
	Thu, 10 Jun 2021 21:16:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 8ABC9106D96; Thu, 10 Jun 2021 21:16:55 +0200 (CEST)
Date: Thu, 10 Jun 2021 21:16:55 +0200
From: "Lukas Wunner" <lukas@wunner.de>
To: praneeth@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master PATCHv2 1/5] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Message-ID: <20210610191655.GA9160@wunner.de>
References: <20210609005055.7975-1-praneeth@ti.com>
 <20210609005055.7975-2-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210609005055.7975-2-praneeth@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 08, 2021 at 07:50:51PM -0500, Praneeth Bajjuri <praneeth@ti.com> wrote:
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> @@ -2,8 +2,8 @@ require u-boot-ti.inc
>  
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  BRANCH = "ti-u-boot-2021.01"
>  
> -SRCREV = "a6e78929575b6969c15ced9685441fc430ee9510"
> +SRCREV = "c66dd9b8467472278803c2426098a2828c93ebcc"

Unfortunately this change breaks booting on AM64 EVM.
No output whatsoever on the serial console (port 0 of the FTDI).
Reverting to SRCREV = "a6e78929575b..." made booting work again.

Let me know if you want me to bisect or test anything specific.

On the plus side, PRU Ethernet seems to work out of the box with
the latest changes on the dunfell branch, which is great.

Thanks,

Lukas
