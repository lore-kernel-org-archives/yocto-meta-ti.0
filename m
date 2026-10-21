Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.565.1792594364817849442
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 07:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NGDrDfmO;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=jp/I+EIW;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69LECrLu1679413;
	Wed, 21 Oct 2026 09:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wLmyOCqv7QbM8vbfDtX9b6mPBck6Jy0SlRoQBjnjZ
	Cc=; b=NGDrDfmOerYZ1EDK5GYbErZ0GMTEyQhTxnW3A6LEwc6A45F4YLL0DcInn
	ODFquRF4bXGw0NTiNQKihKN9kLbDhnx6kEX0enIht5oQyq08say0lhfZnPQXGnkA
	6sVhzL1ladjhqOYzF8z0qaAlhXzW61Klj57VdHaiZhnsugLJaNbfN3U2MQvrwN7m
	AGTukmh5np9sJYwFL6z9kaacszCc+ZWrgWSUACqI5e5feE8sDjZfTfET94zKw6dh
	AjsQ7Sw90dD5AS0eUZpzuVsTPjLKiPGWS5V6J4s/zIJk9ENEoQxCwlg9p3lKpOoK
	vU9nrDpm0aJSWpRiMIXQ/PaWqZByg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hev9ys6vn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 09:52:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+fH2pnf2BbYVuy0kculzmaKGyZC/1qmsv4H91xUtUumUNXslgr1pyvj6v7AL0TrLGCSTmg/x4v7RsujDmSPN0zjojMLR9S7dLIN7cVUQCJuI+VGIqM6Mz9qbP31iXL/vkFRrxpvEGE23Lonc381IvjNUMqVwa4QTuXe/jgB0z1iaVwga5JuPgWyyBGEX/1WTNLbnhWhiaBLK06fIeXlYqM+I5BueNYtgNyuG2b9fbwVkCRUyKcvPyTNgArVIyvQmhw4SJlXzdKB07E9sFdFgwkQmGEilPQPuQxHLu2utzhcJLHehaOf3g3aI6NkhlnivhT/sA1XpVN5GUstB6WhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLmyOCqv7QbM8vbfDtX9b6mPBck6Jy0SlRoQBjnjZCc=;
 b=OvoABJEh8UaNGBma9x0B4yN7Rq++cyYFwVFmKMUWLBHz1hrg6kl1AUuFdjJJOdygBmMNDYjqN/a79wXYXVJQ5ywBgdJuf6+pfp44sZ5n2ahokLJGSBo4E9NqS545zhc42nz6dEAzZkDmd6E1VhkybP6SGZSINW/rPrqJiiZZRsiGbKSh4YfVBxZO8oa/25w1DKKnuGHgmG/HHcB6fQAUwHkfsBCvaTtYJknM1Q8s1b4FX7DrqfND6ZTxz6ICGEI8KLXpdyWpY0jicJJjarlAy10Wf4RSvGoAMQg/21zEb8yn1YrfP9HOFXRJjT6gWg9MuoG3ep2+KsVJS45eH/BDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLmyOCqv7QbM8vbfDtX9b6mPBck6Jy0SlRoQBjnjZCc=;
 b=jp/I+EIWjf4ER7x9jbeafFXfe0LlCgroc6gM+aj5YWbjxVjnGsF+BaXIHSXTpNt2ZmXeR3c2LsFeopK+PHVos+m87NfFHU7MI1YrKrJ8fWhEcvGGfMuLU2uLfixCcG1l79ksFYlE0ieQjxAKhtCvJbDZyhPCB+hnAFsvcP2C2nk=
Received: from SJ0PR03CA0132.namprd03.prod.outlook.com (2603:10b6:a03:33c::17)
 by CH0PR10MB4922.namprd10.prod.outlook.com (2603:10b6:610:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:52:41 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::16) by SJ0PR03CA0132.outlook.office365.com
 (2603:10b6:a03:33c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Wed,
 21 Oct 2026 14:52:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 14:52:40 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:52:20 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:52:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 09:52:20 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LEqGju2804193;
	Wed, 21 Oct 2026 09:52:19 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <r-sharma3@ti.com>
Subject: [PATCH 2/2] am62lxx-evm: Add DSI config fragments for display support
Date: Wed, 21 Oct 2026 20:22:13 +0530
Message-ID: <20261021145213.853962-2-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021145213.853962-1-r-sharma3@ti.com>
References: <20261021145213.853962-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|CH0PR10MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: 385ca675-aa1a-497b-f75b-08df2f82f495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|6133799003|18002099003|22082099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: znx+yHb0DfJo0bpiGD2DjD2y3OfSsoAkbk/VefwKaTs0CiezGuJGHh0NA8EqPb2bCz/jiZIn++a0FtbKG3pwJsPr2hPrH0/9VfzJK7TCSLvYzvQIB7YZO5ShrdzyLb+Io4+LhOLgCLFh0utwqAohC83vfmZeE2UvDv5u5Uaku22v2VAB/NQE88L/18BsZEVvBDksNCrDWGD9NMuWgTBTdG1JWZeY7S/seLxK/o8W28IlBFHAW8RBZj7Srph19CK7vD0yOvijWoUrKHtXyrigrH2XYdniB+I4QkIHq7FsTu29hA4E1yeUvWg3qI74FO4P/rbFk4JPz/abZYCfy4E0h66b7DRItwSyo3SPKZZShiInwvrL0iqoDKrKunLuLnWMKf3chpMtJitSWUs92mc0nlItAwpPySmVPPxHp3tc+N62KV9y8Ds4jEFlv20MUjHi25pC0u7Qy3Yc8HWBUr8jpKj7CvF5IWzY8oVFoJvfaGCtBQPpRNxk1acvR7T6kuMI2/8UJxfAVgvfLkCqKysmS75RQFSQ7xHFkaaniaRfbpD/y10/2GQHaAJ7sy25DPE/g2ROfPmlLpoZTugGixsWv6o7OkMg2QjwZsqcai8rfn7DvXNuTq1Hq5ApDILvPRo391URXhrEIaQzSgi0nVTHdKsZRrsXq8ukZKqDlnewL0UH3U/I3CBf+9+Q4F/CBhIbR+JEv/9kZKqyU9N3hLnemQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GV9WWFFrDsEs+UmRU4M1NZpiYc/Rc/i+0oO1glUlxjNFdDNhkQYPlSkfGSgxEnQs8iNRizrBXV2AXVM1I4k2plCiyAMii5rOjmOYvejZCGvuBHJjV+ccwsN2hn6TAPq83Aw3XdDje3YqBCWHRwDWpuEW9WGVVGQ/oIxhBNmUnV/OVn4eXrfCA/Pd9QTApMQ5NpdsrlpE/RUdFEH/IO/R7IMHorWzR6Pvun9fddMXK8fA4RLTu+q/TYS4YVqDFS8wxxnzf4CH2k7xw10tk/rXUaUEUxBYnD/EaW+NYJHfX7LqCS/1GVhlyAP/Xv+3+HQMKi8E3tWhkyMzwdBqqXPS1OVV37rCWokc3MoC+YozoxC4wCX1AP8zTmOydhrmQsDzPh8DHLbPFhVe2wccnG/JTfNqGzeLfVoW7fKNfueRZU/sn/03iQ0yovFsdS8fXqxV
X-Exchange-RoutingPolicyChecked: Vd0eTN+pEEXwIUFvDmGu0snZMQqqJnahi3nWcqcjuxSV/mG32xTVuF4ZoZsAJOV5antoyjc03IEra1+em6YcQWmURi0O/vMvsznuGfGZez4ha36KxkuMLdcWkmywyQQfT/eWF3HbfNUeFeWkJNVee9zcqukkO0Bk5CMkPvC/jlwSwW0L0cKvEtMrVFRcBd33BIH7VVmncdbm0O9OKkJNkjHUkHSeixoDzCbdjXMHWRC0NEXqG2bpBHT/bry25cIpzrDARtABpl8Nurdz8PlGvVVTcA4RSxCrN841UPBqvK2G80Uze2mbFYPgPCQlWRNJheHH5WoeXOK2JG5Vbmg6wg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:52:40.4337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 385ca675-aa1a-497b-f75b-08df2f82f495
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4922
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfX8POt4ut14SV4
 w/7J68Iq2euTHzKwv6dhJ+KWZZPEP8XQCGSV/ZuWJsj3CfkR0fyVC6auOXEAODu+hyDIwDfkatl
 Hh4ikD4chi5hvNdveu+KrN4lSAQGR0s=
X-Proofpoint-ORIG-GUID: nLX6r2sAW5wptfO9Yn0f1LnRrVFQpLMh
X-Proofpoint-GUID: nLX6r2sAW5wptfO9Yn0f1LnRrVFQpLMh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfXydXU0ZOpgrk3
 kj1p+ZQfgeO71faROUuOnoU6D1Hd+0p8z529gLwX5NicpBC13PfeoODZYEzmxT2L6+wMRjaDF57
 wgtgasmj1IzWVMSVh75kY5Q4nl5mtUTzrdQnJI+CHigG8gk0Jiy4KYeRd3t/oHIN8LfF44C8tVU
 an3yGut9AxWqZ8+M7DQHICMVrcyKee2Ohsx+DdfdusrUJVQgCIIAn4o9Lqe3ms+1oYENnuKZu7c
 ngGrFG+VneY1Sv1fJq+Y/ya1Elb6eXOYyJAv919HGXz1afgOzERjFZhmoz1yD9+/TmiEOzDZ2J9
 tPaqIs1V+7OAW+L4yPNHQLQ4EUbCmKz5eUlkYTH7pVyBN5etw81lK9D7oqSGYADU6Ozf5SRKgjd
 kCrejvmVuL24GEPIwc7eGAoIfYyyiII1Jr9BJLcEHgS8+t+/yFa07gmwEqJ1WD22vRlkh++wVkV
 F0ivh+1I61M5WP7pa7w==
X-Authority-Analysis: v=2.4 cv=R+uWitRX c=1 sm=1 tr=0 ts=6ad8d1bb cx=c_pps
 a=kfEGYAivpUbBRfgbjfv6iA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=u5AcL_Ogppa1QhdG11UA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210059
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 14:52:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20471
Content-Type: text/plain; charset="utf-8"

Add U-Boot configuration fragments for DSI display support with
Raspberry Pi panel on AM62L EVM.

The fragments enable:
- am62x_a53_splashscreen.config: Splash screen on Cortex-A53
- k3_a53_dsi.config: DSI support for K3 Cortex-A53
- am62lx_evm_dsi_rpi_panel.config: DSI Raspberry Pi panel support

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 7a422617..e3d3bdd9 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -26,3 +26,6 @@ UBOOT_DTB_LOADADDRESS = "0x84f00000"
 UBOOT_DTBO_LOADADDRESS = "0x84f80000"
 
 TFA_BOARD = "am62lx-evm"
+
+# DSI config fragments for display support
+UBOOT_FRAGMENTS = "am62x_a53_splashscreen.config k3_a53_dsi.config am62lx_evm_dsi_rpi_panel.config"
-- 
2.34.1

