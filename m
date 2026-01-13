Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB396D2F346
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 16:39:03 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63265.1768322339596215331
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 08:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=nAchAx08;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.61, mailfrom: nm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoab3LvoIOl+kdxBsZCiztIkSV6LFHuYNIqjO0sX6a02ZfNYiazqwVjZK99VFho9tQya4lbELAi4WOUCPVYKHb7qEfSvwILM0Gnmu66Yj/a74Xg4woUqv4k9Tsqi9dLyKKsSsorWcWFWzNAr4++8B69dQYelSzZe8Ubd7tOR0/XSm2MOX3ZjLeHUOXqGGlx6ONEeDM1lQIuQ4kjx4j7JJyT7mur8I9Inb7/rRk7fZTTJTYy7Y1v4fN4w4Jc3sNCFjFqb1/78YcqBIWJqKFc1V4AIOPbQNfT3Mwq4ZhDzLrg8b/NN825/BU5Wdp192P4bNZKyyyLZ8AcLRcbrq0cYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qALmE3tH0ArXcAYMNISWySUq2L3Dt5fOAB3rIdTPdDY=;
 b=c36gkZHv7201Y4hF/+yeg9/ppXEFIfRhb7jC/mRySV0ftaFL8OLqygYAN/y9jmxeHbl+bgCcCyqfUMryHU6GznqKntQ/6a9Gv7wK3dgdhMrjrydvjQDo/st0v6zrVvsGoA84qnvpgUVwj6uaNfDyPLnYwMw4En7k3MF6HZMneJ0LjkDmxuvMw1yT8tCWKIc5wNUts/nwnQIIKjawa+nchme8ap71Qf93L6KV0oTrsCRJKTKdemsW2gN0uQisgmsGFixKcA+JpK/f8LHqhPG+ULdCKb2lGLxiDwRyDcETLGd84JTgi2F5m0JujxqBfNgL5LbcnhzIv07RKohvBWFztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qALmE3tH0ArXcAYMNISWySUq2L3Dt5fOAB3rIdTPdDY=;
 b=nAchAx08zGKh9ZOccp498YlIAlwSS2ylsn97j3SG4S/YMZKgeqUte9RkJNjsSgySuFQtif+g1Kio3bXUG/vVFToMtFcCCFlUTiFKKgLXGEuopGBtsMbY2OearqwAHZx8ytNT3lfRtQRd72MtDHLdIq1pbHFdeYEhdeUJAy9uEpk=
Received: from MN2PR14CA0007.namprd14.prod.outlook.com (2603:10b6:208:23e::12)
 by DM4PR10MB6158.namprd10.prod.outlook.com (2603:10b6:8:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 16:38:55 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::c6) by MN2PR14CA0007.outlook.office365.com
 (2603:10b6:208:23e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 16:38:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:38:55 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:38:54 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:38:54 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 10:38:54 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DGcsdW2450356;
	Tue, 13 Jan 2026 10:38:54 -0600
Date: Tue, 13 Jan 2026 10:38:54 -0600
From: Nishanth Menon <nm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<a-limaye@ti.com>, <gehariprasath@ti.com>, <denys@konsulko.com>
Subject: Re: [PATCH] initramfs: Add dt_to_config script to initramfs
Message-ID: <20260113163854.b4dcwdwxld2ljqy2@posted>
References: <20260112093125.73038-1-m-shah@ti.com>
 <73d10ac5-9888-4313-a8e4-f7ec3611065b@ti.com>
 <20260113115517.q4jhbqlu6zhdrdlx@antiquity>
 <86235717-16b8-4a88-bed4-3b1849cc5628@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86235717-16b8-4a88-bed4-3b1849cc5628@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DM4PR10MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 306e3cf5-d278-47e6-70cf-08de52c23e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nlf/ORMGAOO5So8z0VllJ/BggpSREa8wZ+q+GePiVsKv2guWB3SzhMdJEbG2?=
 =?us-ascii?Q?+MFDf/9erLA4HcltM3nkLRksZc+moNYsr/Eu+jMOnBBaqaZifjuRiDrjLYB/?=
 =?us-ascii?Q?rnDHny3nzUPi92PfGhFSH5SYqulWHdaiorZxqMe/+zPHu5pVMCBCz6PCPXNn?=
 =?us-ascii?Q?WWIGEVw51cuPLVWKZ8Mx+RyT25y+d1ADFk0T+z/fmlaxkqgXijYrmSq4vFBu?=
 =?us-ascii?Q?86YxNDKXiT22zrI+Ezwdg1HY/jEr3AiJrL8n8/cKvlTunTYmcGr+0wLbfOQe?=
 =?us-ascii?Q?qaT5MDIACXmUWYWpEALPoB+jLRz78ke+EjwzKLUPWj+KS5b51NqFwOzrgQqh?=
 =?us-ascii?Q?xY6TG3qgcpoRGa+zqEO1LHm9njGSPD56qVAy9c8Xh3YeIf7OG5mrqrT0ilBe?=
 =?us-ascii?Q?TPReXgsBHJh6vITVjwz2TP2x2clN8HNzppYKXH7xUj/f3tpBvbAr1IHENCQ2?=
 =?us-ascii?Q?95ctKjceeYTdSzrIPurhH2Ox6Fn6vReNN9BnBpFX/EuaiwGf8hsideKLG9J4?=
 =?us-ascii?Q?RtDr3GmpYZxsUk/yYhAVgOr0uBbEjQ8MBHCbFtRTYFlVHVQKRg4oy6IHy7nQ?=
 =?us-ascii?Q?FzLmrdkKNdoIpyCx8ZszYYUf+1aXxnliQcOItTMMn9Fi/S/Ssi7970S1XuV0?=
 =?us-ascii?Q?nYx24gvzfMX/fisichAo/d3gDHV+tTD76H0ueOo7qEc0Zs1rSAe/Jhn7626D?=
 =?us-ascii?Q?yvX0DbE8VuRRSIHmToiFXXKquhrIAKuYSmz6zp/8BAq4Kk13+YkMLhTSaEMe?=
 =?us-ascii?Q?C5l6TbH3zVCtcZ0vAKDXW305k5NXKvqna6Pwcp3Ykzb5kXyA6Ivkl7Wjl3cZ?=
 =?us-ascii?Q?bNZ1gM1qyM98v3jrPoMihGwMpMrntVVXzKaTOjSOyK0xfdFX8k1neDQImB0F?=
 =?us-ascii?Q?h7p1X3EBWTQG0+v9+puAQ2POHyUvj4r8n79dlUOe+v3CzIL3lOm+iZM3ac3O?=
 =?us-ascii?Q?8BX0HI3m3QHLFzrEqTOaqlk/HCkoX+DQCmsfiJ47amSwYMMd7itueiqULoKi?=
 =?us-ascii?Q?iCFhYCzSFqihnszklwk3Yrw0+GwE8kb+tlaRQbgNNy40lngy9kG5VUktWbN9?=
 =?us-ascii?Q?syZHBeNLXpzsk8zCekbp1fZkRQ1+3F4se7wrfzFuy+mbQQSZNDy2spsHjExR?=
 =?us-ascii?Q?/k94nZaXNy4/uKoLaOhYhDGanwd1IkiXdy1EQsZpnrQAJsONLOBGQ3Ec9gnx?=
 =?us-ascii?Q?zx/h1ILiJE0SKWNfMdwmaWRqNUmHj2q7t3AjOTvDEwM37UL+/OS+8Es1RdSC?=
 =?us-ascii?Q?1hItYY5Gkh6QSTZvMIzfXPsNdg7XItbvnHqQZxT+Yg4OjNxIS4DxM6dQtIVm?=
 =?us-ascii?Q?BBpvEDe7ayIioEtwG/OrIkrhR6FtgF2qW9Kp8F0p95ysQDtlolhefbqbFRkt?=
 =?us-ascii?Q?Mi41mGEs+5iX9P+QYRaw/Ao795WKR0KkPNNFRPSVCqFSEcs8TsL9/WlYJHv4?=
 =?us-ascii?Q?hw9eP2dN9mzTS2s8F6p2GfDUMGhFwfLEK8GhHRR0iJZH03vekYjrFLcxFv+3?=
 =?us-ascii?Q?Abzkx4jyOjv9XmEHi5Ss4dTD+cQkRL6kClhODHC4GVCKmhBhMb8zH/j1z9Fm?=
 =?us-ascii?Q?lEuwB+Ycl6jdbamJp2U=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:38:55.3648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 306e3cf5-d278-47e6-70cf-08de52c23e41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6158
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jan 2026 16:39:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19411

On 08:17-20260113, Ryan Eatmon wrote:
> 
> 
> On 1/13/2026 5:55 AM, Nishanth Menon wrote:
> > On 08:43-20260112, Ryan Eatmon wrote:
> > > 
> > > why is this needed?
> > > 
> > > 
> > > On 1/12/2026 3:31 AM, Moteen Shah wrote:
> > > > Install the dt_to_config script to initramfs image from
> > > > the linux kernel tree.
> > > > 
> > > > Signed-off-by: Moteen Shah <m-shah@ti.com>
> > > > ---
> > > >    .../recipes-ti/initramfs/ti-core-initramfs.bb  | 18 +++++++++++++++++-
> > > >    1 file changed, 17 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> > > > index 1a102d82..44574377 100644
> > > > --- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> > > > +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> > > > @@ -29,7 +29,23 @@ IMAGE_OVERHEAD_FACTOR = "1.1"
> > > >    # the final image this is usually done by adding RDEPENDS_kernel-base = ""
> > > >    # in the configuration file. In our case we can't use this method. Instead we
> > > >    # just wipe out the content of "/boot" before creating the image.
> > > > -ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
> > > > +ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; install_dt_to_config; "
> > > > +
> > > >    empty_boot_dir () {
> > > >    	rm -rf ${IMAGE_ROOTFS}/boot/*
> > > >    }
> > > > +
> > > > +install_dt_to_config () {
> > > > +	# Install dt_to_config script from kernel source to kernel build tree location
> > > > +	if [ -f ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ]; then
> > > > +		KERNEL_VER=$(ls ${IMAGE_ROOTFS}/lib/modules/ 2>/dev/null | head -n1)
> > > > +		if [ -n "$KERNEL_VER" ]; then
> > > > +			install -d ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc
> > > > +			install -m 0755 ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc/dt_to_config
> > > > +		else
> > > > +			bbwarn "No kernel modules directory found in initramfs, cannot install dt_to_config"
> > > > +		fi
> > > > +	else
> > > > +		bbwarn "dt_to_config script not found in kernel source"
> > > > +	fi
> > > > +}
> > > 
> > 
> > 
> > Not in this form. we need a smarter version of dt_to_config that can
> > help pick the right kernel modules needed for initramfs. dt_to_config is
> > just one part of the puzzle. Context here is this: we would like to try
> > and transition default upstream defconfig to enable ramdisk by default
> > and then with the right modules in ramdisk switch over to the final
> > rootfs. if we install all the modules in ramdisk, ramdisk will be
> > unwieldy.. So need a smarter solution to the same.
> 
> We currently have the list coded in the machine configs.  So we are only
> included those.  What does moving to this flow buy us?  And it sounds like
> this is more of a build time thing and not a boot time thing.  So this
> shouldn't be needed to be present in the initramfs, right?  Or am I still
> missing something?

No, you are not missing anything - this could be utilized build
time to come up with the list dynamically - that would a smarter
version of dt_to_config option that will look not just at the symbol
for the compatible, but also look at dependencies needed for the
functionality. could be a combination of pre-defined fragments
(example: for mmc, filesystem dependencies) + compatible based
discovery (example: mmc node depends on regulator, gpio or whatever)
to create the module list that is then added to initrd. E.g. if 5 dtbs
are supported, then a combination of dependencies for all 5 dtbs. I am
not sure if such a solution exists though..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

