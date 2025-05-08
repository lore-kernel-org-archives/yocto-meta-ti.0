Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8433FC3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 04:44:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.121])
 by mx.groups.io with SMTP id smtpd.web10.8176.1746679440470241238
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 May 2025 21:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=HgWvXWKH;
 spf=pass (domain: phytec.de, ip: 40.107.21.121, mailfrom: d.schultz@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dF6oER/7j0vuLen+9MZBgfHPFlpIp10l74tZo8yAqyT5Olx451VkEShRV6VdBHpGFHerH+12V5enGtxtX7sopf8HeOjpO67mqilMOY8vr903FoishhP07JYPXA07eJrYL02Qe0EYPGprVaJlp0kAfgLrZ4JlP1MFteJb/UFq/Z26m4IwqogcUaSKN1HBXaVE4Cgry34SiQzr5iENCZQO0igxtY0gcWfUEsDnBA1FuIA4oFeNCeUZ2dhfimhQCwPhe0CHzaV51q8TApU8t+8qWcYPfZHA+W/JCGdBDCWYh93S5JISVbVzGt5zI33xAZCIUS7F5S6FQFaOtorKxFffIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWo2NFLhrAtSjB0n3ELzb/09myiTelV9DRnChNOf0Qs=;
 b=WPRwaAaAf8y7aQgPRjPOgMIoP2hP9Q6NP5G1Uq2d1SXtWr1xqDS13bRb1gn0fMsK2PO+Cjvjt1a2vX3op1P7UUhtyEm4dIUvh85sh35jsjJ/MIEjumBP0y9bSDqhbjzCj/RdbwzxzMQ15Cyf+zRpK54VzY7/c2NV23E0rhHAwW9XLoJ4KwYvYESjNgRMJ0GljNC51guEpGGR9l2Br+axuW/hfRp/cdpQpE5Moq+XKH/zf/jIh+KfWemHT7IZq1HgGmXbujfYYskFo1eSeAGO7KIVtOCSh546NQKSceSnxY2aJVg8PK/S8484j+IqsJp0pdh/fkfc460kVwireRL37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWo2NFLhrAtSjB0n3ELzb/09myiTelV9DRnChNOf0Qs=;
 b=HgWvXWKHQXl7l3I7Rpp2BItOKfjAVd+qaL/R5+Hpd2BOFTUj7EHwpsqjCwCdtkhDPlJUdQdeiCSa1kdThqn94wuNtGpsphoC2JOMZ80ItjKsvASBwoSU7efdSU5G3MfFaqZQNpgoNjPZUX/r5KK8/BhnaKuEDOB8Jfi8B7fgUiX4nacrKWfSIXc7M4/3Ome8inUvXE1B8IC28k5Akw2Z9a3hlrSpTFmNBztF4KU1Fp5nxXktZ6LBq+t9ZtVesQbilGK6swsLr+AgKW85JiIDmf1AfWmTvM6ZEAcTReiebtiDzm4g/HfHIY6z0m8HXV6dd/Cv1tU2aegligSuQTlW/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by DBAP195MB0924.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.33; Thu, 8 May
 2025 04:43:56 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%6]) with mapi id 15.20.8722.018; Thu, 8 May 2025
 04:43:55 +0000
Message-ID: <6153330b-eaa1-42a0-a6bd-131baa3ecadd@phytec.de>
Date: Thu, 8 May 2025 06:43:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/1] recipes-bsp: Add
 DM_FIRMWARE override for am62pxx display cluster
To: c-shilwant@ti.com, Denys Dmytriyenko <denis@denix.org>
CC: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
 Andrew Davis <afd@ti.com>
References: <20250506091015.4049616-1-c-shilwant@ti.com>
 <20250506091015.4049616-2-c-shilwant@ti.com>
 <20250506211540.GG18383@denix.org>
 <a8979da3-0256-4647-9b78-7437a6ab92ec@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <a8979da3-0256-4647-9b78-7437a6ab92ec@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MW4PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:303:8f::19) To GV1P195MB2476.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:150:1a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|DBAP195MB0924:EE_
X-MS-Office365-Filtering-Correlation-Id: caa086e4-67cb-4786-f98b-08dd8deaf017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|4022899009|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HsxU8WZnJzUD4OiDBUKS1ZtLo9fSXR3cubm0XmDjJZ+TqJY7Mr3ZzDi4nYYF?=
 =?us-ascii?Q?sY5SnhT4jv1nJFXW0RxnnBxnvNcal3JhTVpQ1XGHB7TL0EGgbRTP4bTmqXwQ?=
 =?us-ascii?Q?rAR4NdIXPbrFe0nPXSe0SQZHQK46VRt2duJZ/co4CeBgKzzj622gkKbFE4Ck?=
 =?us-ascii?Q?/uAO6eMtUT2PEz20RFL2PksMUIUTw+ExnaqMM5F4hMrKZbMXDPA4rMr9pqCk?=
 =?us-ascii?Q?j1g1hjgmUTCM2YycEqe/EtZ/TAxCW2vKgMBsg6rWqjmS9G00rRe974gPZJT3?=
 =?us-ascii?Q?ICe3L5rJxLt7sjsC3C6a8Rwyi7yiAzPrKi4wPgUCTQN13/NmnrDSra6On9EC?=
 =?us-ascii?Q?ZGjJx9OC7+mJ47pJrtYotb1ah2kla+10DfD2YKyZXv3TswttCsgZLOeVe6eW?=
 =?us-ascii?Q?7GdWyEcf83iW3+ErDguoDtt6jvvFtAUC/bKNi91Jnc8PSAMvqAwxRaIpgq6y?=
 =?us-ascii?Q?R1BOtpKpBCYSI64vefuslRzCHVn6RgSk6ed8DsEJfrjEF5qnEZN1jfUr7fNj?=
 =?us-ascii?Q?0KcZSGdGCfYzy1eZFUrlX6wh7d1M/t5e23aVeeh6L5PQIjzOnIXbVVk/x+tI?=
 =?us-ascii?Q?jSGyqwwWu8q6r1ipW8/XISnWN8yA4AQu0MTB/AkSjQBbRDJlVeEpPZDYTNCI?=
 =?us-ascii?Q?W30f4rL0l2UzfclT7CjRgSZP/rOVd7CrkviKhI71Er7PoWlAF1HjnLY2+rCs?=
 =?us-ascii?Q?PHEcsJroU0GWzlq65ZwqGG+fAFNfTcmBPVm52xe43EV3bzolERTQK9AwW++p?=
 =?us-ascii?Q?YxRVAitcSzOXOisjAzyIK/59NCSneTXjtVvvlvo/DOXpCsE0IqE4G2tNu9xe?=
 =?us-ascii?Q?nVTtfdcTzBUqjmMlEOAj628M2AcYrAO/MvrXZq0Slls85XnB6eZKM2KPrbwZ?=
 =?us-ascii?Q?fqMT+EdxjS5UscmPAvNvKwxPpEwoNyzrY7MBEdW4MzPemhPSgvPkij7bTgvZ?=
 =?us-ascii?Q?LFCbP4YCuakKsnQw7/kimrb0iq/zxV6vrP4vpJ4OXR8CbmqhnYkmuxTjVLTW?=
 =?us-ascii?Q?OxbuuSz8+RtoHps05BsdBBGYHTWUS6ZrKIH71J4B20fSSfMCIJuT3unwbTSA?=
 =?us-ascii?Q?j6+yCk6sKTIYX76zcFVf7UmbFsVtwBI/4rgk6GJr0t05Uc7rMAa7eGipF5+L?=
 =?us-ascii?Q?QPdJWFRm5Dwj8qWCkNpCa+1Lu+kzNGxMYhKi8o9GMjxp9M1Ye1+R1R7D/Nt9?=
 =?us-ascii?Q?7izom3cljelbuOEyDsOOYpoly992x8W4ZYlE9zv8vFamiKq2wILgM36hwQXI?=
 =?us-ascii?Q?Kl4+Di2BjivrTbEbqIwOS7t+SsFDqjYzcVjcsmp8IW7IYYSC1HNbCWzcoVzQ?=
 =?us-ascii?Q?5UGEkwNyDBLXCMOC+tJEsQdCz8f0PSL68y8TT/T6vCSjUOSp4SkC5CFMbyQ6?=
 =?us-ascii?Q?tctL7FAp8xdn8sNhKdG625GUkk3X?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(4022899009)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zA27FjDrshl0vCBsVBh0blR8p+QEWKR+yJ9tI3XEoxOSCZmIeo3L17w8LKec?=
 =?us-ascii?Q?SgDzrE3yKG9JzyuA79bQYBdeg1VNsfO1wN1xmlxHQJX4l8mP9TRSAeDL/Om2?=
 =?us-ascii?Q?498FNsyfs+Mb9DFtOikCGGIzYRlPPHOe5tmEOFcMYSUXmtuJLZ2nHcpZydJW?=
 =?us-ascii?Q?DsoaWbimUwsLuM9L4K7uvbsrZkG1ZT1eA/PxZQqEr4/UDs12CE43NNz0Cqmi?=
 =?us-ascii?Q?veX5EeWg0rEOZbV7utAHP6rlZqxuwLMt8QqlbpivPtOABd3zkx6lQyGshshD?=
 =?us-ascii?Q?lax6f6nNmxnLtz1Ai48bdQ+w7Ud2Wpxw/l0qSnPzVQ4IqCfF/IDDiSRzh4IH?=
 =?us-ascii?Q?5dijQBsUzQC1t9FCc+KFda+Ybns+vX1RUF0O4tjp7ZKEeOczHyGj124SJifj?=
 =?us-ascii?Q?iGaMTDg8PdfCMfFMci5XNOM+BDCjNPEu9SKUrShqG/0EPInOxGwke2B0nQFl?=
 =?us-ascii?Q?2PBvH5BxjUUuUS9X+Jt7fLxv7dYQqAsUJ1dJLrz71xZvyj6OY5jLln2PuOcO?=
 =?us-ascii?Q?SpBdOH6R2a3Mt2FBYxEvstaGb+KvD/0ISjqfjdKX7V6HgHwfqZOKEAB7jSd9?=
 =?us-ascii?Q?ftJ+kKxEl8ztUUSW/NkdmmVPTkQ/JgyqDLyl4ok0T1HG2KOa18P7ZWah86HS?=
 =?us-ascii?Q?BBjbUyhtPHrwA2Nm0wyaLQtHv0E7TZmJ5SCOm0evXf4uqXk8UBGknVqW/17H?=
 =?us-ascii?Q?Y3A03bzW4vU0RB/CDGWRBDwhDJeny9trH6+0OIIYOa9PJsUlgxvEfpNsdWQu?=
 =?us-ascii?Q?mx/HQEclumrfPZtgdU/46NfZw7DBvkL5TQAUW4kGgPQp1Xynwwe8ID3TltvA?=
 =?us-ascii?Q?F4+bzlqvRTMS/lGOH8DKIK2nxMu/hft1CmNEcULPkggzl3ydPO4FUwjwZhzJ?=
 =?us-ascii?Q?5lejWP3iLiJTk/OBoKnIXFHB/VUYfIx2M4kmGUxPK6ARJGn8ze9jb8sRAZSn?=
 =?us-ascii?Q?bSZDpI2WlZgjft325fegFtXwN/0cQfTQVulga628XFof/xYy47Xyve9e4mS2?=
 =?us-ascii?Q?UxGTOv+ypgk7aZUdQjjRIsJ4hefd9g93sdYVRIrd92Mkf2zDcSGSpjD/diI9?=
 =?us-ascii?Q?JUdPQcA4Y11OnBSqCVicM04I5C/gBKYUt1JnFMnsXyWMxdL9J48VJ/KlS+lx?=
 =?us-ascii?Q?/V/axUCoumSxnuyy8yj/b42I8yhxoxxeflppKIDHDQCo2H+Ww+26QiNReNBV?=
 =?us-ascii?Q?F/ScFmXaRpYe3Q+O8Wx3YX8MWjtWtFZ+isjfeR6OrA/PNn5g47NxkYqGee3R?=
 =?us-ascii?Q?B0gzlSb71ls9Uz8m7CbEuyWAy0dlr48AzwS9hdIj8Y/L5Wg0Cvfoun/IdpoK?=
 =?us-ascii?Q?9MYh7ixxXdWv6EgxvgMfWwcHVk/zIyKWXkiYjlzQfMTpj6yyZk0KcXue0GE8?=
 =?us-ascii?Q?xZi53LIYn2gO8Ba8IDBLMrLDvwsKijM9Ngs20Bru91B0JzlO+GCJhDXAAMr4?=
 =?us-ascii?Q?Lb+vXOYaS/b+jzIE36TOj2vtgmlc6IC6ey3BODW9XYZXIkqAcoOBAthoMSap?=
 =?us-ascii?Q?EgdFH2ApTdSBcowRf/EsoyJw3z49483xFcz5G+5H6okiQdEUzprffvgoZ0oJ?=
 =?us-ascii?Q?KAJqtpdjaxQt8gjW91kvaXJDtMInRO9i/6gnLWF11DlASr6vejesaaR0u9nO?=
 =?us-ascii?Q?1AXaPh2uIuwTihfx5T4dTXHJ3B1rh5AwqcmQC7/8MXOV?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: caa086e4-67cb-4786-f98b-08dd8deaf017
X-MS-Exchange-CrossTenant-AuthSource: GV1P195MB2476.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 04:43:55.7145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXIMjDsjiRVPmv4aUdk+xyYcib15BBiIDjO/Qv7CCLlkT+e+cB2DN84N6WaY0iJ3zu8cw3KG0uwwsijaY/uYJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB0924
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 May 2025 04:44:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18545


On 5/7/25 15:18, Chirag Shilwant via lists.yoctoproject.org wrote:
> + Andrew
>
> On 07/05/25 02:45, Denys Dmytriyenko wrote:
>> On Tue, May 06, 2025 at 02:40:15PM +0530, Chirag Shilwant wrote:
>>> * For AM62P display cluster usecase, we need to pick
>>> "dss_display_share.wkup-r5f0_0.release.strip.out" from=20
>>> ti-linux-firmware [0]
>>> Hence, pick the display cluster firmware only when=20
>>> DISPLAY_CLUSTER_ENABLE is set to 1.
>>>
>>> * When DISPLAY_CLUSTER_ENABLE is not set to 1, fallback to pick the=20
>>> "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>> DM firmware.
>> Should a similar condition be added for am62axx to select between=20
>> dm_edgeai_mcu1_0_release_strip.out
>> and ipc_echo_testb_mcu1_0_release_strip.xer5f ?
>
>
> Hmm, that's a good point. Apparently for AM62A, the TI SDK story is a=20
> bit different.
> The major delta between the two DM firmwares is the inclusion of=20
> TIOVX, VPAC & Vision Apps stack
> in dm_edgeai_mcu1_0_release_strip.out
>
> As all spins of AM62A (i.e. AM62A3, AM62A7, AM62A7-Q1, etc) are sold=20
> as a Analytics processor [0],
> we want customers to always use dm_edgeai_mcu1_0_release_strip.out by=20
> default &
> hence the SDKs (& eventually meta-ti-bsp) to always pick the EdgeAI DM=20
> firmware.

I honestly had the impression TI lost interest in AM62Ax and seeing all=20
these patches for better C7x support on the AM62Ax is great to see!

We already use a mainline-based U-Boot 2025.04 for our AM62Ax SoM.=20
Therefore, the AM62Ax DM firmware change broke our build and I had to=20
force back the old firmware in our yocto layer. That's also the reason=20
why I sent [1] to change binman upstream.

It's not a big deal for me because it was easy to fix in our layer, but=20
I would like to give the feedback that changing such an important=20
firmware might break builds in downstream layers. Please also keep in=20
mind that not everyone is using your latest SDK u-boot/linux tags and=20
might need more time to update. So, adding flags to fallback to older DM=20
firmwares sounds like a good solution until everyone has switched.

Best Regards,
Daniel

>
>
> Now, the answer to why upstream u-boot binman still uses=20
> ipc_echo_testb_mcu1_0_release_strip.xer5f
> as default (OR why does ipc_echo_testb* exist) is nicely explained by=20
> Andrew at [1]
>
> As highlighted in [1], we eventually want=20
> dm_edgeai_mcu1_0_release_strip.out to be our default in future even
> in upstream as well but until then if we want meta-ti-bsp to support=20
> the ipc_echo_testb_mcu1_0_release_strip.xer5f
> as well then my suggestion would be to have it other way=20
> around...something like below,
>
> DM_FIRMWARE:am62axx =3D "${@oe.utils.conditional('USE_IPC_ECHO_TEST_DM',=
=20
> '1', 'ipc_echo_testb_mcu1_0_release_strip.xer5f',=20
> 'dm_edgeai_mcu1_0_release_strip.out', d)}"
>
> This ensures that the additional local.conf step for setting=20
> "USE_IPC_ECHO_TEST_DM" is not needed for default offering
> but only for users who intend to use the=20
> ipc_echo_testb_mcu1_0_release_strip.xer5fDM firmware.
>
>
> For AM62P, both dss_display_share.wkup-r5f0_0.release.strip.out &=20
> ipc_echo_testb_mcu1_0_release_strip.xer5f
> are delivered as a part of standard offering to customers [2] & hence=20
> we added the DISPLAY_CLUSTER_ENABLE
> logic in meta-ti-bsp which helps in supporting both.
>
>
> [0]:=20
> https://www.ti.com/microcontrollers-mcus-processors/arm-based-processors/=
overview.html
>
> [1]:=20
> https://lore.kernel.org/all/534da8dc-f7bf-4ef3-b94d-3254a38b26a4@ti.com/
>
> [2]:=20
> https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-AM62P/11.00.09.04
>
>
>
> Chirag
>
>
>
>>
>>
>>> [0]:=20
>>> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-dm=
/am62pxx?h=3D11.00.12
>>>
>>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 1 +
>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
>>> =C2=A0 2 files changed, 2 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb=20
>>> b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>>> index a7d15e30..eaa82a62 100644
>>> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>>> @@ -40,6 +40,7 @@ INSTALL_DM_FW_DIR=C2=A0 =3D=20
>>> "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
>>> =C2=A0 =C2=A0 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5=
f"
>>> =C2=A0 DM_FIRMWARE:am62axx =3D "dm_edgeai_mcu1_0_release_strip.out"
>>> +DM_FIRMWARE:am62pxx =3D=20
>>> "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1',=20
>>> 'dss_display_share.wkup-r5f0_0.release.strip.out',=20
>>> 'ipc_echo_testb_mcu1_0_release_strip.xer5f', d)}"
>>> =C2=A0 =C2=A0 DM_FW_LIST =3D ""
>>> =C2=A0 DM_FW_LIST:j721e =3D=C2=A0=C2=A0 "${DM_FIRMWARE}"
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> index 57bf7a4e..6b7e2bea 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> @@ -46,6 +46,7 @@ DEPENDS:append:j784s4 =3D " ti-hsm-demo-fw"
>>> =C2=A0 =C2=A0 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5=
f"
>>> =C2=A0 DM_FIRMWARE:am62axx =3D "dm_edgeai_mcu1_0_release_strip.out"
>>> +DM_FIRMWARE:am62pxx =3D=20
>>> "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1',=20
>>> 'dss_display_share.wkup-r5f0_0.release.strip.out',=20
>>> 'ipc_echo_testb_mcu1_0_release_strip.xer5f', d)}"
>>> =C2=A0 =C2=A0 PLAT_SFX =3D ""
>>> =C2=A0 PLAT_SFX:j721e =3D "j721e"
>>> --=20
>>> 2.34.1
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18541): https://lists.yoctoproject.org/g/meta-ti/mess=
age/18541
> Mute This Topic: https://lists.yoctoproject.org/mt/112645983/4454627
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [d.schultz@ph=
ytec.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

