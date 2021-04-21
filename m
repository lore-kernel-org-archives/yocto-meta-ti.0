Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.3171.1619038716647271203
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 13:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pd8JrL0D;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13LKwZla044458;
	Wed, 21 Apr 2021 15:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619038715;
	bh=aX6wwNz5zZEOZkGWtZhOBo2BkvIUNHfAD6jv2EQmtcU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=pd8JrL0DnTlVRp7q00d33rw880/bVR+Gr0UUkHNn/kUDj7XOvhiOp3uNbMFBwjqyC
	 ICKCu4a2vC9iWs+Obkt9VSxxB4+HTrxQPYuRIcBGcs2nyAjTf1Q8HJKvkfIRYw2Njm
	 Dmo122Inm/6ts7umw1yaReESAgHSBFccGxKScOEU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13LKwZpM038747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Apr 2021 15:58:35 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Apr 2021 15:58:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 21 Apr 2021 15:58:35 -0500
Received: from [10.250.33.21] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13LKwZYA060349;
	Wed, 21 Apr 2021 15:58:35 -0500
Subject: Re: [dunfell/master PATCH 2/4] gdbc6x: bump SRCREV for kernel 5.10 build fix
To: <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>, Nishanth Menon <nm@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210421205326.22047-1-praneeth@ti.com>
 <20210421205326.22047-3-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <d10cba84-b3f0-b368-f274-a8aa3386ea2a@ti.com>
Date: Wed, 21 Apr 2021 15:58:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210421205326.22047-3-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/21/21 3:53 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> bump SRCREV to latest to pick build fix for 5.10 kernel.
> this update picks
> commit dd0c82fb5763 ("Merge pull request #1 in DBG/gdbc6x from for-5.10 to master")
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>  recipes-devtools/gdbc6x/gdbc6x.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
> index f0d702a0..eeb18fb1 100644
> --- a/recipes-devtools/gdbc6x/gdbc6x.inc
> +++ b/recipes-devtools/gdbc6x/gdbc6x.inc
> @@ -1,8 +1,8 @@
>  # This corresponds to version 1.1.0
> -SRCREV = "d1d32c32fa9e40b48fabf5893487ccbd5790499c"
> +SRCREV = "dd0c82fb5763a6b32dc6d68e561efb66ab8283d7"
>  
>  PV = "1.1.0"
> -INC_PR = "r6"
> +INC_PR = "r7"
>  
>  SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
>  
> 

