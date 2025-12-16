Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB31D637DB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 21:58:40 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5917.1765922317901771620
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 13:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=NoM5y8v2;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.10, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcA5qzl/D0+g9+9Jyj/axDkYzKGvzqmlYE3EHLINyDThD7XnM7IC6lWTQwsJwJ1PDWltScI7QA7uPxVjXQ3tVaiCE5YNUaHIUKWk+EVbBkd4Emv3Z0Imtz8Pq5J5EE/xR6VI2ibbTS7oKtjJe5yqYuS6Jz+rNEtpR3UZpPNB9B2p9Uy/MKszc3gHvO2nR7pnhLIsy4Aq3vj6d+MdGGPL051eJtB3o1nlDmLIDPO9ILsZHDAgTWWSsdNVul20fGe8jWtjMF/4/c4LJnOmv6BnUmIKeWfyX2OGeScBnTzT+3OyAFp80FITn8NoQMHglQ4WDB6bNW7kf+DCI6SrYfLtlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkXRThqd78Yu2SlNLLC2VfoKONNrS8DxDidAWDDotcY=;
 b=gjaI4GNBTv0MrqOESAM6yuUzJPdZFmzOBke90gQr4F1ENO60uwRjdwdoLj6rtoInzcayBotaeSLZLVLqWSWUO4UQhDtfozHiuur4MezS6Wy7EGjhjlhQN0Vlc4GbTELl0KrFimgcnnxpiut5P5DFHvFN4RkdOWyDPedJddTPISrlDSIPwF8CjQwhZQIFrNOz9hqrt2NIPok3v9R3I70mTxh5dICG5gEg2iQ8Q2vR21e096sIatUJw3wRA0MZChZXrrni/4vKruSQu4tJ51Xx8bpN+jXY79fNrWbtOPHHYs42rPeIDfy8kZry4HpuafK6eahuZGDtRv0Qow4B1dWQyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkXRThqd78Yu2SlNLLC2VfoKONNrS8DxDidAWDDotcY=;
 b=NoM5y8v2pJ6dH7Q84V18iFbKLvM1gmyJKBdCrfJ4fkk4mjfxXcYmvxjvANs586wBOIPl4zYnMCvvQlelp5I0G0GTUSIu6D1jsqaXie5iX6SAgBN2qW6/JYBCzrxiQ/pgJjFkT76W4y47ynBRAg2FP4NTIAH/gAUyzD5CFqFkTxM=
Received: from BN0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:408:e8::18)
 by CYXPR10MB7974.namprd10.prod.outlook.com (2603:10b6:930:da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 21:58:34 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::fe) by BN0PR04CA0043.outlook.office365.com
 (2603:10b6:408:e8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 21:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 21:58:33 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 15:58:29 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 15:58:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 15:58:29 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGLwTdE551903;
	Tue, 16 Dec 2025 15:58:29 -0600
Message-ID: <5bb4b9cf-5177-4dc6-bb8a-5706b2860f32@ti.com>
Date: Tue, 16 Dec 2025 15:58:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add support for
 beaglebadge
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>
References: <20251216003229.2229848-1-jm@ti.com>
 <c4acdd6e-892e-46f0-8bf6-c613652d195b@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <c4acdd6e-892e-46f0-8bf6-c613652d195b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|CYXPR10MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a003c0-634d-4d7b-94f8-08de3cee4177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NQyVId/AFZShJaUXXpavJWrU4VrPoo8TpVfarlYrZ2esf22yHDXsCMaq53w5?=
 =?us-ascii?Q?1YUJ4JerIXeq3euHncLnGkqE47KxuRJzFCATAzyXHPuxRD3Vc8IQnEi/Pa1n?=
 =?us-ascii?Q?DvpS1E2zzQrl12zA5bChnx30MW+h9pkJAoSjNDwHfConYK1dpxaAOG9fIlu8?=
 =?us-ascii?Q?fRL4Ltm/a8ApiOGZylHKAASVcVJT0Vb0jVqxQm8G9dEeSCyAm1QUer4NkNKj?=
 =?us-ascii?Q?JZyB2SOyHrKoLOvXxSqcvDX6XbtBi4/VKKLKHJKiq3juFQqg2MSPEd0/RBCe?=
 =?us-ascii?Q?Q1ewxUd0Jba8GCkWqmf9Umo1pY2r44w6vjDa4i/5V29fRwtgGghVKmmR8IY2?=
 =?us-ascii?Q?EPhxf//MYYD8m9I+hqH4YIpJdLyPt+lSuBaMf/7j8LthrBH2n4+0Umwxc9NC?=
 =?us-ascii?Q?+NShJLGUTEXhG4mbS9wnKurAmYK8nbIHgopqi9d4dC6WMki5UzWcxJOZsfeO?=
 =?us-ascii?Q?7Ko3dtL3KXB5V5FSe+IKD7RHu85Secyg0IeXU0ApmMXY/Gm2bSAg18V/uWon?=
 =?us-ascii?Q?rFDKGHN9/V3YQ21FhdQinMpSbZCz0piAVir7fE56uGyoYIlrIo2+quMa0u8I?=
 =?us-ascii?Q?4f9OsnIVVzQR2qxaAxlliT1TOBXtfgFLHts3bU7dhazuc2ZG7TgcJHjumILp?=
 =?us-ascii?Q?pXT90g4sx0PIVTLv2wxyiesee/aEWyKpDVkGsBDkljdWvlu2mxWdrx5v9Mxd?=
 =?us-ascii?Q?U6xBaEGntoQr9iuNAiaUi0lsLOSUal7qU/vFjOgtl+2lbWm2iF+nzJh9bXZs?=
 =?us-ascii?Q?xF25of7BZzr/Pm3w0q+WYBdE/qwecRwqM7z9+yhCogt5K+OfsjmNg28p8Whj?=
 =?us-ascii?Q?Pr2soH4Dp3mGFf7ACmbDcE3p2oAtzcRpsYLPpLKe0P7S1oB3IWn1X1RnAa3l?=
 =?us-ascii?Q?S3Rbg9MJr5aTr9Ijf+PubQUfcWjgwmkHdCabiGEf3Mr9jrADixdcQLqa/yKq?=
 =?us-ascii?Q?hROYgXB6qbMd2W80wT9CFKSy7/lV47lC8LZZW0aRQLSCtMxyIZc02Habb85S?=
 =?us-ascii?Q?rBUvBpjGHUfUg3r7Rq5awnooxeLQgkTSmQkNBYw6n3xIfbwjGUPg9ZARe42V?=
 =?us-ascii?Q?l+aTf1sOCmUkr2DmVFenWMEmAEcapv94UZPiSYIEkOhj8pvlaI5FFhdBc6x+?=
 =?us-ascii?Q?2D0Kpi8n5ku0io0aAP2QwMopteVvb0VWF+ICSOhca68DnwVYUpFuOjXMWAR1?=
 =?us-ascii?Q?K0KjWiI4VJ2X2+HyMd/uuNrGL6oUhm5iYbm2O4q3uNl3kVaBq9TZko7aCqQq?=
 =?us-ascii?Q?UIocneqIqKvczZuaPDfzlBS8TT1Eb9ykwLz2qJ670q/WSmZWM8HhzIIj9Avt?=
 =?us-ascii?Q?k9WxDIko32cz6cvYHAML5Mh10Z3pn2mlg53g2wpiu8DLT0k8XqnZrctKX3nH?=
 =?us-ascii?Q?nHJgec4dbrRO2CT3wIhvXQyl4MTXlQNevRl+aFK+Er9nlC8hmieFMeOTOqHn?=
 =?us-ascii?Q?5EmZ97GA0cyn5ZSvez8eq34wJhEok4IZYN6u0Nhgf3IAxLa72xe2EPqY6MaS?=
 =?us-ascii?Q?QblVu57Ruw75nQo+gOxpd4vm24M4fLeHFaT9nkvs6Gj9cA55Ccg7H2pPYzmu?=
 =?us-ascii?Q?aTXolwxHLs0ucl5vm9M=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 21:58:33.0359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a003c0-634d-4d7b-94f8-08de3cee4177
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7974
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 21:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19362

On 12/16/25 8:52 AM, Ryan Eatmon wrote:
>=20
>=20
> On 12/15/2025 6:32 PM, Judith Mendez wrote:
>> Add support for the beaglebadge which is an am62l
>> based device that requires new build configration
>> for u-boot and TF-A sources.
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/beaglebadge-ti.conf=C2=A0 | 19 +++++++++=
++++++++++
>> =C2=A0 .../conf/machine/include/beaglebadge.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 9 +++++++++
>> =C2=A0 .../trusted-firmware-a-ti.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
>> =C2=A0 3 files changed, 31 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/include/beaglebadge.i=
nc
>>
>> diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-ti-=20
>> bsp/conf/machine/beaglebadge-ti.conf
>> new file mode 100644
>> index 00000000..a9d59823
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>> @@ -0,0 +1,19 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62L Badge
>> +#@DESCRIPTION: Machine configuration for the TI AM62L Badge
>> +
>> +require conf/machine/include/beaglebadge.inc
>> +
>> +IMAGE_FSTYPES +=3D "ubifs ubi"
>> +
>> +MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
>> +
>> +UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
>> +
>> +KERNEL_DEVICETREE_PREFIX =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62l3-badge \
>> +"
>> +
>> +KERNEL_DEVICETREE =3D ""
>> +
>> +UBOOT_MACHINE =3D "am62lx_badge_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/include/beaglebadge.inc b/meta-=20
>> ti-bsp/conf/machine/include/beaglebadge.inc
>> new file mode 100644
>> index 00000000..5700050a
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/include/beaglebadge.inc
>> @@ -0,0 +1,9 @@
>> +require conf/machine/include/k3.inc
>> +SOC_FAMILY:append =3D ":am62lxx"
>> +
>> +MACHINE_FEATURES +=3D "screen"
>> +
>> +TFA_BOARD =3D "am62l-badge"
>> +TFA_K3_SYSTEM_SUSPEND =3D "1"
>> +
>> +OPTEEMACHINE =3D "k3-am62lx"
>=20
>=20
> You should be able to simplify this file down by just having:
>=20
> require conf/machine/include/am62lxx.inc
>=20
> TFA_BOARD =3D "am62l-badge"
>=20
>=20
> Only if we majorly change what goes in this file should we then=20
> duplicate the entries.
>=20
>=20
>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-=20
>> firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/=20
>> trusted-firmware-a-ti.inc
>> index 9e733448..7ef3dfb7 100644
>> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=20
>> ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=20
>> ti.inc
>> @@ -14,6 +14,8 @@ SRCREV_tfa:am62lxx =3D=20
>> "7252a99fb781075db1987d8ce2c7e37324297427"
>> =C2=A0 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/=20
>> TexasInstruments/arm-trusted-firmware.git;protocol=3Dhttps"
>> =C2=A0 SRCBRANCH:am62lxx =3D "ti-master"
>> +SRCREV_tfa:beaglebadge-ti =3D "76800058f24e3eb3fcacdb12106a881ae279f8c3=
"
>> +
>=20
> This file is confusing.=C2=A0 Since beaglebadge-ti adds am62lxx to the=20
> SOC_FAMILY *it is an am62lxx*.=C2=A0 So I don't think you need any of the=
=20
> changes in this file at all.
>=20
> The only real difference is the SRCREV_tfa, but I'm thinking you are=20
> just trying to pick a newer commit that has support for it, so you=20
> should change the SRCREV_tfa:am62lxx and not create a new override.
>=20
>=20
> Does the new board really need a different SRCREV?=C2=A0 Or is just a new=
er=20
> one that picks up support for it?

Latest commit in TF-A supports beaglebage, so will update am62l commit
shaw then, thanks

>=20
>> =C2=A0 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};name=3Dtfa;branch=3D${=
SRCBRANCH}"
>> =C2=A0 COMPATIBLE_MACHINE =3D "k3"
>> @@ -24,6 +26,7 @@ TFA_SPD =3D "opteed"
>> =C2=A0 # For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
>> =C2=A0 TFA_INSTALL_TARGET:am62lxx =3D "bl31 bl1"
>> +TFA_INSTALL_TARGET:beaglebadge-ti =3D "bl31 bl1"
>> =C2=A0 EXTRA_OEMAKE +=3D "${@ 'K3_USART=3D' + d.getVar('TFA_K3_USART') i=
f=20
>> d.getVar('TFA_K3_USART') else ''}"
>> =C2=A0 EXTRA_OEMAKE +=3D "${@ 'BL32_BASE=3D' + d.getVar('TFA_K3_BL32_BAS=
E') if=20
>> d.getVar('TFA_K3_BL32_BASE') else ''}"
>=20


