Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.8418.1637060351738694160
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 02:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DBoZtHg6;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAx9WO015099;
	Tue, 16 Nov 2021 04:59:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637060349;
	bh=ybYM0mfc0xlhBYqOXLhaxScW7uKdHAPoG9s+cHhQzHk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=DBoZtHg6QkXXPm1kZN7UjPwZ8RW/1o023p5GKglmDPhPp0DWh8kib1ZZESoRl9d3Y
	 zvaG3aJeVvI5i9x9PvgqxzxNZjPvuQTTa5kTeKUBhfcMvCNOMn9hHmazaB8A0kEcXt
	 VtK6BndHXcFdzTw2QWyiJiRAsbYalxF2zV0f/Sjg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGAx90H056907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Nov 2021 04:59:09 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 04:59:09 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 04:59:09 -0600
Received: from [10.250.150.134] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAx7ZV034332;
	Tue, 16 Nov 2021 04:59:08 -0600
Message-ID: <7a6bba7e-49b0-7fc8-4fc8-3bbb2ae204d4@ti.com>
Date: Tue, 16 Nov 2021 16:29:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [meta-ti][dunfell][PATCH 1/2] conf: machine: am64xx: Add missing dtbo
To: <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20211115171811.34908-1-yogeshs@ti.com>
From: "Vignesh Raghavendra" <vigneshr@ti.com>
In-Reply-To: <20211115171811.34908-1-yogeshs@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



On 11/15/21 10:48 PM, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Add missing k3-am642-evm-nand.dtbo required for system test
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  conf/machine/include/am64xx.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index 95fdc79d..7646c70a 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -10,6 +10,7 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am642-evm.dtb \
>      ti/k3-am642-sk.dtb \
>      ti/k3-am642-evm-icssg1-dualemac.dtbo \
> +    ti/k3-am642-evm-nand.dtbo \
>  "


Just wondering why this list cannot be wild carded? Would avoid need to
remember and add new dtbos to the list every time new dtbo is added in
kernel.

Regards
Vignesh
