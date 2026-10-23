Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1790.1792738955485883060
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 00:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=V8c/HS40;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=oFdKT2qR;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N5igew1862301;
	Fri, 23 Oct 2026 02:02:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Q3KvE5tzrbt8jcnCCkQuyzbZNCz9aX7FaUFEIcTTo
	cM=; b=V8c/HS40Wq4cfQ7sw9h8sgw4KZZKZfyZ5DqB58xNWO3uhilVtC0i1ORSu
	0jMZ16qUlJnFRhTDcXaKGeKsZ5hpJVxQ0ky0sVIZNqICzcMDHk1cvlbxERSgGsnB
	o5az6PAiHRrSvVEMr8KfBnCnyLQXl/eaY3z5zsKTA2ijtoHzPmkZ5iZIaoJoWVMK
	4TVGcwyoR7sbiX5vdqUMzWEu7OTB3wn6xICypDaBy654i+LyOkY9xZTN9VLhh3/R
	72fev8hY4LGdHVQGo6H6Rd6lo6uLUsMMbHCSDWELeWlED7FPVQ1CwXPQcrhPcR9u
	rc6niUquowuCxqzWcw8x5o2aSS1sQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hfmg050hq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 02:02:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNsG89cHK6XV7C+Cp7WnPb++kQy7Q716XnjONb1JZ+5ejw9BHJpM/Vl9u3l5kxkhnDkFcvJydlcjoFZ8hIwwL6eUj7fbyoufL5/gJoSwj2y5pmnLgGIqyvjKEa78BX/3cLW8tBGqhnxoDLpSwtawkOS/SebyErXCtdqwKTdLRy9w6OFdmCLS+a53lWOUrj0ffJ+uzTySt0ZSwSE97EjUG2mb3/nxG8arLrfhEWUqRoA4JARNFqOW3qO3qfYgWq+KrJ2C5vhRGDkebEVx8CQM5Hy5QSol7mP0L20n7O72l/pKydEQjb4XtqQgnbNZm/BnpxBHIn8UszkqinEdiVB3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3KvE5tzrbt8jcnCCkQuyzbZNCz9aX7FaUFEIcTTocM=;
 b=N6Pt0S+r3EaKDTJQUoNhWdLdz1CcvncIsnG7luprztnzqzEvw6GFwvzVw4qvNfV3pBYQ8VD5TsqQBHBxdDaze+QMTK9KZycPU8pPjqJ8xeAxcEjIZOUPxL3xq2RW6iJBtHjBlVvbn5rHNScjhZ6kuiJi3nTNst2p4rYAwwGRg43v4xAOPLVy5q3Bwo5BvbLisc+YfY9V46WsyPhXaQQ9Qn7NcKmqtdnObHGHNpqwUYh2fRJ08hv+r9KXp1TZXsVNC5/kMF45msmfBOB3WANyltlgl45Fc8DCJ1kh3cW1atUlqyq7WMIoiJiJbiX7BjvgYBuxUdMLKWoUkQBtwwjw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3KvE5tzrbt8jcnCCkQuyzbZNCz9aX7FaUFEIcTTocM=;
 b=oFdKT2qRfFP/CipVLQLro7Nq0q/NGU62SA6wJjusWQ6oMxRFAWrM7p9v3u5Uh044BA8vmhvYyl+d7qBV35eu0jShBVIDAbgNt+bIA5/qnTR728+XeEhlth7HZg9kwL9xn7PJX255iylnl3Ej+DB0JNpmOcqV0BeFciNww+FB5IGNRkgfQpNYbZnhIM6DZWIb4KwKa5vH767M8mvoHTtJ8yhU5TjXXsQxki+PBAk5sbDGg89bLVxrlfA4LkRUgVBg1bqHPOfSBVk0rzYVsVG6JRxf/4lmxj3GOEIH/Pj8iRScm7Cfjy7/quQojqGSOYcZKtHtTA8mirQiqCXZfixG/A==
Received: from CH0PR04CA0094.namprd04.prod.outlook.com (2603:10b6:610:75::9)
 by PH3PPF2A078470E.namprd10.prod.outlook.com (2603:10b6:518:1::791) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 07:01:48 +0000
Received: from CH7PEPF0000001A.namprd21.prod.outlook.com
 (2603:10b6:610:75:cafe::6) by CH0PR04CA0094.outlook.office365.com
 (2603:10b6:610:75::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 07:01:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH7PEPF0000001A.mail.protection.outlook.com (10.167.244.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Fri, 23 Oct 2026 07:01:47 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 02:01:28 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 02:01:27 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 23 Oct 2026 02:01:27 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69N71RJX1085458;
	Fri, 23 Oct 2026 02:01:27 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E7DA49A9C2; Fri, 23 Oct 2026 02:01:26 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202610221956
Date: Fri, 23 Oct 2026 02:01:26 -0500
Message-ID: <20261023070126.2780184-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261023065455.3580362-1-lcpdbld@list.ti.com>
References: <20261023065455.3580362-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF0000001A:EE_|PH3PPF2A078470E:EE_
X-MS-Office365-Filtering-Correlation-Id: abc82acd-43c4-40ce-0e35-08df30d3817a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|261021121427099003|261022115727099003|261022105027099003|261022075727099003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xF43dqLwS72AkkyGiUk9sfZhd5JPV5Pk0AkDrjhsc6xaYlUckiTC/uSFKZC7CevAG5LGgH1IIybprYlO6aNpJEgwSQDESUToP1USh5sECf9Fme8D8DimOe/bZ1hTTBXVCCU0k5EG8brSEEPcVuOnqTr9p5vrdfk1/Ub7HytFcpXXF3cOnOAqugRrTLy9n6RlsNFUTfecMY7ptsO3au8nHOvTRsRmWj4exd61NFUGk4iaDuWqOSuGvsMmK/UEDOXWRlZ3jkJqGDiXrOiSzEOdCGtrDKwOtj+d53GtLsuuKwO5M6xp3SLfIeL0AJiAPgmIAq0oE05I6qvWjuDUOcOQRPuEzzDT6NxJ+XjXCIOAV9mh9Csp37ipAohUuePxKl35o+3fGvxw1eY6YgTUOmhbiw4VJo2i5Bm9I9GqPrGlQvkWPWmsSMb/EG+hJl1J66KjRDHgMmy831uRcteZPbrAv5LzDzSN3NDu1cCIFJ+bYf/QkY9S4bDJr4mjWVJ8CLHInYo2IqlRowTKa4rw3hRLoWLUFghmqVc7NhEg0O91Uj+ZQ6rYkEX0bMVOL8aZ1fxcRaManUGlVw6GKd31Gn3aNEKrJU3Nlxmqcy4F2HYtguwe/3dGrQ4+NMgLVUI18FMf0gGlYcSSY5aq/LXnbKzJdHgrKYJ7spqTbw/wZrrNqFsyMr/AM6SWo6Cuapdzyh3WJMfaI62P7eTN/y7rWJNcYw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(261021121427099003)(261022115727099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J5BgGhZuM19gzapzzQ5FrsYlXqBDQk7b4Sc42evBGAhRL68VIT1vfD80q6CTzRptrmHoO4O8Byc/7rlQYkHtoKxqPsLUqIKGwJc1KaTAaY7Eq0zFjJCiafP4JyIbiSAVKv9izp2tMqCmRPiqK2QkRzfTI5IOx1ah3O4wH4ZGkG8Vx0l6BQX88yeOIVWuMiDDE1GyLg1twW7KrLc63e0SoeStZifWMIUJpsB8PAML1iwqjMfS/hyGIKBC4HGB5ysRsgzCLVqi394awpz2GXvN2X+loYrHuUAVk6NjQ+7xCuOsWYOsJIpDj8BEBHL7UbMaq5IRsjf4xGgh0qmhw3wvDX1LR83W7GGTwZAGq8EzydLxgBN40trIQaFVPACwNKdjOPoZgUI8gPKj4a6AfEyb5lxVfqEod8lPSTRlQQzFE4r5nXgihmpMI7YD6gEkZjfj
X-Exchange-RoutingPolicyChecked: xCVtlPUKAfFh5QVhUERrLYdjazVroUG+2fyzKtbdIj7YIl+ztRjrnoZUgLJ/mRh85qvDnCPjbaGakotgLM8TawUZOiEQzJaw/pV/2mAamRAFGmdaVnM6oFtsxLnKmApuaEBuIhHjyoYA3Pzcg/2EkdywHINNYIm72srLnA1qYM3CRhkgPMx4z43FzwgQQxD8L/nYsgt4pibZsg3ov8T3w0XX4SzQtBmZzqwEieTMLIvHKpvbG3okeXH0lFHCZkGBFwNPNpzHr96eGqw0WQdj5WBjdkz3TNtwj1WvcnxfQqLOvS6mPro9wzfnFQdVmNnHNX2uxJKS7X15r/h9W5brTw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:01:47.7267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abc82acd-43c4-40ce-0e35-08df30d3817a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH7PEPF0000001A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2A078470E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX8ho+CIfNmE99
 73K5mnDSv5GMLL7tOqWmvhnSdSXXO9x2+q0roEiV0YdQM6Xds/XxEbX97DBVe8Z2pM+kwhHrWd+
 roSI17tVJSAa1RiXXXt2HYzbrJhzotbEPz0aHZ8ogQduOeDFTJ8E35bPZ8zTbCWkXmwhfpkaLv9
 8f/cKvD4K2Pv6b0nCPxZiERaYLt8im6V3YKTo9KE5oBlguzqi2yvrCOK92I5XKG9VIHmc+iUnyh
 F2TnXt6kXmEqdc1Zq+WOpQzNa83/UydJqYSNrUxGB6M8NeJ5OSy9DvsTvThAe5rIPCE91/GPR0R
 i/mkSaRAuWZnV4+X1rheqKOaiKCAcJbsjsjR6DhD8LFGtq6SkGp5tNFiRao9VNpWTjwjeA4pPiB
 ZYAXFdc8aHyrT1cKsvwboAPHGC6QYGbtc5Srg6Kuy7VAMAHZd6YDS2nxkCSmb4QEHXz6Tk9t88g
 DPf1hKGI+IO72DQXEWg==
X-Authority-Analysis: v=2.4 cv=QIL91QLL c=1 sm=1 tr=0 ts=6adb0689 cx=c_pps
 a=OTtHDJnq+OHIMh0/YV57GA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=76Kw_IM5vw3dZro82qQA:9
X-Proofpoint-ORIG-GUID: sjP4sVuINUPe7Ifime2UeilkQfWRCldF
X-Proofpoint-GUID: sjP4sVuINUPe7Ifime2UeilkQfWRCldF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXz+Gz65nYRI6p
 BGiVnlTneYl1jXpGQo+Gn0REbxidlcALLOCZh6iOhCg+TeB94zb2tkDBgH/nQTrLLjRy1msIRfi
 dj4t/X7EPIk0y/n7NAUUXxVBXu6BXdQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20490
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261023065455.3580362-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202610221956
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 23 Oct 2026 01:54:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ac0d9a5ba2c6c23092a07469bb0df847ba819807

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Aksh Garg <a-garg7@ti.com>
- Commit Subject: ti-test: package iwlwifi-misc linux firmware images
- Commit SHA: fcf809649115791524d1961e70e086a63f0d5cdf

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed



