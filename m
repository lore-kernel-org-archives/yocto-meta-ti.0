Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306B7C982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 15:23:25 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13568.1789745000054603858
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 08:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=eCDTdHl5;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Mr7glGnx;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEJdN3571769
	for <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 10:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zhN784b+0lHQUHX7QDU3B44LBP6EDRdQ680Hfgxcd
	5c=; b=eCDTdHl5WFGhWbQPZ2FiSZvNWpmFX26nniSmgcSMX09cmKhpplJ1pnDwK
	DmWfPERQ3Vr+SucpkirTzmvd1VeIDJCrcEvSJJgBFz00SMBvKz4ZElhqwRV537y2
	m1wB55q6mg0Z/zBSyOerqp+Km4nMMMKyQUwva2xPS4oxgqgUmb639tn/chf3ud0Y
	xxdmv/Fe2EH7vnAiqLjQvfpvFh4UZTJpsZbCUE+/4shELw2OkVIGI5L0CrOeR8X9
	mrcd3eZ0LH75rjpwZY/BtK0BN/GP5OEJ9aL/pdv9OTyixJlz2Is55llN2cPDWgdZ
	kBIdoaQ3V/LlRlZ07f/zktxnvJimQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013052.outbound.protection.outlook.com [40.93.201.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gs0k3aqd9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 10:23:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxW7BpichTygGVCmOdSax+W5vH+XDsfEi3QPrG5oUdU8omYEbYtgKG22Tsea9I/ppmG+4yYCea0ZGJzMe8R32eOwVbzMc0bZ1o+D1asn7j90NrGYViZoVcOaES+dsJEVZ+9OWhibw/hi79ndP6tzrkhtkoex7CUitBEgNhR9F/prmvKVJ116kYFZNRhbnGdCVjPbyy3vqdoE0xEZDjx9qz1wMfPBQU+9784PRlj6pVyUbeMjEmfbobvWzxjeyjIDULIGBUiDi6ez6TcH2cz7kK9/+jFXeMFZKGbULLpFAmTOJtpqPj+Ty0fojYsANn8EpmtIPxN5Q64QutLD8dxMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhN784b+0lHQUHX7QDU3B44LBP6EDRdQ680Hfgxcd5c=;
 b=rt3UOTotivHXaZYRxP1qUF31PReH/gNf5fHO3MtMjE6TfDv4AS6RHRF/84vwxVMt9Jt+W8uYTh8PmR5Lbh3NK0eDL7ajBkO3BjWxAQAiRLO07huFt2+kTG2JrrvxsoS4WCSGuLHmTxgzEwpuUpUjy+J63IcRLPrKx4ZmHEbKpYk70t/dxbP064Ju4siLrBsWedCPnG0Ou5sBB7vN86U1AKLjroGvRmpVPIPd0Pcxnf0e3w/hsL7qku36qtEqG0u0W9PsvBIsbKOAu9FsLk7La73qWZhZP5eFZLxN69DYKVeSqFLPBrXnHo14xlRkvcEFZmyVVpUhtufhT+MYIoXShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhN784b+0lHQUHX7QDU3B44LBP6EDRdQ680Hfgxcd5c=;
 b=Mr7glGnxCPKrkxMHpKB8UMpUQKWtfJUtGWn9lWCzM2onw1JpOD3DwWwNpo6RYpJykV5rC8KW9VdmbdyPzRoDyP5CwdgMYRz0h6rX42rfH+alVKx4wbmER4NCzeanhAVTcRpa/kz2ZTPmdJFe+XBCPJwcDjH1KWXwVUZkWgQqGpA=
Received: from PH2PEPF00003849.namprd17.prod.outlook.com (2603:10b6:518:1::66)
 by DS5PR10MB997705.namprd10.prod.outlook.com (2603:10b6:8:341::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 15:23:13 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2a01:111:f403:f90b::1) by PH2PEPF00003849.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Fri,
 18 Sep 2026 15:23:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Fri, 18 Sep 2026 15:23:11 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 10:22:41 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 10:22:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 10:22:41 -0500
Received: from [10.249.33.128] ([10.249.33.128])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68IFMfCk1941071;
	Fri, 18 Sep 2026 10:22:41 -0500
Message-ID: <aad45d5d-f696-4367-affa-f8b5a0d3c245@ti.com>
Date: Fri, 18 Sep 2026 10:22:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] packagegroups: ti-test: package
 iwlwifi-ty linux firmware images
To: Aksh Garg <a-garg7@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <danishanwar@ti.com>
References: <20260918055654.180727-1-a-garg7@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260918055654.180727-1-a-garg7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|DS5PR10MB997705:EE_
X-MS-Office365-Filtering-Correlation-Id: d1268e12-c409-40a1-64b9-08df1598c01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|56012099006|3023799007|10067099003|6133799003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	OaejIU0xyVaQAKTJG4hrmD1agG7lnlGax949KokSBIiTJKFRANgP4xM9WoglCazkRhDXcsXi6yGjO/Zn3FAGd+pkqxZO+QgV1+pBPp2IRTl1ekQGm2H/egPOo5kteUWdzb+TeChYY+qsdbM//Fbs0wpMgQKnU8csa2fVCN0h9zTCua6RwKGZARjXn1W3/pPI01saSgxMiFJ3JKAvDv5nLA5I+O2JG/DQmidJLB1TR01haPNBlDtjZeKJaVP968VyZ/AA02jnnHMCqiXHknYn2AYHqs4rT05fbAXR59SFDk8Vpui+Wv4tgVTMsBeoa7PJsqgWuSWn7OkOjNEXM5VxbG7ZI7kfBZ8EsRLq0nxOBGK+V+7rUTzWJhIATF7QyGlIqfABaZZbMZzrjVEkTd5L9V69kqcfuaE+S2tV0dI2erRuzd66ZDj5883MoxrBtwBcZKx6dRV2nPZ5rY8D0MNcNxKU6J5xGi/IVZh9v5bGNipuRdhJe00IVAjg3S+1Ihfxm6Gl4FtioFzvmPRZ2Z3IztK4f/CdK3zXAbsxBRhIsdSRw2krkCnoN6oHSpOdUJgakFU+CAw+Jfgl4mGUeaB7hxNLNLhjyDU1KKe3vV6wMzHixtEJRbZEEc2QVv0mpmvdL4XW86gxiX2X1CZCZDkIpTQYpyIp1W0+1BQ+MEkdOsQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(56012099006)(3023799007)(10067099003)(6133799003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TNgltoBxFopNhvb/KinXR6gVhNNdncc0Eld0eQ568ykH/b7nF7MP8780HFXsvciDQ1zwO/I8zWh9wuGytadrTCak3qkDiyYkfUDwWe4VTVjzzUF42IMXNq78QG90Z6p2enDHq+DJjyBXXqKWzPRsQ+6/ZrWMdM9VBd/2cwIoAhH6ILNwB9RtGNf+0RRMgt8yP+taUoHhVgzNxxUIIK4sWcWmhoK1uUIVeMfnvbRec+KKpfqynrsCIg2cFtlF34Dkn+ag9kQbgDtw3zavy/xW74Bljlv65VL9+8xbjnLlzdOroypCnqdOZwCOjXO2RbpjizkvFTBdMczKFU76ut5kfs823r165IiLO/rUnXjo9EbHFhEee4KCgGT/gVVRsZH67h8anYDRG93Paflg0fs4RD/ioA9w9Jm3eZ/udY982qNu60Bu4Bar8Vche0z/50ru
X-Exchange-RoutingPolicyChecked: 
	zGKnEL0o47ITagtCNSlCYZ0f8NgA5l6AlCqJumCCI7QuuG/z+kj1vspZ0LO6hSWBbfKSk9laiKPeUJ9tOD6lT7lWXNcoeXP6qM6Xttkpoj6dP81W6wQtWNPXFzTux2vmravGKhJKoKdOsEbfZafg/fLYmeIPzdHEERcp8VU2yltKDvszJvETLXHSf6FZatRWVW+mRGhGnCXUBTrEzJztuBF6eACvT50tuqA6QlLM+JgI8Ik7pTc5vE7SVtHA7YBwLSP5/6hfgI9SXB/WfPDIpgwXaun34S5RkpOhJMFES1P5VUf18Qnng7FyfJmHSexTaB8tc7ucio2lZgTdqAhdWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 15:23:11.1015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1268e12-c409-40a1-64b9-08df1598c01c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR10MB997705
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxOSBTYWx0ZWRfX+GR+sZXOb82g
 UtBOs66FASAc9F80Wr3E0BXDaiLYrVDRawXVBWKBGp4bvl/SnPfSTndR4OaWsBb1j2ubPpBjBYk
 8Jvb7wJnrthUVXlwP67qkP/Gta0eijo=
X-Authority-Analysis: v=2.4 cv=K6S3jCWI c=1 sm=1 tr=0 ts=6aad5766 cx=c_pps
 a=MYN/bj0IIkanzoD+9X5qzA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8
 a=sozttTNsAAAA:8 a=wgK3QKj2DBjohYn9K0EA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxOSBTYWx0ZWRfXwhG18hUMHA6B
 zrmKI/qiW14kmmm26pdz/lRwxZXPcIEb7r+Sx5HulapBH2AkKOGHVdPRlST/pDEfLAPn3mPgjVH
 k5KSHrBuPJlhkGVbG9MPxmM6D+KInBpHEK5CpO7fZfx4+XgmP3Vvit779Tis+2vHvkw5AiyIAmy
 gmyZkr5eJsuSOHUg3JO0TkQprjuSfHUYHApkCZkGdLHesoLcSAIkHp39WhuAQfljKIq92Dof9N0
 BEMgf+NBkEWu6W2zpqhzQHipXXP5Y92DSYX6Elemcg69CDGPNP55LaFVYVup++Ht3Y2wsvV95xc
 GczyY32TJ5XfA0mfHD2dkm80IN7hvqlu5lH/2OMyfuN/ziCVDVXSUwUHu8ZuUOzzkiCqfbgi1MR
 wo8JgGedMgtDt5/S/agABQAc/T6M+H/T5pnTyXh2OFRv4w5YT3BuirOYcC8OWFn/QY6GpXfNiyM
 Zyph7NTo5ph6123dYIQ==
X-Proofpoint-GUID: A9Aql0AO_yNdimz8j3ubt3b4t6fgK2oe
X-Proofpoint-ORIG-GUID: A9Aql0AO_yNdimz8j3ubt3b4t6fgK2oe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180219
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 15:23:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20388



On 9/18/2026 12:56 AM, Aksh Garg wrote:
> Package linux-firmware-iwlwifi-ty containing the firmware for Intel
> AX210 WiFi card.

Why are we including a firmware in the ti-test package?  Firmware should 
be controlled at the BSP level and not as something needed for testing.


> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> ---
> 
> The patches have been posted to oe-core to add the package support for
> iwlwifi-ty firmware to the respective branches:
> - master: https://lists.openembedded.org/g/openembedded-core/topic/master_patch_v2/121309633
> - wrynose: https://lists.openembedded.org/g/openembedded-core/topic/wrynose_patch/121309627
> 
>   meta-ti-test/recipes-core/packagegroups/ti-test.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
> index 8a348c26f6e8..9064bf276d40 100644
> --- a/meta-ti-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
> @@ -117,6 +117,7 @@ TI_TEST_NETWORKING = "\
>       strongswan \
>       tcpdump \
>       xdp-tools-ti \
> +    linux-firmware-iwlwifi-ty \

NAK.  Please keep the list in alphabetical order assuming that we are 
going to take this patch.  Please see above question.


>   "
>   
>   TI_TEST_STORAGE = "\

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

