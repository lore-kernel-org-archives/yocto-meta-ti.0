Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5302.1793783525643156896
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 01:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SGePcOf5;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=gcS08yvX;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48J5nP1287178;
	Wed, 4 Nov 2026 03:12:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jbTMtScV0JcKXvHIQN+Gyikl/yxWtTh2e1hZViIai
	h0=; b=SGePcOf5s1WmkjmWKjSgSLEl72pe5GkGo5o7rqd1d2QlAXfFZfWkEomzg
	q7ca0qu3/jb/SOT55tGATKqywiHgeeUrYV1WsjOBix8D7Jhc5sfQX4vwBrBJJ7ci
	GJb8qDqZntJKsJu+ZuwTM2MQLejYidXO4CUYV7i35IWI66SPeKcD2mde6FO7kOi0
	UK/qxVpZCSpKtVNC4tIAZ/A/+cWzy2EDfa/snfhsRAEEbICRJO1L9jcuJCXFZn1y
	73X0ypb2YIdfh53fTqUoQlodUMtcHteYrdrGe/EQQdgP0L34rXI0bmwtWS5RReyq
	0B+upQnGG37NlrnHJIeCwxvGDcezg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013036.outbound.protection.outlook.com [40.93.196.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hquyf1xvh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 03:12:03 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlAtTEUSe+P25uWvPpGMFgsktZ52IVcgnvJlXVCSdQSaWQQiwKv1COfo5cQd51gHdxgRU0X1r5fhlfJM7ANW6dZPi3XEM4AzWDzMYhc4yo9qyo6NiR5tVZ2/XSZ01pJurxJMEIJMeP/T8xJaOrbejre1BfgrQkAJaNE6YlWBBQgM0XDWArFzRHEXF7ulM+Y7OnmEv65hdKVfm/C7PeDPItbRCqYVaUiry4LuNY4RFwtygm9ENlGMAqnI1zorn68Fyez8LuFXX1SzHXprjWCyCBxGTla+oRzdkLcIngi7jfV0MIAsEOaNuwZlISzdzwWmnhP0exsBdzdxDDo6+NV4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbTMtScV0JcKXvHIQN+Gyikl/yxWtTh2e1hZViIaih0=;
 b=cQfoV4OSandMS3K1v07luGQ93w0AMLulMbkHY+SYmUY8IrMK0bAslNse4G5TTQFO/aWPhFO0nVl/1VZiYBLH2+cqY7VjWZYQv0pyjLRZ+XcPEiNfUSCTF6B15l3SYk+4pjxbR9QXHMoEX9vyCu8NzbOhM5BU8sKzJLqc5HBRrQhNULSL5N/RYpyN8HR7ghrMDSrOR1EdyATl0cHYHwz/8O1lt9M0G1m6KgZ8qJ8m26MZsPGoZeMWEnaAaR2tnnq+2vulk7RgTrjT4Y+uC6pbomU5iGi2+ycrvQcLgFANJetkRb27LC3GQ921RY1dqgPWcNBGf3//M+cr6D2baIpfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbTMtScV0JcKXvHIQN+Gyikl/yxWtTh2e1hZViIaih0=;
 b=gcS08yvXAodZnfWSF8pi090s5KU/FrjJvvmQpeMMmUwJ3phl3sb0pjGf0vqQBc5Y0cW8kO1ycekRcvNdVsNKfx9SbqMrlAUIaxgn9rIKj0ZHdU+fA5eP2hXBBuzmIheSF/a8NmXDi5gLAvZn+oKNn636wQa+gEqsAMOTFaW16nSS3Si+s0stB0TNnpw0AOwVFFfH03KlxMnt3pIhtOlrbZrqi5vTn0QvlB/BZwSaHiwB9NLNkfV0tngeJVYzED1XyA/9T6CBwNzu/+5lFt/Y5ucMSbrnCqpVPEJ+k25IuquPhZlDmJfWYidpjnncFyy0pk4RSNdC+dFzm4mQaFPpew==
Received: from SJ0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:a03:3a1::8)
 by SN7PR10MB6332.namprd10.prod.outlook.com (2603:10b6:806:270::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 09:12:01 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::17) by SJ0PR03CA0363.outlook.office365.com
 (2603:10b6:a03:3a1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 09:12:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 09:12:01 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:11:53 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:11:53 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 4 Nov 2026 03:11:53 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A49BrcQ1854087;
	Wed, 4 Nov 2026 03:11:53 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 639652C86; Wed,  4 Nov 2026 03:11:52 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202611040100
Date: Wed, 4 Nov 2026 03:11:52 -0600
Message-ID: <20261104091152.2446330-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261104090328.3447973-1-lcpdbld@list.ti.com>
References: <20261104090328.3447973-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|SN7PR10MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac20221-b200-4136-ef14-08df3a53af9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|261009223027099003|261022105027099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ft3S67vmFXvtxn5luDXXz9GwQJgawdBZ0DJejRWwkfwMMDCZdZ/ESgJRVRZIF4x245rlyjbeJsBDN1hcrtuqDLmvDTP4c5bYY3DreDnbm7d55iIkzvO6f4dBBSDNxZBcKKx2jntblE/LNixYwUgL00m2Ebqb54plNMCAtjZCCUyoPCQoPUfck4e2AvLIUwkJ2/kyOvSp28DqOvEq5A32OkmjlwAtyhV1wmbsa0PQ0OoFpIZTqROU05jGa2tAOgtJkuGosoXS5T2ItyvbqjhsxlQRDoZI/Hb9lg6vnhG8SdQaMxiqKMdE4wwLifaVJhI5ZjUVvpSTVfZ36PbRRb5Xd60McARfNGpIIY6K3mvmSxZIZV8Lhaz8AJAE6nv/33Tf5dSl4z3kplEaUpE6TY8WnsMUq629H63FRG9SsV28S+rfR5QyA4KwQkkXWjk4Bvj1cLluocRUf3YhaKcRtWK1+wrJ/wN7uUuLGulgKLRRLP2vig54xIYuvSguLKJpWaOpIjr7qWcdoOLqR7FxqBOrQRZvmf32kq5bG4JYAR2Ck8GzNeb6rOZ8z2xRSuukXEGJ4TBoySxg8VHqOk19O5IuARCP3uNi1EZNfDdS2FI6uWBBn0hVoc5R3inMSTbOmWEHXWo0lDEnEyxYCnAwAxh8zGh18e5l6BzGel32s84Vk89Jv4kQG/Th0snYu8QaYv3H9Z55M2GbLSMGn+opT8vGkg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(261009223027099003)(261022105027099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0n+O07I2/agq7NGL9FSKfoKP3ZanyCStlVBzCrdRihA8kvBVqghBmOa3GHxFOfIU+JdhhZq0TwUokMJEFunjgGhUqYIjgzdnVJQSWU1dP4q5OQhUkFBW/XoAHF3ZSjJSwuGohWCRP2TOz2D2T9l3Ivl6vKd8/6EQsBe28+84qJOwWid5ZEkDsoms8+XvHNY3ujAxaWr7fnftGkH+eLMIX6xpizGWZJmRRvAl5DAZ+OSwSAEBr8F3mHblu+jEVAgrr4X1RbrbipzQnMbyZ5D1YJ4GFJMNg+GHSqLWKuJxkkUjYxz7IDfotXA4f1mLiq4gEDRwbEWKI8kLeW2QDfHBDvSBlPNhOYHrjBlEwfLjrq0/FL7+svkPVA/AG8454GnDTkOlmRZs6yyKKvKKavajSyHCJkRabm4umXFObylH4rWi8vqKTw6vXSrCn4ejYtKe
X-Exchange-RoutingPolicyChecked: KL8d36Pstp3kob5h++0ZO8MQ5S/NXi8NQAXnERv0GyPZ4ohXge1ciUFbQzxSkZXx4ZYDDSD6iy2/gDl8DE8vMJEpIDDN2gNuj4Fenw43v6APH1IOcx3QW/Nv+EksfGFxYE/qA7WxuZkgOoAz7OcEZGAFxgCYTh3XOIFI6G3oydUgISC3dBJN8XpzkV2QQex8XFYgTDFzKmIC3y+YVp/It1ZS9E6RoKqFz9Ihe1bfGmVzzJDyfWoy/uI6sObArb7feE1rQBLZDD+qHv3efxJqXIle3+2Sf9w8tDs+36FKUGLOHvHdUqyNZZcwJsvIN/Wo90AUZFkJiBIqLnPU8xp0jw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:12:01.1725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac20221-b200-4136-ef14-08df3a53af9f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6332
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX6wt5X64MqctM
 /lLbFeZzwXIzN9ZEp+pHh7r1DaId4uxZHZB3HwXxnFF1ikvkrTWAb1/9g98c36rcnOmVOUyW3CZ
 dXYxGZ1KLMtcFlqYpBMoqDHREfrc1U+hNXIEHi6POeq0iYd7bJ0BTr+tFTrpbKQ2M9CIPw8WH0M
 eIbTEY/WPuwSc5mMvmI1AfVk7tlJtJ4Hzg2aNliqa8CSo/IIS5BELxj66T8Ys7UTgZw2q6++f3B
 AdNrXilBFpK/n5ClK4fVBaHBvCOMRVT1oulO0GVxkBHRY8OkWHU+1kvF1rtERcdvJL4IhA4z4v2
 m2Q0XiuXUjW4XUEA/5MuGRa4YkUR0bZ1pwmEgQAGrt+4YAHCvng3WM3Cb+OHhVF1nZ3LdajUpK2
 LOUXvE8ryk8EE4qOSqwPu42WTaN0mwm3N627xiX9CQT5T18gWryKzLLDUzBrMeMZigiJFTne0xi
 IangWK7A9J4ghLUR6SA==
X-Proofpoint-GUID: t1ugkf3IQ9-wvByWdr6cqc1kI_rAE4gx
X-Proofpoint-ORIG-GUID: t1ugkf3IQ9-wvByWdr6cqc1kI_rAE4gx
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6aeaf6e3 cx=c_pps
 a=vqIpJ22NDJOYTIB/W/KhXg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=_g3Lfgl3PrjPg9nEKWsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXyoc2O87XbIpx
 yIy9eHsQ+iKEw44sovBPBQt2JfTAegN4R5h7EDflXFcot7PvQx99/N5hbdlCp/MMR/Im8iRKL5P
 uS/uKaLmy3doqQrg5rczQLD+i5sijGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 04 Nov 2026 09:12:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20506
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261104090328.3447973-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202611040100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 4 Nov 2026 03:03:28 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a16d1ec29b269e42079ae6a4e821c869e639d03f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202611040100
- Commit SHA: 5bdbb1580b8d9657a584a3f6c99f698b63449ffd

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed



