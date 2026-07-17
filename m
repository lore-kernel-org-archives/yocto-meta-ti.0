Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB9BC44514
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 08:46:50 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9512.1784277995160837889
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 01:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=pl7lPJzR;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=h7bxCAdO;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6bON41764749;
	Fri, 17 Jul 2026 03:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1nqQkbxU/GTBRkmAUDSOM//AOzUh40wZVuu48CxOc
	pU=; b=pl7lPJzRqh9CzSbkFP1gxa50aGTAsrCDu+NUk4MA/clB4R8jALY+3NzCI
	yk64AJJADptDqOOm4eQxrtLkmgiBYm2oI1PSJQmU8P+Aa4E20F0FFutNFnz5DYh1
	y/vaf8sUtZ4NvC9OBXojPUP/13e7a6YpK1byWnKdE+Bk2TXjDDvEGoRmzREdsG1r
	xrRSKG/3yo4SCwYkQWvz3x/J2nptr/MU66Y94jNXCzjBv+OQqkGmcdxePevpmd22
	EVz1/PHyIp0Yjigh+bP+MEi4EeZrN4FH4fwZBbBczAwZzpA1s+pFhKknq/S+baWv
	zyVQqUzNrKjneSuR31uIRuYI6UTiw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ff2ccvgfw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 03:46:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQ85/BwUPsyyeq+ZAhEm+MpgdGHehlmsbJdTqvd6WpCTT9VWLPIabwzAypm/5UizfA167GuNlAa7jXLmb6wCnr71skBqIK7lB+g0KOkZqDIdcie6M6fQl28HUuQzUZd0xTQtrrFtSXTn7DRkNouwRap49TjTnjF3Yz8PwlOUdtv13PYn+h07QBedRGqEdzBFZ9Z28HxLMU2tTAqTfF++lhHsvc1JfuRsxt6mLTeO9kmVaxNyxH+BvMbiuTtxx606p/V8ERLNBRrwSN3D22WvISZ59ta+a04qjyZB/DaXE1FIYBn8vREdmhDYC14/bqG6XLRSR4AydOfXh4j84zMXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nqQkbxU/GTBRkmAUDSOM//AOzUh40wZVuu48CxOcpU=;
 b=RrcRcJmlnWRzVPrmA811NtTYWXzN3pvRJIwennL3OR5ZQKEza48U3AGms4wKKfr6wN06ZSS/5O3xVZzH9yranOXGe/zltyZ7oK+ojlwQP78ASGL1Gy/bshtYVEcUGaZsIzNqZf8MWWmzeqL0K3/Uf9PiJu+DZJ9wOuxPFHzzsWhVrBhMcuZyLuYTEOC3iRNnCrIrP2H04i1m6ibTKv/Dnzblz+Gh0OLbUim9SYNz0D4wNBiomVUdlLzsu4mqhmM/xy9yZY2lAsaP6KQ1tWOdJ2I463kat0WiC04unVXMCMl9iJspFhavauXsMNoyfPHP2u5u3Oj9k5LyRDcWOLa7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nqQkbxU/GTBRkmAUDSOM//AOzUh40wZVuu48CxOcpU=;
 b=h7bxCAdO3L+B7rgrOECwXKhYzYzyX8e2gfEesCowEAZomeTaLO6o3uhs2RHl941v3X9TcnWRxdNGOovhTQ6G3qUNF1gZ/anRM5V4uivAdYPJBhD5Z6fGnm41RpKKnRATPm9RBYTc+ejlHSnk0nT4A7DtrPwBbiw78WsRDjYxkXo=
Received: from CH0P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::18)
 by DS7PR10MB5072.namprd10.prod.outlook.com (2603:10b6:5:3b1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 08:46:29 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::41) by CH0P223CA0014.outlook.office365.com
 (2603:10b6:610:116::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend
 Transport; Fri, 17 Jul 2026 08:46:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 08:46:28 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:46:27 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:46:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 03:46:27 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66H8kOGG2817235;
	Fri, 17 Jul 2026 03:46:24 -0500
Message-ID: <24a74406-68f9-4974-9bc5-cd4d2897377d@ti.com>
Date: Fri, 17 Jul 2026 14:16:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v5] initramfs: Add
 initramfs-module-netsetup recipe for NFS boot
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <gehariprasath@ti.com>, <denys@konsulko.com>,
        <jcormier@criticallink.com>
References: <18C306C8423CAEB2.1068600@lists.yoctoproject.org>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <18C306C8423CAEB2.1068600@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DS7PR10MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: a68e2d9c-cb29-4d98-4c71-08dee3dfe474
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|36860700016|82310400026|23010399003|10067099003|6133799003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Hid63Bu+9pBBcstwOdppNVDx4T7U9UqmYfbvQRfKLbK57byNS4iA9GczCzZXexTp1VMBGk6+prdDVw49FtTttfq1wM27Y5QywP+rhecefsCnfQtU4E4wFSHj5NjYoe12JE+m3oYxwhyiJTmAG9drabsFX3+XhBUUxazUMneEZT7gWSCWfcuGxahrmT5XQDfywzWSGNSy0TIVGc7/ojbietQO4ymL9eX4SME3SeYxHO5XlT/FOnNwJ8wFDMwZBeSVxDVcsnShXmoOSokWCF48K90nukt7Sg2DdEx1APf20pFrbbne+smiAo9J9EgGz/G/xDYKPxIWjOTmAqZxTlH6s8c5XXXhsjVfmMl7SbiRrru1nOMioAjHhrVpe+OtC1/0gll+1j+WUIMs7G3XtDSGgvN5tPEkRGZvZh7Gi03xD15+AU8QQzXwsmBINFqEbti0JIqKjWsD/b3CP52tK8VcDpzGPnSM1FLKRv0oJ51fdzEFy9JiyvNuJ9JejJt+ym2DVR1twBX6c92+d30seeNjc5xi7OQ1n+CV7T8hfx+oPUzyjRh6MMojPmnUt57UcSd+Yxr6cBcOB0pHQc1ufM2ubth8ICDVN3WDCYEXlNzbTdEHD8rL78PW7zZQ6+6U9zpY2zVh932ztCwpEiJ72KGyuw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gmr2uDmIVnN/CNaDVIDAo8i2SckZgYuJoGECJMFZF/aTGcGFkybxvof8ugEPcggTG5iEH76aU1OEzfpaksoSBaQykXOkmyirPYEZQdkX3wDXxpVRD9ub3yo3V9F1CzzY5zfczD71FwobX0RGWBkgeV98ULK+8FDMv6GB6nyicydZGwpruZz71PRqtS9yc7SA24rZLotWCl9xuIZ60QvW2DXrq9ayLDeKq2UyWnWkhzzHHjyY/b5ISCkIfTdmTt7bI6Y9cljD+qUmvUcb2Ekx5p37+SlVMtee3ZGrV5NLpPUkdG1JDihp2sR8TDjH8lwBnsjFfv6t8d4TwIv9cE7UzaCKSMcmE0phNP1iAjJvVjIMhTS0aAWNBO8xLV6ur4FlxQbXDOkYNpQ+R2lHOll4BNx7RlAsTow43SnmkI9FmPjNMSqCsnOwW42CcvjX9Eww
X-Exchange-RoutingPolicyChecked: 
	qAOT2O2NZaMwakjxtvEWsS74nObJW4nXYI3KeXO8GQJWhp8JrnY++4Bcz8TFkLbuq0sIF6uzOWAEq9aEh4UW8jjOlieJN+LZCL4yNb6DIyNU+MzDp5sygcrlDL/4sm7/6ZPWLR3/2hc24gVDRqMwji0Mz3RxSZSznxaNkdBo/vLqraH2epAQ1FOA8QcAWyDHvQcjaSn6pffKC4JkOp7Y6OLw0hns1Fa5QJKac/2ox/Ks+34zDKNaKH7M2asN1SxXkxtNZVrT2fjyuI/kU/IjzLTCVU+63pzSyQDdOF/LhPiH+MhpWCY/Va8DBXWAFC3aoYQrkgZ9buwbyjGOMOjkHQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:46:28.2177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a68e2d9c-cb29-4d98-4c71-08dee3dfe474
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5072
X-Authority-Analysis: v=2.4 cv=NtvhtcdJ c=1 sm=1 tr=0 ts=6a59ebe8 cx=c_pps
 a=ETG1guYRlgXENsW4hp29Cg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=wcNiRk5MLneuTrudpN0A:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: SHqVag31C2kfx1fNOAD-s8zSg--4Ywvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX8FxLvlIXomss
 cTR0O7LEnE5JmK/0b/NMHCVjCmaRk7fyvE4UOHmVi0zDHSb7ziqCY3sktSjaJn7F4bAC9Z7yBM4
 k+U7+eX0wXA84orm1qEbq0TBYt+83WXkVrZVtxBvo9NgRCLFA8EmrIg8xkuvSq4s8DVzHALHvga
 DCuYXE+H5lNrfUrR+CGXtYAk725lOTVxvBJefAvPuRwGtnYTxZrFywKr0wvMslr84UHAajm21X2
 LRE32nUEB6bUT1a7rWp3ug9fB2jUeAOTMoBQwbPm+9g3kb1MMN9+l7ZmQknmTpOZG8WPqwGGOn+
 N9tbjfk6yDyqXkzx8xcqwLywLUHEwbOqChsrOSGn6rmNhP98o9XU7Ev4CqYYCdG+I7+SjJ/RrwQ
 lezCTXfnn61CDLJhQhJCM/sg4COL7aMb1fPFA9nAuJ+UZYuIeCcfImZrmaYYx+lcJblmYK8Ejn7
 kwPlfTaP94dfuVRwSyw==
X-Proofpoint-GUID: SHqVag31C2kfx1fNOAD-s8zSg--4Ywvi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX5ASZtzoo4nZm
 S8InMAPUV8x2pXY+IrtLHUaYqDKyrR/ye2EJ2N5zcbvfdGAFuXcYdLD2+UyV8Y8NGBEu2NvGS74
 6/+OhUfE82QVgxSoJ/XBnHFFMi1PVZ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170087
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 08:46:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20157

Hey all,

On 17/07/26 14:05, Moteen Shah via lists.yoctoproject.org wrote:
> Add a standalone initramfs-module-netsetup recipe that installs
> 83-netsetup, an initramfs-framework module that configures the network
> interface via DHCP before the NFS root mount. The recipe's RDEPENDS
> pulls in CPSW and its dependencies, so the kernel modules and DHCP
> client are only included when NFS boot support is needed.
>
> Include initramfs-module-netsetup in packagegroup-ti-core-initramfs
> gated on :bsp-next, where AM65_CPSW_NUSS became a loadable module.
> TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=y).
>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
> Changes in v5:
> - Scope CPSW modules and netsetup inclusion to :k3:bsp-next to avoid
>    breaking legacy non-K3 platforms building with bsp-next (Denys)
> - Restore PACKAGE_ARCH = "${MACHINE_ARCH}" since recipe has
>    K3-specific RDEPENDS (Denys)
>
>   .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
>   .../initramfs-module-netsetup_1.0.bb          | 32 +++++++++++
>   .../packagegroup-ti-core-initramfs.bb         |  2 +
>   3 files changed, 88 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
>
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> new file mode 100644
> index 00000000..8e76bac4
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> @@ -0,0 +1,54 @@
> +#!/bin/sh
> +# Configure network via DHCP before NFS root mount. Polls for an Ethernet
> +# interface with sleep 1 per iteration to allow the Ethernet driver deferred
> +# probe chain to settle after udev loads the modules.
> +
> +netsetup_enabled() {
> +    [ "${bootparam_root}" = "/dev/nfs" ] || return 1
> +    return 0
> +}
> +
> +netsetup_run() {
> +    local iface timeout devtype
> +
> +    # Extract interface from ip= kernel param (format: client:server:gw:mask:host:device:autoconf)
> +    iface=""
> +    case "${bootparam_ip}" in
> +        dhcp|on|any|"")
> +            ;;
> +        *)
> +            iface=$(echo "${bootparam_ip}" | cut -d: -f6)
> +            ;;
> +    esac
> +
> +    udevadm trigger --action=add --subsystem-match=net
> +    udevadm settle --timeout=10
> +
> +    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER = type 1).
> +    msg "netsetup: waiting for ethernet interface..."
> +    timeout=60
> +    while [ "${timeout}" -gt 0 ]; do
> +        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
> +            break
> +        fi
> +        for dev in /sys/class/net/*; do
> +            [ -f "${dev}/type" ] || continue
> +            devtype=$(cat "${dev}/type")
> +            [ "${devtype}" = "1" ] || continue
> +            iface=$(basename "${dev}")
> +            break
> +        done
> +        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
> +        sleep 1
> +        timeout=$((timeout - 1))
> +    done
> +
> +    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
> +        msg "netsetup: no ethernet interface found after 60s, skipping DHCP"
> +        return
> +    fi
> +
> +    msg "netsetup: configuring ${iface} via DHCP"
> +
> +    udhcpc -q -i "${iface}"
> +}
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> new file mode 100644
> index 00000000..03925497
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "initramfs support for DHCP network configuration before NFS root mount"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +SRC_URI = "file://83-netsetup"
> +
> +S = "${UNPACKDIR}"
> +
> +do_install() {
> +    install -d ${D}/init.d
> +    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
> +}
> +
> +FILES:${PN} = "/init.d/83-netsetup"
> +
> +RDEPENDS:${PN} = "\
> +    initramfs-framework-base \
> +"
> +
> +RDEPENDS:${PN}:append:k3:bsp-next = " \
> +    kernel-module-ti-am65-cpsw-nuss \
> +    kernel-module-k3-cppi-desc-pool \
> +    kernel-module-davinci-mdio \
> +    kernel-module-ti-cpsw-ale \
> +    kernel-module-ti-cpsw-sl \
> +    kernel-module-phylink \
> +    kernel-module-mdio-bitbang \
> +    kernel-module-phy-gmii-sel \
> +"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> index a9eff847..537d1f5a 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> @@ -23,3 +23,5 @@ RDEPENDS:${PN} += "\
>       initramfs-module-nfsrootfs \
>       nfs-utils-mount \
>   "
> +
> +RDEPENDS:${PN}:append:k3:bsp-next = " initramfs-module-netsetup"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20155): https://lists.yoctoproject.org/g/meta-ti/message/20155
> Mute This Topic: https://lists.yoctoproject.org/mt/120311910/9997635
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [m-shah@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
Please ignore this patch as the previous version is already merged.

Regards,
Moteen

