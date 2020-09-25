Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2705.1601020239636590245
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Sep 2020 00:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=D8DbACEn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rogerq@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08P7od43078640
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2020 02:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601020239;
	bh=G8kscPXTrbX8kEhU868CISw3RDTownh7+DjQx0I6a9k=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=D8DbACEnmRujJm/kTxzCkW+UXQTUiE3IwcpD7GdsL0KTf1djP4zhu3TSe8Ah2DP4v
	 VOUvVBPYp9DJASkOrJscgojWHzsYJVYTNs/zsVYwtgFq8QfhsRlRpjiXsqdaekNLDq
	 tiqwQoVIlXfHAt+M/RuUcmFMmU0eZBH8gLs3zMlQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08P7odVQ125492
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2020 02:50:39 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 02:50:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 02:50:38 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08P7obiA081341;
	Fri, 25 Sep 2020 02:50:37 -0500
Subject: Re: [dunfell/master PATCH] am65xx-evm: Add missing k3-am654-idk-sr1.dtbo
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <dmurphy@ti.com>
References: <20200924134440.18133-1-rogerq@ti.com>
From: "Roger Quadros" <rogerq@ti.com>
Message-ID: <2e065d10-efd6-2cac-0253-611bbba1444c@ti.com>
Date: Fri, 25 Sep 2020 10:50:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924134440.18133-1-rogerq@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Please ignore this series. I will resend the required patch.

cheers,
-roger

On 24/09/2020 16:44, Roger Quadros wrote:
> For SR1.0 we use a different overlay for IDK card.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>   conf/machine/am65xx-evm.conf    | 1 +
>   conf/machine/am65xx-hs-evm.conf | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
> index e5766f18..0007377c 100644
> --- a/conf/machine/am65xx-evm.conf
> +++ b/conf/machine/am65xx-evm.conf
> @@ -16,6 +16,7 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am654-base-board-sr1.dtb \
>       ti/k3-am654-gp.dtbo \
>       ti/k3-am654-idk.dtbo \
> +    ti/k3-am654-idk-sr1.dtbo \
>       ti/k3-am654-evm-hdmi.dtbo \
>       ti/k3-am654-evm-oldi-lcd1evm.dtbo \
>       ti/k3-am654-evm-tc358876.dtbo \
> diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
> index 6d20a0de..702ba308 100644
> --- a/conf/machine/am65xx-hs-evm.conf
> +++ b/conf/machine/am65xx-hs-evm.conf
> @@ -12,6 +12,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   KERNEL_DEVICETREE = " \
>       ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
>       ti/k3-am654-evm-hdmi.dtbo ti/k3-am654-idk.dtbo \
> +    ti/k3-am654-idk-sr1.dtbo \
>       ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
>       ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
>       ti/k3-am654-base-board-jailhouse.dtbo \
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
