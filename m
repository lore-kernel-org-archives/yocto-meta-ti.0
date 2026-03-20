Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09583108B913
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:14:30 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11149.1774008861981863132
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 05:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hf7nuGV0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.70, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsXS9iAhAZ3Z4yDbMqb9nIMISjpPNCiXlRndGEL0A3p2WJb7ET3C8ko2Ta/jL7SpCL+VK7xgkrDuiX2h0P3X4C7t05vWt427ErPZi5ccOL5lEDJqHq1jT57dOZ36iKrPpG+6pKjCXpKyumFlp/BUbTkEAigfrhxJcX8XS3LUtPr/nu4t+ut9ZKEmx/QNLYc1YZ3oMWKLnc/SucFhIqsQvRz0NUEyR8lLjnLdTVzBCtoQgfxwKitPHkYvl6T6qqwuow0d6Goz9uaK4UssabqLbQpFhkPu8hYGlEfGTdYewHsGmBbWn2uLzDJgtgSQW24Dxv1/OUT5T9YClF6OmQNkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uf1aOg47GZ5QgsCih488yfryqvB/Oh/jKXFMUpNASEM=;
 b=cjmn3t3oSC2ezTDnb1cNxe+cRS7Nx04l0bOOdqzOr0DP0oLGrucU7l6zEGinCI/VZA1qvYEz13ckXqdKVtQjI2QmlbeY5LEshAjpPwAkptEHyYn4zyS6HxbQyakbcEdHMPxg+0rS/lAvE8NmSYl5vOCWESTc/CL6c7MY2H2of5eA2FhH2AfslvRq6Q+/8bjPngIdnZKaD7fv49HImCelrPYSedzjOlnni7LKmeCd61vQL3S1QzehQfMM7GGgZS25OHX7CITfTs0UHOJy97rG8pbK/eNSKMPntXGKoUCLHUImws5uv3uScyvtyjSNSQJry9zsokpZmk8ysQzmGJNHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uf1aOg47GZ5QgsCih488yfryqvB/Oh/jKXFMUpNASEM=;
 b=hf7nuGV01DCoz89NEFZxK2ZLir26wCiCAmT+2PjcNcRJy26Ps4QlUMM9kf4JCnJU9RvHF3GIEQIuKrvv4RnTYC9zGKff7Wk5shVaULOxrRU6s5F+wGLwp0mYlzLuHy/9mlBkJ4i0hIwu6MzSvwsz8Ab8xZkZYaIm6X8gmfwSNuQ=
Received: from MN2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:208:1a0::32)
 by MW5PR10MB5740.namprd10.prod.outlook.com (2603:10b6:303:19a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 12:14:17 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::a0) by MN2PR07CA0022.outlook.office365.com
 (2603:10b6:208:1a0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Fri,
 20 Mar 2026 12:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 12:14:15 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 07:14:10 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 07:14:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 07:14:09 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KCE4CI3786503;
	Fri, 20 Mar 2026 07:14:07 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-ti][master][PATCH 1/1] conf: machine: am62lxx-evm: Increase max LEB count
Date: Fri, 20 Mar 2026 17:44:02 +0530
Message-ID: <20260320121402.269297-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320121402.269297-1-p-deshmukh@ti.com>
References: <20260320121402.269297-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|MW5PR10MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: a462a5ab-461b-42bf-32f1-08de867a3452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	inzdAh1/rmu5j4ZODhCSszcG86A00hQrFknnXdSmym82tPb96bH/YYrvEjW/dArX98QY1NEI3guBBKYAYIQq4A/bOqzQ4zMq/cqYoDHYc8Gcf+ICST927Giwe0c1Jnkx/2ogtqVFmqDw2ZWVfhZAHWsVGPHb8WYCetB8PjZF+Qp4tVvzMzOrloygYvv0oHyFQh2OlEqXHwEU+zPgUl5qItdiBNZir/jwOcVSlQMi3Zibo2d+gfvS10cDZ19hdsmhN2FrPmQNTTa13vFIZuAn67lCoDQyrNQbEhegWL2eOjE1kofCC88vyFvQD7YRAnFpL9GYMp+t8N+T4BZOxlvVen7eTuCZx0Ii7X+opCbIWk0tKiDXYHFSax+YnqoKxPExpB8LcCRO21A1/S463TktOVPXdPVMueV6weNUdrCbJa9FDo2dxZPGZtSrLeG8Wy4iowbOi89yGKLO6nFyy9m8F3ciWageTi4cUbqowWmRhK3vP8AD9kLMLIUy+NwaDSAQ+UUPNNuyeap/NCARRfM8WSzpCmst1fNTgrslWSp94H3G+SPq+pUSagnL3BImNCIZH8sKSlG5SlPaFrXO91f11FllTj1Oq+gFZ+raSiNIEt6F5hzcYyQ3L+0Z/3ovmMOCZU5C1puTlrhoNOka9eyKWUAdVOYnNLBqorZYueSWlAGlDoSip3IGHNsXm56PJrVTPa2kvWzCUB0I7QMt+0yp6QLRxer0BFMQDA6QVmdrO77K+nmnpyEykGnh1jzbTE/VmS6Oz6nRD5B0JjOVuWmC9w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jgAsdvNEtJlWrTOtYA28WmD4CjdUZWo3fkOh0nkb/pof/PbYUGDFH8L/MEG1Ea6nfQZeiRCw+5q+jqxqKhiNqG2Gf1wxXZW8EgLKlrUFGoiD3/3NlHXF35iBQIY4eHLA4Qwy5+fWYWWfjuhRhJiL4cciSoGJgETlh9l042ZCMY4oarXukBWv2PCUVcSubSZpmOQHSCth5aomp1YD74eYON39ggJacRRNWU+LYVU5Wu0pG+nxucxJl5vrYAQpqz3yhecxJrjRP1KEyplBwixojd4AGWGDCKuk9b6OQWrZ6DFUjf+YDF9mfpRxSiw6cb1/Ey/cs+q8jagWYWA6Tnl4qLWNvc5ymgZHbcYbC/PzenI2wTwXAG/LinD48Y+mZxOCjwEycW4IXY4h77qR00Brfdhw7YncZBbCFeLzXNFypaLEW5RkUBh9MfyCEoLAyDkx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:14:15.4003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a462a5ab-461b-42bf-32f1-08de867a3452
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5740
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Mar 2026 12:14:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19796

The mkfs.ubifs tool was failing with "max_leb_cnt too low (10077 needed)"
error when building tisdk-default-image for am62lxx-evm-rt. Increased
the -c parameter in MKUBIFS_ARGS from 8500 to 12000 to accommodate the
larger filesystem size requirement.

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62lxx-evm.conf
index a0bccf57..9aa4b853 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/am62lxx.inc
=20
 IMAGE_FSTYPES +=3D "ubifs ubi"
=20
-MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
+MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 12000"
=20
 UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
=20
--=20
2.34.1


