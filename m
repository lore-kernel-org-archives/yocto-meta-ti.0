Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DF3C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:14:48 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11469.1784132081280262962
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 09:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=GVt/fkmE;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fNcwQRVj;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE31jR1111945;
	Wed, 15 Jul 2026 11:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=OwYwIoHd3IjWv
	wXMvK+81SBCOWX13yIZpabvUekRT2s=; b=GVt/fkmEAou2p3PtnAaKp5CPb2akr
	3dNJwzx48mQvQ7umjln5OeBiqv5GciMcRmv6d+XeXjO6cHPkCKB8XL0/tYBw+2OT
	3xLSbwxpY9t0ZnL1ghz47vPOrffFt+bzbOg8HicTaqezWbDZlKhneB9hQ9+nj+JZ
	5a7sxNJT8UuSpNBptW/l4UtnvlZ7Yw5HmRGYNlZ1DS4BmoZwYDS8R6irBfSFq7+k
	GU4/kOVXbq6kwamw9TRI7EJES73fmwLYWnaI4XuLbYDRONc+Ti2aWo0U6/VF6g7X
	myBNeQOHdMwRQhxL3zaSZKEdNy335cP1nNEcq9cS/BDAJ+dxl1xsxyMKA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fe9jb1uea-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:14:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZifkjoDVPi7NL0gvg7qe6GSqEF3K4lbPpZTm47ausbypqUrhVLJ0DvabJDFxDHrnZuoK0O+IcAZvQ60PfRdTJIcLbJ1VZ1+kWvrpj95B6Rl3isQEkK0Q8RPV3qXmYhrrPhtIqYALkRyqeUkIU6J9rRAjHkLl+t6b3uAyXTMex71TirVSf/5Z0hx6Bnl/FBcGdIfNmXhamSuZOr3RgyD0RgEbCT2k5++9DbR8MbFqF1idYsEAzhBYbUd/JMAyqfpYdQYee2mgao9DcniTX+reWBh48DWBFCDJ3+Nod+348ui6GrK7werJmwVJyk8rGEQB/+ePfxapj9XAmzDwNQ4h1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwYwIoHd3IjWvwXMvK+81SBCOWX13yIZpabvUekRT2s=;
 b=Rcl1av9XJqEZrT/Z93DwzuLMBwwsUNiLGW02A4op60aiErqcHegm7juYEH4UYvVNWcL3YaYEImAwf/YEjTd+6N9mABGjJJMZSQHGrYS4I6j/PIZvRvobZfedyFZsb8udnnkRzH/mb3mH+LvnwldBlJvPiClImd66tzUMPnkKc+te2GYJ4wTVZ/4X7EDTqQbx3XpspNPz/u4xzqAq5smKrzZ/I0cV59hOnUkNXPtnr1dmOT5IkFCSjHVz7oFnuCUSg8CNIqRJmvIcGSCeta9N8JG915olYU9a5axo/AYEYiW93m4yWLMDK1wyOPZS/MuO/OgT9++NC7+P6eHihUIE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwYwIoHd3IjWvwXMvK+81SBCOWX13yIZpabvUekRT2s=;
 b=fNcwQRVjFuwYjg5tb+ArK4QcyBoqB+m5GaaLjvtZgIQ0ig42UUFMsQPvYM1x0psiTqtPhRZQX/SxoMo/CnMvqZdsF3xVhVeAO4Uzdzio1n2vxb93M16tKZAEykyuummK4gAWsjIMTKfx7nPuzQCoEJKuajCxch5PR108G/gLj9U=
Received: from PH8P221CA0054.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::24)
 by IA1PR10MB6169.namprd10.prod.outlook.com (2603:10b6:208:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 16:14:34 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::12) by PH8P221CA0054.outlook.office365.com
 (2603:10b6:510:346::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 16:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 16:14:32 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 11:14:32 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 11:14:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 11:14:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66FGEW7v2855159;
	Wed, 15 Jul 2026 11:14:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wk2Fk-00000007ViI-1dgA;
	Wed, 15 Jul 2026 11:14:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH v2] u-boot-ti-mainline/next: Update git server
Date: Wed, 15 Jul 2026 11:14:32 -0500
Message-ID: <20260715161432.1790195-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|IA1PR10MB6169:EE_
X-MS-Office365-Filtering-Correlation-Id: 0744253e-58ec-42ca-8dec-08dee28c281c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JkJq6+ARa+CvP3FDR3BQEf1AAXWWo5YpeZ+vPb60NyFHS0RPEShB7GsRS9AbhRKnEmOxdrxfYNdeDbz53dtDpG2ljAQ1H0rH0BUms8kY2neynNokivilTAuQepohNJB4xIOUaoFbIv5lZOqFv3iKmXk6ZGan7c9aAP0qxWU6hgymbavOi139wkkHutGLdYaH5xj07UEYQiF1XxjiEMx//7IypZgx0pQPCisYvUE32YQBQEaWRm+gLQVSSgeylCg7GmNnIq0Hxmi6L4jC5E7fNCFfRGQNRSS8vN+0A1BjikYlOT8EkfYo2gniJWifvSv3dLRvkxbys5hkExBZA0QQtvKwHQvHw2cVFX3BXJRb0SAsdE/ejE1y526y4hTS52v+U3Prsx+ygYDyb13k/uk+tVyJokUFczQmjQCH2NNkvq92We1/WEpPQtEOPaRAG00H+5vycSfYjIsve+dh2UNczIhDVMGkorzOp6Fz9M98DYdfvtFxiaJahj7vOGSVVHOdb6ADW/MytZ90iTO1VZu3TgMZMRe0mTaIw2sxjpWpZ8jGMqP9CXKO+7AtOfYYHp9omR4saIbb3BSHLvPSUs200N5qEdmHHJmBfRidzGFIP4W+k3nxe31GUie5WVD7ZIAEhRWC4DyhDEcfdGBf1/D9mg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2Fu8CO3/ZKZq8Ef9xpe3bSFZYlT1roHaoNiiaLsS4DEP0AT8d5nSwPKbwpzMf8gGs/LpFQdw2rO/S9AcyqJs4RCwqsgCkY3BImpi/+vX0xyD8Ik55LR7sJ/rMaIla0RNNcRfLNYk7MxpObBHKd5TfT/uo+RKRgL9c1m3qjpecfe6990NMm7m7AfTBdxcIsb4srF1DY4d9T26aM6ZZo9oGwRfmVDlMjdLSuuW6inarzu193Wkymbwe0CRzm2B+Q5CDqQ5iMdcYk89NsN6ewDHGzASFtBVtUBOIWrq0hLBtec7piWscmvjOW7Yrt+zsSyOV7dw34Og9NF7JOcu7SpqhupLYNEEC86ZBeuJt9ibMrZjoEHYuq+KSYqKwsmjBmhC3civFbz1QvuUJSc+9UkPlWaYw9gTNF1+0hDRE6HH+b7GDh/7kXstGslULHJI6/91
X-Exchange-RoutingPolicyChecked: 
	Qn205p5TTmIaRBrhA2LLN5bqmsfE7SuMAIbV+7XtXralryqzeltE7gWnBUcP4Fm3LohSbXJobjYAQ3RnHfyI8BVPgXLrCQDHCz19k2+uE5zIxDiU5QqNiTVk0//aeAeIdXnOuqss1gls9UNV30OCftqZpr/Nh9pQJ+CjypY0hBNHFMpVyEJJLXf9NWEbUMM9z4Rzoy+hvzBfWAFNjwDZs+Lml8nfEQ/B8r867w5wY2hQL7AW3hzx63ngvKa5rL3iTKiQ+I9GsFoXCvhFp1OjMaFG9OKhbN9O01PItxzkcHh9ql11E/Ef5KYK9CZmLoYaTrZ8SqMGa/qQpN6/2J6Q/w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:14:32.8766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0744253e-58ec-42ca-8dec-08dee28c281c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6169
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE2MSBTYWx0ZWRfX8/5TNnsaLSZT
 XwqmMQQ5Fl3gvpA90VAh0uFVOMRSH5HP6wfVaEANS4f+9uG5frXcVD1+yiVUDChE3+vS+4rgY7n
 5mf6P+mTnBgQiF08DQuuK6GiYJWSrOfY1uqDpA9mDgomVowNdMVkIIr12LHE0CM70nGIw1CzR/P
 23kZHNo/aF2KRglejdSADp2CWHd4M/oWoXXLrkHvphbrRViDddA+fn6JiAnXOTdTH5RtvlBmCrD
 iLx2/IGvZJLeefbIAoLAKucToHqNlUlX35fV2aBPmyeRrblsll/LpEQ1fJgBMVqcVJUmRfr3eOl
 CxlPQvD71dQ11s8YSnzIpVM5dgmnHfThTG5pn0dFbRk9zLtazIV0FNHC/c9D0v675fjvZgSDdkz
 WTLcfoApUH525FZtKY2llTZjl9uOBKAniRZ4ltCYZjzeVopTd03tUm90fNHfSVwxI5WGEkPjQp/
 Rry1+i03X6X2q+g2Jmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE2MSBTYWx0ZWRfXwlBfwCIW65Kt
 xEiN32adQDGw/0H4v1BgGb+qc+JRj5Vbh/HYd71K2eSIBZ+PeDJvD28Qo3Uwx1VepNm2pawP8OX
 YoVasYGGbkuAdSwBn7PzItY5wfyQ0GI=
X-Proofpoint-GUID: 9to_Q0MHqNaf5I2JgR0ToZ9PFOetVD4r
X-Authority-Analysis: v=2.4 cv=ROqD2Yi+ c=1 sm=1 tr=0 ts=6a57b1ef cx=c_pps
 a=d2CTHFLGvf7JoJ8RUfZBgg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=1VxDqnHFAAAA:8 a=sozttTNsAAAA:8 a=j48J-7TvnIoRcNv8OkAA:9
 a=aZ5uHUMKh6B-zo3GvD48:22
X-Proofpoint-ORIG-GUID: 9to_Q0MHqNaf5I2JgR0ToZ9PFOetVD4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150161
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jul 2026 16:14:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20147

The u-boot project has moved to a new official git repository server [1] for
all of their work.

[1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/2a6ca4ad04e64488ac41c3683cacd44173a96d24

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Needed to update the next branch since it changed in the move as well.

 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 03fd6193..2daf86f9 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -4,6 +4,6 @@ SUMMARY = "Mainline U-Boot for TI devices"
 
 PV = "2026.04"
 
-UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
+UBOOT_GIT_URI = "git://git.u-boot-project.org/u-boot/u-boot.git"
 
 SRCREV_uboot = "88dc2788777babfd6322fa655df549a019aa1e69"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
index 9bdedfa3..4d5f4a38 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
@@ -2,4 +2,4 @@ require u-boot-ti-mainline_git.bb
 
 SUMMARY = "U-Boot master-next for TI devices"
 
-BRANCH = "master-next"
+BRANCH = "next"
-- 
2.43.0


