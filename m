Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF80C98317
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 13:51:15 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8307.1790257870815974458
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 06:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BY7ilTnO;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ut722pQW;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68OC65qm537078;
	Thu, 24 Sep 2026 08:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=NSNkEKmxK5L6i
	ozLG2gWYWkBdBlsKlWbwAfnlobKe2w=; b=BY7ilTnOiOmBzJuNqm2kFWt7iCIl4
	cEBPtB3k9RxARI3RpGsht+GgsoyjRmOsDI+JPZWQYAlMS2iEGmSOPa3Ku7vIExBR
	2EShZKN1GKE+trTs3ZzCVZwsgS7+kHAbFaht0fqh416txHCxxgoXoMNDwyZVxlGn
	habArwToWuYbZKWaiPNgrdN17ZWwclhYWwn29OWtslwBR+zBSNGilmR7/ZjN7E7p
	MgEaRM+XG3lLF0EqEyoM+g7rxHlDBeB4Un9aY5sZ1+3bpfrWcPmCS9vTLA5QlWP9
	dwVJHBOUXdG/tmTUNKhASR93SrEOo+E/jyQ6AqhT1EKTqjfrmKLu0Kf8Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gw13themu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 08:51:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1JbuDscQplpr1mD7ookNdZhuZv6MKETiByyz2UZYbnFfFxLoT1Svf1FC6Nwxbfislv855yDdupMazDgfW1LPr5QGu0HDxVPaWirWqlpTDF6tDEp/iB1MdoYuyt1SniPrSBP22X5W603w85g+XeU6wp/j1eTILdfyegrMXijW4gW0C2GF+DTar4EgPjOYMf61h/fKrxpLggxLH+W1WNmRoz8YP4KpPSJiQO8xGnxM2N98mI/GSCdtU5FZLOcuWipBVn1I4QBEtcGSmnt/WdetbSx1uvaJkt9hU0fOU1gmhYwIxoxSGRYJTCamYzbI2+LdRGdeNuJ7jRlMF2edhZ3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSNkEKmxK5L6iozLG2gWYWkBdBlsKlWbwAfnlobKe2w=;
 b=bXWzQJFvu0K1GeeBxXSzG3gmQBxS3UCTBkwpJgSM6eaTlqxGvBesCzmSpK+0JEe7ZPECquSnWUlKrJGSs8LNNi1PfkjNsTDnXnJW/8x6f+fWyupTaMy2tjFjpYwL2vrErxnMlw3O8KopMeF1ILkf8K3fWStqOlPDyE2nghTXVWVz4WbvFX5STCg/rHj+gEpQhjFVY4ZbSNK9W8eZ8sEn8bAmPmZOOBzETsEbIUobFPgUBEJk72fK8RKdz67ZZH7VNa9nIduXNDVPOWqkQfK3fed8nzki2UgKhUF2+eqtRkfDoFFuY0cKcKMVYlTsNR5zwIyEuGIQGMuOa/DI3C+hQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSNkEKmxK5L6iozLG2gWYWkBdBlsKlWbwAfnlobKe2w=;
 b=ut722pQW+/V/5yrDUtSnY+2yH1kMG1vqi//oX2rgK8zWaWkR74LRKGkWyjNTbsA25dQQy9Ch2AJAsbgxDeqHVu1ujTDDSHyFyeGmKTk7hCoiZURJcBY35Ry4reGsKvunKwLEv14W+EyQIdrqshJXYaRILmgI6X84k9o4jEzHRIU=
Received: from IA1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::17)
 by DM3PPF2867093BF.namprd10.prod.outlook.com (2603:10b6:f:fc00::c13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Thu, 24 Sep
 2026 13:51:05 +0000
Received: from BN2PEPF0000A994.namprd04.prod.outlook.com
 (2603:10b6:208:461:cafe::67) by IA1P220CA0007.outlook.office365.com
 (2603:10b6:208:461::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 13:51:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000A994.mail.protection.outlook.com (10.167.248.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 13:51:01 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 08:50:18 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 08:50:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 08:50:18 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68ODoIsF003086;
	Thu, 24 Sep 2026 08:50:18 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x9jq6-00000008fqz-1572;
	Thu, 24 Sep 2026 08:50:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] kernel-selftest: Disable upstream patches
Date: Thu, 24 Sep 2026 08:50:18 -0500
Message-ID: <20260924135018.2067502-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A994:EE_|DM3PPF2867093BF:EE_
X-MS-Office365-Filtering-Correlation-Id: deae2bbd-1d3f-4c5c-cd9a-08df1a42debe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	8VqDeF2zifOH16a35DuikgPDg0SAJ4bryT9N3uy8zBxtu69LS3kVUg/YzagQ4sUHjzpv6cvNbE421ok5geoHGnjWkGHkNKNtS8MgLlvVTl2k2T8ZaubSKKmkTBXjDCnU5vr6Q0wnB+bp4xipTV1669MubzDbgGdmlO15Y1Jx7AKpYJi8mW4o9rmekMOrRXOHeUUYJ7nIiRnNNj5E8Hbdqq3rRUNKfXkRcmo6F1PV6yJaWOlZn/XUrTTKz2+xO/rpRF2tR4z0mX8HVTiT898tZ6bJ0RIpPsJn5hLDZG4gHsEplicPsZP0OtdIOSs+MPjqY9W6EB5udRwfLxU1opYI7HCJV6XnIfKw2DqVYdMYG8eeVshXuksNZa03GVHPVJOB8Qx3OrT2DotZKyq5GLKHuIuru840Roz3uZFbd4kxfnx8I9cpI3Tlr8BlkE3199CBxZ+9FY5CJPxrcTf4d0fMAda6y2AM6BBNnSuNvhxKs2HA2TnN/3oKwiq19wK6quIVCh1OyuWksUso/CxfIvJ4D8Ya7OEaVm251z3T5U7JT/5cO7vfiMaB/R1FHVvZWRfX2Vere3oT1pSsFb3HD/Qirgve18DS3/MjJhCTRPk636r8N0FY66HinHQ6pCl6ATz1PFkkyb7n0h+6NbdFsHDyPcWgXerSptfH/2u2gJT8yTQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uvPD1eowystt4un79w82cJ+SJpzjyFf86wDaE1K4cdOw3shq54mMfKcLg6DDYTnDXg+Q01n8FZJbW6yBeaHrwfShgR1h36E1sIXP0Un5XtBeo4rICBupCnYMsou0DzGLD0PKAZnRPpkQlVXigZ0RzaoQ1xnuljaSiObqI7zRXG1PBSb8gRpGcqCBXp3u2r0aVms0fgRPWwIa8cIiWo3T+SjQ2OJlojAa/fp+rwoAJBD5WhLjF34yX/wUodPln1Gn0nSim2DdM737R0CO+DoFuTWlM3bW3JSKb+fsf+PozDNxzu8Is0DXa/aCr/fEtl+Nx0w96Qi/veQPTHLWYdOfFzSn8I9BZi3SLt4sxsSk4EofA5TYhwvTArVzVLEHuK+DDTi3pPGD5QEEjPcFst7hyTB9E5GVzh8qwGNdMUJatbJ69rpfCrEZnkmox051jebF
X-Exchange-RoutingPolicyChecked: 
	uo7HaITdl5lrKuUxXRGsX6LRlt4kw5GqwwWV7uiY7PHU8Lkcpq6ZFbBACzf4dDVRT6KiXxO2hro/O9dkFeoQOAxVx6ZvTVnNcXmCbFe7hcrzywnm7Ym/X79sRA5/UyR3RW1nxyzpJdfa81lyv5E8Qy0w8M9XV3bqoSDa93L+9BtJshmrs342ssL0w9IZBOcKzoB1n9Y77sfyJv5eUMxeIRGXsNjWUwt78sJ4OzN4oLqpCs5Xl5jO6aKMw8ASxr6UYzdsTLjsdzsOGdRqEzG5SEe2kk7u5WNqrhCDEO0h5htwNJ4AtKjWVcYrhBZDhELHPCdUXSQA4/o0laAuARqpew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:51:01.5869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deae2bbd-1d3f-4c5c-cd9a-08df1a42debe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000A994.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2867093BF
X-Proofpoint-GUID: DLvqiX4llTr4e2-HT-1EKEZwFgGdjfVq
X-Authority-Analysis: v=2.4 cv=YKUKWhGx c=1 sm=1 tr=0 ts=6ab52acd cx=c_pps
 a=QmrQXVULtgJTkzLS4HxzTg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=-eF9k24YutewJVA_iCQA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfXymiC5AJyp5YZ
 kEEPCDknCkckv2gcCPczGp50MQebRKzcQ2D9Fvw4m8JVEfjK+pL1hY2zg8kFv2Mm30K9xyzEeBQ
 4khBV6LVmRRUuSPqdTaaQgTyBVUCgdc=
X-Proofpoint-ORIG-GUID: DLvqiX4llTr4e2-HT-1EKEZwFgGdjfVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX20fvFVZLhrgK
 oADilcY5tq3ZaTnEfio5TOWCNhyNFSFQO3Qus291hSG3a8uh+0bvBI73qG++0MX737dz9h1UA8o
 r6QegEmAHhvDSexUoIF+kLiimThs1QZtHsEh0pLgGR2HbLx8kZ5AWzvsezn4ceir7jdn+3fDD9g
 gCfFk0cZ8hHWat2JwVz8vryWAay/cBlSOxhmqcB774lyvQeqCM64OLNXeCJmiUB2Vtr+w9iALBS
 Cb6QlCF0KMLbdtz+dheEB+GkJ6TX+yPR3BclSc3YB/MovaFzerL+FJSNj6ri+Mh5TuPmEOsIe4S
 wZmAZhn6796eo1WlX7Tn7Eo+uZQ0uzuWOyswj6sfGtTh16z87bUnEJqcCsiQEn80MG1kMr31Mgv
 wJKTsJxySlhEejWnTU0Q8/cZVxIDSzqPVsu5VeOKN3yIKMnG/uC+gJ7gQB8LFHeUKEstYiAwIEh
 xiNqtCEbekAJFsXD/FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240057
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 13:51:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20414

A recent commit in meta-openembedded [1] added a number of patches to
fix testing issues, but those patches only apply to the latest 7.2
kernel.  Since we have our own vendor kernel and support multiple older
versions, we need to disable the patches for kernels that they will not
apply to.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=11a9324c8449a8567461a7914aa5c7a592de3f45

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add meta-beagle kernels as well.

 .../kernel-selftest/kernel-selftest-ti.inc    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
index bae5b7ab..751b3fa5 100644
--- a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
+++ b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
@@ -51,3 +51,29 @@ TEST_LIST:append:bsp-ti-6_18 = " \
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
+SRC_URI:remove:bsp-bb_org-6_6 = "\
+    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
+    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
+    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+"
+SRC_URI:remove:bsp-bb_org-6_12 = "\
+    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
+    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
+    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+"
-- 
2.43.0


