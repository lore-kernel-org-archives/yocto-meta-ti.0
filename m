Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40FDC9EC97
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 14:44:13 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34202.1768229043429262695
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 06:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=pmYY3POv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.2, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdNoM9AiH5FuW+kE4HC0megmpBze6eYAEIPiOJ1B89JVjdL9MwfKbskvP316BCx/F2XgfbLB247bR7Z9jlFf5BcPaoswS14u4ftv9Bml5J5CGdKm/Q0F5p26vU4o5lVOr2Wpkhtzl6f557FLOCIimidOScmLUAw16JnLpx4MzviLoRqXjoCL+nSEJ73gY0FRHnyvFcItXH9X0QlFKxvoYWGbwMHJun3SHZIYb24Rz6UJCnKwbawGBIIi2apANWIuczInZuutGMsQbkDXuK7zzbVlkLkR33JHTVfvw9gz5gwVxb84/UpJ61qGNpnSiI9+gIAN1iWcat/v1wL45pFmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZMkYwBv8/qPnc9Wvl1CQupPYqtk6xk51Vq2DmP4F+A=;
 b=t/rnypEmpvkxAVUxemc/rYumt6zsQVyOjIUnh1tDF5w/m6FaQ/qkR1YrG0NEKhLMwWrt1yVUiD0wFNphDuCAZVG+r5URKet5zp63rxnl+0CCgd8uNCpyI244F5yAXaWCbzXq9Gjt6pb8Lmn5J6NXkKHTZ/dMUUrAQOoturgAPGvSGvD18fYOlueVXMnWrFTyo5vp/6/wMd7p4bYU10SbFuiPr0RJ3PaJiZHRv2deXTZXnmV4DVf0BTQoMUjQ1cAgTd+wsfoTblJvp5K1eDChCl7ewcjtfNwo1Fdfqv35Zvh5qM6tZEUkiQO4cgBR1X6/GYFlNaoYt3Nx+07xwJ7Z5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZMkYwBv8/qPnc9Wvl1CQupPYqtk6xk51Vq2DmP4F+A=;
 b=pmYY3POv2DpTYgA9V40vx22tIOP2jbrF9rnfZyhEEXZO+7VOhXhPAyftZNg9kaSrHNo+gmZ5VwYJ4qjQxJyCDHXfFp9AQNhv/zXEE2RbP9kHW4GWCbSqczcI1UZqBwCanLzzgprvnPTFlf73mazgZvfbsi2sPb7wrVGjYR4j2Kk=
Received: from CH0PR03CA0437.namprd03.prod.outlook.com (2603:10b6:610:10e::17)
 by DS7PR10MB4974.namprd10.prod.outlook.com (2603:10b6:5:3a0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:43:59 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::5a) by CH0PR03CA0437.outlook.office365.com
 (2603:10b6:610:10e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 14:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 14:43:57 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 08:43:56 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 08:43:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 08:43:56 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60CEhucr658523;
	Mon, 12 Jan 2026 08:43:56 -0600
Message-ID: <73d10ac5-9888-4313-a8e4-f7ec3611065b@ti.com>
Date: Mon, 12 Jan 2026 08:43:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] initramfs: Add dt_to_config script to initramfs
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <a-limaye@ti.com>, <gehariprasath@ti.com>, <nm@ti.com>,
	<denys@konsulko.com>
References: <20260112093125.73038-1-m-shah@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260112093125.73038-1-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|DS7PR10MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a9dc35b-2de8-4205-56a8-08de51e90485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cmVXT2ZxUlR5VnE2REg2UllpUGVhVVhOK0d0V2pCODVIS0QxWWJQRjF5LzA2?=
 =?utf-8?B?bkJxYW5BOStKYmxHVnBlMG1zMUN0VGFnVEZFSk5BMyswcms2eEZpYkkrem5q?=
 =?utf-8?B?bmVWYmJackJOR2o1M0R3d2I0dEQ1cDEzSndIekFXS3NSdGRaenJZaThQWURO?=
 =?utf-8?B?dmlTaFRhUUpzZlM2enA4d05xQmk5UkFLS2pPVHRhZ213ampnV2Q2QlRuQ2pK?=
 =?utf-8?B?RVVhTVZaVjZ1MVNrY2o3eGx0WjI0MzZEc1Z0NXg5Wk5JeHVqYmdSN0FWQlMz?=
 =?utf-8?B?by9aRk5wcDNKS1pVSXdzZFhxSW91NEV1Y3I1ZjFkWkYrVmNza2VHWE5PVU51?=
 =?utf-8?B?WDQvNFZONmlRQndENVVsNGVrVHZjOFNhSGlYbHh3QXRNNWJKMk10N054bERK?=
 =?utf-8?B?d0ptaml0dHhLU0FjRVlyeWp5N2xsRWVNRjJFUVNvTEFDbGtJWk1ybFhUYWxu?=
 =?utf-8?B?VVJqbUdsRXBNQ0kzcnpmdTJhL0lFOEVFM3QrZTl4YURuM3JKa1RPaHZXRFAv?=
 =?utf-8?B?Zm9VcVYwUW5yMTJtYnVqeEZoY3I5SERTekQ0Sk1GLzBwakYrWTh4dGUwWlF4?=
 =?utf-8?B?UjZ3YTcwMStLWTJwTjhYQ3NxZWNlaHoyRWpWbDRvSis4QWJzbkpBMEY3Z2FN?=
 =?utf-8?B?VnFwYXNyUU45RWVRaHUvM0psWnJxTndtazRJdXFqVDFWMHNyL3dvcUp3WFRx?=
 =?utf-8?B?bGlQMVc1N1g0YVlMNU94b0E1c2VwZHF0OXBRb0xVUG1WZ2JXb0l3Zm5vS2Rj?=
 =?utf-8?B?K0VMYTgwMm0xZHVoRGVnVi9FT245ZlNMZ1lweEdMeGpTM283U2hqSkhGZDUv?=
 =?utf-8?B?WHVJSE1Hb3NYelVwSmZhcnA1b21lNWdLSUtibUN0dkZuR2t1aC85YWYzVlJm?=
 =?utf-8?B?azU5V2RaY3ZJZVpTSWhQU1pUTG9FRzZUaU1GaFNOS3M0dE01MkRtRVhTdy9Y?=
 =?utf-8?B?RmpZby9xYWVpRXFoS3JPaHBGVEhLekg2L3o5OUN2LzhhM3J3VVVra2xSSFBZ?=
 =?utf-8?B?STdGK2Z1VE9PSFZma0U3S3ExZFFFeGpaTmV4TDZodnByeXF1SzI1N0dDRW1Z?=
 =?utf-8?B?UkVoSHphZ2pzQ0JyUlVsZzNCY3cybGdqK0RyTVRtWHpMYW5MRFhDaGlFZEJ4?=
 =?utf-8?B?ZnJ0NzlNYklITFZtc3VURjd1S0k5NmZHNTh4WHlGd2htYjNSbStUVGVIMkJT?=
 =?utf-8?B?aGd3a3I1Q1BvWThXYkZuaS9hVVdKNXJFZ0FCT1h4UGFnTTlGdTJaOURQa3dH?=
 =?utf-8?B?UERRSjBrQStINGsrQ3JqZkR4SUtEV1RDMW9lU21DQk96RzhRMjU0WHloYk5M?=
 =?utf-8?B?MlVQRjVOdDRRS2hoUlVXN0tHMHBQYk1LT2FURVh0Rm9NcndCSG1sdXVKTFlu?=
 =?utf-8?B?TFE3cDV5WVRSNjhRMTk3NDh6V2xXUDVmWDE1d1B5QUxWL2RyaVozVDc0V3ZZ?=
 =?utf-8?B?bytKRURxQ0JzQnI5ZTBJSkZJbndvNUMySlMybWpRcWQ3MWpKUURmallUcFJy?=
 =?utf-8?B?M3lXQ3UyYTd5TDlPSTdDK3N4WWxvY2ExcWlRTTRXTElFZk9KYnJiaG9rNTZz?=
 =?utf-8?B?YUdrWHFJekRQMkpDM3A1aXJZY1B5aS8zOGpkUmRwVmVmaUVNTmNvazFTSDVZ?=
 =?utf-8?B?NVNHb2dqTFNwcEFwQTFpUi9FbUZxRStXeThDdjBWR1YxVjJNN0NEempGNnJN?=
 =?utf-8?B?T0xzR01kNnpWcldoN0ZGYjRZeG5yTlorTmFIb3J4U2dtd1l4eURZOElZNWdl?=
 =?utf-8?B?ZEdwaFA4YVBLNEp0ZXY4OVVHTm55M0xMd3psdDJvY1l0akZPdHNRWitVZVVV?=
 =?utf-8?B?UVlEamFSMEtTM2lveFcxRS9ScURSb1VOR0pkcTd4dHU2dTdFNktBcFZtSkNJ?=
 =?utf-8?B?QUdONmkwZTQwcEZkVDhOYlk2My9TMVdMSW9xVHBNMnhMVGJFS0Y0dkloc1Rx?=
 =?utf-8?B?MzRwRGZyYzVpY0JhaTIzOHgrMHp2ZmFZaVYrV25sZ0gyYzZSVnhOZi9TOXNs?=
 =?utf-8?B?MUphcFhQb0VOQUE5MFB6ckliUWxhSmVEU05YQzA0ZkFBRmphT2JRc0l1azBj?=
 =?utf-8?B?UTgzS0U4U3l2eFphSFFZVFcxeTZ2ZEk5anpHY09zVForYWdyTmJZRXpiMUhy?=
 =?utf-8?Q?KmsM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:43:57.7335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9dc35b-2de8-4205-56a8-08de51e90485
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4974
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Jan 2026 14:44:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19406


why is this needed?


On 1/12/2026 3:31 AM, Moteen Shah wrote:
> Install the dt_to_config script to initramfs image from
> the linux kernel tree.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   .../recipes-ti/initramfs/ti-core-initramfs.bb  | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> index 1a102d82..44574377 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> @@ -29,7 +29,23 @@ IMAGE_OVERHEAD_FACTOR = "1.1"
>   # the final image this is usually done by adding RDEPENDS_kernel-base = ""
>   # in the configuration file. In our case we can't use this method. Instead we
>   # just wipe out the content of "/boot" before creating the image.
> -ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
> +ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; install_dt_to_config; "
> +
>   empty_boot_dir () {
>   	rm -rf ${IMAGE_ROOTFS}/boot/*
>   }
> +
> +install_dt_to_config () {
> +	# Install dt_to_config script from kernel source to kernel build tree location
> +	if [ -f ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ]; then
> +		KERNEL_VER=$(ls ${IMAGE_ROOTFS}/lib/modules/ 2>/dev/null | head -n1)
> +		if [ -n "$KERNEL_VER" ]; then
> +			install -d ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc
> +			install -m 0755 ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc/dt_to_config
> +		else
> +			bbwarn "No kernel modules directory found in initramfs, cannot install dt_to_config"
> +		fi
> +	else
> +		bbwarn "dt_to_config script not found in kernel source"
> +	fi
> +}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


