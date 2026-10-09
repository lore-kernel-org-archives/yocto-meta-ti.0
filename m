Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC501CA6018
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 01:03:03 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1267.1791507781200032298
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Oct 2026 18:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=kPTjJjwZ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=suoyq/iV;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990Onvt719557;
	Thu, 8 Oct 2026 20:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=NGLMT0Uj3Mmp+
	X1Y6qg+v/Kgk8DuAvQ5Q9wcrqrEXGs=; b=kPTjJjwZQ5TSITR43+jrHNWxaNLxE
	BlRqrF+PcMIHJhwH7rzDw/Z48ISvmFvDLq4l8WFkY/Pk8dBf889RM5PEov72MeRO
	NuP/EBMSxDrGpmcpswOhDlyqRtuvJ6WzmxU+f2qc77NOK32mh4+IuPa4zIEMtWG1
	3YM95O1WysSIu0K+QUjmb+ieBY4ul4+H0G8SN4LQfas4lcQZDOOJadoPeMqsMb+A
	AgPvTKvJQ1BJJfq0Yz1NfmUEDBPodyd0CV7o5tqt/KK/9YMfz/6b+5wzTndRPe+R
	nOvT4bo344zHd4HlnY+IA+7aVbeuG0A3fyC2h20y++rg+OWpV+ksfn0HA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h68h2n7tq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Oct 2026 20:02:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAt9hqy25GQniPI9ayo+YYTTA5kqIfGod8kgRW6/cWZXRivZzAwbzZQjd3y+RinjJS3UFszQU35n+F/Ciys2rVzCJullFQ6n/pybi7x5y77OQqK8cSo6lKJssHgeHydbSql5I2bNo0kK9eQmR2/loDORlfyxHdZTAWd2fEl3lK9KiR7gLo8VCQnPEPOGrgwSMe0HN9jE2/8abuyRZGnQdkYZS2LN9GzK9djytXi9baFDEmCreEwWyAdVwMYulMAFsdLexqS6pGKYmcpba6dqr1/m+IP0fLHUqChn9KcjcAFgZxeP9fA1XHeFP7rtcUE76tp2YXSCBX8CTvyZpnvryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGLMT0Uj3Mmp+X1Y6qg+v/Kgk8DuAvQ5Q9wcrqrEXGs=;
 b=IBWYgoIRsAAlgiDMNKUtwgqLDLedopFDvcEXkeuTUCVO3oarYJhQNmKqduQ5QBzG/7rsrQ9E7rr9+7+KMY/XBsguO2yX12wYr5g1IR05NkkC2zvFSMYf+rKcDMBAmB1/TZc4nHgu1nJM5Gqe0J6mAamBYnGQMXAwzg2Sq5CwZZaZ70z/Ql9iWOXtM1qg+Q3KJFJx+kGYKpCn4is/vADAf1NfD+zLB1/sn8HHASkZkOazFBU4djO/U62NvKNAS5B2pKHt2mGPh5QAoXkl/RizjZMVpBxZEULoZz+3DyaT1zV4WXohzkb1pddMD2PJb6M8RXbOunDNVvEJuKZrhSSVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGLMT0Uj3Mmp+X1Y6qg+v/Kgk8DuAvQ5Q9wcrqrEXGs=;
 b=suoyq/iV6SS28vSaXTJFXQEnTKSUFYuZj/QjS1I6aermPGMJmSGdXrsEdzRaOm8xbAmFgtttnpsdE27vjywnmO5FXRSIOfzxG3pqJ/6g+2/nXqIdfj69zu7x4+UOpum1e4xWOZUZysdbZkukHZYrL6pH9pVf4EFWj8CrtMPrDvIMjrxWx/KuLJshN6RYmIqpss+zcMpST0Qt4XPJ59vgx+xFS+72EriQUExR1Hldk9j3O/dUV9womnvYcS/cvEcFAL9+cOczvDKgNZwFTeVQyLijXt9Jo4AcMbcvbZs0wCclG5wH5xAKJZIsdn86G3S/qsw8ey/apGKNRfnc+uNt3Q==
Received: from BN0PR08CA0014.namprd08.prod.outlook.com (2603:10b6:408:142::23)
 by LV8PR10MB7749.namprd10.prod.outlook.com (2603:10b6:408:1e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Fri, 9 Oct
 2026 01:02:54 +0000
Received: from LV8PEPF00000068.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::4b) by BN0PR08CA0014.outlook.office365.com
 (2603:10b6:408:142::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri, 9
 Oct 2026 01:02:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 LV8PEPF00000068.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 01:02:53 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 20:02:10 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 20:02:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 8 Oct 2026 20:02:10 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69912Aot3388627;
	Thu, 8 Oct 2026 20:02:10 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id D0D922A61; Thu,  8 Oct 2026 20:02:09 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202610081110
Date: Thu, 8 Oct 2026 20:02:09 -0500
Message-ID: <20261009010209.39548-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000068:EE_|LV8PR10MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 84659d7d-d6f5-4346-d9eb-08df25a10c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|6133799003|260925021311599003|18002099003|10067099003|3023799007|260925022911599003|56012099006|260925021911599003;
X-Microsoft-Antispam-Message-Info: 
	IP/3aErjh+N4X8Hfuv+1sn1UDXQJlJk+c8IWDOiBPod50iLLuj9JlFpfNF6M06nd35FePZKDEW9G6dRHbjHh84KartYVpkA2N3MqUF5whu775f063KT3QV+iHpTdtllx1WjZbB0ZwKIihKrVLPypxDC21vYXKH6cXDgS45dUYR5GhIY5u44qIURrngnkplJeh/1SKLmVEW5jRRy6H9O5haPNUDFrXOCxe2jrDd9wPaCZO64g+Gpqq/NUKXkWfPh9wkgHyN8RRJVdQvggSubAMlpFmgVYjX+dUDbRP+aWzhs+3W3jeZK6vIv9H3tmLNhG2idic1DgxGWZva3EdW5sIoDK4jmejRL0XQt/s58aZPQ+dXPP5+6/Gu93ou1ahFWMjziY/DraOJfQLyIhPooOHe+zl2ufGdzRaWBujy5CGzsOy5HaCBe6PhvSCAy61cVXHZFN/8Rvs4OBGJkuubtVUHleLsa2SrkQnHOoV756BYvIWfoSNnCjJxQn/YhwHGBz4n+En7y6D4GXMZH2DTpTWL5jgg2ZAPhZ2Y5zcYHgpH5J9pRFgekBM2tXjCxyIvrJt6vTUO+FPY3y6CoHgAC6W4TYzPKT7IX/83DGM2RKyVkCewqWLP1MgKPcAwpueK42EaoHLGIKtjQ7AQn4Yb5fzQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(6133799003)(260925021311599003)(18002099003)(10067099003)(3023799007)(260925022911599003)(56012099006)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Xv8l8qi7mas7lg0Ja+JMyegFH5WUZvSczBIqEC6/l2Lm5mOlwfSDcjLmmiGHU8f4ZJFjKDRuNBspDdLuLXB69JIqidHcM2YLnUnZxiP6TlgvX+nomzV52CJLtkcPYTY3+m6GccAQ+sqfiA0WJJrin/1dyW9G4i9iys1xXD/r4tY6Cj7NP/dI1SajWr/28Gv1LzYmOtkFWyTLDXfndJkj++G7N302zxT9s320IaAKoa3ttHQsjmhZM9gkHx+sQID/6G1utprOlAY/3n1BclnZ/aUu2mKEwg11YIisi56es1fqqBB9wg2Pk/3O9WD9Ebcn9+LRjdOvp4XJzk7tIphNz/ZJ3B6s2HxQ78MUM5d1asuJueIVAZuNXkqLPkrkkV9q/YeIfBWyJcBNL4laAvo0sAW5rnbL4Wjg0FF7cmbJ85Dj11a4N9Y4wQ/4dPX+JTV5
X-Exchange-RoutingPolicyChecked: 
	NEkQxBvlHXtz7EL39HZwD3i8T9kohw1BwusHW0VlyUNWmRp5cBpL5CZ1XpcQMPRKvaL0PgNm+J5Hl6J7UZJ73rFRPwhhwyiVLktks58cOmh3yVHCKeG5lANoJ/usH3RacviEpk7vJ8JJuNiDNCLTaVxcy+Q8oXo3CeporSh+uBxb9KA0hKxyB2eX2EY+6kx6TbMMaD9PIZapsZzPiEC2dD2CLsqC5v9+U4H+JZieUx5z0AUXrKZ7Baq8fyeygve7rPW1owA/RZy0hEzoSNQkqcmPmGd/CmKjS4KVvWZcLTr9n1ji6BvqWDpLjDTzt2IJQbCh5ROI5x05Hc5UDQdrqA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 01:02:53.3343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84659d7d-d6f5-4346-d9eb-08df25a10c32
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	LV8PEPF00000068.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7749
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwMyBTYWx0ZWRfX0aIXoXxPQOlz
 sTaJl3vAN4PcZ5OIRWNIX9QG/xzHRXXV4W/tZT3tgZ4suAaMBBOhYYSV0+0sfceB9JK01ssizfc
 lh8HnRnvUMLZKM4HKZvCKdM+lwjzgsXK46enzkZyLJxVVYq4Ox1nlZY3tHV61K7HemdB1N1AuGg
 1zLiT05MLqeZezORv/ovrcFve5+NE1SPOZZk7uNSHWaIR3yTNxj8jevC1oa2kOZvQIXmIzrkl1X
 /HbKeT3MgmMcyEA1ob+b2SCVSYAs9IYxiyjoQkA9kow69uGiHTqxvte8m079KKm+9ETtIYOUem+
 /m6GV3n7pE03I81kqmBuVpuX6cDAhm6SThtEkz+H8U5rUfudcQL4SrOO9U0ucznw0QRIfe60uDZ
 dV68YtP79RIAR9SPaOHUqWEHdxY1U2u1cEQbS09/ZDS8vgYtMWwfrIHeOCx7r7Upiqge+iPhXdN
 ADI+PcvN69w3ACe2GLw==
X-Proofpoint-GUID: OlJtlT6pdg-IADXQRJsyfaJgD6DRLPXn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwMyBTYWx0ZWRfX2VTci0CLhS1E
 SPESz6r1VoQfzaAhWiZ7HjH6dl5hw+P6YvvD8LvBF+ALqoU72cihTQOaNv2+PyfV/4yqlWsPhih
 X9DgVDiYEBJdEC0KkEudh898Qa9lb+Q=
X-Authority-Analysis: v=2.4 cv=a/WlZkSF c=1 sm=1 tr=0 ts=6ac83d42 cx=c_pps
 a=AaT4FrH4hTNSk8p5YcQWtA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8
 a=4jm-QhVOb48tJUw9WykA:9 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-ORIG-GUID: OlJtlT6pdg-IADXQRJsyfaJgD6DRLPXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090003
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Oct 2026 01:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20449

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=4ca322ca563a21cccad8c9ba65e386b9fd34dd16..70800b68682ddc7a9e7e6695712a94fc9f62ed37
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=3eefe4b257b6fd2ef649c25bfc37551df2154165..792d3f648d38cbdba769fab5a77cb2143026c035
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=ca77f7291a4f1c5f6927fee4e47282b03a39ebfd..1b14f5313a97da1edd4e4d92036b727ea267ef5f
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=fff856a50d43288671eaa733f9f59aa25f2fed77..bdbdb414e41afd2a0ddf34143fd6404f14ba64bd
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=fe064c0799d988e6dc4684ffd8792950640f57b1..9ba35283d2ce7c97e633d16abb4edc06bae02319

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 25472162..3d6baec1 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "4e190e1d2b6ab5467228dd35f236a31185863f9a"
+SRCREV_tfa:am62lxx = "756dd70d3ef34d7a308370d941c9ff126cb6af30"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index f7475c2b..fec103c2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
+SRCREV_uboot = "70800b68682ddc7a9e7e6695712a94fc9f62ed37"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 84099186..960fddee 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "3eefe4b257b6fd2ef649c25bfc37551df2154165"
+SRCREV_uboot = "792d3f648d38cbdba769fab5a77cb2143026c035"
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
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index b08eac87..f9ef91b8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "fff856a50d43288671eaa733f9f59aa25f2fed77"
+SRCREV ?= "bdbdb414e41afd2a0ddf34143fd6404f14ba64bd"
 PV = "6.18.51+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 5e4726a6..3a379a86 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "fe064c0799d988e6dc4684ffd8792950640f57b1"
+SRCREV = "9ba35283d2ce7c97e633d16abb4edc06bae02319"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


