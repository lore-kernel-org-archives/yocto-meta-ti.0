Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769C3F4BB8A
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 20:45:16 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30560.1771965906216450110
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 12:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lJbl0teZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.7, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBkV5kNWqvcj0IcCX7f/puPSFRlbKN+9f8GslilnjSY5BcEz/mx8C+OwK1q7ZRnQGkTzGAaleSjW8N4rShYrrxmCcFflCTsIYmK5ntsLJhXp6ikKmy6a8uXsRgPSE8x6SOiaBYtx3undlDfGRIWCyn/aa7wtRg52fLNpgEh/knedmga0VLnsd9PWGM4fsvI+d2ISwbVG3qN/yz9zscceq1afsAqVaF1h4t5x9Ar5qDsAYckIxV3sKc9Q2gkS8xtK2kZJPlvEWrLoWLO41W9u5wkYH5tWrrss7+UNmcr5qZF3kSyIFVkwgHgDDuT6UiTiHSz4cISCnn56EHYz0905TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzgFkpuOAcDCE6Aisnr6L7+Rh2bmJkTsUmj5VOAnPzw=;
 b=ffrbZb49U0aXwtnMFIU97GbvfVlT9QkWiq4WlGwgujYGC9fF+p+tlCcv+B9p66LJsisaHiwrMj15G5aNpSeU93aQLumQqZynDWw5YlSAhBcLWUans5cn21VC3Q7xVzfLyqTjWWduVGLck5ZiM92zD9e7HuDPFDqDfLXffioTBws+0XUlI0A8EEn2n7dMH1vg5SRKiHVEsN/wPFwLmKhKxKAnYQ0+iriRmktkmNwZGDmnfK42/0c0H8dqHj2fuZytAmzova136aT0c3sSkmgpCsbXhkDqRqe/erIjHsUs1usPkocdeF/LlYe5Qn80rBFwyEbmE+CJZKoMQTxvG36/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzgFkpuOAcDCE6Aisnr6L7+Rh2bmJkTsUmj5VOAnPzw=;
 b=lJbl0teZfuxVeiYwDHxBtayQpBvHxqt23g1odwqmK060q+3Si3T4xOHJNR4U1pChmrfzZ6Ov3xXsaKK7oEMxVvM/NzPJNufztUE6OTJ+bZV6BdtW13Y4kb/R8yOQg9YSX/EzK0NpkCvUE03KRFMGk0pbBAMOT9+CiSfdqSSlC2A=
Received: from BL1PR13CA0371.namprd13.prod.outlook.com (2603:10b6:208:2c0::16)
 by CH0PR10MB5148.namprd10.prod.outlook.com (2603:10b6:610:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Tue, 24 Feb
 2026 20:45:04 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:2c0:cafe::8e) by BL1PR13CA0371.outlook.office365.com
 (2603:10b6:208:2c0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 20:44:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 24 Feb 2026 20:45:03 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 14:45:02 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 14:45:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 14:45:02 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OKj2p13371558;
	Tue, 24 Feb 2026 14:45:02 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Feb 2026 14:45:02 -0600
Message-ID: <DGNHHLMCKQH3.17GCTJ2B1XUTE@ti.com>
To: Andrew Davis <afd@ti.com>, Randolph Sapp <rs@ti.com>, Ryan Eatmon
	<reatmon@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/3] meta-beagle: move all beagle board
 configurations
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223235744.3928753-1-rs@ti.com>
 <20260223235744.3928753-2-rs@ti.com>
 <98cd7118-98f0-459b-9192-ed22dd51f577@ti.com>
 <DGNE84W70NUT.2CHW91HOHCJ9J@ti.com>
 <bf5d77fc-bf6b-4640-8a7f-987cf9c63b8d@ti.com>
In-Reply-To: <bf5d77fc-bf6b-4640-8a7f-987cf9c63b8d@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|CH0PR10MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5f7ed1-06eb-4a7b-6d51-08de73e59635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cDBHb3ZnU1lmZ3lmdnhmaFZtd3hMU1lsNHB2UTVtczNiTGZVaW1kL3luN2NM?=
 =?utf-8?B?MTZEWUhCNFBIdy9ZRnNwOHRsanduZFhqT1FJV211bXlRQkg2d1ZlZVhNckRJ?=
 =?utf-8?B?aVpzejVrQ0lDNkNDRVBZV3Uya2NZN1M5MWx2T2NJOURrdW12SDRJbGxDbEhU?=
 =?utf-8?B?Y2lMeDR4Q2FXNDVablZ1WU5KbFlidS9SVXJ5eVpQUlZOdFR4R2lQQWlXYmZX?=
 =?utf-8?B?YUlNKzdKSEtqTzFLQWxxcUM4Z214VlYrWWlmbU5WdHppT3ZlclpQMkRUbGtZ?=
 =?utf-8?B?RGN2aDQrUWxyc2xuV09VeTRDcHdkZVZFVk5vcktyRHBpcktHUkNKWDdMVHlu?=
 =?utf-8?B?RmxkZXRWUDZ4Umg4Z3B1Zk5uV2N2dXNaMWVObFVOVFdXc0JrcTBuY05yVTJR?=
 =?utf-8?B?dXF2NjYxUzM4dXVrSlVaeWlHbU0rWThlVlgrUWcvb0gyMzhNQVVMNkhjVUhk?=
 =?utf-8?B?a281aHhnSjltVGVzZkZCdlZ5aGdMVXYyK1VndWZKNXBLTW1zR1VSNHdyc2xI?=
 =?utf-8?B?WGRwSWtzWHhBa3JWc0o2R25DK2JDQkU2Zk1xbmlubTRsOFNoUm1Ea0lNK3ZB?=
 =?utf-8?B?dTNZUzlmckZIOFJGZEN5VVFrc2NwUUdPVVhjY0hSU0p4d0d2anB6enMwOCt1?=
 =?utf-8?B?YWFaMUNkMUc3WXJtakowNTZhWVNIZXJ2L3EvWVJNZW5pMlN4RlNrdmd6NXZ4?=
 =?utf-8?B?VHZJNGwrd1pPTmEyYit6RW9XV0wwY0VFWkhHUlljZ1J0aW9RSVFqbFRNMktm?=
 =?utf-8?B?UmlHTmdYazRlS0VyT3RpcUNCSXdXMnZXbytaR05lN0trSVlZcStWVDM3bnNT?=
 =?utf-8?B?MXF0TGxuNSt5SEV3bkRoSVAvbnFzdmhEWnlucE9nUm0wNGZ3a1RrRWZyYnA0?=
 =?utf-8?B?Y2h6UkZQdXlzTGlrNVMzVnBjSk51d0V4Rk5DUUQxaGFnSHhBdis5YnE2OTNh?=
 =?utf-8?B?Ti9JYWk5SC9GMDJpdHVvbll4bWVySVZudnFNcXl1U1lJR2E5N0dMVm1QNlBh?=
 =?utf-8?B?V0VlZ2dEdDVmZEExVFUzSHgrUXVIQTlldkhNZitQRVpuUTV2N0JNeVRVQXIy?=
 =?utf-8?B?Ry9oWElMdWpmRFRDSnRKVVRIMnJrNXlJN2JKUE90bkxCdk51QlZmS3N3M3po?=
 =?utf-8?B?RmppWTlzU09BQ05ESW4yZ0R3bStVa2dKejB5TjhoMHArZ0twSE0rcTZmcnRy?=
 =?utf-8?B?dVdVSUFsT1YxOUdXcGdlbHp6LzV2MXAwL2hxTkl0Y0VKVlk1RUVSOS81alhW?=
 =?utf-8?B?OFFmTHJPN2JTc0NhTjhTNFd5OFVCODlMbWhHTXhic0ljVjJ0UFpjY25MR2VO?=
 =?utf-8?B?Uldwb3o0YTBIaGZhYzFjaUNBYmFBVFZKck1JbWRsdytENWNnemwxY0tWWS8z?=
 =?utf-8?B?SjFZY3Z3VXQ2cGJTUHB2OG5teUdDTzNsUXNzSVpIdG9jK1M5eWRaU2Y2bzVo?=
 =?utf-8?B?RFJiTXpwcnZJZnlNK3N4SzFqNVU5RTlYdXlkZnhyc2VEcWNjSFR2K0tOY3Zv?=
 =?utf-8?B?dnFqMHNKTGNzOUgvUmNsSUhUU3ZhREE1eXBOUm91RkRQbklJdTZZNjFYUEQz?=
 =?utf-8?B?MWw0NXdKbU1YRFM4WHdTWURQK2tzVnBJRUppVWxGYkovSWlFV3hmS0cwM3Rm?=
 =?utf-8?B?M2Z3UEoxWmxwSk41Y1Jyd0pmUmVaVHV6QTlZSTZWaWd2VEFDY0c5Yi9RNnA1?=
 =?utf-8?B?NDZTSDE3TnFxdi9IS1pIQy93Z1FmOHcwZWNDN0w2c1FCV3hWZExWazlBYmQ4?=
 =?utf-8?B?R05iand0WUQ0NDdyVm9jR1pMSDZ6OFJjTEVOa3Y0OEYzUVB5ZjNqZnQxNUF6?=
 =?utf-8?B?NlBqMzBOOGhHc0FjSnB1VEtTMEowZngyaUQvT2lMN3kyOTN4ekpCbk1iYUls?=
 =?utf-8?B?QnkxbUVpaUxKRG1sYkdKZmRSck9LekdXNUs1SnBMckdBaTdjSkRmbUdTVkNl?=
 =?utf-8?B?cU1PbzZjcXFXQTdrNXpIMktlekVVZW4ybWxZZk82MUlBeG94bmpybzVxc2Ry?=
 =?utf-8?B?NUR0TjloeHZOejlCQ281aHEvUEo5VHNwWitHZ1Uzakl5ZFZpWlJkdkJxMHFV?=
 =?utf-8?B?ZHVTWWFiaklQMkVqN3J0am45RVFzQXpZTWpMYlllczlaelNrd0lPRDlublhO?=
 =?utf-8?B?WTVaRXREVzRxZzNSazJ3dDFhNFZiUEVpV0tKRk0rY1pLVDg1dkwzaVp1c0Zt?=
 =?utf-8?B?MjJkeU01Yko1aGRzbHRIR2s4V2c5U2Uyb09mZEdHRCtwTnRheHR4ek10Y2lp?=
 =?utf-8?B?M0FCeWtWM2pERUdibVpSWUlKbFlBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XAEiDD6vTkZbBhkPxTGvtyYFJgdql7qtrIvKHgrtf+PvA5a9pxQq82rX2bkv3aQbvDkIyJGc07NtgWM1/mZ4HSRaIu2EiG6XJvXyF37ft/XuLhwZozJEQW8z95qoOW/pcQa5qgjPJqCc0N5g/wBN6wKoe9CEgmTT8AfnPP4MJiUdTcpdjKkv0nMqAFE4FErR/AFfFdP/mNSigt4bKGgv3AsghujLQqjz+gnJTyPWSKeoUpcxnk9rX6HhdnW+sjTvfXU3jJpYBfAUD7sFQ/WWcEV3QuiUQDmh+hrA6Yu0Hu1ot9vIFUidzeRzbN9rtUkQaMylXReBqsezRMSPcsvwGbtP+QNp9WDQNVaH7Xg8pQgVSVovYSuN9Cb9G7EcjWUFTb1kte1dYSXCMh8mwfAN2YD575xy9M7+d0OjlNclYUYgyVINVLv+JR2PSEAVUvDg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:45:03.6568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5f7ed1-06eb-4a7b-6d51-08de73e59635
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5148
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 20:45:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19590

On Tue Feb 24, 2026 at 12:18 PM CST, Andrew Davis wrote:
> On 2/24/26 12:11 PM, Randolph Sapp wrote:
>> On Tue Feb 24, 2026 at 8:55 AM CST, Ryan Eatmon wrote:
>>>
>>>
>>> On 2/23/2026 5:57 PM, rs@ti.com wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Move all beagle board configurations to meta-beagle. There are 2 skews
>>>> currently:
>>>>
>>>> 1. A base TI configuration setting all the default variables required =
to
>>>>      use the device with meta-ti-bsp provided packages.
>>>>
>>>> 2. An override that uses meta-beagle BSP components. This includes all
>>>>      the values defined in the TI skew as well as any meta-beagle spec=
ific
>>>>      configuration.
>>>>
>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>>    {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebadge-ti.conf    =
 | 0
>>>>    {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti-k3r5.conf=
 | 0
>>>>    {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti.conf     =
 | 0
>>>>    3 files changed, 0 insertions(+), 0 deletions(-)
>>>>    rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebadge-ti.c=
onf (100%)
>>>>    rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti-k3=
r5.conf (100%)
>>>>    rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti.co=
nf (100%)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-beagl=
e/conf/machine/beaglebadge-ti.conf
>>>> similarity index 100%
>>>> rename from meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>>>> rename to meta-beagle/conf/machine/beaglebadge-ti.conf
>>>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-b=
eagle/conf/machine/beagleplay-ti-k3r5.conf
>>>> similarity index 100%
>>>> rename from meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
>>>> rename to meta-beagle/conf/machine/beagleplay-ti-k3r5.conf
>>>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-beagle=
/conf/machine/beagleplay-ti.conf
>>>> similarity index 100%
>>>> rename from meta-ti-bsp/conf/machine/beagleplay-ti.conf
>>>> rename to meta-beagle/conf/machine/beagleplay-ti.conf
>>>
>>> NAK.  There is nothing needed in meta-beagle to build beagleXXXX-ti
>>> since it uses the TI kernel/uboot.  So just moving it over there does
>>> not make sense.  I don't think this is the right thing to do.
>>=20
>> Cool. I want a second opinion. Who the hell would look at a beagleplay m=
achine
>> definition and not expect it to live in meta-beagle? If you bring up tha=
t this
>> is a generic definition using only TI layers and should therefore live i=
n
>> meta-ti-bsp, are we going to start adopting all customer boards that use=
 our
>> Kernel and U-Boot recipes?
>>=20
>> I don't really know what you want, but I know what Andrew wants is dumb =
in that
>> it manufactures a circular layer dependency. I'm not doing that.
>
> I think we replied at the same time :) Anyway, what I want is to not have
> "-ti.conf" versions of the same board at all and just select the BSP exte=
rnal
> to the .conf files. But my second place want would be this series as you =
have
> posted it here.

That's already a possibility using the TI_PREFERRED_BSP variable. My issue =
is,
what should be the default behavior then? Where is this functionality going=
 to
be documented?

The values used in TI_PREFERRED_BSP will change and break between LTS (of w=
hich
I mean both Beagle and TI LTS). Overriding it in a local.conf would eventua=
lly
result in failure. That might not be that big of an issue to some people bu=
t
it's worth considering as it will need to be documented.

If a meta variable tries to wrap this behavior for the user, then we'll hav=
e
more dynamic configuration in a step that is usually declarative in other
layers. This solution feels too unique to us.

