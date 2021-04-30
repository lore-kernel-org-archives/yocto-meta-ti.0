Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.3614.1619814231279279894
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 13:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RpGAzkKH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13UKNoun000920;
	Fri, 30 Apr 2021 15:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619814230;
	bh=EgCWC0ptTPE50mERuXNWyvagjXn2e05gI1dXrbKbaHI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=RpGAzkKHqLyzNClggZJOJXCEVNrmVowuFmkAS/U+bUJ2zOL/j6EPQXa3xwgO0dCMg
	 HmbifyoxKgZrwp2DD5MVZCcE+CMpt7cBIZnPT1cIKBMV/bqDpJjDwto5Be4nJrRe/x
	 LqkIKcutIBQ5UWOi0J2FHxYC8HeywsI4Y1h2TE34=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13UKNoGG105697
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Apr 2021 15:23:50 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 30
 Apr 2021 15:23:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 30 Apr 2021 15:23:50 -0500
Received: from [10.250.34.141] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13UKNolO032059;
	Fri, 30 Apr 2021 15:23:50 -0500
Subject: Re: [dunfell/master PATCH] conf: am65xx-evm: ReIntroduce AM65 SR1.0 overlay
To: <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210430202110.31235-1-praneeth@ti.com>
 <20210430202110.31235-2-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <b014f935-0f2e-b367-b103-00338f218cb7@ti.com>
Date: Fri, 30 Apr 2021 15:23:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210430202110.31235-2-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/30/21 3:21 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> ReIntroduce AM65x SR1.0 Overlay as the support for it
> is added in the ti-linux-5.10.y kernel now.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

> ---
>  conf/machine/include/am65xx.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
> index 28733b2b..7cc3ddcc 100644
> --- a/conf/machine/include/am65xx.inc
> +++ b/conf/machine/include/am65xx.inc
> @@ -8,8 +8,10 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-am654-base-board.dtb \
> +    ti/k3-am654-base-board-sr1.dtbo \
>      ti/k3-am654-gp.dtbo \
>      ti/k3-am654-idk.dtbo \
> +    ti/k3-am654-idk-sr1.dtbo \
>      ti/k3-am654-sr1.dtbo \
>      ti/k3-am654-pcie-usb2.dtbo \
>      ti/k3-am654-pcie-usb3.dtbo \
> 

