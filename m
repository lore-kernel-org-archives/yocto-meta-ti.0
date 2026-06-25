Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1C5CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 16:35:25 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15834.1782405315987909795
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 09:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aHYM7ja4;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=v1b6wflF;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFdBV73618297;
	Thu, 25 Jun 2026 11:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/ENPL7grclBPWDgcns3vjqtw+VoFH7vOrqIa/W38J
	5o=; b=aHYM7ja4MmBzzf3qUKl2feUa++X5LeoZzKpTiYg4AeBzYvM4j32Liw7vV
	1TiVuSOixH3myIITagb5x8vecu/Mtvpx0RQMd3JIkj0wc5jL6xpxbvqhmHY9uEER
	9hJQ0vYn/EqlvR8FdQvhqA/HWjaaWD+OZjRx2BUMfWb3l/mlUzjcj8wD58UGYe2M
	uMi3bvEjp+W3VTKDDGX75UauxBaEI8+E3DFDfagXE8djuDWdb6YWfX6KoImjyDd0
	mS0HKZTxY3rZULtkoc22AuGTiiE6z4nz7bY2hQVERcGvB4KB0JHTZtemf+aYNONN
	ykcBGDcSFoGuUDrKJGippmYy1paYA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f12jcj82r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 11:35:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hcflb1ouGz2ynyf311xwYgeNeK4R2tC0YLL9LCZZYg0NNGDcajKkJ3ROKjXBqGmF0vR2OtxcmhD9HiKGa3ylKxk2oXl5DlxB9vHWeS6z5QCKXjwebzhom2YTvxpTaoxJBrsieplVMtqV3ZEho0Ddgoe4AaXAQXpb7yAjuiWM9WGTBee5hyPKLjx4Ro+Eg7w7hOuuCe5tn5duDa70ZEfFMT3YQ2JHwUVQjwkwlfr50nmrL2fMVVI5/lgOarfBqbgouUnuWsPGbQWFSr6kMWUnAHzTl0j9w+F1LinoXlE6wK6EMadeZe+NnfNIGCUNyYf8OeeDlKmBJXAYnmWCAk32rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ENPL7grclBPWDgcns3vjqtw+VoFH7vOrqIa/W38J5o=;
 b=kGQwKPvTZDrqe4lXYvFGjODFsDzinLCA3EXdEiFJPDUxXFaxswbh/w9ImS9v+KVLukTbRZY+hkToZ1VY/KpPSVWUOu2SpITvpGXLc2OjN7CVkFoT6TGkuQZVGOC4KpmFqtB6nMz3rACZT7cNK9dDz7rfTk31HlNTc69SVlKQXUnLK75IlbtbYp1RH4RLrNccdnsKfNDmzNveBrSWR2D75wiftxWd05LDFvz4rcuiGmuPrpKQ8FAuE93SzXDGyyUL99fazg09Fpvguo/S7+8Pim8S6rlhOZ+RhraxIZsNho/0lEqahy51uwI9eQ0aesojj/VHG3kM896Wqv/fNGCz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ENPL7grclBPWDgcns3vjqtw+VoFH7vOrqIa/W38J5o=;
 b=v1b6wflFjGnAsaQUpkwYHbCYRRuC0BwQ4vIM4IfzXcy6meD71jLWHZpUT7CHhML65U2YiUih8id4i/WYtgUSFLGFA+0KPx/HOpW1OC+D8XL2InhbbcK++4Xqb4r+5pDP/FRI8/PJXnVg6hLSIhL6x/jEnnHTOWl4f9e3iApEzpKxINfqDDkXNNMscf4ldyePUzsv0F2QlY5JzEV/crYB+HtnfLjYjYmNoJlV+Hc4B9Yk8mBbqGZrBVoV3+Jd/Slr8Q+XYUPexQyprZBbYA6PkC05Fh6REJFNA8lVJ4FlR+HDg8epk0yD3qLIVItwe0aRJtym22b9Y8Fbyk1erMQTKg==
Received: from BN9PR03CA0409.namprd03.prod.outlook.com (2603:10b6:408:111::24)
 by LV8PR10MB7823.namprd10.prod.outlook.com (2603:10b6:408:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 16:35:11 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::94) by BN9PR03CA0409.outlook.office365.com
 (2603:10b6:408:111::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Thu,
 25 Jun 2026 16:35:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:35:08 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:35:02 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:35:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 11:35:01 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PGZ27R3728908;
	Thu, 25 Jun 2026 11:35:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F06189ACF4; Thu, 25 Jun 2026 11:35:01 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH v3 1/3] libdce: Runtime depend on IPU firmware not the other way around
Date: Thu, 25 Jun 2026 11:35:01 -0500
Message-ID: <20260625163501.1315473-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260625160659.29619-1-afd@ti.com>
References: <20260625160659.29619-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|LV8PR10MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5857ca-7b6c-4fac-8e39-08ded2d7b889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	EOmUMPMrDLT9qL0yaPh/XQcSNzW6eJCg6pmnJDkcRoYujREvDhUA1rjrOvGc9z2Q0Mu7q8RedjBtKBx6YkCAtiKUmY6nqkT21TKYburM5wKAmF7eb6FB+pQsMJroqJ1wloYS9khy/T4/tyf66Vhx7N4RrcKu8JI6KfoB2tlONg3K5xz3MTFA0lD1tSKaqX6JYeFqktvn0v8mSci/A0q0migpRqrpWI2dIVpK3shuqVG92AxwJZ4iMoIxn+zjWPQSmCPD5ZgvxJ9Txp/6/49nKEg9ul+4HiN0sRV6WD47mFOyGX3qi8/q3HMebscFepDs3pqBgNiI9SI1AT9WsA4LFBupEtC7r1XMXGsnk3Vj3joAq12aLUzhsrukT7/Sz2wmi3I8q5xWzQnDkY9GosY5oryjpUjy/fRg1nOJcD8EW/spbVb0kW1AzeSK6yeIK25xTyNb+z755tphhgFX6uohRyl4TaWnxvE3SsjumqyXjMhdPdA02srWg+1ODm1WEeJ5ylsWxjey0fmlc68bG8iAkdfsb/tSh9qrpuPj5iIntcZn36/dXJ7rVVw7IVPXAUcnCzDCtSsBIglmbUJij23I0AkrvPsnI/hFymdwOc3bbefm/CiF177r+/QKndtSDtuxc/XJtisRpDEoN2coPxQqWrOFW/8Qd6fWKxHFzf6xeOEhwDwdRWDiJp/AqOKGHW3b9DLep4gJJvIXnXyVjj2mBA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7iCVmajR7wHVSXZMNbUyyaWcLDJvKjhcVxxntWnpqSMwijr1gbv792pKXMZrN93QcWhyzhG/wPFpqJkC18JkWchW2KxZ36u5300o/KjE79iDAB/TxBgMSitiOJB5FqerlkNyIR0G2ZhWNWDRiG6inq7W34dOohaAK/BqKTW53OPHkM7YJCvKCiOUkQ+xfc7OATltXe/gAiRHuLjsmKu0mWqSSMVO+Lt6DhtoyEi0DgBq5V9o0siXzzu3rRyHga8XD/IjQQaNZJ1/x/n7idFLZJzrJBT2a9KyKDosjBd0RyIOs+kAUWfd+Y1UwdtSvpjXKra1iTCEFQpYFm/JBznT5HPqOv75b/kf3MbBCC6W4/zS+B4IEh8obfLDDyqvfX8h9ZaBsGw2tpxSCsj9WVEnimINNWDjPIan/I/jKT1etevyKTd7usz5oCPlk/c7deY9
X-Exchange-RoutingPolicyChecked: 
	saMkMuS3mzU+kT96vzBVMtROLj9aiTkztJC1X0c3aTstJE2GVjZaqPKAUJTJ6igaytxDfZVAPrbJxlLWbTsbuQ5yPU65WAsoLCKn8Kt/mLgv6VXDjJcxe6RdjsRbtHa49C/y7unBOH+nTpQ27Uohz0ne90yr5hKK6qSu4mXkm/lUe5/gjfmgeCqoKMFQzrSwCrrrKNgbHTJgV9ce9vVic0cUGMJCcIGEvEDPO3Fdn539minQ1+dqb7IguCAq4mkUH5iKXqCp9fvhiY4KRbmopWrUEh1d0zKRFlBB4i4nHTOU1b2vyN+S3Pi6XQWpdFHefrlAoiQidbr1mqHUI4OSLw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:35:08.7814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5857ca-7b6c-4fac-8e39-08ded2d7b889
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7823
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE0MiBTYWx0ZWRfX8jrJLkumQkrN
 zjv05N9lNuxlAVOSM5rXMprlKWVZB2Y18KYGwqRX2eNoEfi61ifXsilJlXI7e8/0S5p7kBdk9sf
 /WOedFbBqydLZdKxcdaQVW36bICWVb/yE2P7/ZbaxezjsQ+jH+i+Z5XcbcmGZC8eh5dq3s+1umV
 tp0QnVkov0VbiX3L7NPFWUgzPnP5G2HwqXcQcn7Z0e+FT9Y54KrRW0CaejS+ySC1pDpvXCpqlBz
 9Am/lzXYHQvyaU9QfseEohqvA1QpnLPpQUINXzS358+Kor7v3RpGmXblriG+MyNI5UXWK7t5QPD
 0WKmkfSTHNsLDTwCtc4zVCdXvGxOtSKX7T2Cy5B2BaKgY9Gju2f28fXCP1V//kCUxyH38cVNSzx
 eBRsNt925OaJOu7feNSMO1wfQVhjOXvXQdD8vcqBZb2XMfNPXnaIEdhmi2UkzhkqWf7JtSjhdGm
 8luS9C2/Kdge+wodTNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE0MiBTYWx0ZWRfX+MIrpPkMIKk6
 hSpOqnqOtJAqsOVu68BVewzPi8tRk1IFCmfPoW52G1GEAUcI2F6LmWzHIjUjrmCJvwo0L/APn9D
 MD6hdOagIGW1dq08RJe6p1qsm37yxY8=
X-Proofpoint-GUID: uJeK1rRZD3-xC94IzOvWEZOWYnyqFMn7
X-Authority-Analysis: v=2.4 cv=WrUb99fv c=1 sm=1 tr=0 ts=6a3d58c2 cx=c_pps
 a=JigUrrSO7vm3KiUpdjzzBg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
X-Proofpoint-ORIG-GUID: uJeK1rRZD3-xC94IzOvWEZOWYnyqFMn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250142
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 16:35:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20096

meta-ti / na / 20260625160659.29619-1-afd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v3 1/3] libdce: Runtime depend on IPU firmware not the other way around
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 25 Jun 2026 11:06:57 -0500
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 240f707c990e4699e88f9b292a38ac5d90203801

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 07bd4c181e2a400d4375ddad7a20fbba6578b133

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v3 1/3] libdce: Runtime depend on IPU firmware not the other way around
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 25 Jun 2026 11:06:57 -0500
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 240f707c990e4699e88f9b292a38ac5d90203801

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Suhaas Joshi <s-joshi@ti.com>
- Commit Subject: tfa: Update TF-A for K3 devices to 2.15 tag
- Commit SHA: 88ce8160ec6c5804820555e0bc29dba23059a4a1

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed




