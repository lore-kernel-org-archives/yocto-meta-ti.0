Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA73CA6001
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:18 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.313.1791304214673275419
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Oct 2026 09:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=K5s6dZnU;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=wZ3fmGM6;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 696ECwMv2731003;
	Tue, 6 Oct 2026 11:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=i3MCifokPxypQ
	5ZOKUNGuohfTe9ZMFKLW2zCAOdqkng=; b=K5s6dZnUPEIRuRD8PmSNBqkcniMY+
	5EMJyH8r5OhrL5YfDvjeURgLt2c9udaHuf23Q7rRR273Cb7lwRCe5Kwng2nVxJo6
	rraWHsvGbCl1vYdC5KtI6KKi/iTTkN677NnEeEk83JYch8+AhGqDVvLujVi8Bkuu
	h3IkEOoqWUjImlrnnLnRdw6NvHEQMIGIOfiZFSDrgZCGHAzc0Z2tVh6d+WO2vSc4
	lVYBNdRrCYu4T3gsxgHT/sejDhKuP+E3dRWqHZ5Ag4lUJOjLtjao3MHnEatl0ib8
	92StrK+T6c7Wx/SHNPbICrVJTlCcM369VqjyzoQILP/2VXRPwgthbzz/g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h4w60apxn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 11:30:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flKBUDwxuQuKWVJhT7Mp6wMo/tr20kH6ltSN3xIbfXAYZvBCic6eCqayINRD0b+Z0RJIaGGd5bpOCxrNSevB0hKJgs0AQxFSzjY9Ak//m71I1VxTGbJ7SdI//2A1UC+eHItraXm1yKNg/Nwo8gc8pGzX1CXtGWf3CKc/iRCHw6SjFdIN8gWIXto4xT57t/Ep3Ajrk++wiITxDBquxAVlg46N8CuxfOUD0lHP55Fhz9Ef+3BzU7V7SruvSbPTZxN8JmSkWzaP6zoAFehd6iDYRCy6aHgVe2ocnii4Sbepg+XIYqjMDf+BReL8WluKaK9n4Iu9bvW72zCSzkSXLTKPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3MCifokPxypQ5ZOKUNGuohfTe9ZMFKLW2zCAOdqkng=;
 b=w/1ozTzIkVNsJQlRTu/qv0KuXLfL8dP+8UtLaYq5HFLWfgG1fBzFW+2+EeP8CGiV2SbqjMsNesI/bBfwvSlRO6sjwWMyz3hroJxFO9b4Wsb3LYPgqacqmUg0IrEFsJ0cuFJ2vSrgJtVqYiYtHCeku686iHeUElZExJkD+ejDfXPWUO7jXYa+03VTVB4v6T6RUsNIxLbou/pJIUYKsYrggmiqEgazpx4D4YG8hYhbRyDPdYKDcajXXgdcb6bMvscIvOOuVulrdniQ7gh2VPwfLFriP5S/pLZ8fKMMZzpb2lTgqNl7AzEnMg+hkihagyf79Ak7tQUM1HBOE5TNBtBrzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3MCifokPxypQ5ZOKUNGuohfTe9ZMFKLW2zCAOdqkng=;
 b=wZ3fmGM6PQIafOKkmKQamYPYxFB2knqLoUf/OCzxHTNLvLM65Pq+ebT+5LFl7HCnZDzynrANuyQk+XFIwf5c2DHpiEepCR3qV4KUuVM3pWNF0gkuhus5UG2YUxCId6xxWQreEZmP62sPmQ00QhMj9yqYMfBFzTYTf4IJblSYROb117PcGx/B9m0A6C+ihVmjKfL2TldFDu7ixij/RatLrmRm7gRbwq/40n6K7EoPw15Pb84L1CtMRzVVKBhdGbaIH0ckm5c3ZjYU0zqwqAvuvierIkzQLhCEzxqEYjfcPEOem5bgkhoxutQ7L5PCE87mmkbin4eXdnNHIzhn3QgmWA==
Received: from DSSP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::9) by
 MN0PR10MB5983.namprd10.prod.outlook.com (2603:10b6:208:3c9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14; Tue, 6 Oct 2026 16:30:06 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:8:3d3:cafe::1b) by DSSP220CA0010.outlook.office365.com
 (2603:10b6:8:3d3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 16:30:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 16:30:05 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 6 Oct
 2026 11:29:30 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 6 Oct
 2026 11:29:30 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 6 Oct 2026 11:29:30 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 696GTUgC1802120;
	Tue, 6 Oct 2026 11:29:30 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 98A882A61; Tue,  6 Oct 2026 11:29:29 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202610060906
Date: Tue, 6 Oct 2026 11:29:29 -0500
Message-ID: <20261006162929.329848-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|MN0PR10MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: c06a840a-11d6-4a61-ef09-08df23c71490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	DYjapuLe2yKjJtrMl8NDy96AXfm7xosACmlUMq7+0ne7mVIjSqW0h15JmVqWmg2ieEiVer5ZXC4VPbMYXNqrQhc9Tf2UtG4yLudVn0f7nvIu3/y5GMUabJ3JigPsRYZlxG8VrjRs9l7v4oPiyNxW2NesbBhVOB7gcsfT+kxSOcVHcCxYPm65OupsIz/FAs/cRrz4SnXyKQ8R2TYrrdIGfz4C18mQWFwghqnBQ7SY/i4xOA/xEzhgkZmpjhKP01q6ChpA5bwFAWBBSSPW6v2bcCSpH1siHYhH4Mn7MlQ/x/MfVBHpl9/88rI0fTy7ZJBOzhyVnMPWsJgFt0pPWmStSAXb3nvNJq91BLllREczjoDoa8HqFQM6ZAkREg6a6widKoIDhRXKxV4IK5GnX1e7ISDOEgNcgNsIyO9AT9k1iRTkttfYRVp7zpz0MUV4GF7diuFTN/ctRZNBiUPFWKclgecudn2TCJtj6oPNqjOdP1kb2caJgsJVsEz92+X0KIjiW2MD1szXXefTdbaFEeFbPg/qqvaTt3RPYgGGSBhikNlxPG2lob2Kx/G9HtSs8DtZiFiViwIsh4ae887cl6xPxGLj1glAiPaV0Pczib/DGG6+tDQEOBJkXGCeC53BuCY6aD/V0RmRH7KxmYcYplJWceZtzJNMFNlt6feEG0adVeVYnQbIVRgr4K2/li1/hkyGkXLl3uBbyVTI2Qh9coCUeg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UDHZ14WSRjdHsJbqEzG4dekaop8npXNecOR77O5BQg3BUW4QC2PUpUiy5FZTyxa4EdwSB5ZIGcSGXJ1WCS6mt8L+mYBWNtLv9en+gr8EK1Q3E0/yeI1ehLAV6xEjeCCdt8HAw9lE45GxWEYNxLZdQPMhlTpsPd/NPV4MSStp1sY3tJnIamlUbdg/plrMpoF+9FpyuE0wP0TosGr0V4AXUoE1cqQ/ny8FT1HqRUeyV67l7dREj6eeTr3Jcsv3HV8KGfN35AvspEnYbAZ5HHFjKqvfIUme0C/GQ5R+RCa+fRxdi9B8vfxtuezcN2CfeBlrshs4SXCEIXEIXc51jJaQL7w1WgAdgeJeHAPYWT7qOhoM7diZ0LHNNeSIGst3SUYJFQ3NtOQtlDLt0o+vKJvFtZYu27WC5CO1lXK/DeBSvLg+8RQoaP7lVD2wpNX10WKr
X-Exchange-RoutingPolicyChecked: 
	o2RpkUqGnNLPZfpucJtDe+EYMqLle5kBbgS1K+q3DSA2PgS2Ev5IIQW53h+XlL8ajICrA2+Osh8tbV1gWsR3cvWEmqTuw6XR4+HMiZMl0EOi/hqCz8payuR1BXsQy4ageX+GmIDQAmbdRtOxqWnby+jpSc07L/zNc7YmXoHFHEawm5Dljv7YGv7tXNQbeGm2DYAgbcnVOUTYoiwHDpTDKdTnEbqQJ83zHKcrMbdloQUD+z6H8OGqv6xSPscl3s4JCwBtxIDLhYOdt843KAyhFRQkNMFPTBpBpbtiXecxtb3qKslG0ntvF+7c6ty4kcBJ8AXtrNlO5wXSH6ripDkQyw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 16:30:05.9474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c06a840a-11d6-4a61-ef09-08df23c71490
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5983
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA2NSBTYWx0ZWRfX0FXWDajjSw6l
 EvoWyiWnKSsoAM66uxT4QashVMJgIK4pLECCuZGcf7GjdO/WVHA+KZ2GwV5VlmoSrWC1gB9Vp8k
 FbsPaJlXvTeIsXB8WZJdT6fUJKXE8jws/y9XrE5J2KLB3OH7D+GK14jd1iYBoaMlWiHjwgnzDfc
 1l2ZUOZaYc5nV01Z2N4QkCyV64oN9qWiaXRvNOP31OiquirNYts6mAcHeCsO5Rw1+D9/ZFrWk2V
 1X49LB7MiOEAg99xcRXgJbquIPpagWLg0m8u4cPnQ7F9a+ezdCPUnm+NfdOzcr2BZKWeBLyixSE
 aKi3csss8iuYxXuCONb+pTR2GT72ISD4VibRIjikLK4ZwxEHmuw2kVL5lvqoLJgmalJ7Qye8xqp
 drp5goRJ02YPWaMZepfh15OY0+6xgYy2aNtMK3DxgTAR+g5fDJKAbjd/BYGpPb42p4uKXeZ2xp1
 t/0qH1Ggpr7pdoajZxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA2NSBTYWx0ZWRfX4YayPC60EYuK
 5PaCulItvwzFp/mHpiA7Ho3bCM5+1qgHDdhuO2KqQFMDEGK8yM2GjjPxERK8u+RWZYGyRX7poyX
 zRSPM3PrZiAxpNbrnYuaXOQ12VRHknc=
X-Proofpoint-GUID: dhGm9yKe56fgZNs24NXnh1UhUu0m02Az
X-Authority-Analysis: v=2.4 cv=L5WI0OT8 c=1 sm=1 tr=0 ts=6ac52214 cx=c_pps
 a=e/sPstj0vE6DIEdYTBOJlw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=5MlU3Q7diwjvPwuEeEgA:9
X-Proofpoint-ORIG-GUID: dhGm9yKe56fgZNs24NXnh1UhUu0m02Az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060065
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Oct 2026 16:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20438

Updated the value(s) for:
  linux-ti-staging_6.12: SRCREV

Changelogs:
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=ca77f7291a4f1c5f6927fee4e47282b03a39ebfd..1b14f5313a97da1edd4e4d92036b727ea267ef5f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index b39b4511..29dad030 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "ca77f7291a4f1c5f6927fee4e47282b03a39ebfd"
+SRCREV ?= "1b14f5313a97da1edd4e4d92036b727ea267ef5f"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
-- 
2.43.5


