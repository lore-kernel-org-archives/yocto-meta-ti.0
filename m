Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.12020.1625751170816495246
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Jul 2021 06:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jVAnaV42;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 168DWnRp048854;
	Thu, 8 Jul 2021 08:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625751169;
	bh=PH8zBsUcgfoweoxpEYD0FYnNwm5RzDEXst7l2x1hduE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jVAnaV42E8TSlRjSRuwBxXsSKS4iwiauvPLfBnl60TeZ+w/m0cKVmgnQr4UawGG4R
	 9KGlLr3Dj1hNHEb8ofjmgleKmIKrsgfw15TClW9lGtbyg0dknt33NtSHMgIADYoM/q
	 3KFtbZgdRFYOR5TEh30gFT3wF9M03psbvoQJDGWk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 168DWnp8100715
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 08:32:49 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 08:32:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 08:32:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 168DWnp7001656;
	Thu, 8 Jul 2021 08:32:49 -0500
Date: Thu, 8 Jul 2021 08:32:49 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master][PATCH 4/4] ti-sci-fw: Update linux firmware repo to 08.00.00.002
Message-ID: <20210708133249.pf7q5gy4bpeyly6e@straw>
References: <20210708051232.10077-1-yogeshs@ti.com>
 <20210708051232.10077-5-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210708051232.10077-5-yogeshs@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 05:12-20210708, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Update linux firmware repo to 08.00.00.002
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 96604282..acd5ce8f 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2021.05"
>  
> -SRCREV = "1e73d9387980f4d425742738968e55395c19e26c"
> +SRCREV = "b280fb4da1a200489b7bc5c1a23f74dd065a6f30"
>  BRANCH ?= "ti-linux-firmware"
>  SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
>  SRCREV_FORMAT = "imggen"


I am not sure I understand how 
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=db51751356e9266b330f7a3246c0a8c0d3531757
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=b280fb4da1a200489b7bc5c1a23f74dd065a6f30

will be picked up if we only update tisci-fw for
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=078be7fcea7e5a1f34c1cd7e6de244c89052aad6


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
