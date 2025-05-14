Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89826C3ABCC
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 14:06:20 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.103395.1747231574307721305
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 May 2025 07:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=YFASyVUD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54EE6Brd3169274;
	Wed, 14 May 2025 09:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747231571;
	bh=DpP8xsmiAtoJMvL2Gep923N5mnre4wLsIG+63uO4PfI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YFASyVUDwcybChr31mlZ12qvxoPjGeXm9y6PRKSKBsTxWAxP+ozGG+N/JgraNBK4q
	 ojWt5eJcB2PLkGN8xvmYxFpwAOJZxFtTsxK/9Cz74nmmEr0Ijhk8gOGnmGep9xGGZe
	 28kN69rVqv5AJqac6hG58oOs1NkauZ2QX8Z/nv8I=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54EE6BnV1298084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 14 May 2025 09:06:11 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 09:06:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 09:06:11 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54EE6Bxp048030;
	Wed, 14 May 2025 09:06:11 -0500
Message-ID: <ac5dd65c-1d3e-45dd-8677-40d233b85006@ti.com>
Date: Wed, 14 May 2025 09:06:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH v4] meta-ti-bsp : Add build support for
 am62dxx-evm
To: Vishnu Singh <v-singh1@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>
CC: <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250514123917.169544-1-p-bhagat@ti.com>
 <bcde9d47-c65c-4356-b440-d7a65bd4104e@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <bcde9d47-c65c-4356-b440-d7a65bd4104e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 54EE6Brd3169274
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 May 2025 14:06:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18562



On 5/14/2025 8:23 AM, Vishnu Singh wrote:
>=20
> On 14/05/25 18:09, Paresh Bhagat wrote:
>> +KERNEL_DEVICETREE_PREFIX =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62d2 \
> i think this "am62d2" is not correct, am62dx may be the correct one.=20
> Please check

Nope, it looks right:

arch/arm64/boot/dts/ti/k3-am62d2-evm.dts


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

