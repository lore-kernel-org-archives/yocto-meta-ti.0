Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.779.1603907645175743301
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 10:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JCHmCp2E;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1869538C11F9
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 10:54:04 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SHs3oL086018
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 12:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603907643;
	bh=kaIWPrwhoQS1Y+S+CqIdR5I8IrU0pDz0MmYT/mmffGU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=JCHmCp2ELZ1LK/bh288lnCo7eGWyR5tn+5T0oHiY7zvPTerhNooGyA7C+4ehVrzW7
	 x0nU88pstWrSoTyfY6L+teaOsNoUPXYG7hpSG4LVRXEv40+YwK5nHbD7jUVszle5KJ
	 DM2bg5LPip7UE1ytPqE8EAytzLKW0Ymdb4JU9Et0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SHs3t3016452
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 12:54:03 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 12:54:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 12:54:02 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SHs2nV129965;
	Wed, 28 Oct 2020 12:54:02 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH v2] ti-img-rogue-driver: pull general toolchain support
To: Gowtham Tammana <g-tammana@ti.com>, <meta-ti@yoctoproject.org>,
        Denys
 Dmytriyenko <denys@ti.com>
References: <20201028173608.10421-1-g-tammana@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <562ed28b-b53a-c87f-3c8e-359aa8adbfa4@ti.com>
Date: Wed, 28 Oct 2020 12:54:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028173608.10421-1-g-tammana@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Gowtham

On 10/28/20 12:36 PM, Gowtham Tammana wrote:
> The patch for supporting the general toolchain is pulled into the repo.
> Removing it here from the recipe.
>
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
> v2: fix email in signoff
>
>   .../0001-km-support-general-toolchain.patch   | 56 -------------------

Did you use "git rm" to remove the file? This looks weird that the file 
changed then got deleted

Generally we should just see

  delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch

Dan


