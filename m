Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.16076.1621238926289037877
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 May 2021 01:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mckioHBa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14H88j2u082677
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 May 2021 03:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621238925;
	bh=LA8d46KK2ai955QIoL8flYfWfMSvrr/ADDH9cb8RNGQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=mckioHBaP+gyqPsHMBYblr9P0i7KXUG90wkrjAHitokLgUhXLAP+a6fZrec61bJzD
	 ofvFD3n3yoIkY1l+R41JXBnaG+kn/n/hfS/nz0qgl01e4iqjbseFCYbj+rcOLvoRHf
	 QP1kEz4t9zAGrAE53dZtcFTaTwJOvX3loc5/BN5U=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14H88j9n108162
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 May 2021 03:08:45 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 17
 May 2021 03:08:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 17 May 2021 03:08:45 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14H88ciN065222;
	Mon, 17 May 2021 03:08:42 -0500
Subject: Re: [dunfell/master PATCH] conf/machine: am64xx: Include SK dtb for machine am64xx-evm
To: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
References: <20210507142949.25741-1-lokeshvutla@ti.com>
From: "Lokesh Vutla" <lokeshvutla@ti.com>
Message-ID: <01502adb-ab0f-4233-a8b7-9136521829cf@ti.com>
Date: Mon, 17 May 2021 13:38:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210507142949.25741-1-lokeshvutla@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Praneeth,

On 07/05/21 7:59 pm, Lokesh Vutla wrote:
> As a step towards unification for am64xx-evm and am64xx-sk,
> start including am64xx-sk dtb for machine=am64xx-evm.
> 
> Once U-Boot merges support for unified bootloader, am64xx-sk
> machine can be dropped.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

Can you merge this patch?

Thanks and regards,
Lokesh

