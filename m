Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12457.1792591677755023344
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 07:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=F2zuHISj;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Lwh/w0at;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: kamlesh@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgsma1596572
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 09:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=PvsxmTJ6RArqD
	5K2hHGB5QHE+oTLyNWwmvciWx2Y0Bc=; b=F2zuHISjdYMLrefmlYk/eIIRUjWXI
	F56vKRP/PhfEcvyky1ZzT0dQmyaIC/Lhp7Lqkdh4SM7wZ1pOvmWhExLMcBv4m31g
	Ml+Ya5XJTEEc77TtHtFiTgJqKtTtPwQt3FEnN1sMlP32nBFOJquHAM7HMBQtuZsI
	Wpp1M/f3VS8QisbxFWsfymbkUEUJNPMrc87IcJ38G+7DAJywYCzMRWkZWFmjTZHL
	Z0xztjVjpu2kTlOAmgmqvUDaZrkEajgkzbPPhiMNiRWht7wYffWtyJkkpICb28a9
	JvjmoPxJrlLt4hn7oFwdBYfud99t1oG5NMPgA1NU0PLujVv0axrYE0nLw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4henaajyvy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 09:07:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1Dk5RQFii82azl+8ouhbKxoQZ9BUq//y7VlNTdbI0X+XAUkDBFdN1OSLCXvkUR1dh30S0UVGj48waPZP6KzBu1QIoVdkuQE8Fh9lVRvVr5+jh8bSW/MK0MSiuzxBnqbtaSfQiK8ftUs8qQWRO+HF1lcb+DTzj1UjdvscA5UIIQ2rqS1L6omdbgD9dli0sKGQnX0VV6iCClQIhv4bSQYcUNdul4ctezS4+ct9tvohYthMnI3RCcmv40xRE0YAmqIluB5rxIWfyKYXP3c2+fhnIAaeAeASked4EXBajUcNgScPtY50DZ2qToVkSVKQwv5dTFex9MKKow8DEyLQIO4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvsxmTJ6RArqD5K2hHGB5QHE+oTLyNWwmvciWx2Y0Bc=;
 b=aEJarJ/KQySIWfLXAcnBN80RrsU0xsjvSf/QP2ehaK1hduEacPmKsnJAD6d8tlAjkbwRZgOjcchaYi0kaDRZVVIVEqf55qsOzTJvwdhwS9USj14Qa4q3+aKADGzgt2sMgzd/G7VK95f2dwlzEzhgKc72v78dUIkgqfWIgXA/R2/Nt5Jz6riSULjPhcE4sgx8LnwD90lYRh0HCLKpEjhA5LoMIEwxvZPO903dVfloWDJ9Fr0IkFH2ElG/qFofTQJ96TggHjVdNAiuG9UCfVDJOfBqmwtcjjHiGIJRjf1iMcrd+/UHxBbhT9JHEZUZthJWD0fdVV433yM+an3wt6l64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvsxmTJ6RArqD5K2hHGB5QHE+oTLyNWwmvciWx2Y0Bc=;
 b=Lwh/w0atCW67vGbaH11WrDav5N4r1BKpSOBxpezH2gWFaggCUT2wODXM0AUn0UIWYfVURQbIlitBkV8xwYc/xOWuaqnQP9/esz0jqry923QDET2+p7eBXLHR52m09VAMml6/Ws8kl7JabDW9tTYR+/YDhWYolbCUUJlWmTTh9XY=
Received: from SJ0PR03CA0193.namprd03.prod.outlook.com (2603:10b6:a03:2ef::18)
 by MW5PR10MB5850.namprd10.prod.outlook.com (2603:10b6:303:190::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:07:40 +0000
Received: from MW1PEPF0001888F.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::36) by SJ0PR03CA0193.outlook.office365.com
 (2603:10b6:a03:2ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Wed,
 21 Oct 2026 14:07:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001888F.mail.protection.outlook.com (10.167.249.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 14:07:37 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:06:47 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:06:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 09:06:46 -0500
Received: from localhost (kamlesh.dhcp.ti.com [10.24.53.228])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LE6jsA2733258;
	Wed, 21 Oct 2026 09:06:46 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Wed, 21 Oct 2026 19:36:38 +0530
Subject: [PATCH master] meta-ti-bsp: optee: Update to 4.11.0 tag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261021-optee-411-v1-1-1f22b982bbfd@ti.com>
X-B4-Tracking: v=1; b=H4sIAO3G2GoC/yWM0QqCQBQFf0XOcwveaxj1K9GDrqe6QSp71wjEf
 2+rxxmGWeFMRsepWpH4MrdpLCC7CvHejTcGGwpDa22lVgnTnMmwFwl61L45NINEtij9nHi19+9
 1xrPzzITL3/vSPxjzd4Rt+wBj31ipdQAAAA==
X-Change-ID: 20261021-optee-411-292b373d1ce6
To: <praneeth@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792591605; l=3348;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=yFiNDBtCppOWPTw6+zzGJf6nm+XHhIUJNGEes50Ykq4=;
 b=JWRSSjb6bTeuwxmmoRqIPv3/QOv/CODxp94wthvgdR8xm82hS0W0QG94gBXb2G5Pr5x5ngG/o
 p7kzzT0OYLKAA7fabcZNESahiyFzG8QqVGWtUT4DL5kv5PJ39Q1jG40
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001888F:EE_|MW5PR10MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db5c0fa-3f22-4930-dbeb-08df2f7ca97c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 9LnSLuqcWCpxxrhsyoFQPJZa9TC206sRT/8szTDdt7lVaQaor2BdMGVXK/FBC+EV4sQ6vERCLE3RE18vvwrYPsg9daCSQYQxR9Eiy6NP+mCrCSPrqCYYToEB2irxRjgJBQWgRItFWJLQV0BiXBGpQCnK8bJIDRjL4K1cNtvZc/c9fIHqkayzgTkdwREQ1XUNGdb26NYwl10XH7MDDsGZToE+v15yq03MuwC6ovOxoa/s+tJi5zp3w3Z5ojjbrkWqRk1zj9qSE+GVUugU1AOKWWkIogIVW5oucvGx8qGkh3jXa/FPh2mGvYf78+NLS1KOhbk0RsL7pg2+UNqy90MYQR8insxcL5xyQNY4BwT8quGoQWD0ZXT7o8bcpmB1dkzPIph0L0ix7Z7McuFodEmHlaGihs0KiJd42KRkA6LElPHzXJNS4ej7KQUCklhqZD+74DXG3Yupg/WiB73pTJ2OK6Z0qewWK5s7fmw/vGP+fXRfvchBpndeDD5h9MTngxZCyvS0p9LHZDnlSSL6OiyimdQ+BEz/H9K+4G3ZzUnjrs3E56qol9kxWXhE6DE5GNjD7HOD6DUZ+tErlJWOa3z8tr8uQLpt2df2xHFOph2Jvsp4an/GE3UrpMGacU+ZL9+fxVoEbOJlZxrprLuaOcFzvUKD8k7GIVI+Ej/ec1eg5b7JXwZGCEQrceaNjKh2UiW79nPUq0dlwUClIP93B/3xMQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ntWeykE9agvgU9FnsTjHRIWNfD7mqmJC5e1itKE38AGeW9BndWlR2Kt/IP+jfYG1ThK/Gh2AZegCjE9wprFu/Wbg7rd74fvnSOkRVYGOAo7zUczS8nk28xi4cFOIKRrWb3sRo4xm+k7ZIoCg4C/x0Zuwe9AJX6Sp5kmrK5Ywyus4HaPqikLmf+i8RO72Bdr+ayxbrsV2VuvoHNQgXFLzL8dwPnDLiNVkEz+wMpIwhYHLVY2in6FlaiQH8/nzDYNL+ac78kvwVqUYXfkGPVNIMdeeAhdxMrbMOHj0+8rZYBzehzHqFiD1Dh270u5CIXNDHiX7pWIeXnkJ/ENrTE/6h893rWk/KjA8NTmPzT4A+9O83xW2oF7GTzDT7iJ8G0MP1tOmb05iy0BU4TtRacceKhSMeM1d0vFHtgoJN7+fwB1O+D/0gMrau4Slb+cIV8ul
X-Exchange-RoutingPolicyChecked: egk8KSmK4xiMQw6/3fvfsuAeRE3WDAG5DqYIP/A24uYNriZGue6ndHZQkzQkpoRsI4l8B6ulyzR8qAC3zncQRbKXUxnPyr6YRQWbyspO04J5Pnscq40RsQZUkHWDDZ/nABzGc/ijN0nPv7wCSG7bJacTn1F8it2vwikiTOnTE9zKiyyKBLow1bxKjm1fHhj1iGcKskcT4t9qSLNvzEStdRnbZIv2f3JpSzbLRJWVWiyi/F6uJTHz9tKOghHK34zYGqDWF44jCPYdSoDfFqaYp5tkJPQDWa//a3Lh0PomHEFXYW5pFyzq0aAgaAiVQfKSpUf/TTRmzJx0XVctLGbhzw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:07:37.4557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db5c0fa-3f22-4930-dbeb-08df2f7ca97c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001888F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5850
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX3W7e7JuokVZS
 UZmDLGzY/nL/yjwaBIJ+V9amhRP4b8rl5Zgdkam3f0Gg+2ueMbywKGhVhz6Vpu5sS9qtDJdp2iR
 GSGSkdrPMHMSXKc2GoZAXVfUT+AOrWA=
X-Proofpoint-ORIG-GUID: s5-9Z_I__0zRFV6I6ry9ALPx0CDTy8gr
X-Proofpoint-GUID: s5-9Z_I__0zRFV6I6ry9ALPx0CDTy8gr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX7pUFqmeo8nlB
 jEXlpeubOePhgtk+NUyA1ROXIYi1w0orRLX6RiV9IV2VaSsqQQgFN2JJGHzxyvjkWN6MJ+b+DN6
 R2fcy4W5c37JZMnT1IKaI36+ZQugEvPgP+gcmm9ZKLpqLdXm1/YEd+Sndd/yByEvqFID0rTnD8Q
 7KBiO8LpTmTcUW2xT4kLQ1M4WsoZTL4nJszX9pBcwjk1vwD0H4JqCGIsvv0/5vDnv1RAplaSUOK
 +9aLriMX0h/4VG9+0hRR0tCaEabWKNxANtX8AJqiC7DCo6gIg99V/lWS0gC/IQ+oOb1lRKEFAze
 7vr4WI6D/cnqfm54gm8Bp/4+4GDdMmC/VjQSoJVap7E+IPwK+yfbq3V9bsj/4j9CaMw5LhV52P2
 YKD+Ce+pfxrZan3RpeHmzjkBwM5PSG/bOt9xiPU3Lq40xNvo6aU00nrpUTzSl11eW/N19Xj3mTS
 hbJITLRybTHHSIK/6pg==
X-Authority-Analysis: v=2.4 cv=cJB1IVeN c=1 sm=1 tr=0 ts=6ad8c73b cx=c_pps
 a=5+b0Cb5m1vs/r/JsbObUdA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=v_0n9l2IsQlz5PLI3ksA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210056
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 14:08:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20469

Update optee_os, optee_test, optee_client, optee_examples and optee_ftpm to
4.11.0 tag.

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc   | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc     | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc       | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc     | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 7968f3fb..2418b6cb 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.10.0+git"
-SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
+PV = "4.11.0+git"
+SRCREV = "da81fb7b30781029bc9d4acfddc7c60b08deb1f3"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index eea7762f..10da279d 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.10.0+git"
-SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
+PV = "4.11.0+git"
+SRCREV = "71e8f3f320eef46a9369700bf30b91d67427d535"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
index ea40ba27..1cba881c 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
@@ -1,3 +1,3 @@
-PV = "4.10.0+git"
+PV = "4.11.0+git"
 OPTEE_TA_GIT_TAG = "${@'branch=master' if d.getVar('PV') == 'git' or d.getVar('PV').endswith('+git') else 'tag=%s;nobranch=1' % d.getVar('PV')}"
-SRCREV_optee-ta = "e3b1e426a605e0537a3c3c9c24228eb22e354b80"
+SRCREV_optee-ta = "f09f4cdad21028289d4e8fc573893b75f7228dc7"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 473c5282..92fe85f2 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.10.0+git"
-SRCREV = "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
+PV = "4.11.0+git"
+SRCREV = "f54190f22611dd5ad5d22546fd4209aa100f56bd"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 8a8e9ac8..60ca3bab 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,4 +1,4 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/optee-test:"
 
-PV = "4.10.0+git"
-SRCREV = "88c93e87a5c172363ee986ded036a25cafcc9d2c"
+PV = "4.11.0+git"
+SRCREV = "179740b43809069ee567d58ebd8e0f85ef8168e2"

---
base-commit: bf41b0dcd77d0c0cb56d4e2cd92c0a7ef53ce62c
change-id: 20261021-optee-411-292b373d1ce6

Best regards,
--  
Kamlesh Gurudasani <kamlesh@ti.com>

