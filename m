Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4554ECDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 20:09:03 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16388.1782331735643061328
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 13:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cZn/XzDc;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=rras5l/i;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJsMFD1271498;
	Wed, 24 Jun 2026 15:08:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8NMp/WNch6Mi7JQNxHM/rmcm3YiZTZdPzdYbs7SDb
	KE=; b=cZn/XzDcCJ7pOjL3OVQYPITwkcIebL9dfjKzgfsjvsEEackfJ94dO1ZRQ
	Y0hjq6Idwc8IZuPIQLs3NMF02/RMUKLeFJ7SXnxh+p4YaFGSmGLelQGioiBTqPki
	ZbVrcNmzRSxU8P1R4sv9TTkZFYblPPN2T4mn8dsSd5Defj4NDv9rRWyE2CC9BOZW
	G3FUgDMfbqDMtc9/06vTqmt5VZJ63qTPP5PWqPCWKPEjWyRLavV15NEHEdf5sIFP
	A4xe0yHwRsYiGgnV8x5uuytkkBgayqUW4G5qAeGAj3YdBJxkuVAOsnKbTHM9XYdz
	8O0yErRmbNVy34tEWa20gVGMD69/g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0e5m3c6b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 15:08:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vt79jlqSuFuX+ASMH1l776I/kZxiP6vMHkCKupyqQetoCFFebQeTQ3N8+Z2dlurSM4GY+wzlgjleAonGC+3/kDxk2/ia0fbi+0LsIGox5fOol31GqFLmvc5aU/1w9sQGJDaPdopTLc8mtHuLhIPx4EvTperNKGFoKfB0nW7Q4lyScUGBj6PBc65dzNBKqWYqmo9BJXrdaY3KALt4MfubBpVJRFktUaN4gRYpU83bAHy7HXzAewm1FYBpQjnSHuivKCD73uoQ9SVESnOeZyRlEpOSxrs/xzUgdpE5x/dDVEjXK8VbCXyD+hIXsFR2MTZIRpYnYmXWEZybq495YT6rWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NMp/WNch6Mi7JQNxHM/rmcm3YiZTZdPzdYbs7SDbKE=;
 b=ipsGTHBDs4d+tLHRzNKh9EjerHBD8WlnKIyehAKS7DpNXHj4aQgOim5/gPT6fZ4y3vRKHniayhyKxPsQRILauhKMY+xTMt493cCY9Gp3Jd+rH52zMtypbYUZ/6t5dKGabgNOXGSXDPiMiaYrtHoNzzXNma9wwsPy4LOVV7Pz1DWnxW35gyrP01vJSH0xCKXU3/zRHiX18DJKUD7AWSJt/48sMvllJn9agiEga6fh/XblhpH0xfbSkqLp929lOSxFjszMpp9v3qrfeIiOZ5L+kly2R2puld4/53vKj/G42/Lkp2qgtmUnd0psvX4+p19E1QZ2t6J8u1aK5Vth777uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NMp/WNch6Mi7JQNxHM/rmcm3YiZTZdPzdYbs7SDbKE=;
 b=rras5l/iAdzsYmt3ALf6pvexIPhzaWhEJfsuv+Vs2PWfWiRYbE8Kg96TMPMRwPIxsTRC3upJCy3hqxD8U6F4UVdvqi8Aklm23rh4eR9crNMC4xqiR2fao+UFoNerGb5hakv6g9nA15D+f8jClZDKd1UvVSkUmp7Zj1UguZ6BGsw=
Received: from BN9PR03CA0679.namprd03.prod.outlook.com (2603:10b6:408:10e::24)
 by SJ0PR10MB4495.namprd10.prod.outlook.com (2603:10b6:a03:2d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 20:08:48 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::9f) by BN9PR03CA0679.outlook.office365.com
 (2603:10b6:408:10e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 20:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 20:08:46 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:08:25 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:08:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 15:08:25 -0500
Received: from [10.249.65.70] ([10.249.65.70])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OK8Pu81159850;
	Wed, 24 Jun 2026 15:08:25 -0500
Message-ID: <596d414a-053c-418f-92f9-16db0a0889de@ti.com>
Date: Wed, 24 Jun 2026 15:08:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v2 2/3] ipumm-fw: Use prebuilt
 firmware from ti-linux-firmware repo
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260624195533.1152173-1-afd@ti.com>
 <20260624195533.1152173-2-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260624195533.1152173-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SJ0PR10MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: faa05015-ed74-478e-cfce-08ded22c6650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|13003099007|6133799003|18002099003|22082099003|3023799007|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	PeQhW/N6fhHgkWG/JNXiOdqeDNQYLQntwEYOcgOXDv9kPSyrfIZh7dOYambmZ6cHPXzEtNGyez+ku3qkiatl/jliKaRK0xKI865ni8smaE+2G/aAc3pfHhDY3VMJTAn75QrzBofR/Qo3OJF8OuR0nFSFv3WXOT5EK8jAAyVP/s8uJGfISeL+jFIdhyhK1n/3LPTx3NSjTxX03YIxk1UOkNpzp5TMeUe7kSn44ruMp1/JwfS9i6kXj5uKbuGmIJ6kl8WZo4zoiuwYU7ePYE5+5LXv8y2UVkhisA5mddB6MTq148QzkhaYWEsaVCayEhGyLkEL+qaWTrH+kVPcTXv6V05/nArN5EKfHxSbByWnxo84hHWeJBXVBccb0LiZDzpqWqNshADvYU6wlBDMfUE8HD+7MKoa1gKFWNM3GV9mborjC4eiQ/udSIZlkMKw8BU/6R1VflhA2ITSsmbP6KkQQIY6TfsIrQ8oKJUpx4vqq7Piau6TNU+RlcXTCfs7zMsSw9UUM42bD9pSxIPc2o+0LPuo11LhsFwEt7HXxK8RIvOtSX6M41ctw1uy2uvkRKjk9ZZnvQ4s/8w55r4/YtRczyjxR3JWUf+OwgZdt5UnFXpijmkkGHI/jpOg1VCK/XDYsGctBkWaBeecMGXdaVv2AQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(13003099007)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sR+pP0RgUSN8RWLRnAjV/vb24KZW+AkivT9VA3qrEGU4IIFBmy3H0qeeOzfKbkxMUVG+eWhraALuE84MV+mwPqho1TsCEOM8Hxn2wqm5avGCjBJ9j+D61h1wnJs5XHHYj0RCJFkCKzDdtNqYPsWB6t/+ABqnRC6QqtyU5tbZczR6xV1znX4J7fnVamoATfP7+RrVxbGrKpygqyTIvkX/ZMajE4v2qh8cWpG4XUZMKQglnBRcxKZM6wI79NzwnT15FtRAOJAFBe9bDpVK8vPWWKlJABoxDMCaUzRd92n4Fbkd19gdLtKRrCszztWo1EX+vdqu0VRVA2/rUQXS8hRXnWdKXHqzh//C9UUEyh8SlSTjH3QkQ2vxT3ZKnbGhPaMT3G1iB562bVvHnXxRcoFeHbdiNDcdPqFa5sOYn/oFRcf+lNII4gXdnQmVyFo1ylXc
X-Exchange-RoutingPolicyChecked: 
	YuS6PEnYG+VoIQPdm/IWjrL9YDsi0KtmtZdQgffXUaeWmT/x47tOHE2Icg6pWbAoI/fdYSozEoYtIwVKNwc7bXdGO1GosjzkOFSxQ2bDR/3ar41YzYAboMPfbl1ior7kIashElJX6A/6+Lsc5HyDwTGWg9dk4wCI1P8aBWz9hsFF/862DnZeb1wK3cyG+FiNxrwdgra+LOEopv/PYBbwK8zrgPbxHjicNn6SM7gK7oUOnCoDCVCPwEjvvZqd2gOysgNTjryjw/br3E/oC+TgPegtFlQMq4BlGgd+LdnxPh3ZsXcwtxLfOaIGQaeAiIT1ZJLDUV72708A6XwlP94H1g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:08:46.9004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa05015-ed74-478e-cfce-08ded22c6650
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4495
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a3c3955 cx=c_pps
 a=l7cXxZGRKbMfBYROU17HtA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=clYl8afV7eOkDmAvpn8A:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: vx01hIYyprZak76FTNbuNbWdr1Y8llio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2OSBTYWx0ZWRfX/TBv8CG+DBYF
 KpRLFR4kKkROS0OfJ0LlXr9GpBo1YEgP/9227u/UVZ683fKdU+TWoN1dWe2wUMFseJ8+HbjEpWA
 MdisGzU6vfLcNqYKpB7U55iLTyTJSqanUF7Z+pU5CXcKYPpr5X+18a3rPUMWN7BzHpSgUMqn2M3
 vG2Ye0D3uWrz1g3FIQiYGAHLKIb7gfK1MdBsKtaHETcJTU4NPZX/Csf01cDtJ8hSUKQGxlBe8EZ
 g+TxqIixzmMqBxZ4gPoKn5/Z6yeri0v4ABrWINdJC9A0W/hLocSaytFZ+PwpkRRaN0l3Zz7OL62
 F9hanrZXYhQ8HgNfZp2zlOdxSt6mEMv/J9ZwdzmW/crCDO0cDJbthHHFwNj//VLDE6JgCGLKjtl
 zRoolSnxy1y99LT30H0w5cHRiUyQEQ==
X-Proofpoint-ORIG-GUID: vx01hIYyprZak76FTNbuNbWdr1Y8llio
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2OSBTYWx0ZWRfX+wk5pT8uIjvk
 56jsa6/IzgUwPa4a22tbCsnjEAczwYIrCsoZ7it8zPYobFOgX/NtrDGtF6eUSXnSb8+qdzBT2jW
 GXx0LmjX7XnqRx/TPg0SxHDn6k72/cc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240169
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 20:09:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20078


Missing License-Update: in the commit message.

https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#license-updates



On 6/24/2026 2:55 PM, Andrew Davis wrote:
> Use a prebuilt version of this firmware from ti-linux-firmware. This
> removes the need to build this locally.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> 
> Changes for v2:
>   - Fix s/suppor/support in SUMMARY while here
>   - Move PV definition to ti-linux-fw.inc like other prebuilt FWs
> 
>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>   .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb      | 52 ++++---------------
>   2 files changed, 10 insertions(+), 43 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 126c46df..88992e60 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -20,6 +20,7 @@ TI_HSM_DEMO_FW_VERSION = "11.00.09"
>   TI_PKA_FW_VERSION = "2.1.0"
>   TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
>   PCM6240_FW_VERSION = "1.0.0.0"
> +IPUMM_FW_VERSION = "3.00.15.00"
>   
>   TI_LINUX_FW_SRCREV ?= "ec029baad8b4b147af8331a5e099ef891e5ae1f4"
>   SRCREV = "${TI_LINUX_FW_SRCREV}"
> diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> index 246255e3..fbc6d956 100644
> --- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> @@ -1,7 +1,7 @@
> -SUMMARY = "Firmware for IPU to suppor Accelerated MM decode and encode"
> -LICENSE = "TI-TSPA"
> +SUMMARY = "Firmware for IPU to support Accelerated MM decode and encode"
>   
> -LIC_FILES_CHKSUM = "file://Texas_Instruments_ipumm_Manifest.pdf;md5=5cc572579f07af266ab57fc17d762c7f"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENCE.ti-tspa;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
>   
>   COMPATIBLE_MACHINE = "am57xx"
>   
> @@ -9,59 +9,25 @@ inherit features_check
>   
>   REQUIRED_MACHINE_FEATURES = "mmip"
>   
> -SRC_URI = "git://git.ti.com/git/ivimm/ipumm.git;protocol=https;branch=master"
> -
> -SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
> -
> -PV = "3.00.15.00"
> -PR = "r7"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>   
> -require recipes-ti/includes/ti-paths.inc
> +PV = "${IPUMM_FW_VERSION}"
> +PR = "r8"
>   
>   inherit update-alternatives
>   
> -DEPENDS = "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
> -
> -export HWVERSION = "ES10"
> -export BIOSTOOLSROOT = "${STAGING_DIR_TARGET}/usr/share/ti"
> -
> -export XDCVERSION = "ti-xdctools-tree"
> -export BIOSVERSION = "ti-sysbios-tree"
> -export IPCVERSION = "ti-ipc-tree"
> -export CEVERSION = "ti-codec-engine-tree"
> -export FCVERSION = "ti-framework-components-tree"
> -export XDAISVERSION = "ti-xdais-tree"
> -
> -export TMS470CGTOOLPATH = "${M4_TOOLCHAIN_INSTALL_DIR}"
> -export IPCSRC = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> -
> -EXTRA_OEMAKE += "XDCDIST_TREE=${STAGING_DIR_NATIVE}/usr/share/ti/${XDCVERSION}"
> -
> -do_configure() {
> -    oe_runmake unconfig
> -    oe_runmake vayu_smp_config
> -}
> -
> -do_compile() {
> -    oe_runmake
> -}
> -
>   TARGET = "dra7-ipu2-fw.xem4"
> -TARGET_MAP = "platform/ti/dce/baseimage/package/cfg/out/ipu/release/ipu.xem4.map"
>   
>   do_install() {
> -    install -d ${D}${nonarch_base_libdir}/firmware
> -    install -m 0644 ${S}/${TARGET} ${D}${nonarch_base_libdir}/firmware/${TARGET}.${BPN}
> -    install -m 0644 ${S}/${TARGET_MAP} ${D}${nonarch_base_libdir}/firmware/${TARGET}.map
> +    install -d ${D}${nonarch_base_libdir}/firmware/ti-ce-fw
> +    install -m 0644 ${S}/ti-ce-fw/${TARGET} ${D}${nonarch_base_libdir}/firmware/ti-ce-fw/${TARGET}
>   }
>   
>   ALTERNATIVE:${PN} = "dra7-ipu2-fw.xem4"
>   ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/${TARGET}"
> -ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/${TARGET}.${BPN}"
> +ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/ti-ce-fw/${TARGET}"
>   ALTERNATIVE_PRIORITY = "20"
>   
> -FILES:${PN} += "${nonarch_base_libdir}/firmware/*"
> -
>   # Disable the "buildpaths" check while we figure out how we are
>   # going to address this issue.
>   #

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

