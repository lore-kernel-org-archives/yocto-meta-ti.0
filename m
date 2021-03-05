Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8828.1614928390928323938
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 23:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=irO3tVEO;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9024338C0655
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 07:13:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1257B5nD041845;
	Fri, 5 Mar 2021 01:11:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614928265;
	bh=0Z9G0WWim57Wdvj97dIBHxe+NNhjtgIOJ1AB7Q7BUY4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=irO3tVEOBWr/EFc9p2eSV3jKGlaMv4notykD0by1RvOAaHS7czDGL+3g3iHe2McUi
	 eNoSgHUbk5J6NKAkBitmELiXS1hKCTiSjp8vQ7GUToU0iIHWWxOJzFAczgrCTExggG
	 Q+CXEpUfxW+cYmlkjO1+WkXpvmTWTVS5yQRXTVdY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1257B5TS074644
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 01:11:05 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 01:11:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 01:11:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1257B5W9035906;
	Fri, 5 Mar 2021 01:11:05 -0600
Date: Fri, 5 Mar 2021 01:11:05 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Lokesh Vutla <lokeshvutla@ti.com>
CC: "Nishanth Menon via lists.yoctoproject.org"
	<nm=ti.com@lists.yoctoproject.org>,
        meta-ti <meta-ti@yoctoproject.org>,
        Denys
 Dmytriyenko <denis@denix.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
Subject: Re: [EXTERNAL,dunfell] ti-rtos: Fix J7200 builds by dropping evm
Message-ID: <20210305071105.o46acaxismlevh2i@clergyman>
References: <20210305064155.5125-1-nm@ti.com>
 <31751cf2-ce18-5e68-57e8-58f347865683@ti.com>
MIME-Version: 1.0
In-Reply-To: <31751cf2-ce18-5e68-57e8-58f347865683@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 12:34-20210305, Lokesh Vutla wrote:
> 
> 
> On 05/03/21 6:11 pm, Nishanth Menon via lists.yoctoproject.org wrote:
> > "evm" prefix messes up the pattern matchup for J7200 and falls back into
> > default, as a result, we attempt to pull [1] instead of [2].
> > 
> > [1] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_12/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
> > [2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
> > 
> > Fixes: 77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firmware")
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> 
> For the sake of completeness can you add default web link for j7200? I still
> couldn't figure out how the weblink is populated when default is undefined.
> 
>   DEFAULT_RTOS_WEBLINK_j7200 =
> "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
> 

I believe _j7 does matchup j7200, hence it works and adding _j7200 will
be redundant..

DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"

I am a noobie on this, so will be interested in folk's feedback.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
