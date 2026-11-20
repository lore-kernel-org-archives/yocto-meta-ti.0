Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3130.1795138783219168072
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 17:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=afdC6alU;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=FwcdNmIY;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AK0wHCp2715639;
	Thu, 19 Nov 2026 19:39:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=UcCxiYhP/c5nT
	C+37C/rH5p2yR/B3ZjudKJviUZZ+GM=; b=afdC6alUwqSoiBNGdmUnUb/DTqaHv
	kY70DcXCqv2QGHVrGw6ao3oJsNwe7KTFrUeqr7vtouFu60SfC7C+SeVY+o3XhbYP
	oNe28+4JnP6ViSQW8pNfl7FcMNGM5w+3CkL+vEo+q+c9FA8e3mNOniqwQ0xn++MS
	p5MRI6ONJJsaHugLpOkIxCpciv91Q5WB5UnA9y8yh9DEVmA1jhqonc5k4KVUBU7H
	D9STupOCzdVElY6D+RmsAudlz+2iYt3q2Vt7MAffJm0csTJOc+Ed2F5QSU57sXB4
	XisIvWQ/w/04QSS99i8XECPJzDPWSTf8iuK4DZhvcwlfGOiQl8aeCWA8A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j2c4r87dm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 19:39:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuiQyOhzeJialBwccJW/rLNjAuaBzxvJG/wZ6gG3PakMM5uxv6pxiINUsFXOnEyZJFwuTqyI707LTBSBjttLlKqjBdrMEFceMGYjFVW388v2IpsP1NWjSqEToiQluP/GV5Q//7dTlaCVpvehc+0zZpTOT8K67dDeW+KZQHgqIxgl32bX2gc/7/jhYhUZyD4loNiVe39rZsQIjvFrCdzUcBeRBFed+zLGiMt1yB+eS1JK9/F6bNfhywAbQ8f49Ee/BxrNebyIokLLdKUFp+vV5CoXx7nFd6sDFkERDZwWUcvwO7V9s151fBw2/szf6p3zkDUPA0z5oY4hRrKB7PbyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcCxiYhP/c5nTC+37C/rH5p2yR/B3ZjudKJviUZZ+GM=;
 b=FbKrdr/u5CWyMysDfKRN6mY0S1jAw5oVzpcEBae5vPqzuv2LahGBhUXpnVJAs8qj3RKLHM+/h0m/FN0O29ROHM1hObkr0UX2zYApTJTKo3uOzjjXnVkK6tKIt61n+prFUZ2cbE/MSqW41A5sqnDxQF5jyhBsOSjkAeMVnwaKqr1ZoeeocX52yQ5UbK0ZNhKx5bmvXOx37KihEGQo3GTKc30lV3t/I9SNnuTSfZ62tWf0a8UwKGeOf04P3nUFQXGyW5POc6HGKkx2dc/5RCavbGrEFpclX+yb+Dcr/nY8ho6G5//JRPOvb9RWV76dQus2rxIGCj0jmB9Gk8s6Z4VhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcCxiYhP/c5nTC+37C/rH5p2yR/B3ZjudKJviUZZ+GM=;
 b=FwcdNmIYuRKCpjQY490xDMq9LWLivK4pZT3K5JwV+TRLVpV4TFh04PMZim1BwFItF/IX1tkF4IkcAygaM7PXiuFRxvjABzh6WSzWI/V1JPurLoBU2+05faKYWtuVwtmyn1DcnjDpcm1y0tYEN2a6bOiVaa0LTY1fY9G+2H+4VGA=
Received: from PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::7)
 by BY5PR10MB4147.namprd10.prod.outlook.com (2603:10b6:a03:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 01:39:39 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::3d) by PH5P220CA0006.outlook.office365.com
 (2603:10b6:510:34a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Fri,
 20 Nov 2026 01:39:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 01:39:39 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 19:39:23 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 19:39:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 19 Nov 2026 19:39:23 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AK1dNHR099129;
	Thu, 19 Nov 2026 19:39:23 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xUDb1-00000006owF-03a2;
	Thu, 19 Nov 2026 19:39:23 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] k3r5.conf: Add k3r5 override for SPDX_DEPLOY_SBOM_NAME
Date: Thu, 19 Nov 2026 19:39:22 -0600
Message-ID: <20261120013922.1625745-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|BY5PR10MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd49c46-a4e8-40a1-2ff8-08df46a7247e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|18002099003|261009223027099003|3023799007|56012099006|261102123227099003|261021121427099003|10067099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: bWqOr36cRsPXbZ3KRkBecZg+f2jQxlZACPKzZBgOFG51Nds0dqcYe0BsX5cV/R0Z2zwC2JK4ts5dHYarlkVsNXLp5xoT/tvKxLJkk61AOUWWZVthyXBQOReJf5+55Lc+9yQad2m4MLNuJtwtpIlowQecWsEtJhEoqHNhrJGw1fGAdpcpdp/xlW6o8FI7+YkJ+7xJVs9kIR+Nq+7Wt03wreVhlgaG6uEubMDHrHOZYIoQfojUGIolDhu6Ua6faWp/V46M5EoNyS/K9Own3f0Chtpr49LOrTwj3E0b3/eAWr2EdJc6Ge5jRd14UKHelOCQF4MItw+wtekFQqFZcVMqbQH3q7fzfjab3qAKJmCeowoQN0nFvuu5xVl1WhF6ia9DZSOR3/QhWJbQRwChYy3/aXtx+N5t8LdWrD+plooUp1kbm/wjFpSWdFIody8a1yNEJKevU4yrv5NYyXPAD+00ZpXaJ1D8N/vw9gPqmaG+PGiAYTekBTJSpLkZkTUl7fGMtVUCd4GFMo/FnVLlDEREoYMzMtCxdQpVKb2IqbF1PSSwon13iMULdD0ID6ycUQX4/dNd0eDaCocxPi56cQ7EcEJtErzjzXNWAbWvXkPsjPhE2p9CVQdKpFl4Q8w1IMp3qHYbDgNxgrKy5RV6z6lOpFGOxYwYddxdHKusd3qQe0lcpVlANNhM17paHGnkxdxt60ITnTfjxERAFSvLr99wGA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(18002099003)(261009223027099003)(3023799007)(56012099006)(261102123227099003)(261021121427099003)(10067099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yjZNynyHFfAZrIPYIQp/GVvBRh0wKxxuEJEWoORd8hW7RD3a9I2/wxRynSqAD3uqnoNYrHeQK5ar55PU3I6A25NEZjpzjuyiY8h4IUkyP6k9rlKFThvwdmIqBd8KVvAeNw6MNqw+u2oH9ufyv33xBNDP5KT3hJwA4oyUKYJwyY49D7D+2902lLWfTlpfotjzy8upr4IKkoo+ae/h78oY+qHPCbJTRkmpWHXRjH55FR2LrLaY70n3xndk8+/Kre7BZ/cGE5awWp/frtzJvyjbw9hAfDyfSzmaZBXti886RTRCa5h5+OcLXBjiMuIeS1eJ8sS17WVCYzdMrAyjvswVxGBk8mvM67TMLZqG+6TySmxzBJf6xNb5T+ddkafMEC5M8qzQX7fGSxCm5WzriIu9I9evWFsO29K2ow4H3it8a4QvJhy0zICdRymbm3dXc734
X-Exchange-RoutingPolicyChecked: 5OWXDoFHlq6DqoJ+BpTQsZXHXlpcNrOLPeQYQlYhB4G/doTMINMkh06RqgcDmRj2pan3OwlrRrKuXaXKSGUmXYZw9c29NOZPIoqEAIaUhF6KmWzqdQ8PAsjNVs8NmdUibauRkyv0mOdF5k/jGMVyb5y03czwAe+CMzs0If6FAg+cUvgU+K2U91f0cZjeuVxvhX6QGwIWX2P5rnJcIx4iZuBuzRxIUm5Uq0zQsu2mOeeuACUdovIABxFCCsxJY24g7Ob3TZ9U6uAW2ThF+hlemH8Z5iiT/03wflCGZ4va3pF+PZGKpgc+cYH3OxGM5QN8zdevMWaIRv8HeJRK/2KihQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 01:39:39.4583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd49c46-a4e8-40a1-2ff8-08df46a7247e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4147
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNiBTYWx0ZWRfXyfvBKrn4VmvM
 DS7FUrOnGxyyvumUQhXhbDbOSRHBSW9UfYM/LkoWIUyOztTGaL35y7ffmsPHNKYqmUkpO1X/bMm
 Cf5mZ9zAgvahN7PfELF0SGSPLTtpYXpJWmW408zb+/4IQfFIVKc3GqAbjpXSzIPJHdauANfYW6g
 0VVbrJH82Bipw+SPTOJP7Yj4qyC9p7kFm87e4hx8ODVcIZ6hNkaZDECeiii8fIG+qqirR7TuD+9
 3XmXWp1dhz3p+JjdQ8jKDaqpw4sxlYpKPzg7D9P9YN/ide+57r1aYlyEP4TkkRjq2uX8iGBOQWN
 s9trT/fmAYqeJscB+sACmZglasz4i9Twl/yQA0uSweJbcgVMm1oInT1J9xiyHTGcTpjy1SN2fyU
 0Vgg3k8CzlsIrz8Fjkm8jn76Rh7U3yarsvPcXKddxf1+PtchqgfMKj68oaTm7fxWaRdCyN26J0z
 Jbh6DUW6/UmG2kqTIUg==
X-Authority-Analysis: v=2.4 cv=Yvya1IYX c=1 sm=1 tr=0 ts=6affa4dd cx=c_pps
 a=fNyNANDL+C7JeK/y+7sGAg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=IFA0K-ofvJDn2maoVaUA:9
 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNiBTYWx0ZWRfX9yYQYvjyMp8o
 g2JU2UqDyjrR3j/YeBBXGMoIM2TQmINypzNI2sahB+is8IfPPaZUoi0aZ8+Y11SbvNG2CnfNAPU
 qYTe9N79CUr6rCQ3fGNbrUm2G1e1Z58=
X-Proofpoint-ORIG-GUID: Tan9n-Dv2MeamGoosPuSvBWNIC9rbJIa
X-Proofpoint-GUID: Tan9n-Dv2MeamGoosPuSvBWNIC9rbJIa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200006
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 01:39:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20561
Content-Type: text/plain; charset="utf-8"

To match the change we made previously when adding a ti-soc guard in the
layer.conf, we also need to have a k3r5 override to avoid the multiconfig
setting for SPDX_DEPLOY_SBOM_NAME from being overridden.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
index a995b46e..e415c939 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
@@ -8,6 +8,6 @@ TI_TMPDIR_APPEND ?= "-k3r5"
 TMPDIR:append = "${TI_TMPDIR_APPEND}"
 
 SDKPKGSUFFIX = "k3r5-nativesdk"
-SPDX_DEPLOY_SBOM_NAME = "sbom/${PN}-k3r5-deploy-sbom"
+SPDX_DEPLOY_SBOM_NAME:k3r5 = "sbom/${PN}-k3r5-deploy-sbom"
 
 EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
-- 
2.43.0

