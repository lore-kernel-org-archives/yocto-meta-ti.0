Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0961CCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 20:18:29 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.913.1761250700066923652
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 13:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=yul8LHbX;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: jm@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NKIIZC1747372;
	Thu, 23 Oct 2025 15:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761250698;
	bh=OJwG+TGR508oHVQWGbXcXCsjEekRGDsPnvigwbzyDTk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yul8LHbX4S3OUvZJPskBWelr0YCnUJH/6FSp4/hdrw95Bm4IHnLc8vcIoLqHL6MyX
	 92HnN+Myj4TOUHBTp6eBUCynsfjS8G/eAkP42+2BoOluSVRC5a0etI6KrskBNYybyX
	 R90R+8QaKSdsISgPZNAxi7mNkojIK/S/YR8qc53Y=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NKIIZ73063718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 15:18:18 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 15:18:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 15:18:18 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NKIIZL3419731;
	Thu, 23 Oct 2025 15:18:18 -0500
Message-ID: <aa697db1-ecad-4096-952d-776efcf78921@ti.com>
Date: Thu, 23 Oct 2025 15:18:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] 2/2 conf: machine: Explicitly include
 overlays for am62 LP
To: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20251014200702.933617-1-jm@ti.com>
 <20251014200702.933617-2-jm@ti.com>
 <531876c7-0684-4c12-be84-f7c784579da7@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <531876c7-0684-4c12-be84-f7c784579da7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 59NKIIZC1747372
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 20:18:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19159

Hi Andrew,

On 10/16/25 10:29 AM, Andrew Davis wrote:
> On 10/14/25 3:07 PM, Mendez, Judith via lists.yoctoproject.org wrote:
>> AM62 LP SK configuration=C2=A0 includes all PWM/EQEP/MCAN overlay
>> in KERNEL_DEVICETREE_PREFIX but move to KERNEL_DEVICETREE=C2=A0 and
>> explicitly state the name of overlays that should be included for
>> am62 LP SK build.
>=20
> Why?


Yea, found out using KERNEL_DEVICETREE_PREFIX is the correct solution
in our case, contrary to AI explanation between the two variables.

Will send v2 with just the SPI overlay patch.

~ Judith


