Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACAAC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 12:03:41 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7949.1685448214385233964
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 05:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QuUhdtQ1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UC3XvO122341
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 07:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685448213;
	bh=SeRfEUeni3x5S/jMejjZwbxWQE9o/LRG18PvccDHThA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=QuUhdtQ1AxcFKE4r1uwefkuv9e3scDiBH9fluEGGGDnKHYGg9G2vQYd7ytm36OLpu
	 Db6ofBgk9GLufn2G7jHtXftAXDPy2WIrYSgDjmg+Nva12Frh5KLBhMrFupEM4Od0hI
	 RpDsBz8EsEFeAE8q187fcN9OKc40nXUr61ENmwWY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UC3X7d013137
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 07:03:33 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 07:03:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 07:03:33 -0500
Received: from [10.249.39.16] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UC3XtH118660;
	Tue, 30 May 2023 07:03:33 -0500
Message-ID: <8d509990-d5ce-2df9-8e3d-e71873e4cffe@ti.com>
Date: Tue, 30 May 2023 07:03:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fit image signature
Content-Language: en-US
To: "Limaye, Aniket" <a-limaye@ti.com>,
        "Chawdhry, Manorit"
	<m-chawdhry@ti.com>,
        "Dmytriyenko, Denys" <denys@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Davis,
 Andrew" <afd@ti.com>, Randolph Sapp <rs@ti.com>
References: <5dd77f89-8c9c-e135-5db9-a526d4b3b8de@ti.com>
 <aff76fb0c59b4de0800708f45df6b9dd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <aff76fb0c59b4de0800708f45df6b9dd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 12:03:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16621


That is correct.  Rather than diving deeper into mire of copy all of 
those classes we are working to get our changes accepted into the 
kirkstone upstream.  Randolph and I will continue today looking into that.


On 5/30/2023 6:29, Limaye, Aniket wrote:
> Here's more info, if needed, :
> 
> The deploy for the .dtb is being done from here : https://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass?h=kirkstone#n755
> The class is appending the functionality to kernel_do_deploy
> 
> Whereas our linux-ti-staging is not using that function at all. We are using kernel_vendor_dtb_do_deploy from here : https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/classes/kernel_vendor_dtb.bbclass?h=kirkstone#n776
> 
> Regards,
> Aniket
> 
> 
> -----Original Message-----
> From: Chawdhry, Manorit <m-chawdhry@ti.com>
> Sent: Tuesday, May 30, 2023 4:01 PM
> To: Eatmon, Ryan <reatmon@ti.com>; Dmytriyenko, Denys <denys@ti.com>; meta-ti@lists.yoctoproject.org; Davis, Andrew <afd@ti.com>; Limaye, Aniket <a-limaye@ti.com>
> Subject: Fit image signature
> 
> Hi Ryan,
> 
> I was recently trying to enable the fit signature locally on yocto and faced a warning..
> 
> WARNING: u-boot-ti-staging-1_2023.04+gitAUTOINC+010afc1fe7-r0 do_deploy: Failure while adding public key to u-boot binary. Verified boot won't be available.
> 
> I was talking to Aniket about it and he let me know that there is some vendor specific override in the kernel class now and am worried that this vendor specific override might not be compatible with the fit signature that is there in the upstream. Can you let me know if this vendor specific class has the things related to enabling the fit signature booting with uboot?
> 
> Regards,
> Manorit
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

