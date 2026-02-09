Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F8FE81BD7
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 15:12:20 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49404.1770649932934403781
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 07:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wi4sJKPu;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.39, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uguc6eFozXhSNsaEs9zQnicoSWGWzudkui2+tFgOqgjaknBWdPzrLK9R3L4NaDy5/1tegIE7fQADB7PsFgf6RMThPkinTVAkR9UZToGARkqBzShOp6O5YOLigx/Rl6devs0a3dcn1SWNsvJVu2QkUFZGFCdNzO92nKOHZc612oN6B5esDOgp8rgNUIO9OnOlD1vPoQQsiA7Sm/J+vx/kzPQ/g1s+UhDRtnkVRN+fe7E/5GF/LO/8rSYdzO1MNFk6MoheEQ/2jKMzN0rIaRwq2JzfkX9GShbUfC3m72uzQdIJx/JD0gW5gMfcXiGn6MDuA2xeyHZcWVPAYEsgGDGWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsdxI2f3O/YR1k1JOd1ePoK029xC641nLJRZ9t82Ibg=;
 b=S1SAgr7Xua8WtTt1tftbLCJ/36/KgLFsZV1ztlO3xtNKEQVoqUi82mglFSshdhP3JDHJL3woSanyUQQlOGK8rIi7xlZGPAF4mV1bYGb5SOepz3uk9R4Vis5iLDWAjp0AahSi84AvDV3KPuc5VEBFUPZ3xl/pRFhAYbFnhPlCnMKc4KpYETjeeltCBxxD+P4bzFz7BB/bE6mp5duNhxphanTq5XpCGQFTQAUEhkKVrdDUvbJEC94h/e6nSqaDki2MGXIemrmBJOoLkRunXGthCWFpKHXuYmSV4LpbEKfdrS3dmL4IaBHZyriFdN+bzspm/A066E35pi3xf3634Xm1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsdxI2f3O/YR1k1JOd1ePoK029xC641nLJRZ9t82Ibg=;
 b=wi4sJKPumKFsg8Jxgd4ZE+AL6Xm3Gsb92n73+M3xlAzSrAxopzMzdDA6Pcc7+mpE/u83PqD/9Xcyb7JfwPx8LLNTUsDnfNKYV485XJ8CJVzYJpYH6sELjXxuHXHnNJBBMbBJq3mAmU5GNOKuSWn4N/GLccc07tBQ5I2Epft+w74=
Received: from CH5P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::28)
 by MW4PR10MB5839.namprd10.prod.outlook.com (2603:10b6:303:18f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:12:10 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::c2) by CH5P222CA0010.outlook.office365.com
 (2603:10b6:610:1ee::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 15:12:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:12:08 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 09:11:42 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 09:11:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 09:11:42 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619FBg9f1778276;
	Mon, 9 Feb 2026 09:11:42 -0600
Message-ID: <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
Date: Mon, 9 Feb 2026 09:11:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
To: <ivitro@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <denys@konsulko.com>, <vitor.soares@toradex.com>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|MW4PR10MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d589bea-254b-4759-ba48-08de67ed97c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|4022899009|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rQ/SJnHVkB0QQx5Lq6s6whLJ0HqqsiBNZHVKCjiKaBbBwxYq5Rn2PXD/Mjn5?=
 =?us-ascii?Q?23hXBa8VfXaAm2rLGx4QQkxws4yRghLVCkSTnSfzSX6/WqXkWGpdtC52sNg3?=
 =?us-ascii?Q?/eH/oiYmay8++HCCE98NS79v5yf+FtdNneFj3xtHDCvxM2HSnxDayKLMUCJA?=
 =?us-ascii?Q?FJD5X/z4S6noIsZCgXIPeugbQBAowlY7plyh//fRWB4pLykJy+pB0SPJ/vwE?=
 =?us-ascii?Q?BtwIWjR1yj7yWWOSg7/2271XERILaqXDQjX7X3EjzUnL72vVmQgL1o6Vel9n?=
 =?us-ascii?Q?mxr8XupeP4ZuEq96xQUvNSuXxWsXJHrXKPPo3u1tiqEa+MATnfNL0RSf3DYf?=
 =?us-ascii?Q?OcI1kZyTWUNjxNqRPf9Nf5pRAwQ/q4Ze4z/yIDYjFj9cH/ZB/jHYgTh+pK1F?=
 =?us-ascii?Q?koPRaRyM5Q9nrOnN/rFhdOb2JC9r+flBOc32lVeySN3Gzl7jw1z024YRSccl?=
 =?us-ascii?Q?UjaIU0n/6FtOAAvpzW65iWIbGJVSaRw22OHFNfBU3FL7/Sn8RIU9BdCJd/91?=
 =?us-ascii?Q?QWcgvPzW0w2Pk0PBLvwIsIB2nwR5a8k3F0W2qGAMB+f6RJkq2uMUE93Fzrqa?=
 =?us-ascii?Q?HdBO7e1lMDckTYjWBH7Rtb/8qXtQe2O7Lq0f2BOsAUBA2P2coqpUKp4h9v0i?=
 =?us-ascii?Q?vTixNuDNm7fDSZLGqxlVHpMKFEUpEEiC2IlKyoNfOe27wUA81AjnUddKAf75?=
 =?us-ascii?Q?7eOVhdqw9A55sPlnU78aUy1BQwfiUNQRq1Sz1ifS2lJ3R3KgUCSAaBW+tKOZ?=
 =?us-ascii?Q?grB5BZcO6+wINRvw3tu9yCwNnPZXkQuiGK21p43fa6xcOqvvHXFw13qBn2io?=
 =?us-ascii?Q?uArA5O7NAOkOlujfWRAYh4Hc7o3iLN6iHQePa9J77M5cgLBBH4DaJklu/tvd?=
 =?us-ascii?Q?6w6e+vtmZUk1hp/npTegrWQw0ocGv7tWqE2LJWXxcJAOvAqcM7hPfeBnKfZn?=
 =?us-ascii?Q?2+fNOwxQ7qYeRUDciz6X76hfVTHti+c9kwfxHAIyTZj74CDrcluPsTNzI8M9?=
 =?us-ascii?Q?7ARAZ+CeaKH9i3v9l/gTccsDfVRM9wnW9X/ppNxJwDQmE0hsf76Frg+fcWfi?=
 =?us-ascii?Q?4okQ32mEQQttKWMaWqGj2cmaf6r9WyJQQVAAAvXXBsEhYL94zEgdKZJK7pVj?=
 =?us-ascii?Q?cKH9pKZEzidgNA+V9k4M66tAe9+m5gjs68DAF3IB2Ctp4cS1kw3lCtR3ZCcB?=
 =?us-ascii?Q?6MBSOZ0ekR7prpHFsO7CGD/Zas4h9yMaZVIC1eDkbRO7DzUoFegAHrGhgdFe?=
 =?us-ascii?Q?UDvThVtFzo19Dz6UwCH9FE5duPZYyQraAUqhu6VmOerFx51kMkfYZ7aFxTpl?=
 =?us-ascii?Q?GNY65UqNw36ceAVQnsTEJY/Tws2MpWt33McUgIbVDDuc0K+FF+bY2EqvOLik?=
 =?us-ascii?Q?n0jyGm4o5+VMtu8oV+6Yt+WLi/D402N4IUSZR6u07df0NBjRokp+YB6TrmZL?=
 =?us-ascii?Q?cuSxjalVK0UaUXsfIntGh3oIH+V37ebrvjPfbvJ5Mh6VcOZ9k89UJi+QIcxf?=
 =?us-ascii?Q?SAPR8hIjPw4ywCcpDGr4iNHiMFwU5+fcLrReZv3bmOJinUgZB4pB60jcrLW7?=
 =?us-ascii?Q?6AiDTDSscDpP6UTMVaxpY4lXS4JJJHGRNkdxkKKIbjNcz6FwJaF7VXA9+XO5?=
 =?us-ascii?Q?Mg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(4022899009)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8jHvlCfW7v1qzov7pZRvj7M05NzqTO9DMZiNIvW0TJMl3NM8hhZOcQ9eTTZrvepv9ufaZNEbu16BVGFicpZHk1Dfhne96VpIZ98zIm+tag8nwfCvu6DvpENn5PKaxT9z97s6NHO4lPqpqGlBnxPIh/sALHQ8EbK2qplqIvtj7GgWzfkxl7O/UOR359dRq5//CSOfpN5LP43/BJRLjjxkMPZKtD+PSJpwepCqDW+qGFjpU+48bcHbVub2XcWoz9U8pBGt2P861DJm3naRQEI/0Ye56JiztmsXwDRHtdD4zvmo3+Y3xmHd50QsMAF8ZV1QRz/oqfyupF5/17Tn7X7vEbIwzkxqGL9zN+T6xmtKOcxJkeDluTUA2OkANVIJfMwjKS93j8OGXc7yBnqjEp0dv6TeyVIfjFAEdRHpJtUoNvYjNaLx/4DaSlFsFXb6ECmh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:12:08.3110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d589bea-254b-4759-ba48-08de67ed97c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5839
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Feb 2026 15:12:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19474



On 2/9/2026 5:21 AM, Vitor Soares via lists.yoctoproject.org wrote:
> Hi meta-ti maintainers,
>=20
> We've hit an issue where selecting a BSP version (e.g. TI_PREFERRED_BSP =
=3D
> "mainline") also forces initramfs integration via ti-soc.inc (lines 32-49=
). The
> bsp-mainline, bsp-next, and bsp-ti_6_18 overrides all unconditionally set
> BUILD_CORE_INITRAMFS_IMAGE_STEP, TI_WKS_INITRAMFS, and IMAGE_BOOT_FILES.
>=20
> This means we can't use bsp-mainline without also pulling in ti-core-init=
ramfs =E2=80=94
> even when our images don't need it.
>=20
> Since we can't use bsp-mainline, we also lose the correct override contex=
t for
> other components. For example, we end up having to manually override all =
the
> mesa-pvr.inc virtual providers in our machine config to use upstream mesa=
 =E2=80=94
> something that bsp-mainline would handle naturally.
>=20
> The root issue is that initramfs integration (an image-level concern) is =
tied to
> BSP version selection (a machine-level concern) in ti-soc.inc.
>=20
> A possible fix would be to move the initramfs logic to an image class (e.=
g. ti-
> image.bbclass) that images explicitly opt into. This would be a breaking =
change
> for images relying on the current automatic behavior, but it would proper=
ly
> separate these concerns.

I recognize what you are saying as an issue.

We are in the process of moving to require an initramfs for all of our=20
platforms as we transition to using modules for kernel features that the=20
upstream kernel is unwilling to turn on by default (to keep the kernel=20
small).  We have been turning these features on by default in our vendor=20
kernel, and we moving away from that.

So there is a need to balance our need to make sure that everything is=20
in place at the BSP level, and the need for downstream customers in=20
distro layers to build upon that initramfs and include their own changes.

As I see it, we have two options.

1) Provide a mechanism to extend the ti-core-initramfs recipe to allow=20
you to put more stuff in there.

2) Go the class route and make it so that your initramfs (using the=20
class) would make sure to include ALL of the needed modules into your=20
initramfs and still register your initramfs with the images.

Can you point me at the recipe that your initramfs is using so that we=20
can get an example of usage so we can plan for the best solution?


> Would this approach be welcome? We're happy to contribute patches.
>=20
> Best regards,
> Vitor Soares
> Toradex
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19472): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19472
> Mute This Topic: https://lists.yoctoproject.org/mt/117717310/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.c=
om]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

