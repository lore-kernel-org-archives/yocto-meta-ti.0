Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321D4E9A04A
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 05:41:39 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6141.1771393296837896343
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 21:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=xIqhQBzj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.5, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ep2+HsPOp+8pUdGoaaEkSJrfgJVgettK4B2WaO+udKQCO4Rwic6h2EM8TX2ROyOLfQkOf6biARjIinJZ0oUplGH8o/iPpTkpdJFIV7aiuEC0VoBYR0lD5ODevOC005NBOLCbXcjbYOuAt0MY4O2qzIL/epCBN2D/xtl7oufNClfJFVmgA3fdGKGSyWNy1rX7+f64cY6PmEJdxIxWGjMs6UdWWvdYbeGhXL1VoklDjDFhXod51WcFvVj9sUFvTkbYyjySr78WxdeE6RlaESvOot0Wlpsq0+kW/Ye4nLM3FHG7gqYC3boexbve7RWPUPFYZFVdtIrknNRZRRkWlh2FFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfRrSjXC6csd0IkjZfJyFy+DAVa/1L/rD/+0/qjrKVw=;
 b=JvFfhrByc2fGvPNpe2nfxpI8L4Ax9D1g8AyvYV3eZG/j15SXFHIolsUo4EfsK2k/1ux8ApwTj7wdNVI44QjE5wgS7JLhHOTkPLuFy0yXr/4sjZHKHy8bIehKX88Y18Ti827BvfeEVW3QjHcUDGERVBoGEQiUuzr9uJfrRL7E4KgXxVp74v/9JKKr5JUQT6l9u2e6q+ZFR/TS97YmwlIiSonl7OkuOEUww/qdIz0ZoTpqPN7ka08NfdmE+NIEjO87eibeGr9Ldnf4A7jQmp0JQhQ+duwDBHhLEDO/49RLay1bbFfHb1Nh3VwuG2ZOGi5tAHTqgkLjmht/ePteM2Icsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfRrSjXC6csd0IkjZfJyFy+DAVa/1L/rD/+0/qjrKVw=;
 b=xIqhQBzjmy9qmfSabIE2YuQK5GRrzaxoP69OfXtHdpv5g/HrkyIgqrtOZ3ubNOxtvEHnlhS06uo3a+dydwfAHKhgMeWlhOfM16fDbPF3ak2xBxx84bwYLqwnkcGVUd2dEeD6vpLyEMrPQbkIhMwIbplros+yAfjO/UIwQJalIhU=
Received: from SA1PR05CA0016.namprd05.prod.outlook.com (2603:10b6:806:2d2::25)
 by SJ0PR10MB4462.namprd10.prod.outlook.com (2603:10b6:a03:2d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 05:41:34 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:2d2:cafe::41) by SA1PR05CA0016.outlook.office365.com
 (2603:10b6:806:2d2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 05:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 05:41:33 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:41:32 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:41:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 23:41:32 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I5fUbE341300;
	Tue, 17 Feb 2026 23:41:31 -0600
Date: Wed, 18 Feb 2026 11:11:30 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/3] libdce: Runtime depend on IPU
 firmware not the other way around
Message-ID: <20260218054130.sghfy7n3gz5limsc@yogi-work-pc>
References: <20260217180339.128793-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260217180339.128793-1-afd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|SJ0PR10MB4462:EE_
X-MS-Office365-Filtering-Correlation-Id: 5287a6be-3a4f-468c-147d-08de6eb0602c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IQEPTHo+sd3F2ghjBkRQu+hko39frYrDAnldvH9LqJgIZnfZUDPdhax/Vkmg?=
 =?us-ascii?Q?gieqEJvMmmGpeH+APj6+Ufp8nPQfFz/sXXWBtaC4se+k5ThlSb/XnHTM89RF?=
 =?us-ascii?Q?OtnqYDGh1J7JIkGDJxecjnQIyhKhVL33hv7idQbSVurqERfJj760A4ALQn31?=
 =?us-ascii?Q?/i+W6peFUKOh/3MOsD12SZZ/B3pv8G5xXLGOlW52y7uSuJZ+4eJ6pTqfqTbQ?=
 =?us-ascii?Q?TOT0iBWYsYQnHFDNeF/Z5zu7CIpf9rulvYsAfE51AdNJaJLwKmBoTfCqbTrQ?=
 =?us-ascii?Q?P5x3D/toULzPE8JV79/SydCUz+K6yy3BsVX9/wGl7x5FbnOFL2ystnTOFIKp?=
 =?us-ascii?Q?gRZNzBlTFCHUZ+KQnDM/63GIpTim0R9F+iozKDolroku61Zagkg8ZxJ0nDI0?=
 =?us-ascii?Q?HQO1O4y+oyIYlpgvRYwSAH8UjYyQXhtFww96NWAgYR5zpYpK02l0LVZVX2le?=
 =?us-ascii?Q?WiATt8C2nQmiHX2b7ahx6D+/7jBgougJV6xcAc6gwmuXOO9XBxFkrfUL2F2M?=
 =?us-ascii?Q?f+Z9eve8nlO0i2CPZWNnR1ShaCKfS8/6g/Ezo/vP6da/rG4q42sE06Nc4yDN?=
 =?us-ascii?Q?kKkBPz0LzLEpPf0mLZOiDy0a2D9HmTGUcgLVvXTlH33IfP4dD/n8fhPVvK3e?=
 =?us-ascii?Q?JOL2e5e15FkAb2fb1/q+vtSVJ6kpAjKTTPjRSOQN5HVr4pTebkVmi/5CTLK1?=
 =?us-ascii?Q?SJX3qMiN4ZJKty3EuagLY8+1mT9aeNGfSgl5a9GznMeJWyilrRqYoCJ3yL6G?=
 =?us-ascii?Q?1m+4dUksIZCMEPhxWN3Tw0yhJaus5Og9cHpZUAz+HYJcZ0PuO4FPWSMvf2Hn?=
 =?us-ascii?Q?dSqo9YPqxJlkUfApEI5m/8PDWq9jSOGL0QVi+CZRGoUMnac0ebzrk3p7+RYy?=
 =?us-ascii?Q?kByLXVRtVoyFw0aX4ThE7nin8cu1KjbiN4cqZwxD79NpwNEUraNAdXTQMJRi?=
 =?us-ascii?Q?QLs2yRaN8twgfGWUXw3EODr1dpzmkHP8jfTolx0CQG9pn/MEy94L/MBqPkTn?=
 =?us-ascii?Q?8zMCvvnZbqwhS/jJ+paK6qfHHRA6ITBCCDWT/wTVi6xdBwszP69xWmyLsZuF?=
 =?us-ascii?Q?6ENGpHCNF7pCPml1aWiyNla8z78d5mg14ZHYLkKVQXCR1Ssayvgl+Au3raam?=
 =?us-ascii?Q?d7mDjnZlmbqiV3CxdpYqQVyiuL0KKV6WouAojLAVKki07eHTEPFzfwSB3G8i?=
 =?us-ascii?Q?sQJV+fZCAPRFgs1clOFFfVq7G3iVBBm8JWSg22fhoBBxttudMSDPhtbcXyQK?=
 =?us-ascii?Q?3Sd+m2JAU5K8N9hOVaEi0MDj5MUWxqKLNfhFdHbmGpTjXV1xH3ao91hJRoPf?=
 =?us-ascii?Q?7t0/8JOD5j0Zqxi91VgLdBl3qSf341awPuKPnd8jWNRhdnDi5X8ilJPhyolV?=
 =?us-ascii?Q?TfW6gF0T3d830eP+FtCihsnbw6Lo7TkFDs5XKDmsNvYromke6yrjOt6Udbnl?=
 =?us-ascii?Q?IMAajyXlB8hntHkREN4nalKABETX0oHXSYXPyUTeTvWBqsVA1iNyFeGJ6OvC?=
 =?us-ascii?Q?x5+cNMu8aJhNmjcyVhDAzyIeG/IkM3qiDy0E70xsEiBwMZXvYowrxfJo733S?=
 =?us-ascii?Q?ve+Hb2g7Om9C+M57LR2X+V4XNJ/6Q9HBzvg34bXmkjDEr1b3hR7Eu8S8ODF1?=
 =?us-ascii?Q?0xW3ngA8FKS/Put1ejdaJSTVY+x1NhsKoPZVJsjpAqBSbd6q1C/9o4r7CuYb?=
 =?us-ascii?Q?/FdJYQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RCpMBJhZX5x7q80TKSnJWKmJuO22o8z1wk8YR3neFffiYAslx/UJPyUND3EUE7bat6gyZpwafWlW1szZGqgFRRaf7IHXIX8HRBSoCw1p+jme3/4jqXOjFj7DPIMrNcHiJylFGOy4oI4LWhVcr2vdEGQtw8FMIe7UPTbGo6X7ouEGoOfJocpFmQ0TMFdQ7RISqo6wjVRhfnC+jfnUY8RnxcdaobwI0eoIaDXTAX78gQLagF4qWNd5bM1QG94443DSu/I8gAZ32LAiFw2NeQujyD5a/NsJL1MWfuzwUWV9ilIGft556dv9gNalIUJR07hPogf5ODv6agPsyJRZcAgsDhNcJhZoa99k7LPcfoyJfgiefXXy70iZcoAO/MXXz+1gJZskZ9TmnaZmCaumKvovYd5bNa964hKsZ2xWlvlcSJB5Z97I9nO19ht2AfEaL1H7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:41:33.9235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5287a6be-3a4f-468c-147d-08de6eb0602c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4462
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 05:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19538

Hi Andrew,

On 12:03-20260217, Andrew Davis via lists.yoctoproject.org wrote:
> The DCE library depends on the firmware to function, the firmware has
> no dependency on any one userspace library. Switch the runtime dependency
> around here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb           | 2 --
>  meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> index bca91df8..246255e3 100644
> --- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> @@ -9,8 +9,6 @@ inherit features_check
>  
>  REQUIRED_MACHINE_FEATURES = "mmip"
>  
> -RDEPENDS:${PN} = "libdce"
> -
>  SRC_URI = "git://git.ti.com/git/ivimm/ipumm.git;protocol=https;branch=master"
>  
>  SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
> diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> index 2ae44086..26b384e2 100644
> --- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> +++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31
>  inherit autotools pkgconfig
>  
>  DEPENDS = "libdrm ti-ipc"
> +RDEPENDS:${PN} = "ipumm-fw"

` RDEPENDS:${PN} += "ipumm-fw" ` to avoid overwriting any RDEPENDS set
by inherited classes.   

>  
>  SRC_URI = "git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master"
>  

Regards 
Yogesh 

