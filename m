Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20924C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:51:21 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7370.1789019473313237124
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 22:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cZb5G2WH;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=NX3RMbsh;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Fg5C2505305;
	Thu, 10 Sep 2026 00:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=ig1DXHIxCEjSGbu
	tTZ1OKthiI0wAMhLnxViHWrQ+wvY=; b=cZb5G2WHATAmF3apX46fpofhXCcfV0V
	x1gJAGtmnaHIe+uCInlh8BsurhLjAZMx3z4alLBQhXiiHTz8lWzxI4xXSS7S0NMt
	MzX7zVUL40X4ZSJQlJ/35RhjWUHfkRvcsNUKlV99DmR5gAUGfcN1yf3gbMuR1uib
	FpYUWd/2lXdey0JVjBpuuSczOwnRyUa3Yu0RQw8dpnW7yEuukXEmK5wqM50l+Vp5
	oYGMX3KljvVaZHll6T9Rq/aefBoGpIHTn1MfrRE24Gf0Ziit6I7qIa0vjotwtyJn
	EUNKFC7hUNyqkgUtLobuyWPgYeDcsqBaPCX+RApLDNDg3QK3FfxpwZQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxg3hb8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 00:51:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yP+u9JAXanowbbXAzNLINAFEW3vQZwuf1xk5Tp2Qn8KJC3oVVDsSSLhmVktbYPYQIXLCeSBYjF9KbiRBKHmCIbIabbG1jPscRE1f/eWt6z6xr2deYtCZn9KCog2QW+ADEsC1bAyLRuWROY5EcgxW02muPTnGIJokky4FPwdXK1QYlPK9l+aH5uunx1H0HvmP4RIFWsCwMMsE9M+Hg3f1TqvReh2dIGBAqsTvAqtFlSJS2w+WwbB1dIodZgaQIMjZs2XQKxS1L7+EXmcVA7toLJiVLe60YoDlh9RKGJSb1X7w95cEAeEl8dA4oh/lGOKDCQFExnYaquwBf+IuIoyQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ig1DXHIxCEjSGbutTZ1OKthiI0wAMhLnxViHWrQ+wvY=;
 b=wpFUwXt34yXduzaZeVz+EH+h4VyqBpqs2lMYfIyHisk7la1vyLgZQq1aHY9Z36R7HiPk9DeulL3lXFmV83t21Lt/mkwnGPLqirVOKEeYmGRKSzpMRRxX2fkkD8jfxG8jN9K/QQnaDfuANXIFdBSpiPlqXLMigdGSM03Uj74Fp6oC50y6aF+eeAZQdzvvvi8tWbqWcbAlls7FThmQD0lQVL0VNhHz+Gg1d4GnaWGBNDb+EPQ4l5W5z9jp3ZRnvwW2Ca+tsQ+fhEjzpDqo7E5eCv5QdiV6LoK3wpKOkKwJ6y9cbcTwcn9pWt9+FWXDngtNhgTNvwqSt8exdvei337+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ig1DXHIxCEjSGbutTZ1OKthiI0wAMhLnxViHWrQ+wvY=;
 b=NX3RMbshizugtohgBQtdvIwp+LbugJSLzvt832DwtPlHQ0oHNTdBJQMHbBPLbBbyrW0jWWSrPIahcTe7JUfNfNfHmpzMJJ3XxBwEizTI2EBGga4vH33Nh7xNGu5rNrzhoDb2sZD4KoB/7x9IiOm8RGLjJRDj+z73w6I7kqeVXKE=
Received: from MW4PR03CA0259.namprd03.prod.outlook.com (2603:10b6:303:b4::24)
 by IA0PR10MB7644.namprd10.prod.outlook.com (2603:10b6:208:492::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Thu, 10 Sep
 2026 05:51:04 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::4e) by MW4PR03CA0259.outlook.office365.com
 (2603:10b6:303:b4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.14 via Frontend Transport; Thu,
 10 Sep 2026 05:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 05:51:03 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 00:50:47 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 00:50:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 00:50:47 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A5ojvc1725501;
	Thu, 10 Sep 2026 00:50:46 -0500
Date: Thu, 10 Sep 2026 11:20:45 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2 2/5] linux-ti-staging_6.6: Backport
 OpenSSL 4.0 patches
Message-ID: <20260910055045.nhrds5odt3ltv7lr@uda1250336>
References: <20260910015454.2933250-1-reatmon@ti.com>
 <20260910015454.2933250-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260910015454.2933250-2-reatmon@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|IA0PR10MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: da37525b-7bec-4b70-9423-08df0eff7fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|6133799003|13003099007|22082099003|18002099003|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	3fRgxaUh65vB1zsptvCIClV/BfFjHuiJTyLjy6s/WUHKD7M3jTH4QlaU3TKPDB4R2zBmJin3MdbRXJt6PUsBSd2f5jw/MTO3AyyhEcUhcPmeT5BtBpbsl9jNS5uIU8seBNKZanxddLC2qwJxSi3THD0by76zhkcebjKrbwRsQPxUXxbPYjLiIuft2RLYXptpg9tMg+FhaUCHpXa5pV0cSkfDGpg3rmTs+ZE+kBdwYXISQUDsuCGTAIpqWKYVYrtY+r/hGpXXi1HkuQZkgIUgzYADDOumHqA/etGrRopNBiBJhMNekdudzHV5b2ba1LRPCFAVmm4xLoY60AX8wPw6iEeaus+HAIFaLavW9KUH8th/dkn+ZOA8cgD7++E1sy+a29pn45GnJAIQHxwOvP4pq4A+qZ6zXRQkBLxYUqo+OMjGMRSaC7YL1NUbrxdfZuFJmwpCQdXwfZ/9N9tr46OAXSRdIR4PRXmVf0MFT1gpquvqehnd36b/vGXoyXnAFFXco/vQvJ33pFxa9u3q+hciiUATlww8DuVuisNgrzNbpjsSqOljUiIs1JT3EMvATFJG16kzc9mFcbi9Vg4S4//mYt/XI7/yfLoUecnxVB1Z8JCtYUtMJBB4AWY0S/H80eqJIn7jbThh6BeHIfk9JXoudJr2HpIpbJ48mEmABEtqzMywjjF8TG9+LGwAN/G+vlWD7NnSlZFgqXhllou6d+ucYg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(6133799003)(13003099007)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	58u9JmeCQFtgVpdA2udOhCVAYAGlV3CgTMJ3k7fIf3tR5wltHsH1sYPDzw2l8jUvsH2WtCMiEaXMQsAjWuBQ1TtYgo2AmK+4krbxY4i55RYo0bEDbMMhZc3EY8CQI92HZatybnEJC296bg9zuvzW0X8ExFlJzQ+fyLIFuG4YsKywuUOJx1cvqW65dJ3ZgeATHBjNPrQs3oLmH/Hzw0zmrp693vJDd9sUr8iR+eCxjyek5xTe5HMQQElydhf/jB1z0m65TQH+XleIDuRegcktqMowiLrM+6GJobxH/K5BUwdQNCv4z8XQmwkwTARcWXEza2ufT01DQD4safhikqHKA7beCpjUWk0pKv2W/oQhTClaPjQWwo/dYsGv+5uvE21s0x1h7pWYRhI8iIMEdKQ8NrHGh+y9TdgfU6wX8M7d3UU2Xz2rt7eFrtG4voWUKKlX
X-Exchange-RoutingPolicyChecked: 
	tl3o6i6c+gA7TNZMU9BhgtS7Q3kKM9+fymmfHnfesHvhJZjOPV9qwGct8kuqBEc6JeANGEFHtsPMxACps/rUs7p0gy7M+jC6/spMknhYCewayFrq9Dvm5pgG9zeI0Ajf/9o2Nd2XhKU/F5fBfZ9tuUhp9T1oiWwWaTHrRfDmQYyepbXEiDtKJTSNOdPcnQZSDBvHUbnHAwy4qptpVN837TKPbY05Srauhj9rnh1YhceIfZpNJo3IFJgjyrmdjhOb5H3/kfgxx1B9BcvwvbcChWfgeKbV+6Dg8h1/D/RlkxyAc+ZjMMftmKuzocZy+QtfStMlH3DlvlDPG0CNTS/YVw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:51:03.4298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da37525b-7bec-4b70-9423-08df0eff7fee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7644
X-Authority-Analysis: v=2.4 cv=MpPHeGae c=1 sm=1 tr=0 ts=6aa2454f cx=c_pps
 a=qO1H+kaF9sbjJIkK6g+tnw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=FOZC9FOpAAAA:20
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=LpvIoRCglkBb3V0tsfMA:9 a=CjuIK1q_8ugA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 9H8y9jl--34LN0wlxRch1LE-2uA-Nr-d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2MCBTYWx0ZWRfX2i0l/JbokPA/
 n7/hX5IwIzZavpoUkGa0b4+CeWVOOGSO+hRWNckJIi2bsyqoLKb0HOvdQBAFsAqBS0EG4Sv0X2h
 ocYFehEtqEzUzEcGSXX0nWt5AiNYs60=
X-Proofpoint-GUID: 9H8y9jl--34LN0wlxRch1LE-2uA-Nr-d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2MCBTYWx0ZWRfX1yQo7I1RVkHV
 jcAFiEPM7hgLMKOuJ8dwSO5niaEo+L1AAvW61Q2RvvvU+03YYrlEq5CE1/iJHkAYGHD/aOlwJrU
 4Pj9z+qy8R9GBn+L/WgzKM3Zh7DnHgRpX81ekCRtCAGkZrZpFcS/pVeV1cZq2Jo0YprYn8Rq49D
 LPH3r1y4BgxGtxPhBx/m+PZAlqfunsRxRMNnCC9A+dQfIewZYVvhsz0Lobvy29bFedxW3NQcemP
 PFXiE7PnucssTz2YYLvAvhptB+E/MKP6+g7xFTP1m4V67PtjFTqwaRY3ICndquzFPZNZQrkjCYF
 4XA0iDrZg/t3axQb8E/RbWwCHITpKHdGG2RhXwB8HpbnEijMtUwL/YbVh4v1/skxpaDppUxsiJ/
 4v+xQXdQrWNuRf72nUL4m9s70NttD2bL+7v2W6e5TGrq2PcCugZHmrHwoeoaM0FvJ3r+PsrdYy7
 waPCl2d5VIjEmTLuCxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100060
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 05:51:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20367

Hi Ryan,

On 20:54-20260909, Ryan Eatmon via lists.yoctoproject.org wrote:
> Backport a set of kernel patches to 6.6 to fix the OpenSSL build
> failures.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2; Added missing Upstream-Status.
> 
>  ...mon-SSL-helper-functions-to-a-header.patch | 205 ++++++++++++++++++
>  ...-using-deprecated-ERR_get_error_line.patch | 121 +++++++++++
>  ...-pkcs11-provider-for-OPENSSL-MAJOR-3.patch | 163 ++++++++++++++
>  .../linux/linux-ti-staging_6.6.bb             |   6 +
>  4 files changed, 495 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
> new file mode 100644
> index 00000000..6a58b5eb
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
> @@ -0,0 +1,205 @@
> +From 300e6d4116f956b035281ec94297dc4dc8d4e1d3 Mon Sep 17 00:00:00 2001
> +From: Jan Stancek <jstancek@redhat.com>
> +Date: Fri, 12 Jul 2024 09:11:14 +0200
> +Subject: sign-file,extract-cert: move common SSL helper functions to a header
> +
> +Couple error handling helpers are repeated in both tools, so
> +move them to a common header.
> +
> +Signed-off-by: Jan Stancek <jstancek@redhat.com>
> +Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> +Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> +Reviewed-by: Neal Gompa <neal@gompa.dev>
> +Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> +
> +Upstream-Status: Inappropriate [OE specific]
> +---
> + MAINTAINERS          |  1 +
> + certs/Makefile       |  2 +-
> + certs/extract-cert.c | 37 ++-----------------------------------
> + scripts/sign-file.c  | 37 ++-----------------------------------
> + scripts/ssl-common.h | 39 +++++++++++++++++++++++++++++++++++++++
> + 5 files changed, 45 insertions(+), 71 deletions(-)
> + create mode 100644 scripts/ssl-common.h
> +
> +diff --git a/MAINTAINERS b/MAINTAINERS
> +index 9278c30ef1d5a..23f9028848552 100644
> +--- a/MAINTAINERS
> ++++ b/MAINTAINERS
> +@@ -5204,6 +5204,7 @@ S:	Maintained
> + F:	Documentation/admin-guide/module-signing.rst
> + F:	certs/
> + F:	scripts/sign-file.c
> ++F:	scripts/ssl-common.h
> + F:	tools/certs/
> + 
> + CFAG12864B LCD DRIVER
> +diff --git a/certs/Makefile b/certs/Makefile
> +index 1094e3860c2a7..f6fa4d8d75e05 100644
> +--- a/certs/Makefile
> ++++ b/certs/Makefile
> +@@ -84,5 +84,5 @@ targets += x509_revocation_list
> + 
> + hostprogs := extract-cert
> + 
> +-HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
> ++HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null) -I$(srctree)/scripts
> + HOSTLDLIBS_extract-cert = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
> +diff --git a/certs/extract-cert.c b/certs/extract-cert.c
> +index 70e9ec89d87d3..8e7ba9974a1fa 100644
> +--- a/certs/extract-cert.c
> ++++ b/certs/extract-cert.c
> +@@ -23,6 +23,8 @@
> + #include <openssl/err.h>
> + #include <openssl/engine.h>
> + 
> ++#include "ssl-common.h"
> ++
> + /*
> +  * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
> +  *
> +@@ -40,41 +42,6 @@ void format(void)
> + 	exit(2);
> + }
> + 
> +-static void display_openssl_errors(int l)
> +-{
> +-	const char *file;
> +-	char buf[120];
> +-	int e, line;
> +-
> +-	if (ERR_peek_error() == 0)
> +-		return;
> +-	fprintf(stderr, "At main.c:%d:\n", l);
> +-
> +-	while ((e = ERR_get_error_line(&file, &line))) {
> +-		ERR_error_string(e, buf);
> +-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> +-	}
> +-}
> +-
> +-static void drain_openssl_errors(void)
> +-{
> +-	const char *file;
> +-	int line;
> +-
> +-	if (ERR_peek_error() == 0)
> +-		return;
> +-	while (ERR_get_error_line(&file, &line)) {}
> +-}
> +-
> +-#define ERR(cond, fmt, ...)				\
> +-	do {						\
> +-		bool __cond = (cond);			\
> +-		display_openssl_errors(__LINE__);	\
> +-		if (__cond) {				\
> +-			err(1, fmt, ## __VA_ARGS__);	\
> +-		}					\
> +-	} while(0)
> +-
> + static const char *key_pass;
> + static BIO *wb;
> + static char *cert_dst;
> +diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> +index 3edb156ae52c3..39ba58db5d4ea 100644
> +--- a/scripts/sign-file.c
> ++++ b/scripts/sign-file.c
> +@@ -29,6 +29,8 @@
> + #include <openssl/err.h>
> + #include <openssl/engine.h>
> + 
> ++#include "ssl-common.h"
> ++
> + /*
> +  * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
> +  *
> +@@ -83,41 +85,6 @@ void format(void)
> + 	exit(2);
> + }
> + 
> +-static void display_openssl_errors(int l)
> +-{
> +-	const char *file;
> +-	char buf[120];
> +-	int e, line;
> +-
> +-	if (ERR_peek_error() == 0)
> +-		return;
> +-	fprintf(stderr, "At main.c:%d:\n", l);
> +-
> +-	while ((e = ERR_get_error_line(&file, &line))) {
> +-		ERR_error_string(e, buf);
> +-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> +-	}
> +-}
> +-
> +-static void drain_openssl_errors(void)
> +-{
> +-	const char *file;
> +-	int line;
> +-
> +-	if (ERR_peek_error() == 0)
> +-		return;
> +-	while (ERR_get_error_line(&file, &line)) {}
> +-}
> +-
> +-#define ERR(cond, fmt, ...)				\
> +-	do {						\
> +-		bool __cond = (cond);			\
> +-		display_openssl_errors(__LINE__);	\
> +-		if (__cond) {				\
> +-			errx(1, fmt, ## __VA_ARGS__);	\
> +-		}					\
> +-	} while(0)
> +-
> + static const char *key_pass;
> + 
> + static int pem_pw_cb(char *buf, int len, int w, void *v)
> +diff --git a/scripts/ssl-common.h b/scripts/ssl-common.h
> +new file mode 100644
> +index 0000000000000..e6711c75ed913
> +--- /dev/null
> ++++ b/scripts/ssl-common.h
> +@@ -0,0 +1,39 @@
> ++/* SPDX-License-Identifier: LGPL-2.1+ */
> ++/*
> ++ * SSL helper functions shared by sign-file and extract-cert.
> ++ */
> ++
> ++static void display_openssl_errors(int l)
> ++{
> ++	const char *file;
> ++	char buf[120];
> ++	int e, line;
> ++
> ++	if (ERR_peek_error() == 0)
> ++		return;
> ++	fprintf(stderr, "At main.c:%d:\n", l);
> ++
> ++	while ((e = ERR_get_error_line(&file, &line))) {
> ++		ERR_error_string(e, buf);
> ++		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> ++	}
> ++}
> ++
> ++static void drain_openssl_errors(void)
> ++{
> ++	const char *file;
> ++	int line;
> ++
> ++	if (ERR_peek_error() == 0)
> ++		return;
> ++	while (ERR_get_error_line(&file, &line)) {}
> ++}
> ++
> ++#define ERR(cond, fmt, ...)				\
> ++	do {						\
> ++		bool __cond = (cond);			\
> ++		display_openssl_errors(__LINE__);	\
> ++		if (__cond) {				\
> ++			errx(1, fmt, ## __VA_ARGS__);	\
> ++		}					\
> ++	} while (0)
> +-- 
> +cgit 1.3.1-korg
> +
> diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch b/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
> new file mode 100644
> index 00000000..993f6739
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
> @@ -0,0 +1,121 @@
> +From 467d60eddf55588add232feda325da7215ddaf30 Mon Sep 17 00:00:00 2001
> +From: Jan Stancek <jstancek@redhat.com>
> +Date: Fri, 12 Jul 2024 09:11:15 +0200
> +Subject: sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
> +
> +ERR_get_error_line() is deprecated since OpenSSL 3.0.
> +
> +Use ERR_peek_error_line() instead, and combine display_openssl_errors()
> +and drain_openssl_errors() to a single function where parameter decides
> +if it should consume errors silently.
> +
> +Signed-off-by: Jan Stancek <jstancek@redhat.com>
> +Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> +Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> +Reviewed-by: Neal Gompa <neal@gompa.dev>
> +Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> +
> +Upstream-Status: Inappropriate [OE-specifc]

Typo in "specific". 

> +---
> + certs/extract-cert.c |  4 ++--
> + scripts/sign-file.c  |  6 +++---
> + scripts/ssl-common.h | 23 ++++++++---------------
> + 3 files changed, 13 insertions(+), 20 deletions(-)
> +
> +diff --git a/certs/extract-cert.c b/certs/extract-cert.c
> +index 8e7ba9974a1fa..61bbe00856717 100644
> +--- a/certs/extract-cert.c
> ++++ b/certs/extract-cert.c
> +@@ -99,11 +99,11 @@ int main(int argc, char **argv)
> + 		parms.cert = NULL;
> + 
> + 		ENGINE_load_builtin_engines();
> +-		drain_openssl_errors();
> ++		drain_openssl_errors(__LINE__, 1);
> + 		e = ENGINE_by_id("pkcs11");
> + 		ERR(!e, "Load PKCS#11 ENGINE");
> + 		if (ENGINE_init(e))
> +-			drain_openssl_errors();
> ++			drain_openssl_errors(__LINE__, 1);
> + 		else
> + 			ERR(1, "ENGINE_init");
> + 		if (key_pass)
> +diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> +index 39ba58db5d4ea..bb3fdf1a617c2 100644
> +--- a/scripts/sign-file.c
> ++++ b/scripts/sign-file.c
> +@@ -114,11 +114,11 @@ static EVP_PKEY *read_private_key(const char *private_key_name)
> + 		ENGINE *e;
> + 
> + 		ENGINE_load_builtin_engines();
> +-		drain_openssl_errors();
> ++		drain_openssl_errors(__LINE__, 1);
> + 		e = ENGINE_by_id("pkcs11");
> + 		ERR(!e, "Load PKCS#11 ENGINE");
> + 		if (ENGINE_init(e))
> +-			drain_openssl_errors();
> ++			drain_openssl_errors(__LINE__, 1);
> + 		else
> + 			ERR(1, "ENGINE_init");
> + 		if (key_pass)
> +@@ -273,7 +273,7 @@ int main(int argc, char **argv)
> + 
> + 		/* Digest the module data. */
> + 		OpenSSL_add_all_digests();
> +-		display_openssl_errors(__LINE__);
> ++		drain_openssl_errors(__LINE__, 0);
> + 		digest_algo = EVP_get_digestbyname(hash_algo);
> + 		ERR(!digest_algo, "EVP_get_digestbyname");
> + 
> +diff --git a/scripts/ssl-common.h b/scripts/ssl-common.h
> +index e6711c75ed913..2db0e181143cf 100644
> +--- a/scripts/ssl-common.h
> ++++ b/scripts/ssl-common.h
> +@@ -3,7 +3,7 @@
> +  * SSL helper functions shared by sign-file and extract-cert.
> +  */
> + 
> +-static void display_openssl_errors(int l)
> ++static void drain_openssl_errors(int l, int silent)
> + {
> + 	const char *file;
> + 	char buf[120];
> +@@ -11,28 +11,21 @@ static void display_openssl_errors(int l)
> + 
> + 	if (ERR_peek_error() == 0)
> + 		return;
> +-	fprintf(stderr, "At main.c:%d:\n", l);
> ++	if (!silent)
> ++		fprintf(stderr, "At main.c:%d:\n", l);
> + 
> +-	while ((e = ERR_get_error_line(&file, &line))) {
> ++	while ((e = ERR_peek_error_line(&file, &line))) {
> + 		ERR_error_string(e, buf);
> +-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> ++		if (!silent)
> ++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> ++		ERR_get_error();
> + 	}
> + }
> + 
> +-static void drain_openssl_errors(void)
> +-{
> +-	const char *file;
> +-	int line;
> +-
> +-	if (ERR_peek_error() == 0)
> +-		return;
> +-	while (ERR_get_error_line(&file, &line)) {}
> +-}
> +-
> + #define ERR(cond, fmt, ...)				\
> + 	do {						\
> + 		bool __cond = (cond);			\
> +-		display_openssl_errors(__LINE__);	\
> ++		drain_openssl_errors(__LINE__, 0);	\
> + 		if (__cond) {				\
> + 			errx(1, fmt, ## __VA_ARGS__);	\
> + 		}					\
> +-- 
> +cgit 1.3.1-korg
> +
> diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch b/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
> new file mode 100644
> index 00000000..8f509895
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
> @@ -0,0 +1,163 @@
> +From 558bdc45dfb2669e1741384a0c80be9c82fa052c Mon Sep 17 00:00:00 2001
> +From: Jan Stancek <jstancek@redhat.com>
> +Date: Fri, 20 Sep 2024 19:52:48 +0300
> +Subject: sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
> +
> +ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> +Distros have started dropping support from headers and in future
> +it will likely disappear also from library.
> +
> +It has been superseded by the PROVIDER API, so use it instead
> +for OPENSSL MAJOR >= 3.
> +
> +[1] https://github.com/openssl/openssl/blob/master/README-ENGINES.md
> +
> +[jarkko: fixed up alignment issues reported by checkpatch.pl --strict]
> +
> +Signed-off-by: Jan Stancek <jstancek@redhat.com>
> +Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> +Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> +Reviewed-by: Neal Gompa <neal@gompa.dev>
> +Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> +
> +Upstream-Status: Inappropriate [OE-specifc]

Nitpicking here, Typo in "specific", I don't think these typos affect anything major.

> +---
> + certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++++++++---------------
> + 1 file changed, 73 insertions(+), 30 deletions(-)
> +
> +(limited to 'certs/extract-cert.c')
> +
> +diff --git a/certs/extract-cert.c b/certs/extract-cert.c
> +index 61bbe00856717..7d6d468ed6129 100644
> +--- a/certs/extract-cert.c
> ++++ b/certs/extract-cert.c
> +@@ -21,17 +21,18 @@
> + #include <openssl/bio.h>
> + #include <openssl/pem.h>
> + #include <openssl/err.h>
> +-#include <openssl/engine.h>
> +-
> ++#if OPENSSL_VERSION_MAJOR >= 3
> ++# define USE_PKCS11_PROVIDER
> ++# include <openssl/provider.h>
> ++# include <openssl/store.h>
> ++#else
> ++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
> ++#  define USE_PKCS11_ENGINE
> ++#  include <openssl/engine.h>
> ++# endif
> ++#endif
> + #include "ssl-common.h"
> + 
> +-/*
> +- * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
> +- *
> +- * Remove this if/when that API is no longer used
> +- */
> +-#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
> +-
> + #define PKEY_ID_PKCS7 2
> + 
> + static __attribute__((noreturn))
> +@@ -61,6 +62,66 @@ static void write_cert(X509 *x509)
> + 		fprintf(stderr, "Extracted cert: %s\n", buf);
> + }
> + 
> ++static X509 *load_cert_pkcs11(const char *cert_src)
> ++{
> ++	X509 *cert = NULL;
> ++#ifdef USE_PKCS11_PROVIDER
> ++	OSSL_STORE_CTX *store;
> ++
> ++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
> ++		ERR(1, "OSSL_PROVIDER_try_load(pkcs11)");
> ++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
> ++		ERR(1, "OSSL_PROVIDER_try_load(default)");
> ++
> ++	store = OSSL_STORE_open(cert_src, NULL, NULL, NULL, NULL);
> ++	ERR(!store, "OSSL_STORE_open");
> ++
> ++	while (!OSSL_STORE_eof(store)) {
> ++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
> ++
> ++		if (!info) {
> ++			drain_openssl_errors(__LINE__, 0);
> ++			continue;
> ++		}
> ++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_CERT) {
> ++			cert = OSSL_STORE_INFO_get1_CERT(info);
> ++			ERR(!cert, "OSSL_STORE_INFO_get1_CERT");
> ++		}
> ++		OSSL_STORE_INFO_free(info);
> ++		if (cert)
> ++			break;
> ++	}
> ++	OSSL_STORE_close(store);
> ++#elif defined(USE_PKCS11_ENGINE)
> ++		ENGINE *e;
> ++		struct {
> ++			const char *cert_id;
> ++			X509 *cert;
> ++		} parms;
> ++
> ++		parms.cert_id = cert_src;
> ++		parms.cert = NULL;
> ++
> ++		ENGINE_load_builtin_engines();
> ++		drain_openssl_errors(__LINE__, 1);
> ++		e = ENGINE_by_id("pkcs11");
> ++		ERR(!e, "Load PKCS#11 ENGINE");
> ++		if (ENGINE_init(e))
> ++			drain_openssl_errors(__LINE__, 1);
> ++		else
> ++			ERR(1, "ENGINE_init");
> ++		if (key_pass)
> ++			ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
> ++		ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
> ++		ERR(!parms.cert, "Get X.509 from PKCS#11");
> ++		cert = parms.cert;
> ++#else
> ++		fprintf(stderr, "no pkcs11 engine/provider available\n");
> ++		exit(1);
> ++#endif
> ++	return cert;
> ++}
> ++
> + int main(int argc, char **argv)
> + {
> + 	char *cert_src;
> +@@ -89,28 +150,10 @@ int main(int argc, char **argv)
> + 		fclose(f);
> + 		exit(0);
> + 	} else if (!strncmp(cert_src, "pkcs11:", 7)) {
> +-		ENGINE *e;
> +-		struct {
> +-			const char *cert_id;
> +-			X509 *cert;
> +-		} parms;
> ++		X509 *cert = load_cert_pkcs11(cert_src);
> + 
> +-		parms.cert_id = cert_src;
> +-		parms.cert = NULL;
> +-
> +-		ENGINE_load_builtin_engines();
> +-		drain_openssl_errors(__LINE__, 1);
> +-		e = ENGINE_by_id("pkcs11");
> +-		ERR(!e, "Load PKCS#11 ENGINE");
> +-		if (ENGINE_init(e))
> +-			drain_openssl_errors(__LINE__, 1);
> +-		else
> +-			ERR(1, "ENGINE_init");
> +-		if (key_pass)
> +-			ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
> +-		ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
> +-		ERR(!parms.cert, "Get X.509 from PKCS#11");
> +-		write_cert(parms.cert);
> ++		ERR(!cert, "load_cert_pkcs11 failed");
> ++		write_cert(cert);
> + 	} else {
> + 		BIO *b;
> + 		X509 *x509;
> +-- 
> +cgit 1.3.1-korg
> +
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> index 9acc95c8..3d6b7007 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> @@ -28,6 +28,12 @@ KERNEL_REPRODUCIBILITY_PATCHES = " \
>      file://0001-vt-conmakehash-improve-reproducibility.patch \
>  "
>  
> +SRC_URI += "\
> +    file://0001-move-common-SSL-helper-functions-to-a-header.patch \
> +    file://0002-avoid-using-deprecated-ERR_get_error_line.patch \
> +    file://0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch \
> +"
> +
>  # Special configuration for remoteproc/rpmsg IPC modules
>  module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
> -- 
> 2.43.0
>
-- Yogesh 

