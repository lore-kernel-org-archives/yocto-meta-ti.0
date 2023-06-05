Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28EEC77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 11:22:22 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.4934.1685964136184224139
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 04:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=OAuIQx2r;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 355BME1l000499;
	Mon, 5 Jun 2023 06:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685964134;
	bh=h6rRepcAt89u210TU7I7YZO6BxIL/qFuuOvF3UUSecE=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=OAuIQx2r+xNGDMGEvUSL30xJq0dWIkfnVRFG8uhzPSUFZ8I7XmywW1R1lBfSwngkb
	 MNeyB2j0oeag4XMeHiPdtzEZwd7I4sMzb+hJMSdUL419AWheYIFNwN8BcwMJl0Vkyz
	 d2s8T0uyXZPyGeFxc2P3v5FZi+tbU+06yuwzKBRQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 355BMEjU064163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Jun 2023 06:22:14 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Jun 2023 06:22:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Jun 2023 06:22:14 -0500
Received: from [172.24.145.229] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 355BMCt4003619;
	Mon, 5 Jun 2023 06:22:13 -0500
Message-ID: <8e560bf3-7997-9a66-a3fb-55dbb264c4e8@ti.com>
Date: Mon, 5 Jun 2023 16:52:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH] meta-ti-bsp: Add
 recipe for u-boot-ti-jailhouse and linux-ti-jailhouse
Content-Language: en-US
To: Ricardo Salveti <ricardo@foundries.io>
References: <20230602092932.2576466-1-p-bhagat@ti.com>
 <CAAaKDhH6NFE4wE7Rge4qYELvOSV6V4YTWoi7eyiAeoZBr_8BPw@mail.gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, <g-gupta@ti.com>
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <CAAaKDhH6NFE4wE7Rge4qYELvOSV6V4YTWoi7eyiAeoZBr_8BPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 355BME1l000499
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 11:22:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16663

Hi,

On 02/06/23 22:45, Ricardo Salveti wrote:
> On Fri, Jun 2, 2023 at 6:29=E2=80=AFAM Paresh Bhagat via
> lists.yoctoproject.org <p-bhagat=3Dti.com@lists.yoctoproject.org> wrote=
:
>> Add a recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which cont=
ains
>> patches used for jailhouse. These will be used to build jailhouse imag=
e.
> Should a new u-boot recipe be created for just one patch?
The patch in u-boot is used for jailhouse on am62xx-evm. It fixes the=20
"reserving fdt memory region failed" error while reserving memory for=20
jailhouse using device tree overlay. patch is kept it in a separate=20
repository(processor-sdk/u-boot) and only the jailhouse image build will=20
use this u-boot recipe.


