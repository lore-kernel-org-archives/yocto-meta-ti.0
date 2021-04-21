Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.3162.1619038729869825949
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 13:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c24/3nlM;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13LKwmdA081539;
	Wed, 21 Apr 2021 15:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619038728;
	bh=gWyHJiacGQu4J0ocJyafUXPwg2Bm2HiF78sSjX5pOuk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=c24/3nlMaB7ChJxdlSvqhTt72YP0yrMrHN2hkLryPKzJ2ku9wyzWMwoVC8eGqVj9i
	 0p2A1K0q7kuHvMuQBnS+S5IHvhIrSq2Bq8bcDclXhOd2ORH4uWNqqb107Tm1eXiXmW
	 0eFh9/YBrsyBettZXz9orGiKpPLZE6a88DDIVwLo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13LKwm2W038809
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Apr 2021 15:58:48 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Apr 2021 15:58:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 21 Apr 2021 15:58:48 -0500
Received: from [10.250.33.21] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13LKwmll073300;
	Wed, 21 Apr 2021 15:58:48 -0500
Subject: Re: [dunfell/master PATCH 3/4] dsptop: bump SRCREV for kernel 5.10 build fix
To: <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>, Nishanth Menon <nm@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210421205326.22047-1-praneeth@ti.com>
 <20210421205326.22047-4-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <327188f6-b35d-1c57-3659-d7e27a373aab@ti.com>
Date: Wed, 21 Apr 2021 15:58:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210421205326.22047-4-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/21/21 3:53 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> bump SRCREV to latest to pick build fix for 5.10 kernel.
> this update picks
> commit 816485e68430 ("Merge pull request #1 in DBG/dsptop from for-5.10 to master")
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>  recipes-bsp/dsptop/dsptop.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
> index 6bc38373..31f775e2 100644
> --- a/recipes-bsp/dsptop/dsptop.inc
> +++ b/recipes-bsp/dsptop/dsptop.inc
> @@ -1,7 +1,7 @@
>  # This corresponds to version 1.4.0
> -SRCREV = "25e823b04e62af224dce97b90359b7569ce3fbb5"
> +SRCREV = "816485e68430bbec643eac9498bfa5303eb2c2e1"
>  PV = "1.4.0"
> -INC_PR = "r1"
> +INC_PR = "r2"
>  
>  SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
>  
> 

