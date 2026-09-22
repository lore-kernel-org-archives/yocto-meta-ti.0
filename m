Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB13C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 14:44:30 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11963.1790088266016469698
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 07:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=L4Sn08y6;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=jlCGGlpp;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPXV42082035;
	Tue, 22 Sep 2026 09:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Jye/mOMbdgMNr
	u0OfyE2K/ZXh+3wlwXCOhCYmQDeTyU=; b=L4Sn08y6F96mL/BPbQq/uOUmoadYm
	Pgbh+9b7x2UwHwm4y7gq6sjNtHcVLB29Gxr5AEQa67iq3qGkoK/Ff/8d63sd8ozo
	CArwIHTv7UzzhvRaaChvkwjMgXZBwmUWr2EBEJQr896qNwElEw3P5/l3q50wH2gN
	KLp79uR+k3avxoq/flrPYaOhERAFP/YyTgHeRNxpoxdJHGm4blfvv0/j0OWi9uaD
	4GxboE6VHcR23AcjxNQAhV/A4DyryPMpB7z8IWIJDus90Bxb4OHRckFBTY/ZNUcl
	78cqtWnGvzw87FQLbgZNsSaxvx14+v69ZPpMxdOKoiqj3eyuyWgOJzGZg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm3qcq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:44:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DASWpJGNuKZYdfpytkfjPyZxnSc8FK/Q/VK4SJhTQvJR+I3dLSPbhFmIfEmYRnSInI/KL1Si7Xo4QVQRgrH2D15uhmJoCVEVYfpAMij1mIFF05sa9RfltkiUJ5dKLvjgQ+P/WhYD2YNH9azgICKtL5qRs14u7Cl6v09NmGXcm/Hs1zoexoeRuajV5U5z7t9LInDPvbtQM/R4J1U5/pNBq+CP0pchRAp2jIZetrTaWwYpFTKIYC2J8xva0eU0uXqsE2DbDipqMDewXsMsmbgHisnADRwhEbZKOD/ZgZ6Ovbbe5qLvWmwaNYN42pbZApS25vz5XiUOHxceXkP2/W2K+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jye/mOMbdgMNru0OfyE2K/ZXh+3wlwXCOhCYmQDeTyU=;
 b=LSNOckCi2O0BY301E0QXOZX9zUexFTIRFJejKhF2ASVwuQevG8Ige0YjWlelJ6/M7wPuZa6aXHKpNFDQYYtRp96fFwHtfeIzu04gd69iPSh4hS/eVSOKjuXM/UKf3FEQ78/Q0yb7/UZsp+IMBNWzryEmBjotDTdRf+Lj8y0ZeWC02xeo8oWgcGIq2QFlRBmBgTf5uTz0jevKo+tw3/OrwDYdZEE2zkeDIr7+EnslawrHHJCVqtEaoz+2PgrU9/knYvFCVAHlOdeWthdQLZKk2BslKWYuzC1dKcvBYdM+VuBIX9jIZGTjv71fpBbJqng5HC08XZiG3iMRWuvYN1kWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jye/mOMbdgMNru0OfyE2K/ZXh+3wlwXCOhCYmQDeTyU=;
 b=jlCGGlppEqau1MC1PrWauA9wXIhdSld46pcUrcd5HZ2kmXLq1Ewpfrg0YVV7RxyndUMLP2YLuUEayhkD8KXUqKhz8PQO0DSBJBA8V9ebHtrbBGjSavkwOLQ2twqBHYz0E0rW506+5DPmX2v06VFw81uuLF0yvc3OBhcg2bUh604=
Received: from CYZPR10CA0015.namprd10.prod.outlook.com (2603:10b6:930:8a::27)
 by CY5PR10MB6189.namprd10.prod.outlook.com (2603:10b6:930:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:44:14 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:930:8a:cafe::50) by CYZPR10CA0015.outlook.office365.com
 (2603:10b6:930:8a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 14:44:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:44:13 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:43:47 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:43:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 09:43:47 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MEhlS41066750;
	Tue, 22 Sep 2026 09:43:47 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x91il-00000003svZ-1oHH;
	Tue, 22 Sep 2026 09:43:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] kernel-selftest: Disable upstream patches
Date: Tue, 22 Sep 2026 09:43:47 -0500
Message-ID: <20260922144347.926114-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|CY5PR10MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 829a8726-5585-407d-0cbf-08df18b7f82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Qw00OWqE317ziWW/ZLchApQm1cKohJ+jYfnxaWIatoerVtxXHw1qNv+gpZeH9xWJXH3OXrGm6Tn2ZgoDLXylvkuje18iL2fe6WOKR6ssVsKUHO1Oulr8k7VnX6OiHuf1T07QpOBpjyN0AYsdiKuEf9BaMT1aKMye1ojuOFIqJif/cONsw1zoN7oUnTXpcr0CMbvz5xHX926k1TcsusWEWD64K+viNrR3ZEl66E6ERncq2tOEha7qSKcNutnCMGD6ldkvbiPUZ6S5eP6jIhIMmPbriciMnYPhSVi35oNnMQViAFSqd1fY+rqWgpkuwmS0nEtMt5q+BR2SaOftdGcTkK3w9/dAT/JsoibQMG1SDuzSssKMr+vyFc+kSgYCmpMVQBf51ml5EeRNUjLmvI3luYWdFQoJoCIAzEmwIEode/6ySwTCDN91LXR3fbjTGW7KeY/obiusv2Od92FF0NcQf7yNQhrv3RzpNRxgPeKCbeh5W+WIetGC4rK9dUsoDahXETxn5qir+FdBh952VytlSEWkWfS7O09zORCcUF2mWhIDCGXEwTzAWz0Jd2dSB8wn8EsumFGLHFpAPddlzUbWk5yJeh6eUK6WRKnGJ6DHK4u6Jc/NbUy+5LczI8kmyEVJwvdOCirEb7q8ptO4qLxVMnv7rcwCa/0E7HV2/xJpBL8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5IKiFRDF+CZqD6xjLkBqcZlRS9zixE2DCRdLrWq6BzwDkzB7Xk5DgkRKVsfL3Usjx2OnpN28GjElwQXZlTJ+69ry4dsWfOjUH5LGmdmQPx98qu37nzuY5Tue4ZtJRJ2TPBbpGOpDGX4HsgArQseLxDDQEZktSbvN5hDY3RoejodkWeb1w3fFQ0iiK7kEciLtPFFS10RYU4ep0SMsh/vgeBRYF1qFLv8xII0B2zcBe8bL21ZSa5AdWLzUZ7ab/ShMf6DDjARBkV7p928rCSgukf8ooGz1XGPfRH+AwpashcL69Hsogp4zgMxWujVUJI0KT5rqOC5LF6AHHFgWWJ5gDQTBib1UNGdpQAhdBKRrz0jdsrb8sFsUYd/0RjURKmEVBDBtKGiMzc1cr8v232ppZcsk1U1IgMdOCHAAouJxIhQkgKtTJoUiF1Zc7XaCHdaO
X-Exchange-RoutingPolicyChecked: 
	quAqbgT6nhJnM+n+0nsyhIlmP/L52tpBb7p8aAULKW40SY7xuX25XvK9uKviyudou36SkitorRsied+xKSBFT6l6kEhROfL0jWFkC1iBaL4GzHWeOrqmnqbq1MmLdIiXHtdNvqqLjQqR3fqvPmZbflCR8vSzfOpluilVCHASWIGt1pZg+azK1vWB576pDB0APZNwxE4rTenA6z5s/gLmccT5ydfvDMRFsllndJkjSwQQOS+FBHvs0GWscjbhXnd3xYb7o9SrU8DinXFtn0Obojgoe/ko3D8kS6pYHmAigev/gNlwPcWbqpwJyTa57MHVOhjvhUnBK2RMABsPV5lNMQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:44:13.0454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 829a8726-5585-407d-0cbf-08df18b7f82e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6189
X-Proofpoint-ORIG-GUID: tJe9qDsG47uahWWcFRpjVzXx0XdvBlUr
X-Proofpoint-GUID: tJe9qDsG47uahWWcFRpjVzXx0XdvBlUr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxNCBTYWx0ZWRfX4sTCIMnWslG2
 BlyMNpaKjMMvXovQj+0Igx9+v7CoijwCzL5gS5/nNHGvzQCF1DUaMRo8Ax9OgoJ4JwNdrK6RLOz
 Tn2NFf9GKOQkbW9YyvWaLjXBU6mwp+suOpSdMg+Oy3xKyCK29OgKeV8kKtwm37QNn4DARijLHni
 fJz1kZ9ATAH0ghAv5gWhGoJGzYiQ1D2vwPvv/bpvWHDqNYUlCwARPh3gOA0W7/FPAYeZE9XFpM8
 vJjCqoOgD3a7SiI4z0blJrCgpaFcxceS9+CDQ6vcBycy42os3D8+GSKXO2vhfP2HtO55jHxMS3y
 8aWtjLXEIrZzauyMHniCSmYd14OCQZn6jN8QcEqp82YAokPeSG4LHxEYucTuhEQeWVN9+jOjSrS
 xizhgnzFPVDG8ifM2aFc1WsmXIOZxAt1KnQ1s+QjFUEiWQ+renUO1teT7/fVJN9B76SJpm5wSXz
 0NR9QSafkJDrQe4RRbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxNCBTYWx0ZWRfX1qFTfOQ0cdod
 qzABIC4mCRs2OPSbXk4tzcKUucVepqsQwSbCZKbX4ZSMyNVfh43PhTR6tPQKzagy08UA1upxuWi
 jN1nfNTHM+Yt/7wwyU17VYMEI9DqPwg=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab29447 cx=c_pps
 a=jDwMdcx0fGNsu9pFyB9b3w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=HmCJBz3T52IHBOaQsS0A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220214
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 14:44:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20391

A recent commit in meta-openembedded [1] added a number of patches to
fix testing issues, but those patches only apply to the latest 7.2
kernel.  Since we have our own vendor kernel and support multiple older
versions, we need to disable the patches for kernels that they will not
apply to.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=11a9324c8449a8567461a7914aa5c7a592de3f45

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../kernel-selftest/kernel-selftest-ti.inc       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
index bae5b7ab..e393b39f 100644
--- a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
+++ b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
@@ -51,3 +51,19 @@ TEST_LIST:append:bsp-ti-6_18 = " \
 "
 
 INSANE_SKIP:${PN} += "staticdev textrel"
+
+SRC_URI:remove:bsp-ti-6_6 = "\
+    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
+    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
+    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+"
+SRC_URI:remove:bsp-ti-6_12 = "\
+    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
+    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
+    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+"
+SRC_URI:remove:bsp-ti-6_18 = "\
+    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
+    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
+    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+"
-- 
2.43.0


