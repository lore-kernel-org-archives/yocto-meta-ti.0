Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C1BF30275
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:18:28 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63258.1773699499417477197
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 15:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lyjQPbn7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.51, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdBDcjvTBxXbPt+RJNTwIIWrQIGdmB+3jQj+jApPALfI5fyJQg779jmfSEYjd78X1gW4L/begPFQAbRBrBveT93ejLZyRx1Ekay7Fio5R8WD36nTGKMzrTR3IcQZUn7UOv7jXpzigoy2oQFJCbjShWOxvpuAmXe9jgxiCs2FWsLT6lPQS4mg4kjZtFz3zkoYKXoNee9AbtvxBjezlk5+1G0o88SivpRLCDPSUF8+wA/gGRM9Gq1JEPtaMaYvm/Zm7VHktPpS+eBX+vV0Z9JQIu2Lh6ixJckvVhQstt1TJUPMDZUaiTDKBnmnOE53SSTISGcIcjgN7efu3B4Va7/IaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMDN5LdlVCSn/otTOi6SrTZKyd0i4/Biin+74LAyMbc=;
 b=wuXF36W5uTsYF0Aj7RlP55fq3Icaxs5FKVm25FRBpZF6NvSrJfBYr97TWx9TJuRHeL0Kz49jySU/oGjYrfAQxyVWdyvihMWpNNEQi6MLFdWwIsgfTj8mONt15woe0B8SjHEK4kwdYmzwQAGCKx7Hau1SAx9FDqLDzYi/PDQhE4gRzkvKKHTFYcoQ1/MFvSYngp2SrZJVQb3Sf4XPBZODyDKLWUuHeaw5eLpDUziEhlgnG8VOjrYarX5u0aiWJlRWCuOx6HOEf/2HmGCNnS+sy4zs+OPVOvf/oEYsMjN8lnEnwxuGz6Ane9+C4zKEj5rofBIhNIcJylhJYqOOuFSkvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMDN5LdlVCSn/otTOi6SrTZKyd0i4/Biin+74LAyMbc=;
 b=lyjQPbn7COcQAWpZvRjylEokhBtbh6PN7m2IQ0pWm7N8EjQg+DGtE6zr5KWH9JJ1p8OqH9GpD1DKkbJe4g9PSNUD2DiK+VyEI+x/ztozNB6UsXwRwwgyru7JZoOswVPkvlaFMNyayMyFWV8akRlvaw1yKXX1/qYoawK+nEc80wA=
Received: from CH5P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::24)
 by DM3PPFEDD6F73B8.namprd10.prod.outlook.com (2603:10b6:f:fc00::c56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 22:18:16 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::54) by CH5P221CA0008.outlook.office365.com
 (2603:10b6:610:1f2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 22:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 22:18:16 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:18:15 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:18:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 17:18:15 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GMIFHG1547765;
	Mon, 16 Mar 2026 17:18:15 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>
Subject: [meta-arago][master][PATCH 2/2] conf: machine: am62-lp: Package ECAP Capture overlay
Date: Mon, 16 Mar 2026 17:18:15 -0500
Message-ID: <20260316221815.2502448-3-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316221815.2502448-1-jm@ti.com>
References: <20260316221815.2502448-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|DM3PPFEDD6F73B8:EE_
X-MS-Office365-Filtering-Correlation-Id: e5726703-5313-479b-4000-08de83a9ebde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jBuTVzPJ+lq5aYpApZXgMjeNfg008In1BgkdIYzZS2ws0XpSmErOmnClD57eMY2Jd+3JP5e7IQOhDzw+gfUHhqOEUFb0YRDZHCIgND2nQ1hP19xLkUMWbQBQYBAkw3tdD9GosCETvHrzwW17hqpRFMZ5QmyWPDOtrt5eE5rZ1DreRrgibRLX42D8sZWG7wntEQMPtjbZRvJUif5YRrA4hHKfI7/yVqZeiv66GI+0kBJmOgTaMnNZ5chfNksuPkA4g9VqOQzZynGrngZ22qTS20r64mUPXB5+MdzOrINjWEpzbk5wFz3mGwFHcIi7H9c4t1618Pkwgi8x9PtLgTx+nYApI752CLoDwrlbApUGcjSixhs7SWtqW6UAUmWjemongyeECaXvDYMMQ7qBQv0Cymy0d3ep0wTCJNv1TcmnD+MqG6dOrv2QrsqzNeRo21MVVuuhwju/8Y4dv8PqKdva6oL1vYmABhMZvfe3c/2q4UQ4m1Cc7SSWfFmOatdfqTJmy+yw33YsGPRT3FI8XFJ/q4xs7cuCPQgeXMN0307uBTYobya0WaTNH57OGO0VZNN7A1DP8YOa1BR7xL2lHbXTQ+7KswnYhNjW9l+MnoBmrY0ECKnYxfRqUJSfLyYAQpWFXHgThFL1z7KfPIF88l4e+BiniDb7GQXSOJ/GNzP+r2VLDNZe3+bxouyvm+EjakGrXn32M98yFpOOatTygA73wC4tClO/xNY0ktb3byabhcbKAU30nJgO7PCsGdrSt0xfylj1jBWaizI5DDR+/jFn1w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8eZs/lS7YW9JRwpEbyNu68qDDmqtzOAp1HwwIDkWpgFyenRtx9Cs8G0VMw0+JRMuKOOIhq6lqYOmiHv11T1PV0MfauJzcO82ex/3N5l14p1p82ExQ0ReCLvzvxL6DfKiluhlfLyytvPXxBn1WmXsiobKSsWRrNZOxdXQYvDa7Wzx6Enu1nVtYYvOB7b8k4Qn54uk9THEIpSOousd99Z95tnCz8ZaGRnjz1+Lv97fn1ANvZWVISHPZCgvNzwf+sm5XTS1atczIpJ1NB9pAP92UdMhlQKowWxxUjVudjtqe0sP1TPf0CR2r6xQdI5SB5Pw5sTTTya9HrO+pvb2KfkPwGBpfY6GW0GnKtC7sB0J2lFD4Y18u7D3XPuabzZHHXqU9Bk7Wcy6qTUoyYHM5I0d//aVBHWsWLXnhYp/f+prUNXY6ubHjXcN5hg+2ksHsmti
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 22:18:16.2045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5726703-5313-479b-4000-08de83a9ebde
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEDD6F73B8
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2026 22:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19721

Package k3-am62x-sk-ecap-capture.dtbo for AM62 LP SK to
enable ECAP in capture mode.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf=
/machine/am62xx-lp-evm.conf
index b24b0772..d1f6660c 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62-lp \
     ti/k3-am625-sk \
     ti/k3-am62x-sk-dmtimer-pwm \
+    ti/k3-am62x-sk-ecap-capture \
     ti/k3-am62x-sk-eqep \
     ti/k3-am62x-sk-hdmi \
     ti/k3-am62x-sk-lpm \
--=20
2.34.1


