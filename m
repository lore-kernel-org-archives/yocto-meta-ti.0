Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7.1578087037278113115
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Jan 2020 13:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=l56eUqFL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 003LUZxi010883;
	Fri, 3 Jan 2020 15:30:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578087035;
	bh=Vv/Lde+NElPzBu/gaEj93K1OQnX2bSx/zhTfiB0DW4o=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=l56eUqFL8h3U6/5TrMVoZjSeTjIuWpf6DoErlqgAMsMn8cl82AknYvFv4rtFXhGrz
	 e+lZkyp2rw/rAQkLipd620ZpbZ+N8GUY8BCX58VAa9WVa0nqH9Z6tebhxvjkEg5WOI
	 /ERjrQbSxuvvRkjkmk3setsq5BNlTatWJLcyR0to=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 003LUZVE049401;
	Fri, 3 Jan 2020 15:30:35 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Jan
 2020 15:30:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Jan 2020 15:30:35 -0600
Received: from [10.250.65.50] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 003LUZe5028136;
	Fri, 3 Jan 2020 15:30:35 -0600
Subject: Re: [meta-ti] [PATCH] beagle-x15: add am5729-beagleboneai.dtb
To: "Theodore A. Roth" <troth@openavr.org>, <meta-ti@lists.yoctoproject.org>
References: <20200102194059.GA13220@beast>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <d626ca1c-6e7f-0412-5a6c-8021a9eb8237@ti.com>
Date: Fri, 3 Jan 2020 16:30:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200102194059.GA13220@beast>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/2/20 2:40 PM, Theodore A. Roth wrote:
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> ---
>  conf/machine/beagle-x15.conf | 5 ++++-


Why add this to the X15 machine? The Beagebone AI is not an X15, the
catch all for AM57xx machines seems to be am57xx-evm.conf, which already
has the am5729-beagleboneai.dtb.

Thinking more about this, the defining features of the AI might warrant
a new machine conf.

Andrew


>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
> index d5e05ec7..0af45a84 100644
> --- a/conf/machine/beagle-x15.conf
> +++ b/conf/machine/beagle-x15.conf
> @@ -4,7 +4,10 @@
>  
>  require conf/machine/include/dra7xx.inc
>  
> -KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb"
> +KERNEL_DEVICETREE = " \
> +    am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb \
> +    am5729-beagleboneai.dtb \
> +"
>  
>  MACHINE_GUI_CLASS = "bigscreen"
>  
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#12591): https://lists.yoctoproject.org/g/meta-ti/message/12591
> Mute This Topic: https://lists.yoctoproject.org/mt/69386296/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
