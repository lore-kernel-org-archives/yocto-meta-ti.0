Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.12845.1634663750352398468
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 10:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3A27340C2B;
	Tue, 19 Oct 2021 17:15:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ej2cFTm8Sjk8; Tue, 19 Oct 2021 17:15:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1059E406B5;
	Tue, 19 Oct 2021 17:15:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CDBBF174698; Tue, 19 Oct 2021 13:15:44 -0400 (EDT)
Date: Tue, 19 Oct 2021 13:15:44 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>
Cc: meta-ti@lists.yoctoproject.org, Praneeth Bajjuri <praneeth@ti.com>,
	Nishanth Menon <nm@ti.com>, Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [meta-ti][dunfell/master][PATCH] conf: j7-evm: Replace eaik dtb with sk to KERNEL_DEVICETREE
Message-ID: <20211019171544.GN10132@denix.org>
References: <20211019082221.4767-1-sinthu.raja@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211019082221.4767-1-sinthu.raja@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 19, 2021 at 01:52:21PM +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The board name for J721E EdgeAI Kit (EAIK) is changed to J721E SK [1],
> so replace the eaik dtb with sk dtb file
> 
> [1] https://www.ti.com/tool/SK-TDA4VM
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>  conf/machine/j7-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> index 7cde9f4d..1f47f00c 100644
> --- a/conf/machine/j7-evm.conf
> +++ b/conf/machine/j7-evm.conf
> @@ -13,7 +13,7 @@ KERNEL_DEVICETREE = " \
>      ti/k3-j721e-common-proc-board.dtb \
>      ti/k3-j721e-proc-board-tps65917.dtb \
>      ti/k3-j721e-common-proc-board-infotainment.dtbo \
> -    ti/k3-j721e-eaik.dtb \
> +    ti/k3-j721e-sk.dtb \

Was there a corresponding kernel change with the file rename?


>  "
>  
>  UBOOT_MACHINE = "j721e_evm_a72_config"
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
