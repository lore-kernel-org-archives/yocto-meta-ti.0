Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED42F10A1E67
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:54:50 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45355.1774522483939524439
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 03:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=j9ZAqgzG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.56, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSJYzhwRrkVe9d/+3yXy+1flQGMpZYhRGGQ0IKG73iedpKwKPoCV3hdadSVS6ta0aXFKs1nNx4jQItOSriexuLM2t0CM7lRxi74cipMePQ5oeXl4F/12BXQFC0u+q2cXy0TqmjyLO8RjMgN4EnSO7Db+cKBbZUBcmGJYJAuZdNnMz1jiWZs6mgU4+3+lA89IDN48pehNjgON3zNxzCJqEcMF0izXDaR4PHLjWwZh2YLnyXZAPd8vCTcF+66Zg9UvOGjkS20x0th/6mIEcI6sScQieF/O4qhtBQoNnpKbY9/pp88BTraK/J1fXANhFvMyVtGzVn3jYwO3M6K9LDTZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pliGhTjR+Nd+oYXCeLZ5fX/exTGTIRBIL1dFt7RC5g=;
 b=fLBN0U9BDINaxbGTix+oKemaqTsKYY8gkxVXSCqY/nuC+vGqZ64yVtAKPARbNvvHOZ9NfNrG4EoInFaCobEspGT3yYgE2SoCtXUTN9Eiui3DlGVxdv2r0qsyBkB3ehQJezB1uVeGS/dW/H8ZbS70QULxkFs3l/EVCG2PSITseBUMFKzyQ8R4RakYBPKz5ew/A+JVShVr4PXFLL+Mw13pM2ThwgTQEp4VzilQXGIlp07HLysFpURp7O71k4+FyNzIqf0JBEVqziJsPAeuexPnE23i3YttX0yJEshcBwSS7evLuxQOzcRus3oXNRoyLDJ3qIcE8ENNINI7FKvaG9fX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pliGhTjR+Nd+oYXCeLZ5fX/exTGTIRBIL1dFt7RC5g=;
 b=j9ZAqgzGW2C745stZ5hOzkYamr1S/D+80Crz2l7Bww4PdXSzjQJei1ugjnV2ONqR4wW+ThyI469yzbV4H04020vcuf7ROEH3042AXFG6qYM4/eayNnwYWP+tMw/exsudTnF2N+2VwRbXsLwTB0J0jhunaQtbAqN8KKd23X+gc+0=
Received: from DM6PR04CA0025.namprd04.prod.outlook.com (2603:10b6:5:334::30)
 by MW6PR10MB7685.namprd10.prod.outlook.com (2603:10b6:303:248::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 10:54:41 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::87) by DM6PR04CA0025.outlook.office365.com
 (2603:10b6:5:334::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 10:54:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 10:54:41 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 05:54:40 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 05:54:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 05:54:40 -0500
Received: from localhost (ada0543016.dhcp.ti.com [172.24.233.9] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QAsdZu2011864;
	Thu, 26 Mar 2026 05:54:40 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Mar 2026 16:24:39 +0530
Message-ID: <DHCNPWULXZZU.3HFNETK38IYPU@ti.com>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <vigneshr@ti.com>, <anshuld@ti.com>,
	<gehariprasath@ti.com>, <denys@konsulko.com>
Subject: Re: [PATCH] packagegroup-ti-core-initramfs: Remove runtime managers
 from initramfs image
From: Anshul Dalal <anshuld@ti.com>
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260325062856.2664785-1-m-shah@ti.com>
In-Reply-To: <20260325062856.2664785-1-m-shah@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|MW6PR10MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 800962af-b954-474c-0a5f-08de8b26152f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	lQ8FNyrKOLASmD0XHfHIRQYcYkxkWY4oClfoZGkRT/dzFmg2j0pGwkXMoSaa4D5fGTBs+6wDP9rKFeSPJENJKv3q+VKTOTSZcSKd3Xgc2MHFxIHfgEHahap23nxbK28vP1MwwIzhr2YZlwnYalVSeqlNFZpEI5rCDA1A6YCnzft+wjsk25Kn2RZnjgcRRGNgOdn1TOYjLbnlL9OBDdXoBp0+4Z1SYTJSwxMKor8vtdMS/5mcq5g6SAVmCZtVMNWJyDKdL5HkknIXsaptMw+p/+L3qPxsLFaeuj+kxiE7vKuQYdGoo+B81q5CguLtk/RdHx/DjfD4iX3jnyvgAKnWB5JQgf4I0m8VVwFMtr+I7Ra/ccfvtU6D/dufkK+pv4CcnAWA01qYeL/Owm8nVV8vsZwf06+wbDrxl/+P6doJprjCf1S6qO09XuR6dwqCZrouJdS/hW/FtvjMD1PMA3ZJFN46+QY/qoEnp0cxcTwSacM1vjVmcuF5PW+lgDw9q5eNtgPKu78e2AozfED7yWztI1VJ9E+cOeRugrIxS0PA7DLY3ynwGG7uuEdmXl36izjzlrYFMoIpRjYT0nTGW2jpHffWdI4p2LGVW0Q194JlwmtYHiB4UN/nBv7R3mWHIacY9Wzk71pxcgDYprulyjwaLGR+KLsLSHie5mcftXcbhQay7N/7CVbOv+QTFr25F2FtxNc8KqD8dOmG1bXzJ+JD06RhSI0QjGyjqdaG6aGczx7TnUG+ULHhU5cX3bVGsInEBHnDagsQp38DXCUIFAM8nxL69bKdOVGPw/Owb56IfSE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OjuWxnrvnz08IGxDldq8v+nIT9aJFz3cAm9e2k0BkiDRZ9z/zu2uCrDn345iEs4gpqPAMMb0Pwe6gha+N/e9+NXeyF5fBNtOPsLhxWEEbKHWBes5V17qBoD+vAYIJGOpI/78WmKJUO7k+sCvJ55ZbsKunmvtxHMZA5e5vQDL2vkJLeseZBTftkbBSiXAA1R2/lUJpx5sl605Ag5w/vFphG71x/sP3DhdmxH8taZLmA8l7jpy/mTe5sDt4cWqEFNg9ErzR0U/rbtHQEsfZTh8V1POLZSN402E76b5D6ScUPe0sw8CYYjQP15CyW6L5B0pDtml/JZvwA5g3b0p5nJIFJRjsY4XMA/hQCFU+QU2QrKjynDT60ZImxd/oWvwFd8TR3jNjJHLsoYEysJ8BtADfS3PdoeVkn7LsfR0iK+/FcbHbQQfWvUdT97RvRrRxW7a
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 10:54:41.2616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 800962af-b954-474c-0a5f-08de8b26152f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7685
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 10:54:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19824

On Wed Mar 25, 2026 at 11:58 AM IST, Moteen Shah wrote:
> Remove runtime managers since ti-core-initramfs does not requires
> login and other services as it is being used as a read only
> image during the boot. Modules can be probed using the udev from
> initrams-module-udev, hence remove the init manager along with
> others.
>
> Signed-off-by: Moteen Shah <m-shah@ti.com>

Tested-by: Anshul Dalal <anshuld@ti.com>

Before:

	$ du -h ti-core-initramfs.cpio*
	90M	ti-core-initramfs.cpio
	18M	ti-core-initramfs.cpio.xz

After:

	$ du -h ti-core-initramfs.cpio*
	25M     ti-core-initramfs.cpio
	6.5M    ti-core-initramfs.cpio.xz

Boot logs (AM62ax EVM with SD boot): https://gist.github.com/ArchUsr64/e902=
15448010aac5db9ccfb2e63ce433

Thanks for the patch!
Best Wishes,
Anshul

> ---
> This patch will help in reducing the size of the initramfs to about 7 MB'=
s compressed and 25 MB's uncompressed
> Boot logs: https://gist.github.com/Jamm02/ebdb124064e253208ee479f46edf127=
f
>  .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb    | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initra=
mfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> index a9eff847..f496f21a 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> @@ -11,10 +11,6 @@ TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
>  RDEPENDS:${PN} +=3D "\
>      ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
>      ${VIRTUAL-RUNTIME_base-utils} \
> -    ${VIRTUAL-RUNTIME_login_manager} \
> -    ${VIRTUAL-RUNTIME_init_manager} \
> -    ${VIRTUAL-RUNTIME_dev_manager} \
> -    ${VIRTUAL-RUNTIME_update-alternatives} \
>      netbase \
>      base-files \
>      base-passwd \


