Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765FCC531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 19:00:42 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4062.1784833232634945774
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 12:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Wb1hLwOo;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qzQecn/P;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66NIo4So1010095;
	Thu, 23 Jul 2026 14:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=lapQnARx3LJZ6
	e9IdN+E2AImDx2+4s0RIIVIFZdS/dU=; b=Wb1hLwOoz7XqJAisxkkmFfAMygVjL
	j5JWOIqQUily/rAxgxKgSEhgpvl/xIHV9huH8UdJqY/V4yU70Xmhi8qCOI7cM7sR
	7sfsLVfd73wZp9qfkmjy79nFW2dEIj05MyD2N25MLtHkQTWVnrYKejzDGp9k3SXi
	50eoNSdMfDUuYh9K5sX7FyKrUSU/sHaiKEiSO6Dw2Bfb9a6+Kr4WZMaLi936csd5
	yPH8/scc0DkHGqVt6W78BBxv3lzjB0SJ4Xxmt3ebbRcmteFc3QaGRoKJhL0UXE8T
	8SPXGdwxlM0yANU3HUwh8/oAeLhjVhFdbHN5URw4HprHTNgFjPXTyBKlw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013059.outbound.protection.outlook.com [40.93.196.59])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fkhvutqe6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 14:00:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJeZhMrShHPFHXAFAaV3VG+V8VJQL4emJb8dreFsPxoxAM4v5ZdjERBEi3oTvnvOAEP7oaNo+oKPWYiYHuUaxrphh38D3muXaXuKnjFaV/VwoJGk6nNsMNinYVm0/oWas72UYSUIR6hE53n82bObRNlQ5UgOJR2yQBRPEYp8u1NkJ6T5dQ8FKkCyxnwCoX7oxNDsaFV3yqFh8fEbedGRplEYQOCTHw6kgiYhdLXSnFopKFoxNrLsX1gah4NIfJHLJY8Toe00u1hhDJ9DaPMtgHQMXhrKfGk2VchQDhozQqOn4emohYAK+8pdGP0R2gAy8wHUw3sCYQ4986wSM51Org==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lapQnARx3LJZ6e9IdN+E2AImDx2+4s0RIIVIFZdS/dU=;
 b=V7Df6lS0AfO/sneyWmVJkuQ+LOEMkRYJQMlUO6HciD+fpcaBrJEsmX2+0vXGxWjojVEoLhSQRCqgG+xzaAG2rZ755C8GmOBsDeReHsYhHHpuc7rt1/g8bBNN/J8pVzW/6PAtDzDThk0OIDxvLVmGXG9wPiczZx7TU/Rvo1TYAvV6MwQkm89ePrAf2JKG5OU/33bd1Xu1S/OCje6GvYLkUxuA3P4cJpv29hc+qgm2U+J220ISdOkSQMZj5toJMSloKPY7kO9QoQf1SVTFW+86oJdKsxgfY1rDNKQl/PU6R9C9LYWwEHcUrFMwiWW+wskb3Z1FZwEGFtuO4sl0HPpoCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lapQnARx3LJZ6e9IdN+E2AImDx2+4s0RIIVIFZdS/dU=;
 b=qzQecn/P1Y0DHgQnTjocwfZ7k6cbqpv9n/amZscD/Jls2EOwgmzCdGs14TNDhxrImAdY1LE8dVrjsKm0nm2sS7y0u0b3cV5Cr/itaHukf/n30IMHwOU6VhvqnmbGenPu+KFIepo2p1ixUQgXvr6B2awuX5O0WCMcG6jxA+mWTlw=
Received: from PH8PR02CA0021.namprd02.prod.outlook.com (2603:10b6:510:2d0::28)
 by IA4PR10MB8325.namprd10.prod.outlook.com (2603:10b6:208:55e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 19:00:28 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:2d0:cafe::6c) by PH8PR02CA0021.outlook.office365.com
 (2603:10b6:510:2d0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 19:00:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Thu, 23 Jul 2026 19:00:27 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 14:00:16 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 14:00:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 14:00:16 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NJ0G0H1682873;
	Thu, 23 Jul 2026 14:00:16 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] mtd-utils-ti: Update SRC_URI:remove due to oe-core update
Date: Thu, 23 Jul 2026 14:00:16 -0500
Message-ID: <20260723190016.3180478-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|IA4PR10MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed5966a-591d-44cf-26d4-08dee8eca903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|6133799003|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	I4zgUx63U1lxMgmrbSIqq2ZrNYLGiVyAHsNoLBhTH4dGgDdcGwpNgc7s2dMGFAbSDSzD5z7qz1qCMG2SLQQ07+W9wGOIjkl0FpRCygnZYieslcw9SoymTrpOWCupaKLg7gNH7Hjt/xhU/TVPGABSDIDOakaKyzhEVsNopnJR9VnOAK7qo8pjU1ISrTUjkK1NqJQXFSUQ543Yklg/+qLr17ASKqFXou+IhXMkLB883AoCgpBeAGad60qUVT7wobjGVJR0Gkd0l/SZSQxPv225GjNnOHl8La9/WsgpIXZUpKIhWstPPte4+11SnDFuCsCrsssXRO93a9EkuL5MX3eacURKnDaPxKG5tZvAIqKaK4521OeDqfaxIg268Fgu9tvWT0FDGPwoAOZbJrFG5hDUP4jUUKcHFSCgL2pr9yWrcMHqh07uJrHv1pho3yk7sXiOgUvlwsH9ojIH5dz5jtjjhO9o3WdHZ2rgF2Me9xJeQ+xYS0ALRzov1JEZJjSiBkl2Or2xt8Dqn5lm9gR7wSnFyN8yUJz+JSBM4Rc3ztXcOJ2S+Uvu61RN4VOm9D9/2IY+qx2D0gczNKYEqFbAt0jWgtrLnyv55agPnnJjzZ6xdC5ImDRd3L9sF4gWqKMGIxjT2/bNaJMZ+adAFNJFTEJYGa2NvU5tGkoGMY0YIsfyZeaVYvsvC/EM50yXaK+N68Jph2jFvfZ8ylynZwyZ2Ol+AA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(6133799003)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	j3JF9l6oWNC0L4i9BCKOgRZOl8smNR2+BkbUcBaXRBhszlemEzSsd1y3ao2FhgdTOQ1hRDBUB3KauWxhp5Z4fmRRY4lGPApY5t8lns3UU6kWQR34aQhAKVKit+lGbokhjBO+AuFUPuvl/RJRnLv3JHPz7bcdUpivw0gGlXAxnsTwdzPm/4B9cjg7Nt9618gipFsLBfttP4834JgPQglNKWgz3W/o4YZ71YPTdCoF9/5k240KW3WvY+hJO7xN93Z5AN3Of6As2ti0sI9Ff3cUcTrpTIN+vGIWn1buLkK5hc5QFyf1AHPmQQt1Ln24/cCnn/egcbnl4lxUOoyeLI6kt2NwPTfAuilkWzA1a6AXQYaE25q42C2bx8dKOV2CVlrJKoWA8Bhl/aYgglbTe6Q35zXcZIXpbzJ7oEG5Dt70HCDTsiWVo8C9sZNj6fLwbm70
X-Exchange-RoutingPolicyChecked: 
	M1C1o3tDhckr4/F9kssUIu1sfpcpUPIgs3RqSF4u0i0IzJU+lFoqajsoiO8aTujbThGiDTaX6YTkxFTzAkTw3kJNaxIbWmCVNK9CwXDakw3Q57kFwsMgnNmc62yEGZuwALvcQ08FfsvmUiw1lFieCqsCZZ2WDz3LqPN1w3BQ/zWXn1tpOn8ss0AzWQz/+BmsEsJ44lXkNkZAbDJ3H86YYP/h2++OtWpCAksgp2NeCpHmeT/EE4ltd0ps6aqn7/FTSerQIp3KUMS14suYTWbKHZ/8buif4oPVfs80xvZBP/cxaacD+GiZdjenxDlYT+c1LG59CmNVrOl0uaPv0YNniA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 19:00:27.7220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed5966a-591d-44cf-26d4-08dee8eca903
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8325
X-Authority-Analysis: v=2.4 cv=I6VVgtgg c=1 sm=1 tr=0 ts=6a6264ce cx=c_pps
 a=wUEmejkcrq5hT7YoMv924g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=JfrnYn6hAAAA:8
 a=Yvv_zqkvNT5kJ6XmcYcA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4NSBTYWx0ZWRfXyRwHofU9+EY9
 DgVRzgl4aoXYyfvjANxpQiZ9oAT2joWof8YcFEho8LfP5HR3hr7T7iAFX+Koar4PSlKJCHP1IIz
 MrXZYB8v/zTtVdyda1tMNtyADL/S7Uc=
X-Proofpoint-GUID: s1HyusVQ7kYh2ZSJHDLuhcHAiS1daxiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4NSBTYWx0ZWRfX6Vf6YyZD3Kuc
 dMmCxkgRrA3PiGLTJu+Rtw0+MW2EJOPo2EMJpAvIDKvQ/B3eUNi86TYTkMGazZW5JRryEpeyfeV
 Hmk3qhQJJX0Hj2TFfp17NZn+k3+A0x2s56u1zIf+JGs27NOlUL6EBOuEzsGVd+4Mo2G9iHdSwE5
 OAjeCuC5uZ0EUeJtvEOevuhBrkvaTkXxG0Um1wzEhKIk6/+NfPsemHyvS8mSSlrLAsFHPSHTGhH
 gG0Sx3gNAws9PwKGRtF5r+0ryaA79INhcWCwysftTlLkFAC5thB1vg+J2rQp1pK/YlaGcGciC6x
 AWefelhbNa0IOhRLJd1n0aGba1b0slQIKDaMlfmra1kLjjpMhdO3WUO17FD8345/tBCTDhysAVr
 36gx/QAUvWvl4ZlyJV19Ofwhm1Yf2V5dBCBVEcoBhGSmhS6KubCQyTspECBQ0Flx8Z0u9EUfL4+
 gMvhcs1i8O8qTUGgnzg==
X-Proofpoint-ORIG-GUID: s1HyusVQ7kYh2ZSJHDLuhcHAiS1daxiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230185
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jul 2026 19:00:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20189

From: Antonios Christidis <a-christidis@ti.com>

The SRC_URI found in the oe-core recipe for mtd-utils has been updated.
Update the SRC_URI:remove to look for the new value.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-ti-test/recipes-devtools/mtd/mtd-utils-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-test/recipes-devtools/mtd/mtd-utils-ti.inc b/meta-ti-test/recipes-devtools/mtd/mtd-utils-ti.inc
index 4c4f8028..ad0f2ed1 100644
--- a/meta-ti-test/recipes-devtools/mtd/mtd-utils-ti.inc
+++ b/meta-ti-test/recipes-devtools/mtd/mtd-utils-ti.inc
@@ -1,6 +1,6 @@
 PR:append = ".ti2"
 
-SRC_URI:remove = "git://git.infradead.org/mtd-utils.git;branch=master \
+SRC_URI:remove = "git://git.infradead.org/mtd-utils.git;branch=master;tag=v${PV} \
 "
 
 SRC_URI:prepend = "git://git.infraroot.at/mtd-utils.git;branch=master;protocol=https \
-- 
2.34.1


