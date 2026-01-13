Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4763DD2D0E2
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:55:32 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57297.1768305324536926478
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 03:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MS7PXCne;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.71, mailfrom: nm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWYMQFTpIUwO3ZT44tiatx3wvbSWyrhJprjE9Pj8GoiljW/aQLi71BHhjQ546BhRaP+kq2M3EIFU404v8ptMrkWYCMb+nPMFu0y/w5PQIHYqvdVz0G6P73stNP0LAXyuXdnbKvJ6h+HPeG604ZQ4LHZlUjotN7oYNHxEhpCOmZL/Z3tBbJOu++QVroFtT6vHJJF41Qz6yCTtQIcGUn2z5nocxU3K5RGvVjOS6qw0tpydwiStCS6nyemdjyvbbQivnJ0fONeRfgnyYdrZ2PhyG1hAjwedukyYEZ2vtkWA0bYQMNwJ8Zd0WuCcwwli5ZKDhechg/v7t+HKfhtJYhmLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6AIRCHDCquakamiqheP9wI5CA+yDsIefO5tPL1fDYA=;
 b=hmibdwCOoo1HQqsAD+VRhdARp8p95UNw2TietaYf9g9lJHze5jK0lrtLO52kdu4n0qkULWK7Tjv2D71rnbAkP6fJ33PRxnb1O7w5lXEUTCS6qgZ2FCbdmD+pbmoNwkvnj7aMaNapKsErKdUwAmwR9aOmC+zbq7azpnkqPyCq3cBafbBqGadx0YKqkOy8CysVW2F349ljn4+muT7ic5obXWyxNjhYHfQs1sERiypQerFisUW+bPk2IckIPyub0CHLuEAD4XDmgBuaKac7ngZKfoTWdaEloxHQQbgFPAL/vJCgcuTO1c0k5YazWAa3b4zqv4s90lkOpq/SL2YYZGAdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6AIRCHDCquakamiqheP9wI5CA+yDsIefO5tPL1fDYA=;
 b=MS7PXCne+6zCkHoLXkSGYIygZCKzOj6M9sPTJHOlp6saLUw267hSPLu4/PHb6L04PSg/RoBw3uIE69h/FZco/1at57FwcEAOi1HS4B7ZAd5cgL+2WUuRFmb5igChgrkrNKpawq0ou/R8luMFawIkCFflncroEt3tWaxvAlcRMk8=
Received: from SJ0PR03CA0111.namprd03.prod.outlook.com (2603:10b6:a03:333::26)
 by DM3PPF0AF60B9AF.namprd10.prod.outlook.com (2603:10b6:f:fc00::c08) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:55:21 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::b) by SJ0PR03CA0111.outlook.office365.com
 (2603:10b6:a03:333::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 11:55:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 11:55:21 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 05:55:17 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 05:55:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 05:55:17 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DBtHAp2210697;
	Tue, 13 Jan 2026 05:55:17 -0600
Date: Tue, 13 Jan 2026 05:55:17 -0600
From: Nishanth Menon <nm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<a-limaye@ti.com>, <gehariprasath@ti.com>, <denys@konsulko.com>
Subject: Re: [PATCH] initramfs: Add dt_to_config script to initramfs
Message-ID: <20260113115517.q4jhbqlu6zhdrdlx@antiquity>
References: <20260112093125.73038-1-m-shah@ti.com>
 <73d10ac5-9888-4313-a8e4-f7ec3611065b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <73d10ac5-9888-4313-a8e4-f7ec3611065b@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|DM3PPF0AF60B9AF:EE_
X-MS-Office365-Filtering-Correlation-Id: 716c9229-f86f-47bf-bc89-08de529aa0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aSs/tdWxR9LHH+9ElfROMu+jkUZn0KWW2hWh1meJU4U1HQslRMLDYSaVX/0+?=
 =?us-ascii?Q?q6EpW7aItPQEZG6NjREcVvYs8Z7hypqQ1AlQ3oLtrMTr1gi76KDjFzK3NZ/K?=
 =?us-ascii?Q?v6MzOQIBrHvKpuLqBTWgetVTXkRNlj0H3hekIY/+7/yvHGfAyTkH+xFFrcZh?=
 =?us-ascii?Q?M9+kcxlO8qtPgK+xefs77uuW2TseLhGx+QIVH/FLod5/baCQeEHLOGiU36Tv?=
 =?us-ascii?Q?9MWAlf/ls74O5TjR3yeWb9TQhguha1MeJh4Tt/KkYMty19a2SaKqOqh6VlK6?=
 =?us-ascii?Q?AuG4tPwCkwp70KjOxkLZpZfzRsg4Ie7snxObMjzJKHFZXyI0TksV0i408nes?=
 =?us-ascii?Q?m9mR9ghVWZEoKmbIbYHGtcoUKh8rqMlIUUArbXFqZX5d14hYx5+wwfKaLq9m?=
 =?us-ascii?Q?EB/mgMQ8qn2i//EFM57YfwZyUv/IXXXZeDuJh338PJD9a6fEEuUeLvRp3vF8?=
 =?us-ascii?Q?SFEU6GGi3Y71XpYhexua87TF3lA45/35X2WThTOc8Wu515z0GqG+qWToL51d?=
 =?us-ascii?Q?J9H5TtsV/4wTKwAcPKDJMW1Ox+xUgM41KQTmWpQjI5wvbTdSxI3pwZAs9koz?=
 =?us-ascii?Q?KspqiI6VPh5VwRiDnRgbBzQizt81N4NOIEVepxDJ2irjp3yGfY5kEz5b9JxR?=
 =?us-ascii?Q?sma2cXKQT0qVnRK01pdBJWE/FKMsRV9wuS47TjfbW/U9giEgVcqJolf7WYk4?=
 =?us-ascii?Q?zfkvaqeQuyDlR+P03CWZxsteeJrNbBtqmMpwSER66tWPvkJT8GXTn+hkQaL6?=
 =?us-ascii?Q?MOyGZv9YzFj0GaOTOjYX0BCyX4NehMOW2g9xDTmUhJ1IoCGzVsyxwUAkRs0D?=
 =?us-ascii?Q?kM+7f4yqT8q36X0yEd89ZnQUZ/6rlEjlco6/5SUM0xV7KRrDRdOJ/Gp/l/bS?=
 =?us-ascii?Q?DT/vM7yriM04JTPvcBqujGaFzwUkfxgH+pddAhMDUukhOU7MW1m/sx0yu+R3?=
 =?us-ascii?Q?jn1ZbDwhY/dzFw1KEypkyORgRItLmeUYiRhZEkhhQ24+aMAn02aHXr0NZM3g?=
 =?us-ascii?Q?Utv63b5vEF4nPBevOB2csI0BB+qLOnRVK98K6YeeSRvfajSkRwRCg5EsDFMu?=
 =?us-ascii?Q?u0KzCtyj8HX6Ti8ut33fouKYC8X1atniE3jUWvwcgH6+fMwxeb4Ab9EQu5ct?=
 =?us-ascii?Q?+F30mGHjIa6zL7DxkOpMSBiZiT22+ejvhueqVyDLPgsE/v+s9030Kmk/Taxv?=
 =?us-ascii?Q?O5gaVpoZ7r0bQmdt7hvoyuNkgRjBunzFareFdT4UL9NSsRhsX1tFKJNgTZ1d?=
 =?us-ascii?Q?JioQWK73RoVA1eQ2Nr+6lkBuaXLEpddsuwxZxuklEmGmlBbNLmhmxqXV5bjI?=
 =?us-ascii?Q?huxctFVSUV3QMEGuhAJc0kKpLalkuWNtzRBYFbgbJOiAqMZF7C0lHwDqVpaF?=
 =?us-ascii?Q?JvvRr8FqE7N0/l5SzHTwKFo3oQ3MM3rwHsAFweyOJaow3F2lyPYVytgrmu82?=
 =?us-ascii?Q?D5zyuhaMCJ3CcuMNfGDQkkPvCXU9/tTzNRS0UBrEBtuFpQgS5kjnkZvPOrpw?=
 =?us-ascii?Q?LMbhYanWPAdReIZFF7BxrQZq8MtlgPI1DSWp0ybUUcQg0sHbjVBaoF2m94bV?=
 =?us-ascii?Q?T7MovNCBz76MUlGUyS8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:55:21.0861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 716c9229-f86f-47bf-bc89-08de529aa0f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0AF60B9AF
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:55:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19409

On 08:43-20260112, Ryan Eatmon wrote:
> 
> why is this needed?
> 
> 
> On 1/12/2026 3:31 AM, Moteen Shah wrote:
> > Install the dt_to_config script to initramfs image from
> > the linux kernel tree.
> > 
> > Signed-off-by: Moteen Shah <m-shah@ti.com>
> > ---
> >   .../recipes-ti/initramfs/ti-core-initramfs.bb  | 18 +++++++++++++++++-
> >   1 file changed, 17 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> > index 1a102d82..44574377 100644
> > --- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> > +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> > @@ -29,7 +29,23 @@ IMAGE_OVERHEAD_FACTOR = "1.1"
> >   # the final image this is usually done by adding RDEPENDS_kernel-base = ""
> >   # in the configuration file. In our case we can't use this method. Instead we
> >   # just wipe out the content of "/boot" before creating the image.
> > -ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
> > +ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; install_dt_to_config; "
> > +
> >   empty_boot_dir () {
> >   	rm -rf ${IMAGE_ROOTFS}/boot/*
> >   }
> > +
> > +install_dt_to_config () {
> > +	# Install dt_to_config script from kernel source to kernel build tree location
> > +	if [ -f ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ]; then
> > +		KERNEL_VER=$(ls ${IMAGE_ROOTFS}/lib/modules/ 2>/dev/null | head -n1)
> > +		if [ -n "$KERNEL_VER" ]; then
> > +			install -d ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc
> > +			install -m 0755 ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc/dt_to_config
> > +		else
> > +			bbwarn "No kernel modules directory found in initramfs, cannot install dt_to_config"
> > +		fi
> > +	else
> > +		bbwarn "dt_to_config script not found in kernel source"
> > +	fi
> > +}
> 


Not in this form. we need a smarter version of dt_to_config that can
help pick the right kernel modules needed for initramfs. dt_to_config is
just one part of the puzzle. Context here is this: we would like to try
and transition default upstream defconfig to enable ramdisk by default
and then with the right modules in ramdisk switch over to the final
rootfs. if we install all the modules in ramdisk, ramdisk will be
unwieldy.. So need a smarter solution to the same.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

