Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC54C44508
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 16:56:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1211.1784048187808981612
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 09:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CvoTP8lN;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=X/Oe66qU;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EGAf2B2680095;
	Tue, 14 Jul 2026 11:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=MncLTCa+kEAwr
	7zXXob3bHN227OYfEl831SIwT8swdo=; b=CvoTP8lNbMceuJlaoT+33rgyDGPVu
	Z5xtW1jnhoth/1xOwMsdFtWYVy/I9WhWk1NlSohkkmIVhxY4UUNuageYAsozuIQ6
	TlVJpDqEKSv1gyvCD/GpLJ4zZqOZR5++zv4ShgF1mWHDVItkJL3lyNGry9w+aonx
	vyci0eTU5a2cUxXV9ZjNKzOTjyU2wREfXdkLtvTPYptEEKghlbU522SJSt97llKV
	lNPgwOlzzRDmmDMfzpljm4Q3U7eyY2j9ixT6Jd8+7n/Wvty1LsFDRjAXa1Ee9Uw4
	3vzFrPBl9VY9Zhi0BR7Jh+ROoDl5GkrNg7ZIS1UBG7xOc3T1W9KxLtR7w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdm2tj23a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 11:56:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/1T5KsUNb8uJfqtsoMZI/nBnJ7h16lJgYZNUhT5Fv1/TPOyHyDhLP12ML9IMp2+E5yyo0ipi17eDUnmkxlN8njnnzw4wRJfFRx9T5ND5Fo53fx4QhB8fOkBF/Erl6lDwhxBuJSX0MxtgJBmDSvR57vroFs37wxvz5BPM6fSv0dEMCFyAGSBM2mRYipEMLHRJZy4mO+RRdM/MT4yvohn6J3sZyUkNuV3Ou2DzB8DsH2aIQQ/SY9P52IzZWh26G9zGUBiy8by/oXZOPcyNl/XTzX76BMh2tBhptrkR4ZueS296Y0abpn2hwBEgdG88gBmCFw8H3H6aaZ6k/X8YxssoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MncLTCa+kEAwr7zXXob3bHN227OYfEl831SIwT8swdo=;
 b=V8zTMYXgtQB3igBkMKQw/Bc/QbhNc8Qd9ZvD+8fUBQhloDiBP8A9ZtY7zYLoJVPlFFXIWL3laXlFjb4FhDIfEcs58pGlm1YCK0GRHx8sQYFi51muO28emA/ZCcqLzkPEA1YAHfc6wPJ4uOlE8P+HFDOrT/aL3hVsY78Zft/kCr7E4I5FN7uRKyr0DTcOH3Wy8rhdqB7QZa8uQjk9aXIDo1N8p56dgTC2OPzTsIxczfhsQbeg/uvZJfnpLiA5XXI5OHkFDYS5oOHk9GSl+qvoyn3Tz/SKhLsl/Z5R06Ji44cpabi6xfDaxIZE+xRTgnF0Ch0nHL92wz7kW7BZ3MQgkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MncLTCa+kEAwr7zXXob3bHN227OYfEl831SIwT8swdo=;
 b=X/Oe66qUDsmoH60IG0UOsU3Y3kx6Va10KRXrBPieY92YsFKE8dPW/4YNCRJKAs1+qSvvixK2xP33+TMR2TuKTQXe1Vp6MDUijFefckFizoIBn1mV3HqEYEwKDnJ3mzfCJeZkBnsUrnHQAcPCmCwGMgSbNMfZrFQiJcp50MmuA9w=
Received: from BN9PR03CA0870.namprd03.prod.outlook.com (2603:10b6:408:13d::35)
 by DS0PR10MB997674.namprd10.prod.outlook.com (2603:10b6:8:311::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 16:56:23 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::65) by BN9PR03CA0870.outlook.office365.com
 (2603:10b6:408:13d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 16:56:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 16:56:22 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 11:56:11 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 11:56:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 11:56:11 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66EGuAdm988567;
	Tue, 14 Jul 2026 11:56:10 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wjgQU-0000000F4Fv-3lhk;
	Tue, 14 Jul 2026 11:56:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] mesa-pvr-24: Fix llvm-config handling
Date: Tue, 14 Jul 2026 11:56:10 -0500
Message-ID: <20260714165610.3591270-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|DS0PR10MB997674:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7b4355-8da3-4b93-b2dd-08dee1c8d57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|13003099007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FZNSTJc6vPmBgxTGsyYSlymfiaGoTqSQLDkH9O7oB9NgNtRFkmzufVoCFu3dLUPxbYmIHu1NMxnjz45WpVFtPLwIT2NCMKgKCf1xkV3BflUAoyksn9UrBesGrOaIxmO3q4k05KsKZeNeDY2UgDVYPhSkTANb3vqjq9eC1pjeVeUALKvy+ePaVPtLR3KhiVMEvSkDKNccoqcPkuBoQjD2DvOL34RBDOl2RMQBIUA5/gvuyZLfb+FhmCG4pXGXSIISM563ZrY2sIi0uBGpewihlfeHvfR5REE3SFTxMN2mJJpt3lHTWvkX/ggDLFEMzHePC+a+k8oNvxf4iTfBBGvoW59odaT6U3v3bb3rkhz30a8nE2G2VdSjLFrJ6aTxAKBib5+xGnIbuLHJSNtqYAt1psmuExwC/xcjhFayepQKC/bn2PKG6f31gJ+yEuJsgOIbPxImTehYHQ0llv5I5yDkvRLJQlJA6WiVeik5Qh9GKgTDP5VykBQnmIDjgDpMGxG2dW01nr1XthaC34VEhTBOd/X45X1oHfTzF/48QXy4Ff8k+gc6qooCA72OIm3kgeot6Z7+zgmssFHfOpz80ZfTjG9Aemm2Y8cMfcfiV6RvSM3l/9ghjnyKHixGxdBowxXOygBEkKFzyv6xnb2orW09cCeKYH/aLlANOrYOs9926CV1I5pmk+HyCOM1zE2QngcllsSqBM+8LSI1TCFVAsYlxw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(13003099007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1U4r61crff9Za4FrnEOncY7ZDi17XkhYS19/gblb3B0wfjk5UAMaX1jpSvZehEzeypVGClNK/tdry46ZBEnV039IAQMeWilGQD8db+6nyBPzy9UULhhEkxyUmApfGv9zjA8+Ak9+fqw0oM3Sldqrspre94kPi4Q/lYiIHUERtoao1AeXKMscz+W2kARt+suoozpKLOsDea2lyjKgFPTIduDfOKZbQzgS7joKdgq2lUlYJUrqnYKkdLnLs9kjo1NeTGPU2hSSKXXiZj+uOKK+4ghVDrWocAWgbE1M8fAig5Jrs06RB4wcEdsD7WAZrnLtq44mZrnafetOGY1HSwUZY1FPmr1q2Vh4SpXN8cz9QFgl/KNEEz/5Q4mqQPm/EF86fZ/9rwDvUkE6f73ISFd4thXTMWuAoavcQP6lLtxqNXVlkgvYf8I0Oi9xorH8ng47
X-Exchange-RoutingPolicyChecked: 
	HOsYbWS980bKL7RO4bT2RJJqZlq7VCEt8Rvszfbx45Y/sInI9zBBtYzi+BS+WX4Wgjr5kK1bZ1x+NLfR8eKVpfS+GLe9rvNncMPBORbSO0PzOrKzaMsqHjGQ46e6bgjac+daFnMHUn0/Zx0IeLdZIHTdVxNvyCjr3BpFUs/hijVTgXkHCrmJSjiNFmJw83QPNU1Fl+zBBG21py+5f/hCCWeqTpa/1ZSptkZ6Byq8+eI9z6ajZNyseRvzrCza5Ufc9BUmB6wZ30vs6wq/wQ340JURPWbCPKjIFG+EHP0bZM0Ngx1nVPNv6lxfaYVbHXNX93vZU2lVqFQ8rFrrM2R9kA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 16:56:22.3594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7b4355-8da3-4b93-b2dd-08dee1c8d57f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997674
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3NSBTYWx0ZWRfX4+5gs3xsq0OR
 hbY+Mz6yn35X+G1Sh3WRhup4jJNDQ4nNNBpDWdLr9FilIs+jaojBrDQKmUvJajr0bzS/V9kUqrv
 bm6imjsG27ZH+3X0zUaYvWfPSEc6fT0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3NSBTYWx0ZWRfX99RGREX9z7kz
 9cVWzQ0i8PSwC2LA6y68xTwyg1twkNg+rMLMn+pd1WPTHzswmLpCa93Djzg8L04sR+xq6tZcfrX
 bDaaIDtHkLtxqFO2PuVJiY1WKWq/gB9CWwOPjXAHXxwzrb6oxrxkiEPVjzEsYGz4h4q3EyjhGJ3
 A6R9EduPpJXxMWC1F4gsLoRYNSWcpjw0LYe1n2fUbe6xuQ0uQDK36JS2Yt8lpVtyx8mTnl92Azp
 cszNYxpUaRe0+U0V1rX6tBGYbP4X5Dw5XXs5rl0cMxPe6GSPccu6BDF99XNni7iR5OcE+iZLl+M
 w1CydbdP3UXvPxTHgKARhOFIsZA9Bu7BzlawJUTpymSpxjPyT67hql6GphZwEukiiUAW2njbnWI
 3l3ybLJpjafTLfFNKaJ38pW/VTbHFzMhS5/OOh11EgTkuNLcPMSknuCWNaSTyboihgTstVzW8SA
 SSRD1ngob++l7C8J62g==
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a566a3a cx=c_pps
 a=gGLfFga2G+uCUFnDxO+Iyw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=ymOni7ib-cu6r2QZjMsA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: aR_Xw86hcE3AODurzmC0TZgsk_V4YNxl
X-Proofpoint-GUID: aR_Xw86hcE3AODurzmC0TZgsk_V4YNxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140175
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Jul 2026 16:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20140

A recent change in oe-core [1] for the mesa package introduced this
change to properly handle the llvm-config.  Since we have copied the
mesa.inc we now need to copy this change as well.

[1] https://git.openembedded.org/openembedded-core/commit/?id=8aace29b692a8f3902a675fb4c022c223ba49531

This is a backport from the mesa-pvr-25.inc file.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/mesa/mesa-pvr-24.inc        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
index 5ce93d27..2c4299c7 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
@@ -60,6 +60,22 @@ ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
+replace_llvm_config_path() {
+    if [ -f "${STAGING_BINDIR_CROSS}/llvm-config" ]; then
+        sed -i \
+            's#@LLVM_CONFIG_PATH@#${STAGING_BINDIR_NATIVE}/llvm-config#g' \
+            ${STAGING_BINDIR_CROSS}/llvm-config
+    fi
+}
+
+do_configure:prepend:class-target() {
+    replace_llvm_config_path
+}
+
+do_configure:prepend:class-nativesdk() {
+    replace_llvm_config_path
+}
+
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
 # here we assume the user will want a release build by default
-- 
2.43.0


