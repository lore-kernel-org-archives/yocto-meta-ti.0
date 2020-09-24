Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1773.1600987267699318623
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 15:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=udCgF8ik;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08OMf684023289
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2020 17:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600987266;
	bh=j8IBSkF9jGX57DuXsDVeSKKfvv6lr6zb5Ae10hPbrRE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=udCgF8ikuirPEg0NRybhr19d1Frx1QlgmejyxZTOUytZU41wKsZMMVrA2kEPYaQAC
	 MYV1W2I6u1coxyge8e0CTMZcnyQbYAsr5D0uaXkqWu9jUBLYtC3tOc5A2gx6r2uVzZ
	 GObD4EVCXjABWr0Xgnu5friSmCBJe6/m9oAIZqYg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08OMf6Kk024319
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2020 17:41:06 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 24
 Sep 2020 17:41:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 24 Sep 2020 17:41:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08OMf6NV011817;
	Thu, 24 Sep 2020 17:41:06 -0500
Date: Thu, 24 Sep 2020 18:41:06 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Roger Quadros <rogerq@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <nsekhar@ti.com>, <dmurphy@ti.com>
Subject: Re: [dunfell/master PATCH] am65xx-evm: Add missing k3-am654-idk-sr1.dtbo
Message-ID: <20200924224105.GA5919@beryl>
References: <20200924134440.18133-1-rogerq@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200924134440.18133-1-rogerq@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 24, 2020 at 04:44:39PM +0300, Roger Quadros wrote:
> For SR1.0 we use a different overlay for IDK card.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  conf/machine/am65xx-evm.conf    | 1 +
>  conf/machine/am65xx-hs-evm.conf | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
> index e5766f18..0007377c 100644
> --- a/conf/machine/am65xx-evm.conf
> +++ b/conf/machine/am65xx-evm.conf
> @@ -16,6 +16,7 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am654-base-board-sr1.dtb \
>      ti/k3-am654-gp.dtbo \
>      ti/k3-am654-idk.dtbo \
> +    ti/k3-am654-idk-sr1.dtbo \
>      ti/k3-am654-evm-hdmi.dtbo \
>      ti/k3-am654-evm-oldi-lcd1evm.dtbo \
>      ti/k3-am654-evm-tc358876.dtbo \
> diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
> index 6d20a0de..702ba308 100644
> --- a/conf/machine/am65xx-hs-evm.conf
> +++ b/conf/machine/am65xx-hs-evm.conf
> @@ -12,6 +12,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  KERNEL_DEVICETREE = " \
>      ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
>      ti/k3-am654-evm-hdmi.dtbo ti/k3-am654-idk.dtbo \
> +    ti/k3-am654-idk-sr1.dtbo \

Should there be ti/k3-am654-base-board-sr1.dtb for HS as well?
I believe HS doesn't yet have SR2, hence not sure how the DTBs should be setup 
with or without -sr1?


>      ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
>      ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
>      ti/k3-am654-base-board-jailhouse.dtbo \
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
