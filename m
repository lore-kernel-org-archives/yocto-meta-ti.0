Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0122C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 15:03:10 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12445.1790089385873392157
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 08:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=A/FIq421;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=NwR/EykG;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEk5av2473335;
	Tue, 22 Sep 2026 10:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=sSP6bjFcaokT/uW8/ipAhGJvOZSbCexjctMrZliIJ
	kQ=; b=A/FIq421q4a9mN5fI3NE/y4ngjrw1cBlWJ0dydGzag+gJm1s+ezRfZdbJ
	CgHIgmd2LU5YqV/YRjj1fxbI994BBzPOFeaM3nzBOZqcdUXxxAjFJjp/56yU/B0u
	rX5Oz76g1DPueiQDU1SbtoZJkayV+Gk/2X4tCrragi1WDy4I6ooq5d62+LyK9L4F
	ALA/Efkbf8WtLaEJNyISr9YvRb0cfZ+ZcDQ9ornMF8IWUUSjWnq9Y9X1qUKL+UHp
	h9CiCsobDbMOOY9L6u1m1wsyEybyQHs7zEFV/QhRBMqrWXUUqCApHrBJO9uEvpWG
	xINh2/GxxAZLGg/4j3go1FSWsto6w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012023.outbound.protection.outlook.com [40.93.195.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm3v16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 10:03:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnd0mAmzO3Pvc5MMMlvqCok00P268gG/DpKV5jTq1VgmD6+pUPqaOmnCps2ZzoZRjs/EXEAuy0rxfnOlnwMwq+SJDSVPfSk4LnQsiMi0d8SXMlFbWySWOXxA4wFsW6Qtpvlg8q6Xbsu0GsKJup6VDVvkjjFWr+wFre2G6hCKPBpML38UFq6g9T4t8y9f4Cb0ed8rX0uVyRYWblMx0XAwONfUAGnaI4LEOmqJbEtqPzcblj6ZJqcCmYcAMwe5KImYHEP8JGU7wEVNhaDoQaGv2UHMp5IHSn/eECeTBvk1SISlRwWFAC74zQJsgVZvAh7fFrsyjHlu5mf6ysXD/fIL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSP6bjFcaokT/uW8/ipAhGJvOZSbCexjctMrZliIJkQ=;
 b=Os7G1Bjg35uYCQ5VdqCZ93OX/M5hw2eD0y3Ao7hdW0sSqF6qbCO/kqfWeHVtkDt6/jTLO32IwWYVM2q2gLcCDdlbE33v1zwnigb2HR83K1e9jBMajuW0cnStQzwANoRg3GDklW3uzzdlTbiTBQzzdSkZH0x3LVDj3RLi2sMDNUplKnm6Fe6+gXsCoLQUDvABBEDlU3VFoQ0REEODBGQN/FzckPraNFUOtVEJRdrBqvwBxPUJbgjxy86tvtJrgUYNOvV1ukmVen5B1HYA1x3HftRJCjZDaFsOfVCwy2mNfMLaDrXMbrh+0fRj5KX6tEZP9+82/HSWT4eyiH+SOzNJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSP6bjFcaokT/uW8/ipAhGJvOZSbCexjctMrZliIJkQ=;
 b=NwR/EykGmO9/fQzV6YdZ2bx2vmPG6ideqxki3BO11Tim7gXLBLqGrmQnELj6DDR6cDU6gzaJu3UVF09jfpP+D62euJh+jIxLKEma210h8x+vZlYYxwkl3Qe+2AKS6U9qYlUO1KmjCY95AlJ2nezVnZuNkCakRCp+KTN0LDWwbkx+6VC+2LbQSDyv3lz97hShd7C5xJIAaeylcwmUFZP1T1yu6uWzt2/txTCFaXemCL1EYICZPWd37VRRuOp1NCkHaFijud9bZ7jU95JX/P+nkrzecn0t2OQuB2r6C8F9bwY84jM0kkNEtqa1VAVvsYlY430yjujq4NsI/4KSraMoKA==
Received: from BL1PR13CA0253.namprd13.prod.outlook.com (2603:10b6:208:2ba::18)
 by CH0PR10MB4937.namprd10.prod.outlook.com (2603:10b6:610:c5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 15:02:56 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:2ba:cafe::3d) by BL1PR13CA0253.outlook.office365.com
 (2603:10b6:208:2ba::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 15:02:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Tue, 22 Sep 2026 15:02:53 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 10:02:02 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 10:02:02 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 10:02:02 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MF229S1616590;
	Tue, 22 Sep 2026 10:02:02 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id A83322C86; Tue, 22 Sep 2026 10:02:01 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] kernel-selftest: Disable upstream patches
Date: Tue, 22 Sep 2026 10:02:01 -0500
Message-ID: <20260922150201.1519758-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260922144347.926114-1-reatmon@ti.com>
References: <20260922144347.926114-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|CH0PR10MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3bebda-39e9-4064-3bb9-08df18ba944d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	0Vcbo7H4bmR8vvBRjtdEqD5CUUyTmF/JFxFtLE0zUOwlt3M1nsiU7pRrkrMxJVvO6vCfJN8Aj0ob5pnMJ6b32Qq/iwSl+p/AihbmShAQsOrAgdkln5HqM1CcUSWVlXzzd4LWBeGBPHkgueE7pe22W6Wd4Sm/4D6e7g18a7PVZIixgLs9zwuVj7/VjsVEP10n4cbgvq66+w+rClE9IypEJwxoYnFp49goluQhFOtLLKDlE6WwW53st8V1QNwDV3jVqiXh/lTpViM994a57AWOZz79Hk+y/NsOPpbFtDZrEcOePbClRtg1sYShU4QWgMUwhCDFHcZteQr9wno5SUUWe9Z9SpwPkgHkC0MC38UqSmBzahdbPN7+TaKG+hCCu0VkHaG1qsBGUJd9u+mmLivD2NsuOecYavGZOxOb6XTzRrHB2FCHOUkrV11RMAyLiw/v+CbvLPh6wDJt55ATTHB962O99MwLh7r7xyOu1g2GrLX4yMS5rlGcDN43qwbcoasrYtl7Gl+yUp4G9OfGG2IYApHOV3cRWuezfWkCn53aef1ySyfkMh7qjaNSEUuBBisXboqbetyJ9/wsGOcjUQ9b7wjOPZL7wadjnMMMJy4cMHpHLBeBzKVHfrcSOH7EQikybrLZiqPKUn58UTNNi9L9P3WB3xQf+c4dKMXDy4BwidqdYmDhJGhXBl7LyAbSvPID9/d3H1p0BD1Y+fjxlmKYPQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JHl2LOiVl2ZOuEqpGcl6D8aWkz2dDy3Gp0C61Jgcg9jYkl4M6Yc09trNgIylX99Hbp8Xp8ZQ115y4JxoBGGw7ssDLJkpKjHkeZma9xi2QNioYvwPLzbyrxk15ObHEzg4TB0maPuS+zY4S3+y2giEE9Ob9sNgyKBMTpRYG8GsWvFmbsmJKJ8iWeCSOVh0nvbQuZ1M1aMFys0+5I3s0pQdMP1e/mcLOmSM9ZUw/W4GhRGrdmSgwyaEnmGV9JO5u2fbJlkB85iMwnFI5TP/sPNa12DTSMIZC/8QZ2OwdozdsxsBQa9UVoqO5GU2yUg1skZ1hiZWHxcoQCHIFRe1YLkEMkRYX57PR+pRF/xCM402uWTnQGBg1N1byLSeDtKZLOLfe6Y2ZmCfiwEenrd4VyIdKqdM7chwjWWkK0MQNc0VmfKhIZ+d1F8smdCBegZ0Y9D7
X-Exchange-RoutingPolicyChecked: 
	bsRlJKS0l6v89eYFLlx3vxtlEqVavGYBneNxeiuVu9uOzaux/RdJUDjOaOxALhA9WVJEt9y5zmCuDfCLNQ6cwAfDV88FfLoMAoiZtjE1wgXQ1Uuf0r2JhXSl+E8R8mCIHzHcGEBY4MQnwCmxH/33hwQuKb6CCmLg/Q7y8U4fr+TkeELxC56lMdygxDR0Jzcy8GfY662XVDHTBr7wgLmpe9wZidc6GEdA9kL9txBZaqiFUM1cHmpqCahY192potloHYJbGykKO1we3UkZl077+R9KxSmv9TvXwCXvWGWlSAGPAP2Wac7b0Y0jbYioJCYzejgNU6QsVGCI1hgRRkgOeA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:02:53.9817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3bebda-39e9-4064-3bb9-08df18ba944d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4937
X-Proofpoint-ORIG-GUID: lv1w1EX7Za7HJFyVmDLXwmuBT9YNgicd
X-Proofpoint-GUID: lv1w1EX7Za7HJFyVmDLXwmuBT9YNgicd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX7q1NkjEubWvp
 myZELjfY1iDQVD6K5QObpz1GA6tQxLZotVf/UYGaIYw5fy5v6RdbiFm6n7+KwouRCO3K00JVzEX
 FpMOagcKIHE8lw0sfTbqTRe1tL1hqEpQzbh3hPDyLAEAjAznKLAFyPTjKSFzlE+N771NqG33m41
 m7F9Z3J0MPN0Ke6lTro7IIKTDdKyGTWvL6q9vDG16slpHWgcdQ8et+A+L9zxYCsyZGlRuYoAZzv
 PzgvqrcI/veQpstWvmT0eqtQ3R/CwgV9e+JfO1emqt+ANyDHFAKF3R3NMmyVt//dWf/EQm+G7VC
 /ly5uSCJYcrDGCShRc3+Wl01ln7bEeeh27qhOB9AOUXR/3gxqpOH4BP+U8kP3jVOugMRCAP2zVA
 ohYZeZydRPmcvB/HmI9cER2y6r+v9Ijz/gI5M5VpxWeLgzNKlh6JxSFm4LzNKYS6tNI4Za3F4I2
 cL/idgDP46icyOtHJ4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfXw6ovqTx62SP0
 W1SKBhKwPqrE/yByyngZ+NduLVoDthEcWVCRJ7cQYRwYndRF3eSHwbBuL9cIci+MCMNbAr6eEE2
 iyLt0b/0G9udYDc3UVD96yPqjZ8NBaY=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab298a5 cx=c_pps
 a=CfFGriBY15yWSKnMtEY+og==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=zok6NTIosdAf9pwZiLIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220219
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 15:03:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20392

meta-ti / na / 20260922144347.926114-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] kernel-selftest: Disable upstream patches
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 22 Sep 2026 09:43:47 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ffe2464872ba5b78b0e8fa373742077e1153bd54

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Commit SHA: 64a48b4c9a61d39888fd2d410e3a7bfecae76072

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed




