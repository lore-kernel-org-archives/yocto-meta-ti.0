Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.117.1642198507041857089
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 14:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D35D40C52;
	Fri, 14 Jan 2022 22:15:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZD_L8-5u2Q7; Fri, 14 Jan 2022 22:15:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2CA3840ACD;
	Fri, 14 Jan 2022 22:15:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E9B3117471C; Fri, 14 Jan 2022 17:15:03 -0500 (EST)
Date: Fri, 14 Jan 2022 17:15:03 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: meta-ti@lists.yoctoproject.org, Michael.Krummsdorf@tq-group.com
Subject: Re: [meta-ti] [PATCH] ti-sgx-ddk-um: avoid unnecessary dependency on -dev package
Message-ID: <20220114221503.GL26229@denix.org>
References: <20220114125218.3065949-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
In-Reply-To: <20220114125218.3065949-1-matthias.schiffer@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 14, 2022 at 01:52:18PM +0100, Matthias Schiffer wrote:
> ti-sgx-ddk-um's do_install creates a symlink libGLESv2.so.1 to
> libGLESv2.so. As this symlink will be installed to ti-sgx-ddk-um, but
> its target libGLESv2.so is in ti-sgx-ddk-um-dev, the automated
> dependency analysis will add ti-sgx-ddk-um-dev to ti-sgx-ddk-um's
> RDEPENDS. This will pull in a large number of other -dev packages
> through RDEPENDS and RRECOMMENDS in turn.
> 
> Avoid this by having libGLESv2.so.1 point to libGLESv2.so.2 instead of
> libGLESv2.so, so the symlink's target is in ti-sgx-ddk-um as well.

Makes sense, thanks!


> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index 9d55122c..e4243a2b 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -56,7 +56,7 @@ S = "${WORKDIR}/git"
>  
>  do_install () {
>      oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
> -    ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
> +    ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
>  
>      chown -R root:root ${D}
>  }
> -- 
> 2.25.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
