Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB98C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 14:43:14 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2330.1787928187300929721
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 07:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UigdRqSc;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=sAbAKrRe;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDOvMV1782656;
	Fri, 28 Aug 2026 09:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HLHKiiZ74RWaremlJ1P54qXUmZG3NmnSf22OHA2P1
	IA=; b=UigdRqSchkPe5E5AmxWLF9LhtZi9HWSVgvHY5Ty81SZcLuLtYjoHpgrcX
	9JZ5Yb+3sdtsVOtyCJSfLKhwksiuK8Nf4Kc+0aIgFcH3Qhx+ZT4lZi0YyfYMyWnu
	vJtEIHxBmaywvEo5SoVhCID+k7zt7D4uDad9r5gbcKQRAsPwQWNlaAIF9rLXZnaU
	tFxlqLE4Y7R6tGFagyIls0y5956Ib8g1etjuUGNkBWksLoFuTRhHq/NVOv1CoJNM
	s9LBaeu+WnGvaR+mVv/D1oJXZQAO8LZHB3+HlIgZMclkWMtxK9LhjG4/nU9Xd9Vz
	jJi+G8uZcIZMcLIuXRuSwBNGbgwRw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24q3jun-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 09:43:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llwQAzdr0cTuQpMPfABmeRFv2lj0l8mLUQVUQ5OP5GS51cKVn7Kn2c3fz+ZvqJ7VNbnRW+bFP5TgdvD2pYOdhGtxST2I0yghIUaIwUynGk1rR3d1OpheLYlaADVTmftU3OYLeEgc5bcTO9ptxRDMhifKdjXSLCID9Hdn9xWh56WmwzWLTvrkxdQK5QCWtBuizbAJPP/y74e9Q9XoE9wq6OheGjM4283ZWEa+bnqQMinJvPhGxN0ie6GA5RBsgxSJuvfArZoKAKx5T02gLNf+flvZ71QlfDUKc6LFbSLgxdk0AATMPFnuOx9HBsW6qmTTGfJq49H+HKHZLtopPw2vGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLHKiiZ74RWaremlJ1P54qXUmZG3NmnSf22OHA2P1IA=;
 b=A1ej2bJ2ZfCNzAw3kLfo542QGVJKqfCcM4qR7RBYZmQoCz+pP6AG719KAMXXNZooeKr47n2gsDPRkFQHq7YBBeXtwI8EVerY0nuMqU0xeQMvBmTVMXXsQyKfWcFgkRL9v/8CDQqCULfw/E/9oKFHlNe7PzumwMknmd1/487+fwT+gXDRd+hfldIBzPc83JL960PquaEASE1mDllRuahXmshV1sYgZ4l5omlZM4UV5buaRj01GOAA3YoCcjvdsE6dCrZnPkiw6vbrJZ8dahzAqoyjmLfe9Jq/Ob0nYGDnqOtLQv+8ZLlhctMnGuq5PaYoAnBc+bNwIPjQefos0empKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLHKiiZ74RWaremlJ1P54qXUmZG3NmnSf22OHA2P1IA=;
 b=sAbAKrReUm57Skxa6EvqrlkH9aKcovXtWRDX/L079NVCEIZrBwBjbAUlTsXKhUyuCUy7yFyLflz73V7skH+WOVN9OWsVrZKQxvMSD1jCXXQwjW99MtKkJllR++y2dRpGWQeNsDxp0pCUX2vjzaeBKhdJXnyjYtfHdloa8eWgvD4=
Received: from BL1PR13CA0099.namprd13.prod.outlook.com (2603:10b6:208:2b9::14)
 by SA1PR10MB6392.namprd10.prod.outlook.com (2603:10b6:806:258::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Fri, 28 Aug
 2026 14:43:00 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::1f) by BL1PR13CA0099.outlook.office365.com
 (2603:10b6:208:2b9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Fri, 28
 Aug 2026 14:42:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:42:59 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:42:43 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:42:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:42:43 -0500
Received: from [10.249.37.116] ([10.249.37.116])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SEgh3e4007002;
	Fri, 28 Aug 2026 09:42:43 -0500
Message-ID: <ce24a4bc-5100-471f-8ef1-09e8d879d3d8@ti.com>
Date: Fri, 28 Aug 2026 09:42:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] ti-vendor-kernel-headers: add recipe
 for TI-only dma-heap.h ioctl
To: Hari Prasath Gujulan Elango <gehariprasath@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <s-kapoor@ti.com>, <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260828080757.1160553-1-gehariprasath@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260828080757.1160553-1-gehariprasath@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SA1PR10MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d33e5dc-c440-40df-f347-08df0512a7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	72pF9XB9YSTI1dBwoDhUR6UfQdJrtlId8EdRGLk2aLdDZust8hnyHleNsSUF4MxYzM5xDTIOljsQMW1KyGze6EtmIgwR2OzsgXFxAZgAlkQiA6oGU9Pjp7h+QIAhgY2Xuk+HaIZa5e1tKtEo1VNfwXYU/bm+MT0TjbwJ1t0lfZm7KIaUzLCIMgrFhOwJ0KMxe4ApeFNWazSVZC5L+zfpc8y4iNZiCWU4dyPB/OVp/6e9DfOUAQOZr5ZNq9ks9XyiueF/a5SIEaSVcPRujvxfINW+rtZtKXv460n5+iDXiCBRlSg+cyXi1NePf2jINZRnzOMNKOtiA4ECfb6ZW0c/KUFO1qwDGBgzXWsCZrFMm00VzAUMrQnavCgftSVeor8CnZpNGxTgFfVV6vELtmJvwpJ9dNJbrFneWoI2BjUckQYZXgAaeqEoiGNMb+bfxoF1gW/Mz4iAmGEigu97xpBSWDhTJYldeayyMA0HS1EF2FN5frTjb/PaSzxD2x3iZ5IPFhdfSKdDG+cW2r2NtyiIQr3l7MH6Y28xgZZqaE/4fjJGas0seLqA2hgX7EQBNBcEy2MzYz+ejB+jjPMEr+wmTjpaZEuVzfr3LW3vzSbZJnT0QoxETA2mxnygTVPa48D6OHrTXlZ3xO1rJ4HBEesfyQs9dz0yi8UJ3UNJGfZMiylY4xgTnIga/S1K2fnR/WENjdYAmm5u3EjuJc7LN5jbtw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LV76djxV7ED36KjEtcnqQGnRAY5ik7TXUKqlxN5QAqVBCw5wUJ6n+uuchiaaa91m62NaGHNfgjQjnxi3N2nmkFBfL319R9D3Wi1R+PHeSTu+9MCsRMd5Hzqp2E2MSEPYiRCqzHdmwey3NU3u0kcNw8nSaVcHvZxSlyz3Ttj3ujMF4/vXcq/DJLIixbOdnuexd1nk+tNkudQRgo702ndf+u6JjqnAEV1rJAD7B0n1wrVLxQcPo2zEhtJdDe/piabuY95nxgRQ1j3ae/8li28GBe4MhsdD7+iLq8zajLYwTH0Db4bAUzGFmCiO9Mrm0IMdqLP5l5Sh/qMFhMC3NzZRWdva92BULeDw03dncjK+rwwujXEiWkLKUetxPR5jkeYoj0r8Fmuh1R4aAye4jR/9839Ft+OmSB9xPS4a0FPBLnakMonFKNp6YJlJV5ekyA5S
X-Exchange-RoutingPolicyChecked: 
	IXqXGR09m6heDngPKUIc/7xchZ3Y5gmYjs1ltxS3iegqGBua30N6PUbp41ovevPGjWx1rRQulGucChHiMGbyM68RJe9KYCowgZeHOieRSYNYGoqHIdmFnesIVAjZ2R+mWcALVdrM7Htl9WlRdHsKQGO2As0eck7wQekiVE8Hk0GNksJJV7871wFcR4LYIhqC5lvfZuUCmOKOiwujN1XOwpDotu7aP3izK5RYUBLUEGveTaOt2woOleUaLScgP6Kcya+XRZJcLAgW4+zREhRbhX2K0ouiCktSQHKzytxAwGH7/Ymqv7+53fiY3MsxX+SVWvgNnA8sEOrS4IbNQJb41Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:42:59.4493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d33e5dc-c440-40df-f347-08df0512a7fb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6392
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyNyBTYWx0ZWRfXzB7dCAAiQ1NF
 MXQCAiQC7EK1HOTiIEPTxZEGH+wuwDGCiu2GMp1EYaR06aU/ZaZnftMr0EbCkZvrC7dG34qiuxh
 Le45H1hFKFfynFxx2Nt/u0R7RCWTNZjVZwD8dTp2dSP0xFtLXWzZOupiGssqSZvLFbvA+CxC7zL
 hPKA8q9bLo/EcIP4VcYeX1jIvK6vWRqr1RUKREf7rwg8AIXJ1S6SVNODyOxIet13G8yYFajPXr8
 7ntmqE1uPxP+C+sIaJIXrJAf67UU0yTUy0PBfZmHPf18eLdG7aU/7KkeRgkVKAnwWUnec9iOUr7
 IY5Aq2i06ujkGi6UISupwzkvL+unI1PUJJVwQg4kdN/606IZQ+JUyUT8qR/PAI1p/XEKxm2NsB0
 0VuaM1ddR9ehy+XXV6ggvLpHllA9Q6rOtcx0NKoRSbVkQ6qHWKjUqxPt9KQ2YcfuAIEkXzY1pdm
 201QfEEu/hISMDZvbog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyNyBTYWx0ZWRfX9gDlWA9j471k
 W3UahdqimPktdyQPIV7IlCK/2sczA4hEtMVmfveQSFz6XMkg70Au+tN0/KtKlgUEmHE+OAL/boB
 mkngOiy3ftlmwVZEmV+yIEy8LfAIFSQ=
X-Proofpoint-ORIG-GUID: kHdsnmaAjPO21VIirsylmpandV6Af2lx
X-Proofpoint-GUID: kHdsnmaAjPO21VIirsylmpandV6Af2lx
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6a919e79 cx=c_pps
 a=eLvx4Fye0krSvKD/jKlmuw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=2-B5UuxeKmCew2EXUOAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280127
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 14:43:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20298

On 8/28/26 3:07 AM, Hari Prasath Gujulan Elango wrote:
> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
> downstream.The standard header provided by linux-libc-headers' wouldn't

Add a space after end of sentences "."

> have the custom changes.Copy it straight from the kernel's staged
> source tree (STAGING_KERNEL_DIR)into a separate /usr/include/ti/linux
> path instead, for userspace code that needs it.
> 
> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> ---
>   .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> 
> diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> new file mode 100644
> index 000000000..bf7dcc3a5
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
> +DESCRIPTION = "Copies select uapi headers straight from the TI vendor kernel source \

s/uapi/UAPI as it is acronym (Userspace Application Programing Interface)

> +tree into a TI-specific include path (/usr/include/ti/linux), for userspace code \
> +that needs them but can't rely on linux-libc-headers carrying TI-only additions."
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
> +do_install[depends] += "virtual/kernel:do_shared_workdir"
> +
> +do_install() {
> +    install -d ${D}${includedir}/ti/linux
> +    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/dma-heap.h ${D}${includedir}/ti/linux/dma-heap.h
> +}
> +

I don't have an huge issue with this series, but let's make sure we know the alternatives
first. If only a couple applications need this header, they can bundle a copy of the
DMA_HEAP_IOCTL_EXPORT definition inside their own source.

That does have the downside of if the definition in kernel changes the application will not
get the update automatically when rebuilt against the new kernel. But this is already the big
issue with using custom UAPI like this in the first place, if the kernel gets updated the
applications can stop working. The upstream kernel never breaks existing UAPI, but our
downstream can and does.

As said, this patch looks fine as-is, just something to think about.

Andrew

