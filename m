Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42644C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 14:57:04 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2658.1787929020777928550
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 07:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OkwogLlz;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=KIbmdR18;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67SDOpFw664743;
	Fri, 28 Aug 2026 09:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=79XD/RFhMDY0Dq5PxGeUd7+V9KbE0UyDp4hdr5TJJ
	SM=; b=OkwogLlzeUx1JvpxkgGTGi5dCkHufksM7CftVYKl7hlG28kCYHlhcZ7Wg
	0Goz0sjIABd63doLS02g7pW09bmGh0eiHyVHVTf1saLdGKuDxVKXI+KlVi41335P
	eR7NT06cxpr6FtP42Jo8PJCInbuOyy1YsD5Z0aKRJPHm/x02Ku7B4DQ+2If5dAN+
	X75QIYdsS2PySQW2GVH/z6pyn1jJOwjsOvqYgrMoSmmppRfATBm/2gY1girpK7/0
	9uFHiaOfZ2CgfU/o26AQo4fMYupaUYsamlGD0n4dphpWAm7FTUrfpBB7gDmk9E/j
	Tydias6z41XehdoVbibnHrQEgO50Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011058.outbound.protection.outlook.com [52.101.57.58])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gb24pbm4u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 09:56:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdL0jOuiqhKYN5R/2ofuc1MSZGkL5FUXKZ+PslIEQEpEl1WJ2HTSKzFjs8QWP1+dSA+ZBDEbroyTsMZGOh+3v2L1Sx6c1BDSZMxHVT8LtnWzkCam9jSfqvENzeHlMvOf424bI+/gkJ14VTtxrtJCGYUc3kENCQ4NwJQMczcn6ayXp/ZIkbev29Z1GnZh3BqNU47EVpa7/viiyMVrdSerpxjyxq3Yopixn8sLBQHXRpn9aD7LTCfVq/D/WylMq8+D2T8IrsZuaExlJwLDTf+bPyR8c3JQOgFvK/a3J6vxJ6R1Y4ORgSNo34YQQH5pX0lAW+HlrpVUHk0hbX3Sxmtqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79XD/RFhMDY0Dq5PxGeUd7+V9KbE0UyDp4hdr5TJJSM=;
 b=QTWjqsEkbcqhkkhgty1BiTqo9ZrjJUq37bHdnl/8cSvkSNIBP30Zk/vhTOjI9zF28ekCNyqwjz0jfXhy8iN/Ejarta/d6QriffPZLCS0F9Y/GgT9Kvc3AsoJeLg4VsTApWvzidI0gippjWgKsZ77PTi9JC2UsRuKHDfrX73hFTEoVm6PGkST76aqRUjBEZ4lREVsPAKIcczVcW09anKpGg+QUqU49VzhhvQmDgrXAg5cr0JxwKtY9sPnVxnRCMIZh3Wi5+9sNYMA+G6+C7SUgvZPlLTxcSGFnKnhiFazLGwjWfXF6Mgxm+YkiDVKv6Hmch0iIgKyrT573exYfyTpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79XD/RFhMDY0Dq5PxGeUd7+V9KbE0UyDp4hdr5TJJSM=;
 b=KIbmdR18i63FsZzg+1RvKwxVnrBlPb9Dt5ev5Ag/UsVcxb5EOkxhnLKoHv5GyM53zpiW0Fb0SuK8O2rpejl3OvS2pysIrixgQh2LlKHBFKMpK/r2bVx3zlo4pH8egeptp8qvc70zXAbbznoB2a/k7Cmknl83kGmJquaT+ChK2tI=
Received: from PH8P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::9)
 by SA2PR10MB4748.namprd10.prod.outlook.com (2603:10b6:806:112::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 14:56:54 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:510:348:cafe::74) by PH8P220CA0025.outlook.office365.com
 (2603:10b6:510:348::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 14:56:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Fri, 28 Aug 2026 14:56:53 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:56:15 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:56:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:56:14 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SEuCEH2996051;
	Fri, 28 Aug 2026 09:56:12 -0500
Message-ID: <9fde48cd-6440-4b51-8701-dd8c3e8c1fb2@ti.com>
Date: Fri, 28 Aug 2026 20:26:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ti-vendor-kernel-headers: add recipe for TI-only
 dma-heap.h ioctl
To: <reatmon@ti.com>, <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <s-kapoor@ti.com>, <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260828145221.1301539-1-gehariprasath@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260828145221.1301539-1-gehariprasath@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|SA2PR10MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cb3183-17d3-48b1-5e97-08df051498d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099006|5023799004|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	2jtajJcPiuHhmte38elo2pR0EY8SlbUfz6jws7dXKewLQK81sjQdoBrus577IZbUekyxH97BWuU5FGTceD/r7rfceZbaiccCGrzPka0PwBeRIr97RXuC6BSQPuTHYV4UfRm1/Kjh5nmQlDAluOU4iuett5WrLvysDHDb1Lod4AnEJar9nHuIjl2JyP6A3V/pnJXz7WuHCdkXyXzO50AInBr8Khe8pXBZPZ7Tz5gu05GxX4Fg4ms8stPh+x3dnFytqjf2xu/IG8Q/+TYvXXBw0n/ILT+BdTJI6c60xcr3KcrunPwpgEA9/eutPNx2UHKKpvxsoVADPPiwRcIcCamgV4WHOf/N3wJ/ygSagqcdRQ0OIg7d6N6Ud1ptSdon5pf8bKehzTTxJNp7ZWX/FjYOPnWAz8hcmlY8QlLmFNvcerXVh/EiTWkDoHZOzrVoYAW/3zQ+Hr3lBA7CbSnNWNcWCuqg4MCSvnvYW1xWYLBQFtVtVOjMydy2dMOidCBVUs/8fobsyHqRYzak9030Po0r2t7lFiDeCbs8cQ29qzUT5SM6Fp7KLdIN1RX870kqKxNxCiq2oGbIYiU+bjJFHugoL99VXU6ltAsduZZSexkl8MUp4Y0mpvlvPvux3oos8Dg0TlVt8RP5mSokvXdHAHLXYlK8pTqOSNXesVrL04mbm3G2ArojGh77vC4l2Xe4txYYP527JuZaZgT2h5TBD/ungA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(5023799004)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FYLlFHCil3Momam3WEOKrN8DH3TQmilwxni1lux/0YX7Rv82BTkKeelld26rJPiYaciPGqSugUKBazsbG+MpJt88PCOEvi6BwP4lOFH8YWZeD7mcP43vLDgoHy/syx8UbosI3cuAjJJdnR2lqx61YHWHLi28VkloE6yw/BVZqi5Ix1EBHa/s6TBHytCDsxLyIbrt3v6Q7IisToUqzIbGFD3whQndiq4W9TWfvWZVQqVlK+3OijDD3sfkEUH2RJ05rpWAtzqCMxKCo9/NMXK0m/91TEavBlPsZx2UI9WtMpYUwHBL5MLz9SM1JUm5RwfzgrloPI0oEm1XFp7ZlL2f9KJ74OTvMf+RxcQJ53xUTEUYhK9/GQQ1+rZUUWAD7xb05s+C0QujG5HLM56pNBuN+QB/F/ZsfU9C4lSPEYp+0upM2R+UzmrJbLGCdGavlEpn
X-Exchange-RoutingPolicyChecked: 
	W965anoE17gtVVx+Wb9kjC2c6qwFm5Gptnq2wEg3E26Xmd6471z9Jk5DKx3DICsULwJkvmor6ShzSb2pHEMwIJ7m12B9xUpNEbx7rdbDTZbay8koaJzM0wUjB6ZMc6TQlGKQzjXlsRpVv4VfS7EWdkbSckiOFoNubms0nuU/0Pg7d9oE9wqSS2d6ESotfhbo1Ka4CB0ZLj0T3zju48pESMJyegApWeDQKEbn7/x1bP7scpSxGXhCZcS6KVfXGTDNa1yYRZVOfP1fKLy2g9qmjGN8FQYUaoXWyaYUrpzd7szOzftXUosTxw0/oTgzA51rTL7JS1gk+Lindtqz5b9wFw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:56:53.0389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cb3183-17d3-48b1-5e97-08df051498d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4748
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyOSBTYWx0ZWRfXzReUbWPuzKeK
 OKbMa30FmPPA1nh8zxVY337cxsSkw3/6/7UQxXGvSjflElDI6pFtapN+CedxMyI5m3+5c8po9Sf
 6vf8RMIHJZYQsgGcXeFp30xjPmYiydswUrNkFKOY98tTaX60pjisyWyYSYqv5tI1B6zLgbqSJAo
 np4xtN2EHVDJ1IQkk32I9likL16MPYNoBiySdxsajF+qZw02f9gRBCyjG2dcjpKRUHF782YFxM7
 ICwtVQNSpYgmLnbOW4vXOgV48Z180AL6HrS64KPpgCxftoHeSkOw0QB9LRr3mZQ54N1ueIdyDII
 zcJRcEVqx6fTutF1cg23gfJJ9+scf/S+QJ3aSnwqMVikcbk9zxWrGKkWr/Bn2hvwALKO36c/8Q7
 lVeyDg1Wq3rdUJkRGeAXfUcjLFCRGfZGVfWg0rm9PNOlAWTsneIvfrGV9Nl7oFRhj1sch2r9O2d
 c7fEKcpJXEExAk2+0yQ==
X-Authority-Analysis: v=2.4 cv=A7pc+aWG c=1 sm=1 tr=0 ts=6a91a1bb cx=c_pps
 a=qNvklhu79FbMMzLDwJ4KEg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=2-B5UuxeKmCew2EXUOAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: zEfZW8CS9QlbpfPL2PBVHJzS8BT6Yq4A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyOSBTYWx0ZWRfX/rugIhz7JKxJ
 7yrBUQ0pbKNT+aRtJ5TWZysB4CnU+q7/kuEUc81MngiyeO+J3fhz/oOYc7ErY+QON4l0c7h66Ef
 guyN6cEyp/X/F/lmEnJlo1edzJ8xK4I=
X-Proofpoint-GUID: zEfZW8CS9QlbpfPL2PBVHJzS8BT6Yq4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280129
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 14:57:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20300

On 8/28/2026 8:22 PM, Hari Prasath Gujulan Elango wrote:
> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
> downstream. The standard header provided by linux-libc-headers' wouldn't
> have the custom changes.Copy it straight from the kernel's staged
> source tree (STAGING_KERNEL_DIR) into a separate /usr/include/ti/linux
> path instead, for userspace code that needs it.
> 

oops missed the subject prefix guidelines,discard this. Sending v3.


> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> ---
> 	v1->v2: Address minor review comments in commit message and
> 		recipe description.
> 
>   .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> 
> diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> new file mode 100644
> index 000000000..5d570689a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
> +DESCRIPTION = "Copies select UAPI headers straight from the TI vendor kernel source \
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


