Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.2253.1634599476295231678
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 16:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=os7ZLoOr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19INOYM2003262
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Oct 2021 18:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634599474;
	bh=bU1gjIOKloDIJb5DeHzMakytTZn1EqHBZUfRRpQ890g=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=os7ZLoOrtI2dsFP2IYBuoMRxriij7TowjGo+Na8Xs4rwRv/aPCEUsEDtkvNszw7V8
	 0F7wEn4jIGM93KqoGL31v78HxRv+hbIgKoe62iGnVa3LZVcreww3So+9//JU5n/5aN
	 /oFP9T8TeGViExFrLGB2xWG7FoxDOY0j+SaxPTEA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19INOYFL116877
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Oct 2021 18:24:34 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 18:24:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 18:24:34 -0500
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19INOYaW051709;
	Mon, 18 Oct 2021 18:24:34 -0500
Subject: Re: [meta-ti] [dunfell/master] ipc: ti-rpmsg-char: Update library to 0.3.1
To: <hnagalla@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Yogesh Siraswar
	<yogeshs@ti.com>
References: <20211018212801.14426-1-hnagalla@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <dec9b00a-b95c-e4b1-f847-f48a378e0c2e@ti.com>
Date: Mon, 18 Oct 2021 18:24:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018212801.14426-1-hnagalla@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/18/21 4:28 PM, Hari Nagalla via lists.yoctoproject.org wrote:
> Update the ti-rpmsg-char library to 0.3.1 version that enables the
> support for the M4F remote processor on AM64x SoCs.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> index df14d63f..140536e7 100644
> --- a/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -7,10 +7,10 @@ PROTOCOL = "git"
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
>   
> -# Initial 0.3.0 release
> -SRCREV = "0e76d13d08f0df5c7e70d58bbf76f7e299906ae1"
> +# Initial 0.3.1 release
> +SRCREV = "0824546f61bda7715519841d9b9f0fb030ddfaf2"
>   
> -PV = "0.3.0+git${SRCPV}"
> +PV = "0.3.1+git${SRCPV}"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> 
> 
