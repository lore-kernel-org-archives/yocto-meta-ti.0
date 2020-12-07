Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6022.1607347331147544129
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 05:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OI9AMdRJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7DMA8T096766
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Dec 2020 07:22:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607347330;
	bh=DfxON1NDutE+Y2viC/HzmgpiXIb3L1xnGJk+eeKEygg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=OI9AMdRJYo4EnjaheG7yYETwnog+MEBDwRDXF5V7vsU5GXPfMTLq9OFudau9T+EnO
	 yfzjBOyzQyZsz+DalxPDBcc68L944Fdxpw+pOCOwdlEddKKZfZZgy4x1/v0YXSOoKo
	 GO6ljlQr0BYbG57BEud4zBhb+ZYQwkT7uO5VdZE0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7DMAtN022005
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Dec 2020 07:22:10 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 07:22:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 07:22:09 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7DM9xv060232;
	Mon, 7 Dec 2020 07:22:09 -0600
Subject: Re: [PATCH] [meta-ti][dunfell/master][PATCH] setup-scripts - removing confusion for users when script succeeds
To: Caleb Robey <c-robey@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Lucas Weaver <l-weaver@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        a0232989 <a0232989@ti.com>
References: <20201203222211.26326-1-c-robey@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <42f38512-0612-200d-aec8-715a11a3a9ed@ti.com>
Date: Mon, 7 Dec 2020 07:22:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203222211.26326-1-c-robey@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Caleb

On 12/3/20 4:22 PM, Caleb Robey wrote:
> From: a0232989 <a0232989@ti.com>
>
> Script does not include all correct versions in success message
>
> Signed-off-by: Caleb Robey <c-robey@ti.com>
> ---
>   setup-host-check.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Wrong list this needs to go to meta-arago mail list

Dan
