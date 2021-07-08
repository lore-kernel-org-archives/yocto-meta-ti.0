Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.11857.1625750774373762962
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Jul 2021 06:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HiRxg9R+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 168DQCBC045892;
	Thu, 8 Jul 2021 08:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625750772;
	bh=qnI9f52dZcxQ1jeQ3YUMQu/cwTTQQCemiEPhtFmYm4w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HiRxg9R+HNiN6XiU2WJxhRbzXC3DQMA71Ra2Ewe5YXPV8Aq9NmGT7jhXRzV/YZkvl
	 AxljCOQPfbe0p/wJfGvhHRBNo24NH1uyKz+bN2ufMX9CcNEriIkkXgo45Y9mEztxN1
	 O39MwtFpKtepiLt/ULFlZilx2jJ0QedKMo+CKoRA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 168DQCuP092692
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 08:26:12 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 08:26:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 08:26:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 168DQCCL067955;
	Thu, 8 Jul 2021 08:26:12 -0500
Date: Thu, 8 Jul 2021 08:26:12 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master][PATCH 1/4] linux-ti-staging: Update to 08.00.00.002 release tag
Message-ID: <20210708132612.ftfkal4vovdrprfj@anymore>
References: <20210708051232.10077-1-yogeshs@ti.com>
 <20210708051232.10077-2-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210708051232.10077-2-yogeshs@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 05:12-20210708, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Update to 08.00.00.002 release tag
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index ff807108..59c9bba9 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.10.y"
>  
> -SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
> +SRCREV = "08058130545674a175939922532dc3ca76d8bbad"
>  PV = "5.10.41+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild


If you are picking up eaidk board patches, it will need to be after
this.
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
