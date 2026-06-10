Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5140BCD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 12:38:16 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19537.1781095086528432853
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 05:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=tLCLdK0F;
 spf=pass (domain: ti.com, ip: 52.101.57.14, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKwFfpvBf381aTFuENPHVLYVhQG9RbiqzxiCs4jtMD3ruKQQ9HFb3is7VAD3X+Av9BwoUWXJjoT+B6vIdqV1qM8L9nqyJLHLq5cTfLcdE3jMVSunITwfl5Wt3KqxSM2baK4XV1WNN9ut+25ZUZaQbHAvwCUOVqVwNFP+Ha2KfU57MGsaplpPv6BxitkzdMFnmjxTcQMKSnjBEOuSyLE5ih7C2ygOrWsLXd+w/6ZI2J56mPn8DSObeLlExIQRyGC8tssHRJTsZUE8eWjsGdH3vbcgrczAGX5hQPDsRQNhX2PfJAtOJJqxCF50H2nPrH1M1tmitxiXnMCvoH2HSfVVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxEBVQp5I86D29+D00OdN62oLwp/SL4ZuOmb1RchyLY=;
 b=MPfl05s8ko8GjfaUmUNv6yR7W1kfxEA0iwXs8xPqq1uHLCqpCemRgwcxMm6HVXTcd7v2uy7QBXFfKlibW3j9PeoK4Hg7T9a7SFfwv1nF+hFsRqzMY3lUeJTtb/TS9UT4nCiOqIbLZDq6Ai3n0YIsiXsnfOYZZih1mI6NJVdQ4Tjk6ANSpkK5QqapEyF0dmfwmRkRVYxf9NOPLJlVeSCBAac9RsJnWjNzKAVsW6+R+4dm07GeAo6qOP2rrXrQRKZHarZnG5QD8j2PzSxOCaX9op/ad+lLHLMtPZ4lsiACaYHK9nbJbKaWjvIV4ShOiYubflNePpUoM50qMQQnK1jNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxEBVQp5I86D29+D00OdN62oLwp/SL4ZuOmb1RchyLY=;
 b=tLCLdK0FzKeXosime0brPNb7U71+PBmu7b/46+LOzdYl/iYMifkkTnhrq9nZ3r/KtjV6PXSTtuKWOKyg5jDnudlBEGcfIkNPpSQwbwlc+TIgOFLoaeMMuJdRsv87zVlgb0QzmeYQOHF3aOTWKWIVXRocWiVWz8pW3vJgYnZOXmA=
Received: from MN2PR18CA0006.namprd18.prod.outlook.com (2603:10b6:208:23c::11)
 by BLAPR10MB4900.namprd10.prod.outlook.com (2603:10b6:208:30c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:38:03 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::3) by MN2PR18CA0006.outlook.office365.com
 (2603:10b6:208:23c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 12:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 12:38:01 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 07:37:43 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 07:37:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 07:37:43 -0500
Received: from [10.249.64.82] ([10.249.64.82])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65ACbhtk3288776;
	Wed, 10 Jun 2026 07:37:43 -0500
Message-ID: <c8532bbe-2640-4333-aa88-0fe1a51f450e@ti.com>
Date: Wed, 10 Jun 2026 07:37:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH] beaglebadge-ti: avoid building ubifs and
 ubi for beaglebadge by default
To: Yogesh Hegde <y-hegde@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>
References: <20260609103052.2451227-1-y-hegde@ti.com>
 <c6c07667-08a3-4b22-88ad-9ae5542a4d14@ti.com>
 <7b465487-5987-4420-9550-2e016fb4fe9d@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <7b465487-5987-4420-9550-2e016fb4fe9d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|BLAPR10MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1fd838-82f0-4c48-6a40-08dec6ed1c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|18002099003|22082099003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	o0Quh+J846k4YZt2lhscS0Vv0lH5HX9uSc3LfBP2/Bta66T6eSAdrbHSzjgJcmDq0/uyN/yvIGb4p+/hc9jtaVay5RuMH0SswaQbbalc37a7Ip7rpxDOcDG/ZJCKiUkrw6wapWS8IOn/HvLM2gJJtoG/CXIdXuDhjHgCUMCapqUS1GGTMbw6R+h/1ye3fbIwCYLeMmDgMNtq6cznvGfyd91ALX30cp2vC4KgclmBE+/scS80bIZAZqVQF/K34AZULU85ERTr8bEnx9pDpKqlKoszmyb37IJVpAkB5+FdvhaLnitxOUWE5UpGg5OFfyMkdoApYKZcpbRpsS7ls2sYucOy9VW0e4A78pSwI1tvXUH0tu7PVym+kLPwPs8ANj1FkB+3t8DjKvUZzhDVN5fz7rRPcXeF/xhpufBR1zfCKPkUgYjqDXUXjWJnDHwqsfLxMSEStKUgeGGDUTSLNErCYf6POV+aNWsuqFtt6oihDtTjXibn0ttv+J2M9/uFmXxYCUfvhjgId57IyBaA9A3QH5h5cBek7lLY86yWH+DAKeHypB5NIh5zjOSfWyHynKQVxBeycy/whUL4ROhJin/XErbBxTJ1vwfVIuKwtP8a9XYsikznafzSJEebhr42n2i6pE8uFLF1Yb1FABGiijcZSpY1Uk5MxwrZCD81vcCaGqyXnWrG+U40sHuYvWmcYferIO/cX5eRn8H85WQUYTBxjOjaT2dzxKEJixpW6LrL4eE=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	O2ckqXaguOndx0LGIW7aLt0LecFJ1fPUEDEjBd6sTXyzxGRehvtkrOPeG1w3tEa5l/uyndPBxNOWtdgkbg6qkOnjDOL87wSvnKuuE5w0U1XyOKNX0e0f7g+vpYrd37NuQHnEbL8uBDpLKN5H+bt/Fv489VfM7gREg+/0tHiBfEph0AEweI2pD5s90+czWjC/wS//D1E2kfRSGDJnM9JKuDEYQk0A8lTYmYi3AZ5fOwHB1/wKqx39X+4dmEXhgjuAvzOfleAzjqAXtad/P+S4b0exynl+M3LLJuh8KnmMgd+DzJXON7xS7Rg2ugRsVCtmjzF09KPg1Dt5vn+/MpdAM3fLKHKpE66QONWPM9yXEMJxDB/jaIu020I3CsHVELg9HALAd+7yRdHRrpl/g7p7laEGJqDUz02jkk3YRxmoIFOFetRQIp+HH8zxRx3DBynI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:38:01.8053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1fd838-82f0-4c48-6a40-08dec6ed1c67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4900
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 12:38:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20006



On 6/10/2026 5:26 AM, Yogesh Hegde wrote:
>=20
>=20
> On 6/9/26 19:35, Ryan Eatmon wrote:
>>
>>
>> On 6/9/2026 5:30 AM, Yogesh Hegde wrote:
>>> Beaglebadge has only 256Mb OSPI flash and except for
>>> arago-bootstrap-base-image and arago-tiny-image other arago images
>>> doesn't fit into OSPI flash. Hence remove ubifs and ubi from
>>> IMAGE_FSTYPES to prevent unnecessary image generation and build
>>> failures when adding packages to the arago-default-image.
>>>
>>> Those who want to run arago-bootstrap-base-image and arago-tiny-image
>>> on OSPI can enable UBIFS in local.conf .
>>>
>>> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
>>> ---
>>>  =C2=A0 meta-beagle/conf/machine/beaglebadge-ti.conf | 2 --
>>>  =C2=A0 1 file changed, 2 deletions(-)
>>>
>>> diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle=
/conf/machine/beaglebadge-ti.conf
>>> index 78525030..5295296d 100644
>>> --- a/meta-beagle/conf/machine/beaglebadge-ti.conf
>>> +++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
>>> @@ -4,8 +4,6 @@
>>>  =C2=A0 =C2=A0 require conf/machine/include/am62lxx.inc
>>>  =C2=A0 -IMAGE_FSTYPES +=3D "ubifs ubi"
>>> -
>>
>> If you are going to remove that then shouldn't ALL of the UBI settings (=
below) also be removed as it does not make sense to configure something we =
are not building?
>=20
> The intention behind keeping `MKUBIFS_ARGS` and `UBINIZE_ARGS` is to give=
 a reference for those who want to enable UBIFS
> via local.conf. They don't have to calculate these values.
>  =20
> Machine config still defines the hardware max limits while users get to c=
hoose if they build UBIFS or not.
>=20
> If this is not valid reason, I will send a v2 with fixes.

Please remove them.  If we are saying that we should not support UBI on=20
this machine, then we should not pretend to support it.  If someone=20
needs to recover those then they can look at the git logs and see what=20
the values were when we removed it.

On the other hand, if we are saying that UBI is supported then we should=20
not be turning it off and instead work to address the bigger issue of=20
not building UBI for the default image.

What is the actual issue we are trying to address?  We have not seen any=20
build issues related to this platform that would spark the need for this=20
patch.  Please provide a little more context so that we can choose the=20
best course to address it.



>>
>>
>>>  =C2=A0 MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
>>>  =C2=A0 =C2=A0 UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

