Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD7EFD876A
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:22:09 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75711.1773753721492725653
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SzcZ0Kjy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.49, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfukRseJCcVJkccUZsK2meXPi1TK8lymq98qdrv+v5zg6cQU6BJbOOuhmBwYbf2iKrWzMfFXK39kNy7zo0MP8O9r/Xq7bUBvn6Q+dhntRP9CbP1CctyhXbnU6Qwxcr8mlyd+hLVam2pCYU5aBYzN8P2XbnD5BN/y3rmorDL7vAHLxq55t4NzAGd85+YXnjukkoeGX59mEjmGPPAtEYYNrT+FljQDqg9ZgZ70srfrpJdxEX1bUCpYCJzYahYp4G5fzj1TRM2WbgtTe+wxHCkJUdI+Ce4Bupw3Ple++Ao6B7YHIFWWyPbxoGguLs8MUlHf6UVLOkqf6JTVIFGjoXT/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FV7lLz6ZRj2qSWBvXR81Ogy/fyRgdH9+uZBu17rpuW4=;
 b=giWzYejPY3BgjWKsvnTCenfaBRD2IbQs19eZOKmhwUDztduGvhwb7D/YWu8leQWxPa+iLe/JzWtZXVLuz4py00aWeStTz91Tc1Murtx0q3peZo3QkalXAq4KkbLEFub7rwy5EeQUQESnmaaSsZw18t9ouOZ/2kk7c6yrh4K5RIXSBTcrXuMmjfw7TgIqRHmmTVxT9RnGxM28fvNq0ZNYejCxrEs6kXaDif1xh8gLNMW0r8hSoUcFEegIsVP+aPNoYAqv4A80SUX48eIF/ceTn24uneTwgea4aXdZAgUdeUPIy4lycUzQZDqnwx1S6STnIU2ynCLm+d785j8xC2mr9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FV7lLz6ZRj2qSWBvXR81Ogy/fyRgdH9+uZBu17rpuW4=;
 b=SzcZ0Kjy4bhXqEObvwu5yXSAapo3myNQadbOAgJ8pPUPtQSpyICy64V9dfpj2/+0pSWSaMfeAcKRBlGBi7FtQEcjo0Q/oCO2CfmLs/07rmIqBF9TPG+WYAGsIqLLlpoN4uKUJ3iQSfCNO2fO+gMqUHk9UtVW90wkn4+f0to1SBc=
Received: from BN0PR07CA0014.namprd07.prod.outlook.com (2603:10b6:408:141::7)
 by BN0PR10MB4869.namprd10.prod.outlook.com (2603:10b6:408:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 13:21:58 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::8f) by BN0PR07CA0014.outlook.office365.com
 (2603:10b6:408:141::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 13:21:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 13:21:57 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 08:21:46 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 08:21:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 08:21:46 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HDLk183229951;
	Tue, 17 Mar 2026 08:21:46 -0500
Message-ID: <d6465f94-c2a5-4ceb-b0bd-7f369f125c87@ti.com>
Date: Tue, 17 Mar 2026 08:21:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] conf: machine: am62a: Fix
 overlays in KERNEL_DEVICETREE_PREFIX
To: Andrew Davis <afd@ti.com>, Judith Mendez <jm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
References: <20260316221815.2502448-1-jm@ti.com>
 <20260316221815.2502448-2-jm@ti.com>
 <bc7280a4-c758-487f-9780-f56eeb945993@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <bc7280a4-c758-487f-9780-f56eeb945993@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|BN0PR10MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: da2655a3-8c51-451d-0059-08de84282a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PM8i02Hy4p2o/kCq7TP7AbKuwpznmnkSUN5jrMOiQG5cvparmpWaStuYKwSWEwrU2sIasyEPFWl1FcoOmhXzpTWmCsAuP/MNQqFvfZyokCvUG2LjRr2QoWe43XpCrlkWpJki6WBwmw2/keblSKcOkmJOxkud7BekmjoQDxvDZUH5zVWCB99e2KkfrQfZQY6Uf0lZbJL8Zh6r27M/yYq5NiVEULrQ2qXgm53VghLiFO11uRN8xZjdm3b3d09Sw3xfi/PFoAKAxb0xs82GgChbPoVdxCw9Eq1vqUt5JTBjsMOomJpX7VBPkmidJfl7ylGxyB7utzoUwJmwLdCPIFy4n1oCNtZPxljT+4GGrhUOt2g6L4ggn7xCygqvtLFzGq2JtdzrT/re+ZgbPFjpb+jzavQ5j4bVQFMnzclKoe8pUq1UUO2EhUZB3th9x+Jk3zUKOmLXGN7LgMG4k6Rkl/mB9b9t7NL/71zpAaybm7eyQLNNR9kApeOG1vGmPplZkwXoROtpVYMLxizm/eFWXF8NOsx4ZCoPll7SLCOofVoxDygBJeYtEw6uBV4kd4g0gGrYqgI8BI237z7uN2bHaKcfKEn/AqD7szq61idxQmtPRF6y1a0QojY49B2BSEEn0CE5/yMYnMacvjtdKTNivMMfd6Q41u3op70ODOQCwS0AvZta1NI8BAX+KgNDl+F98vp7scq1x8VnqgTy6iTFRjR4JdiXHWhhkChl7pzmvbWkgh0x7sV9QuhhZro4s8CZbyw3zFKzngffeUjw6bQKpDa2wQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aEFDdL8bCmcPQ2ZXWJqftyPrkI6ImaQea2WsweXO2MUdyP3IlEaWbz1i0KZAMy0RbAkLuav7EY/pzkxFXJExoVIlF8m3gVPI1k021ep0/NDYPEmo5oCTv547tWNgWzJxzrp5CFvtEtOpZnUGneNhteNREpq3VGq6i0OJNfzOcCo3S4lhrkDDNzfGZbX8zQt7hNtA6eVWrAg0qxTMO4y4IhvUp8DcMntBBs57u8e/bUiqTw5bLPhEwqJBnGzOTtntPMEBKC02R+lSoFevEtJZj0wNIunHBMexxNvuvfl4F68+YDeEegxqSBprjtyJpSDDVgm/JtFrXHbJe4zGljoUfg0KhRGzSrE5Im/fYOAkVNszrAGJMBuSsXWEryaxNa/Z17vNY30C95rNYoVKc0hIaAxpWLv5F+l+bDiqJHha8EnR7RpMT0ReR+89iVvZdXmP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:21:57.7023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da2655a3-8c51-451d-0059-08de84282a68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4869
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:22:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19735



On 3/16/2026 5:19 PM, Andrew Davis wrote:
> On 3/16/26 5:18 PM, Judith Mendez wrote:
>> There have been changes in k3-am62x* overlays due to conflicts
>> in DT, so update KERNEL_DEVICETREE_PREFIX for AM62A SK appropriately.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62axx-evm.conf | 8 +++++++-
>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>> index 32ae2490..01955470 100644
>> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>> @@ -6,7 +6,13 @@ require conf/machine/include/am62axx.inc
>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7 \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>=20
> "ti/k3-am62x-sk" is already a prefix of "ti/k3-am62x-sk-csi2", does this=
=20
> change do anything?

Andrew,

If you are right, then this locks the machine down to not pick up future=20
additions under the ti/k3-am62x-sk pattern in the future.  That's what=20
it does...  which would not be "Good (TM)" if you are correct.


> Andrew
>=20
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-ecap-capture \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-eqep \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-lpm \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-mcspi-loopback \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-pwm \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>> =C2=A0 "
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

