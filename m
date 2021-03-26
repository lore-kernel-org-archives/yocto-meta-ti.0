Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.7905.1616731019516951984
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 20:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E181A40C82;
	Fri, 26 Mar 2021 03:56:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HREAPemQnVJr; Fri, 26 Mar 2021 03:56:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B312940952;
	Fri, 26 Mar 2021 03:56:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1D064174566; Thu, 25 Mar 2021 23:56:55 -0400 (EDT)
Date: Thu, 25 Mar 2021 23:56:55 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Nishanth Menon <nm@ti.com>, meta-ti@lists.yoctoproject.org,
	denys@konsulko.com
Subject: Re: [meta-ti] [dunfell/master PATCH v2] trusted-firmware-a: am64xx: fix target board name
Message-ID: <20210326035655.GU18041@denix.org>
References: <20210326033945.15324-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210326033945.15324-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

NAK.

https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/include/am64xx.inc#n13


On Thu, Mar 25, 2021 at 10:39:45PM -0500, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> am64xx is the first generation of k3 device that uses
> a updated board defintion as "lite" platform.[1]
> 
> This patch fixes the TFA board to appropriate target as
> "lite" instead of "generic" for am64xx.
> 
> [1]: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=84af89563e1b17def844d3672bc601ae51f0257f
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  conf/machine/include/k3.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index c727d724..a96ebb76 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -28,6 +28,7 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>  
>  TFA_PLATFORM = "k3"
>  TFA_BOARD = "generic"
> +TFA_BOARD_am64xx = "lite"
>  
>  MACHINE_GUI_CLASS = "smallscreen"
>  
> -- 
> 2.17.1
