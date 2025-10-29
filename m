Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A126CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 03:30:04 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.59])
 by mx.groups.io with SMTP id smtpd.web01.383.1761708599591584481
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 20:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=aszXRbLh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.59, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXiom2i/4r6h05aYXnnyNl9VyLZx1xlX9/mqjXjOGWMBlK/DizoYnha9ZQS/d0H9UAxyeapKZZZCgRpaKRMgPCc0FZd9aB1tQsth6cPLUqUtfQv5bY7IXNvpAbLA2QT47WDmde9aWAN5RTm0QOnUd8TKftI6pR88l99V5x4xasxaYRuwuL0J4twGldcNzIZqBRREa8H0dsykpPGpgfjpo10gDg3KhiOMiPZqodGAKKOCWVlJAR0LJFKgi4KAhF7nfS1BI+JGvhrTjE05aoFsLQcJ0fC/QxJcrsBpem5QVXTku3Lpap0fN2WgxS4YHN4QF52cAMok2EXU+8pxupzTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRMA1xj5jWIquHLHFCC47oxJSilkskhVROrJDCKtN6M=;
 b=WaV5FLiV3xZmgK0NrqEUYWq9nmb2RZhCqFcXOFq0V+fO13UT/MqrJdvzP6jS8gtGRGE7OcvDmiUk/kAE1BFu1nLdzXH/955bL3PE7qiTd6vQ6wqtBvy6M5SNErxehiBHP1NeOSO9VXMvbYoOTD3csqUF7rnDvgrVNshANNwsz+cbxXPBodVOU13ApjtSwXCzzNKlyDcnokJTqmUOf7ZuVI+5KE2CsIS3fnT22iK9rGj7iu5wursgT2cTES32cu4GSRuZ0ECFX5G9wXw6MQm03XQIWXnwo+WPtjDKGuuOiIRTbZeqrEcKMXKuQdLRk8ZdwJ9NI0RQkMKpHwO6yY1WzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRMA1xj5jWIquHLHFCC47oxJSilkskhVROrJDCKtN6M=;
 b=aszXRbLhx3v7IlUFZsfNP6jSVT7sG0l/KnL7pn+Hvc9gXKN/dV7AvKjLnTyEkpOYFtQVxnwSLsLUn40wcY0RpgyJE6pQ3k7Z5nM8e5A1MsQ/6y9qGVbyXd6jDpgboHKXKsGPdh3kXeOsV+LyccV57nuK3XgQExwEve0yF2UOAzw=
Received: from BN8PR04CA0055.namprd04.prod.outlook.com (2603:10b6:408:d4::29)
 by IA1PR10MB6242.namprd10.prod.outlook.com (2603:10b6:208:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 29 Oct
 2025 03:29:56 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::11) by BN8PR04CA0055.outlook.office365.com
 (2603:10b6:408:d4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 03:29:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 03:29:54 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 22:29:48 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 22:29:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 22:29:48 -0500
Received: from [10.24.69.90] (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T3TkWL3340264;
	Tue, 28 Oct 2025 22:29:47 -0500
Message-ID: <7789e891-29f7-4c28-a724-79c1df840a84@ti.com>
Date: Wed, 29 Oct 2025 08:59:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev &
 license
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<denis@denix.org>
References: <20251027040535.3340080-1-v-singh1@ti.com>
 <03baf840-71b6-4260-ad63-7f3f3d781c74@ti.com>
Content-Language: en-US
From: Vishnu Singh <v-singh1@ti.com>
In-Reply-To: <03baf840-71b6-4260-ad63-7f3f3d781c74@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|IA1PR10MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d52563e-8d9f-4b3c-91db-08de169b6d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iWC10aD5kffglvqaguS6NfX24tVjSUxM7D82dKNZiwRWHS1MWhnBfjAr+3vA?=
 =?us-ascii?Q?Z3XdVT7B0VGmB+1yUJ2u5POXHkaPfc0gwkdblbAWAj9YCT2dz8PlL4Mh2HHD?=
 =?us-ascii?Q?C+nvxjlrTVjv2VWhikydq9gYNUQEhjuH19nKxmQ3oSiIorlh+rUhwOEZkhnQ?=
 =?us-ascii?Q?DJKmoPnV55UFod2FbUsiML28CLpsBn6LliLOeoVaZ/K9KrCjX/bPnxMQUy6s?=
 =?us-ascii?Q?wdthPcFpTzQe9k/bTyOZuST7NQdyzV5g8exMt4s1bKgodDw9q99MXosoYLXW?=
 =?us-ascii?Q?wj6XJFB/ys9EaIOaBuXlsw7qbuIgUJl/kR5EJ9bTsvcbVdVO5OeI1t1RGCP/?=
 =?us-ascii?Q?jrIQYRww0V4VGVnghR3bsY9KU8Gz1omVIVdLSWf2KyYKarDBuVYiNDH4WgyC?=
 =?us-ascii?Q?q/NdEk/MKnKexUT0tyJd91VNQV4ObbGMecWoqO1js/xROlen3HVylK46Ptow?=
 =?us-ascii?Q?9ri02/VDnJzBZxnKETadoH4jXXfpCLr7DNyNyc4OvtBgT8AJDmeb22VtNQEl?=
 =?us-ascii?Q?xtuJSY2FHb8U/5IJ/Jizas9T24/rjUAKOujY3pQSIJ05xp/w8Gpd1njbCI7H?=
 =?us-ascii?Q?lcNfWvFcldqUtk0PHJnYr3BlZgnJOMCfBmx5z90yoP71/SxCnlF15+LbrXUa?=
 =?us-ascii?Q?CEBAcig8Jhp2gTzjolya2QvatE1L5GOuSrpO/dBuf5+STg0jpDJT5Y2i7TY3?=
 =?us-ascii?Q?tjvBYEbKGja8+CRgIDKQllxkx1dfARGAtWtTg4iSIcESU2+3nR+099wvs4VS?=
 =?us-ascii?Q?pJLLZxkHd2zXaaIkxuQMC15mbCPZXJEea07iSnj66JuHTnbhCLjEzLIb5oZT?=
 =?us-ascii?Q?J6+F8jEzFMOd1RTZlHrgs4BAJdadYhVU8VjwjkU2M4mNXmlGl3Fla8mFzjW4?=
 =?us-ascii?Q?yQDPW2nbq9rOMz9KbAIfHeWKQ6LTbE4KEZ3m+C3PvFv5LN5bOY8CBY/VkdKw?=
 =?us-ascii?Q?RkACzJcL0b1+fFvk12tZlK/nJGsy3NK6rnYJs+tcu2qrMUQWtsM/n/st3H4u?=
 =?us-ascii?Q?m2cHAJWN+uicS2bzumpB0isVObSCt1CMJ1p1ckoTmAULByXEGJXrF/y6Kql7?=
 =?us-ascii?Q?EmvSgUDi8fndJ9qtDc0uN0Icg529Wlx3XyvWG7LHPjMkigeCG7JJvEtjpShz?=
 =?us-ascii?Q?zsOQBhQ99lX7Be+e6wGrWHwNwagb+j/wXgIcx4gMMU5gVdtmbhAmuQLC/UDQ?=
 =?us-ascii?Q?Hv1iWUM1ywqlkTmev1DIvCVvTefwqkHITh5ye7mSGiDNB1dZruuwZUwGe5np?=
 =?us-ascii?Q?9+GT7zmCIQLE+YFb8/lQ3R0ks/yt04uG3NbonjfSCaAwD0YybT36vqIg4KIu?=
 =?us-ascii?Q?u9xwWGG1BkmLjfcpUKR/lpbmkFtdbQYwrDhA0ylc+zJiHXM/rcYi00+knMxu?=
 =?us-ascii?Q?6CrDrbW9spvtg/0VfBG/9U14ppx/Hi/YRA27hc6oI3Ww5Y3Fy0QddrUo0zH3?=
 =?us-ascii?Q?pXUFWjt/mrZsvs3gCVY0uoutF2er6bf3mcut07z4UxXc1bMMpSQA/PKLaMhY?=
 =?us-ascii?Q?2jUCMdaVt6Qgl7SLpI/olQf+DdQWm+slrW7VIqG4/QgW3somapi2LutmaqRP?=
 =?us-ascii?Q?zE9Rb3FNtV4gcGxfVRI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:29:54.5500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d52563e-8d9f-4b3c-91db-08de169b6d8a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6242
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 03:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19189


On 27/10/25 18:33, Ryan Eatmon wrote:
>
> The subject does not state which recipe is being updated.=C2=A0 Please=20
> change it to:
>
> ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
>
> Also you did not include the branches in the subject so PRC only=20
> checked against master.=C2=A0 Likely you will need two patches, one for=20
> scarthgap and one for master making the same changes in both.
>
> Also, when sending v2 and higher you should always include the version=20
> history in the patch after the --- to document what each revision was=20
> changing.
Will update and send v3
>
> On 10/26/2025 11:05 PM, vishnu singh wrote:
>> From: Vishnu Singh <v-singh1@ti.com>
>>
>> Update recipe license to TI-TFL, use scarthgap branch
>> Disable 2dfft and audio offload example build for rpmsg-dma library.
>>
>> License-Update: license change to TI-TFL
>>
>> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
>> =C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb=20
>> b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> index b624871d..7600f867 100644
>> --- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>> @@ -1,9 +1,9 @@
>> =C2=A0 SUMMARY =3D "RPMsg DMA shared library"
>> -LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c53"
>> +LICENSE =3D "TI-TFL"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D91dc4ee6d125d0aaba4e5bd2fcc50ed3"
>> =C2=A0 -SRC_URI =3D=20
>> "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dhttps;branch=
=3Dmain"
>> -SRCREV =3D "609fd72f458ba56f80d06810509ef88d010d2c03"
>> +SRC_URI =3D=20
>> "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dhttps;branch=
=3Dscarthgap"
>> +SRCREV =3D "33d20a5a488844ace45ffb9dbbad9f043c5c897f"
>> =C2=A0 =C2=A0 S =3D "${WORKDIR}/git"
>> =C2=A0 @@ -11,6 +11,6 @@ inherit cmake
>> =C2=A0 =C2=A0 DEPENDS =3D "ti-rpmsg-char"
>> =C2=A0 -EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_EXAMPLE=3DOFF"
>> +EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=3DOF=
F=20
>> -DBUILD_2DFFT_OFFLOAD_EXAMPLE=3DOFF"
>> =C2=A0 =C2=A0 COMPATIBLE_MACHINE =3D "^(k3)$"
>

