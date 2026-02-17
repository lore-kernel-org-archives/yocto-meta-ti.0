Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D7CE9A029
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:53:18 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18316.1771350789717630629
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 09:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gK20sVa0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.46, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kpwx33ywqBhxUlsplCxHDODpIU+K+Tja2evcHQdktED7MZLWZMIIth9DVYItQiVIF9zHaxZhrTm+URihPbepw4R1rPTUcicuY6eE3SAc25MF5BqK7U+wDwDnMcgiFaRQS+r2JYyWQdh+IZConEyXcoIShaXgOxROWw8WmVmR9Ku0Du96DBhR1f6BVLIyoc7L8sJpqp7v8rWRUZqOxIKPIxHzLRwJJvJSjesz7BILA/cpGUSxv7ft96L4GtUdIIqT8apW805l+uvBx2RqxeIRNNG6MFZDfkx+j9EeFuWMRw49rP0LigZt2twHzvQOw6hlzAqL7ae3DHEcdbyLsfoSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKfKAEbM1E7mnbAU2tOt+ll9OnkWdT75+ZVbcg497XE=;
 b=lXFHZv905G1EAt1h4mGpRyPSsbRHwbBuM/iI70QR4lmpaFX5ACDfndijnE8S1tNqqX5UESY9ejg+Gsssg56bU/DFeQfLFyHaqmNVbx3Z+3Au5W50Xe1k94gMghIpe+7lOJvJd1L9z7LpPm9Ei49AxV0rEzPWqq3giLmJ/EgMlOVHf0//1FLrFNl/PYEomJ07ocKsHF5pI2c81OXZZ62YwJUj8IkqUsVleIhcZa3MsvMY0onOpdSM9dMX1T/xUVwMqRuAoioZKyp3Pb9d6Bu/TWiNNXD3rpSHHcAbF7rNm13S41jmWYOuEZkWDWw08GyteKRGQ5Gul06jBkYRzE+vjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKfKAEbM1E7mnbAU2tOt+ll9OnkWdT75+ZVbcg497XE=;
 b=gK20sVa03CJ2ay7+wlxFNjNX7UU7AxhVqJx7ip4NUmt2NRNiaJFSW0gPb2gjlcpTGjqOUpe7SxFo2Ts/xbuwiSgU6z8hGnl1wP+IPiDpryDa3FWJHguAYrKtJa5/gJM/NCKbG5b6IseM9/6SWlJ9+09jTTwgypYJBx+JKY1pbJ0=
Received: from SA0PR11CA0130.namprd11.prod.outlook.com (2603:10b6:806:131::15)
 by DM6PR10MB4377.namprd10.prod.outlook.com (2603:10b6:5:21a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:53:07 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::80) by SA0PR11CA0130.outlook.office365.com
 (2603:10b6:806:131::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 17:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 17:53:06 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:53:06 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:53:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 11:53:06 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HHr6ft3729215;
	Tue, 17 Feb 2026 11:53:06 -0600
Message-ID: <decd99f6-a660-4010-a856-329ba6c6c677@ti.com>
Date: Tue, 17 Feb 2026 11:53:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2] ti-core-initramfs: Change assignment
 of IMAGE_BOOT_FILES
To: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260217161041.786432-1-reatmon@ti.com>
 <1148f430-063d-4aa7-8e52-8e8378112ee6@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1148f430-063d-4aa7-8e52-8e8378112ee6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|DM6PR10MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: d293769d-51b1-4dc1-1d80-08de6e4d6808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W0j6+cwSXZEwpSrfLxQ+0RCqhsaYDlBSsYu8qdfTK2RLNU3mCUoZuN5vUi6a?=
 =?us-ascii?Q?cpc8MIc3Vs6v8IPoJyDOvb87sPfQ3xhmsbO8kN7REsQW/7e74AndkzjblcBL?=
 =?us-ascii?Q?mmIDfrfFtSOqCM3AVxg8ksM2PSfyXR6Fwbtka+1PVpBdD7EnOjq1CuD0yM6b?=
 =?us-ascii?Q?UxMhlO3quSzNKQYp+VDAflUGF0AM9HgBHvv1dV2hXK6b9bv3DvHOsCWsNfPR?=
 =?us-ascii?Q?hdddkxYHvtdoZV9YJkcjMbbMOjL2D5NvYz6alIoIfSDZYbyilSh0Mj9YqH6c?=
 =?us-ascii?Q?81qimnpdo8Oo/bqULhrzoN7r7CRLZAmJo5QI0YMwaMftOPesXSxX6V3LFXju?=
 =?us-ascii?Q?nZGLlhDiUzWHqQq9UBpdXOsLopRRw5UBCbxo980XrhCoL4Z6pyHQMZ47QnAF?=
 =?us-ascii?Q?lcs3n2Ef6g8TC9J8OtjphmalfPCiZaCIB5VaVSRQ2zZ9qxFjbp7o7Vo0lzHd?=
 =?us-ascii?Q?9ELLyAdn1oLDUuOQnpKck0rospExpdsFLJYoIBeG3IThrpwnYqDsXxvNtoQc?=
 =?us-ascii?Q?4ucoz7RP+eI6AvF4oRthYLdKTQeEoF0AkZ6EhI109+mmSsFMstbF2XeiZRIG?=
 =?us-ascii?Q?JMR+nHgwP1WjeafaFZM7aaD9UJ32wGHDkgQ0yaLPvgFr3VAQzfJ335bMDabj?=
 =?us-ascii?Q?etwK5uCqND+KXgzqZVSaKviV/PxR8opbWXECrgeSN5aC/Cr+gbB6FdUd2IKj?=
 =?us-ascii?Q?01/sIiZvKK6qPKxkGPLX78wORpu1bJnkatZBkEXH/1d0J24PbDRLXQMFlgn/?=
 =?us-ascii?Q?zT6EH1MTpb/902Dz6Z5+z+pa1LeTU4lg3Wn6NLHDo6ivI3hREIrpeiJiS3Us?=
 =?us-ascii?Q?lW9T3Y7j3IkTnWV4TOXM3hLBZlR6YxgBMwOTQ7W7aAXGQSQecPUMzFtb6T99?=
 =?us-ascii?Q?cK+MTNjLaM06JPsDFRSdHHBv2mXKcHhC6qEDiyzODBXQRI7e4C7uSD5Qn4sU?=
 =?us-ascii?Q?ID0MxPMLx0Y1TswH/VPCFRU6wMl6Wx+fMOmKkEVveU5PuJyZaPOMwK78Jatn?=
 =?us-ascii?Q?MVxrksXu6PLEpyPAdsBDSSZF0O5EoAyXmW6dVgM901pC42MAK87z+YjrykUt?=
 =?us-ascii?Q?PsCPAd4a7Us91cgE9Bpc9O+QsdvrIbpcRQ61oLKseY4im0DBkVCs9TO1yfSD?=
 =?us-ascii?Q?8u59w2CDKfdFweHCWC6hH/AyslyUxwbHUbqHdsLG1Gl64vpiJgw+nnVefAO7?=
 =?us-ascii?Q?Xj1/yHa80kGN6lTS+zN7Gc3BHEPGU/KEYGGvvAF5OjAzlntuyNyrAiQl4N0O?=
 =?us-ascii?Q?WmvS5YhreQyr4YjFC27RUlkROue+Itd2o5uUd6gFDE+/mu75Ln1hDonQG36L?=
 =?us-ascii?Q?e848c3R0Wu2YoYrUIPOi7+40FHP611/y2VphGN2mpS774+9vSlfY/V6N4tpN?=
 =?us-ascii?Q?eHlkAw+j7Glb1piUOByc3p/CRwxvndd8/KgNcPxR9McNFmurOXjo94U9KnOA?=
 =?us-ascii?Q?Sa++PNOco7eNDgicOmHWS6rioKMwAAra+5gLyVK+mbebDC/L3tFC5aUwV058?=
 =?us-ascii?Q?9+0xDHeo6Z49UKW2EwTRDSpeYQ7J79iGzvMCLXgFL6556mLQRPvLY8JYStbp?=
 =?us-ascii?Q?jU12NXTSoONhmPjyIryau4h0usYt/dmwEsdBlVGYyI8bYxLKZwVpRsURbJYb?=
 =?us-ascii?Q?gA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6OAukuvn+jw4fx5IXSxvYXgaEv5UELCIJAhuMqqHDp87Xy7gIsb4L1fyzDbiksDxcgHuyM2JsgCDH4QABWtOYU14/anFRBlx0FkK0ZagnqOAN1LYh5a/oxdeJ2hWFQEFDjkIdvyimZkH99V6St3atwGjzKr/ScuooNktBRMTu+b+7DSqxXWpfmoOIsIaL4y+9hxtEMLq8UpRS18+1mjG5JnPG68zOrpBumRaGEDJLJS7qGZKQ0xNqyfxSKQepWKMq4fTN75B4UPImhYkP8w1ivXotvG+RSNpuVYPQ+0OQWAGXZUyRh+PfkQvxBG0nLwQB0nsACNWQBJzqnaBptz+QFUOVwv2YLIDPKMpJHsVEhHgSjXv+IvyIR39ltkCS9godJ2ffCN3IvoJsTdpkGY4tlPee9tPC37dH+azNUiSdaG3Y41J4aaDT2Q55KeCxJ4V
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:53:06.9403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d293769d-51b1-4dc1-1d80-08de6e4d6808
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4377
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 17:53:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19529



On 2/17/2026 11:23 AM, Andrew Davis wrote:
> On 2/17/26 10:10 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The +=3D setting was overriding the weak ?=3D assignment of IMAGE_BOOT_F=
ILES
>> in k3.inc.=C2=A0 This resulted in nothing going into the boot partition =
of the
>=20
> Could the weak assignment in k3.inc be changed to a +=3D? Seems like that
> would have the same effect and prevent any future issues like this.

I would say no.  That is the default list.  If a platform needs=20
something else then it can simply set IMAGE_BOOT_FILES to something=20
else.   But if it was a +=3D, then the platform would need to use :remove=20
to remove things it does not want.


> Andrew
>=20
>> wic image.=C2=A0 Change to :append to force this to occur after all othe=
r
>> settings of IMAGE_BOOT_FILES in the conf files have processed.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: Fix spelling error in commit message.
>>
>> =C2=A0 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc=20
>> b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> index 9d3cc612..475234a1 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> @@ -20,4 +20,4 @@ do_image_wic[depends] +=3D "${@=20
>> '${TI_CORE_INITRAMFS_IMAGE}:do_image_complete' if
>> =C2=A0 TI_WKS_INITRAMFS ?=3D "${@ ',initrd=3D${TI_CORE_INITRAMFS_IMAGE_F=
ILE}'=20
>> if d.getVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
>> -IMAGE_BOOT_FILES +=3D "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if=20
>> d.getVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
>> +IMAGE_BOOT_FILES:append =3D " ${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if=
=20
>> d.getVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19524):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/19524
>> Mute This Topic: https://lists.yoctoproject.org/mt/117859038/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

