Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D81FCD98C5
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 02:17:47 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36871.1781144261408594690
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 19:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=xaRYLc+d;
 spf=pass (domain: ti.com, ip: 40.107.201.42, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcmLPOISW6TQ11qCGPhpvYScmg1TgYoJJhnrzmE+Nc/POJ39nxpZoej19QX0bgcqpIaTlUITkjIBqe0XK4MqgBMMi6O2Q1iCXVQRaoxUSBD7zhMRxj8zTy8YXWWG5sdtbYjmY56hasQN5yzT0QaXY/H17I1ElYusYnElDLIdQVm6grqfJaI5zGR9RBPHlIcv4zsWcrTCAb9dDk4c0lXvrTEV39ByabQSEHpjR/uwZ5boUoZAnNXbllBG2WTrkR2kZjY1AgMyOm0z1D1aDZCZNKDGrjhRm5fBNLdZnMLS4ftA5KgC+eceKIh2Mf7eeZ/QL69u76yDHlz5lTnT3Evd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSCx9pJco6sGgiNyFnfSElIPdN/SPf841/APlBxqJLg=;
 b=ljbVnFMZ2mghLn6UZNR3uE1CprU2ISd9F0K9JgrXNoJMXgvviXTK+hJmH42caYU2Ty4e9MUPmTOMYyfxQg3YYSQWv8NpIgUjakNGINf/lNdvsxti7gTb/q0cE3zV9DLxnvS0nbmo966I4sT4hX0sVVWU8+Ko64Xp/ARo77Qs8ZX6KUvDF7eh3lGDLn1n+VRtM21qtlCgsAAF5bza1p2HTmUP/VR0Oh3YGQ74+KEcRD+CYdN8mvKEPGL4OOlGalCxTeZrNnBACucVNILkBfVetRcbaACRGJdjS1GXjG8bfWivGOgqOQzuAg2o27JSjv/prfhax7Kan8FGrrPcddPb/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSCx9pJco6sGgiNyFnfSElIPdN/SPf841/APlBxqJLg=;
 b=xaRYLc+dMUzkm4aI8EHTzp0R3BF+l+f6d/Rkz+KR8QhW57sJdGTwO9YyL8momIqFe/RS3pI6IqKi4jVcBXYaISgwQngTpIdhD3tPp5o2UCWSvLErt5uIMut3VH9GQs+/YjMA2ecy2w5cKOg3PfPmYTHIOZkQW9TqCPzBViA7KIE=
Received: from DS3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:45f::16) by
 CO1PR10MB4484.namprd10.prod.outlook.com (2603:10b6:303:90::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Thu, 11 Jun 2026 02:17:38 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:8:45f:cafe::9c) by DS3P220CA0002.outlook.office365.com
 (2603:10b6:8:45f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 02:17:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 02:17:37 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 21:17:37 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 21:17:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 21:17:37 -0500
Received: from [10.249.64.82] ([10.249.64.82])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65B2HbpS921927;
	Wed, 10 Jun 2026 21:17:37 -0500
Message-ID: <d5d84531-360e-4f57-b4bf-699614b3d749@ti.com>
Date: Wed, 10 Jun 2026 21:17:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: Antonios Christidis <a-christidis@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|CO1PR10MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: b220a300-30bd-417e-635d-08dec75f9b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|4143699003|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	rNPyNbS8Jy3zFS+oBjjy9jETEu4el5vaD9+5XdqMQdOITsgw3NSYf15Wq4cdOEr2KzdkRMP9dT2A3KUXMTAFO6jJQCXoDeVKK9zLNsbraYObaNrWAEUdM8J6QHEfj0zKSHjCb9/a0bjT5xdz3mfV5wyj5TUl0S2Myl8UgBEtMQGBHN1QY/0ePn4EdyowATZSjpkeirBJGJQQQJagzqevhJHYcFZBMWGiuq3PKZEwgS5ivkHam3PimOK8q9ZHNU+AGz4+dwx363Jokh5Up+AAStjQBN7c0d6mb9ZCX0kfPF0PCBPF0ZRY8qOea1vEWmbyYB4zBc2uyTsuPJDKhvHqM3hYMTl9NyDxZsmoaP9E9oLMNx/+r9HphRi58tpsRA0+mZHsJMIJ0rUZdFgJL0+rVvD27EcQH18tnNCA+jnXRR0MvGTfVih8NQsVYGq3b6XTBn9kRZ1CZUSICU1hxq9hf/WyMBgnzp3wrT8sAZMDYLI3IE/lhreiz9Z1+x1k0qqszbnCFsS1473AtnTNv454blRMIMK6qlgd+OjcUzIhdQa8pFLOa21QARv932SBAvX4WXDT1dUu9xJLumKsA9VaDt6qH024B6OnMrhTjel4WMixTag94UMQwpIO8jVOfZ5iKvoCx+Dq595/qs3NETXiMN8tbwXo+OMWzlVy7NbtYdCQccaF9tAxaZ8CDsxKUs1HtJGf8Xp7SCVc5NeR1ge7xnXm3B9D9kyvWYR0iWj0kV0=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(4143699003)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RrT1wg35QQOcda/TCPWifP5itvxsqcBSpW9vPXVhxYZGldFazZtKLi9r8FkQhV48QvLEi2arpvGA/YFR9HfA2rpVjxtYA+s4EytuLm/9MxPEjyrPYNqL+uaC6AJpDB01YLaVPH7o0yJF7JR4cDBCewl79KzXU4I8pPANoXPccZt8WPl9rrffz7yzmRCobYjAZJiAR8pJn8cuhgSh9fVQfiHCiy3c2t7o9GRMTywNQ/hmcpqRSomnkdv8fU1H/3oj4o12sdSTmEE1cdXKwmnPkYs9B7u5xqVbXGOu3kdlUzSbuguWhFRu/a4R1IKbUwdTMhlVvZnzJpcVdko6fw8mzx7SV8DUs4WB5Z1uXGQwK7dkQ/R/u1KtfS3ono85hjLC+EQgmYUp7n7uT08eNs4AsoX2qCYJLaSTPiYwOnbqn+q+R2Xp5JzmOHnHcBlEbguM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 02:17:37.8402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b220a300-30bd-417e-635d-08dec75f9b98
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4484
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 02:17:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20018



On 6/10/2026 5:58 PM, Antonios Christidis wrote:
> Dear Ryan Denys,
>=20
>=20
> Let me know your thoughts on the overall patch. I am particularly=20
> interested on your opinions on the following change:
>=20
> On 6/10/26 5:51 PM, Antonios Christidis via lists.yoctoproject.org wrote:
>> BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"

So... I think what this does is establish the pattern for which version=20
it will match to.  And then from that pattern it will pick the highest=20
version.

So for ALL 6_18 builds it will probably choose 25 and never 24.  Which=20
is not what you want.

... I think ...

We have never tried to mix versions like this in the past, so I'm not=20
100% sure what the best course is.

Likely a mixture of the override based on machine needs to be in there.=20
And for that I'm thinking you might need an extra variable.

BSP_MESA_PVR_VERSION_6_18 ?=3D "25%"
BSP_MESA_PVR_VERSION_6_18:am57 =3D "24%"
BSP_MESA_PVR_VERSION_6_18:ti33 =3D "24%"
etc...

BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "${BSP_MESA_PVR_VERSION_6_18}"


Something along those lines?  That would be the most clear for people to=20
follow as well.


>=20
> I wish there was a way to use syntax like=20
> "BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even=20
> "24.0.1|25.2.8".=C2=A0Is there a better way of enabling this logic ?
>=20
> Also already aware of the extra ":" post-pended to the variable, I can=20
> send a v3 if that's all the feedback.
>=20
>=20
> Kind Regards,
>=20
> Antonios
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

