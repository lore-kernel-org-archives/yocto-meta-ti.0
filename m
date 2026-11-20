Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3126.1795138820730201186
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 17:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZjJQYOxb;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=S6A5/ga8;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AK0wKXP2715680;
	Thu, 19 Nov 2026 19:40:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ldP87HHRjR5/v
	Z/XEso1ZYAd4bY9qaa3UK4qYeI4/J8=; b=ZjJQYOxb/WSFROmcunQ92SAArJJd/
	3gORLJc0qP+yyT/EcvGxdtZ1U+wVr2/+CzyeLHw5YD2h0CXj+gVTKc1AX6yCj3a+
	jNYviq/9osOj8aUk2WP0XPbD293NfLUc8q8ctD/BuwDsGIyeYPLg+GTRUuRkFosU
	jv77EiEgK61aQD2dhWncbaag/QV6RqE4Oe/lJvm1JW1UrYzN8ckD2h2UF7cMh4cY
	A4S0lf6veLlfO7p5dGoEIm9DssGTP1/4HoPSqA28TQE+YRBFe/9C1tFOkTuNZdrd
	RCtj4vv4Ttml5uPSdCckkd4ukC/e5VnNQwLw4ffwZD/82IajWnaTmjHbg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012071.outbound.protection.outlook.com [52.101.43.71])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j2c4r87gh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 19:40:19 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2GEo98qA2AKybggk3v85rdo0o8p/h13plaZ4Sz/IIHUAit1ESOjAC9max0AQiDC2PPir34MRvUgaIu9771S5JeBbkN3o8BYcAIxl703nDmnxxHm9ah3BApLm9uG2yXgutC5pEqQTlbkjWCT3BPA0mJmXMnAQSpD+ydb1jjExFMtpETnnjB5lGsr26wpk8JddOUBucAEi2LkKZBYdeA29MgY7y5YBSoo2VeDYa/+adn+TiNWNp4fyGvaTzhnTdvtq260z0gkrFAJ53kr4a4p+IrblekMaw/I5pgDqBQbW23d4mffdl3rz3D1lUbGz5/uNGAcuiTAKAB0DCTjcJ6GWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldP87HHRjR5/vZ/XEso1ZYAd4bY9qaa3UK4qYeI4/J8=;
 b=EKhVjRGakOIUffzAPkGn/eC17bFq0RvpGUzbxJ3MykS0/BD3dkjjTJMQmIHqAOWrLFkXpNnH66hWdscGgycGpL5CHus9xcjM+UEJX+yUBCkkiI3ldHoTkULsLj3rTVJgnAW/4eXhlzjD4GgaKg+UO0+RifM3azFNU04tywytMoOhgGUXp5PpkEMsmhqKovh6JlFD14bnlCAZZGaA9rqfm5yt1mb9ckeWbLESX7uUTJ8mOT2ZtEYcWQoBbZWpCQvTJY8oLew0QhI7o4301MzzDvci52eVUm3/exWIW6wHmbP/S+FM2jHLF6fHK9CS3L3eP7SHOPmHMY5UIxuhjec5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldP87HHRjR5/vZ/XEso1ZYAd4bY9qaa3UK4qYeI4/J8=;
 b=S6A5/ga8vASEgREuNNTvvEZB3rfK2MpwFiPaXlVO+yIzqAcB9wIWh865OUuGyryqGC807OcDxacY+a4HkbuijftSnvwpNd+21HiBkTsm0Gbbt8WWDwWiHlYsTP9K4vDOzgdPLCPLtG/u/1bKitBhlvOwWYPHQ+qjHUvao4mcI3c=
Received: from BN9P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::29)
 by DS0PR10MB8128.namprd10.prod.outlook.com (2603:10b6:8:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 01:40:14 +0000
Received: from BN7PEPF000000A4.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::2e) by BN9P223CA0024.outlook.office365.com
 (2603:10b6:408:10b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 01:40:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN7PEPF000000A4.mail.protection.outlook.com (10.167.245.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 01:40:12 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 19:39:30 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 19:39:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 19 Nov 2026 19:39:30 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AK1dTb9099239;
	Thu, 19 Nov 2026 19:39:29 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xUDb7-00000006pdh-3yMw;
	Thu, 19 Nov 2026 19:39:29 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] kernel-selftest: Remove patches that do not apply
Date: Thu, 19 Nov 2026 19:39:29 -0600
Message-ID: <20261120013929.1628410-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A4:EE_|DS0PR10MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: f54ef1b9-a7de-4d5a-0543-08df46a73835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261026121527099003|18002099003|6133799003|13003099007|56012099006|261102123227099003|261022075727099003|10067099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: wcSxbvYHFj8AH4EV/axOnc3Fa9DqLDH8Wn8adkOoWT/NvRIMZS1OGaQ9UoSmouUHQPU0Eetnn+bIk1PAWsxUuTZ+XeXn+Q+33Z7n6FfZ4kgn0KsPWhHdDTB0o7LoOxHPiYopU48M0sVzGhHSmoAKs+6NIjJT9q2oBnx3uR04cYWlnCA3mLzEUtFHtz13l23aNf0StFoDYbqn0sSMw9UVZrfoUVQtcvVMaQxVD0Mfpw7hAuXA4BJSp3EzsmVtdhqVrPqPg5oqHfQRCSgPfuRCnpG5w6a+gL89WBgWH+Y3BoS/JMoInKL4UDfINKfCYNpuqo4TomtoGt8c8tVdP64ptNcq8RvNXC812GcFLBMYXxj1TLy39j5nJhEhw2knmBR40R/x4bBto9aDpMpOs0a0h311JzG9wLmdUqm+NTXTBBLPC7Ki2YZWaksByeBAbhb2xYsDco8hGCUjAqmTcXvo0TqdeAw+X9x6rkCj+V2ZUCQSC9DHIJyU0dcsWsJ3kS6CjcSLAnVbQF4saEuExPvCvOK4/HQs1XUHTB1uA8868cYN32ReOtp157cG97X8seQmlNwWFoCDYS6HLxaIQTENwJWzZd9en1fPmDe23ZuKBOn6esd7fdrNOrfmsuFae2hLlbZu0EtBpbW+smIJZCyCjw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261026121527099003)(18002099003)(6133799003)(13003099007)(56012099006)(261102123227099003)(261022075727099003)(10067099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ID4CD9RCV69E0AilRqJvXgBiH4HDVDIkeEDoWS0k5pbayBRfqswInGQOj9yB3JzxWvubHY+LvRSifS4zI69rpyOfXQ0a/asDRo/Jr6GTLRVPUo6loZsrt53/RzxGFJREMNGWPugwgAXr89gVZ24w5YbDopjbgBjNvMnDjptqGKcd1zJAn7Kzv1boND+YjEEpixlDXyZvmXhemMSU0zKEe+xW0ydPmPH/yBjhdp8QYFZRW385see+xt3y3dBrvjrMPHwfYgGGCB//NYyT/zOJhfCTtnP4KWmdJ3LI1mltjpfqXn3IEDfs2I8CwhmK2wJE1HHEVDEeb1VjlO4U3ztMqyIOT/DmkMAhnEPtDSCZl7ZP4Nl+g4kmdByNDB9IxOU48kZHnqIWqEAba7l0CWdzRWJrs5zodHFA3LYasNUkIrP0NHYlx9/wpzektNF3mWd7
X-Exchange-RoutingPolicyChecked: IBELvS4YmSQ7YoakwzFphXiV+3GcxEmD9RKGJlRLZMsukXG+GSZnM5/n1ZMaj7aa+xDcdr5UPS9ZcdzCaNIvMeJ5Mq5hyqoFxwXl8HZMugq+Qxo7s5JDF4xZ+9r6pVnuMN++6waNho/wBtT89EwFRG78GqNzmlT8Spe/sCPArrXupLofH3eYqzHqiChqhPePbRvn2QC6phvFWPfscR9SzSeGlaLfP7ttbCceM2omG+8QBrRIOa9KyabJLxjEzQ9Uigg4zwLYBiz9UPJyIEAWRRZrP+4WbQmrUO1tA02f2qIrRReDnm3A4771R5GF7dSbZZc8N2KLo9O723KVl11vEA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 01:40:12.5270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f54ef1b9-a7de-4d5a-0543-08df46a73835
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF000000A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNiBTYWx0ZWRfX9gQQttfdBGqL
 ExNyKqrVwtu4r0NwFGi2EYWS6NQqKHyzIbupvxVrrN/7rfk88VUCnigus/jF9BsfpHRuk6zfjN3
 xZgr1RCLxC3ctXD5qEXfoCwcnvRTopLc6MpPwe+PXLcxJt2ZkbZ5I6C2vImA2hde2OfnptCnjZw
 K8iUgx/OWPIaaRI8luxDMSsT1SrlYZ2Mp3ARRsrh7N5hz6MDkRj3Sp1sW6r50QmUFoI3TYbNpeU
 KtrY7xyxO34B3uSBWPu01v3IsHO1otxKRL1NFUKf6MvLbCO4uJmF0JMYb8wRDPWOk8oEAb2h/Q9
 hPfveFgrXmwGZx6BwURKUsfeFuX74tqLUGr2xzEzmqDfssvPtXrhOFRJhZu18qvG32MZoorkBYG
 J4oaIl+OjssKcuX1TcSYhH34kb1wr7t3FVA43wpRM2ySuLG46t9ejtuVCoPxPoSTkAPR9pX1wNy
 w5BP1glsiCTUSJbXSjA==
X-Authority-Analysis: v=2.4 cv=Yvya1IYX c=1 sm=1 tr=0 ts=6affa503 cx=c_pps
 a=Upp9xsdEppYJlq5B+Xcl6Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=1hCT6YGQg_82i8NQ1N0A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNiBTYWx0ZWRfXy4RN7hq1IFKZ
 mBvwodan7YfyN36+fqIF2L1PcnoF0WyNqPFvdcJbVyyVKXaB6wb2s671bCAff6/hK5LakaH4Law
 fnWpF/liytNZ0OoLQzvheTZYFkivFYg=
X-Proofpoint-ORIG-GUID: EcmKfFoKRYBKYH5sGVCpp88xwBX6g2uM
X-Proofpoint-GUID: EcmKfFoKRYBKYH5sGVCpp88xwBX6g2uM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200006
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 01:40:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20562
Content-Type: text/plain; charset="utf-8"

A recent changes in meta-openembedded [1] added a bunch of new patches
that do not apply cleanly to the current kernels that
meta-ti/meta-beagle supports.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=6162a688668d0b81a5bc979f4b66c87ae4e1b741

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../kernel-selftest/kernel-selftest-ti.inc    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
index 751b3fa5..a7467d25 100644
--- a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
+++ b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
@@ -56,24 +56,74 @@ SRC_URI:remove:bsp-ti-6_6 = "\
     file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
     file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
     file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+    file://0001-selftests-core-fix-unshare_test-with-large-fs.nr_ope.patch \
+    file://0001-selftests-proc-proc-empty-vm-treat-pkey_alloc-ENOSPC.patch \
+    file://0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch \
+    file://0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch \
+    file://0001-selftests-lsm-check-lsm_get_self_attr-errno-before-a.patch \
+    file://0001-selftests-lsm-skip-correct_lsm_list_modules-without-.patch \
+    file://0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch \
+    file://0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch \
+    file://0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch \
+    file://0001-selftests-net-udpgro_fwd-skip-the-UDP-tunnel-tests-w.patch \
+    file://0001-selftests-net-icmp-skip-without-tcpdump.patch \
 "
 SRC_URI:remove:bsp-ti-6_12 = "\
     file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
     file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
     file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+    file://0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch \
+    file://0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch \
+    file://0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch \
+    file://0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch \
+    file://0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch \
 "
 SRC_URI:remove:bsp-ti-6_18 = "\
     file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
     file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
     file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+    file://0001-selftests-core-fix-unshare_test-with-large-fs.nr_ope.patch \
+    file://0001-selftests-proc-proc-empty-vm-treat-pkey_alloc-ENOSPC.patch \
+    file://0001-selftests-proc-read-tolerate-tasks-exiting-during-th.patch \
+    file://0001-selftests-sched-install-cs_prctl_test-from-the-outpu.patch \
+    file://0001-selftests-sched-skip-cs_prctl_test-when-core-schedul.patch \
+    file://0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch \
+    file://0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch \
+    file://0001-selftests-splice-skip-the-kernfs-checks-without-test.patch \
+    file://0001-selftests-syscall_user_dispatch-build-sud_benchmark-.patch \
+    file://0001-selftests-lsm-check-lsm_get_self_attr-errno-before-a.patch \
+    file://0001-selftests-lsm-skip-correct_lsm_list_modules-without-.patch \
+    file://0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch \
+    file://0001-selftests-filesystems-binderfs-skip-binderfs_stress-.patch \
+    file://0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch \
+    file://0001-selftests-watchdog-skip-when-there-is-no-watchdog-de.patch \
+    file://0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch \
+    file://0001-selftests-net-udpgro_fwd-skip-the-UDP-tunnel-tests-w.patch \
+    file://0001-selftests-net-icmp-skip-without-tcpdump.patch \
 "
 SRC_URI:remove:bsp-bb_org-6_6 = "\
     file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
     file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
     file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+    file://0001-selftests-core-fix-unshare_test-with-large-fs.nr_ope.patch \
+    file://0001-selftests-proc-proc-empty-vm-treat-pkey_alloc-ENOSPC.patch \
+    file://0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch \
+    file://0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch \
+    file://0001-selftests-lsm-check-lsm_get_self_attr-errno-before-a.patch \
+    file://0001-selftests-lsm-skip-correct_lsm_list_modules-without-.patch \
+    file://0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch \
+    file://0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch \
+    file://0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch \
+    file://0001-selftests-net-udpgro_fwd-skip-the-UDP-tunnel-tests-w.patch \
+    file://0001-selftests-net-icmp-skip-without-tcpdump.patch \
 "
 SRC_URI:remove:bsp-bb_org-6_12 = "\
     file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
     file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
     file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+    file://0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch \
+    file://0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch \
+    file://0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch \
+    file://0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch \
+    file://0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch \
 "
-- 
2.43.0

