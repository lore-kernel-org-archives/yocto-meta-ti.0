Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0476CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 07:27:49 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14754.1780471662111106047
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 00:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=e3VWvJZ3;
 spf=pass (domain: ti.com, ip: 52.101.201.63, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAYjRvlDvRT3hDD1CRxRC7OflYeBCGBhZ6CE8XJJN1BD393DIrnipGuNQrW5myGwm6BmGqzap/34+qO4tgqB1DdYi+vdNbnhVSAJWWfzWwDaotDf3Y5y5wnZEBjwmeeG/RCrYslefTB7E38tmJ3qOEa3zL7MDDHh08IokMBlkBq/Lsi2FHr9rdr1eGt1LEBtVP+F6TfEOqmVAyJ4WA7sysxubnTVM55f9uJZAV+AquY0PCyCpKtXmOX/3psx0HjjBsvbBoOHrBnk6PQ88zJ+mymjuJqryYMYv4lOjaEl/tTgxZ4sAb3DTpOoUZZeZyC2ptfYldZOdKHJYPoH+WvmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjji4bh9vpGxVQqamXDomZY6bgsLYq8umxBv9hL4LDo=;
 b=iocPSkyqRNLQZrFw1HxK/1K180YUH0JCwiwJsaXcsZpib2iAypoM/aMpe2W5ge1qeRQqYFW0NzF77mqI/Gp88sm2jaA6nScuSmkaAB4lh4WMmy8SwOIq+jzHx1DSSACgijusuFILszHcwgK7wNDs7dRNfYlWWe4OHlTd4rPzZ7hxhtSLbL4JhxVGLwA8f4hBJ1z/qIejLE++7Ujv/pS9EaFpY1mH97jnFqbByIreyzoZ2XEvYPH2d+wMgvGhi4KDL5k5Uw+KEJwHGT/T76Cz1sV08xm069g+Cw1QxcKqqGgb6HKZwdHDSmacH9/x1T17WfAs4cW2YcjIpz5nydw2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjji4bh9vpGxVQqamXDomZY6bgsLYq8umxBv9hL4LDo=;
 b=e3VWvJZ3AGnIqjcnTR3NTEVav3PUC/MZ0cj5EiIbS3+6q+i9Jy9psNT+d2ESNVqzJH/8WqHUkx4HEETO6VsCBDGwmynmP2Crezp8ejX1LjmS3rFTP8sp+o4USo/ep7frlcxbt6hF4Sq50kKc+lkTR/eD4aOo3cKEzUGeAvwjSs0=
Received: from DS7PR03CA0008.namprd03.prod.outlook.com (2603:10b6:5:3b8::13)
 by CH0PR10MB4921.namprd10.prod.outlook.com (2603:10b6:610:c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:27:40 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::72) by DS7PR03CA0008.outlook.office365.com
 (2603:10b6:5:3b8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 07:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 07:27:39 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:27:38 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:27:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 02:27:38 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6537RZc5734199;
	Wed, 3 Jun 2026 02:27:36 -0500
Message-ID: <de8de802-7231-4d24-895e-29d750a32dda@ti.com>
Date: Wed, 3 Jun 2026 12:57:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v2 0/2] Fix NFS boot on K3
 platforms with bsp-next kernel
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <gehariprasath@ti.com>, <denys@konsulko.com>
References: <18B58170605FD50D.264455@lists.yoctoproject.org>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <18B58170605FD50D.264455@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|CH0PR10MB4921:EE_
X-MS-Office365-Filtering-Correlation-Id: de977f9b-d556-4765-2224-08dec14197c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|36860700016|1800799024|82310400026|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	RUZtaKkBOyRfcyQ08GoOx3eC1og7rw/McRbEFgtu9pCzfK6i2sfii0E6CStHUmmTZhOLikk+V8CVBqstMU6ZuNHaXp1vxL4KnKHV9Wt88Dopfgsb4xAMvls9Z+/xJUO955mfHvbLVnKSD4lsy4nPhqWbzQJ0yjDIYoNVmtAAYu0n1LgXsj63ZVTIwMd4IerkmDUOQ0JgaNLoE7rqsvCF39oUQ9FqFYkxggyWlfsaj2Omh3yD+sTesXW3foUY6oXOMH4vtDDc8Sns82cplXlm1aMifdxkcvyiPRdEVP/H9j7at0AEgHaLT5NKue4nJ6DMkLdLhmEHLVD3AkViE5u6Xdd89hQ90T+saaNPYu3s0fIC6P7PJxxbvOMlr1aodAyDZ5mCrvyFVxVqk+xWp90POf9TNLyBkI+F7p/EjLvzJKrVDP/TlNqjI3QDg26fbiH/0pKSy8feCKHKGEL/DTJTXxH059rbbhlbbnF0JEg1eQ5M/GS8rBCoc5k5BZTAY7gRCKDLAUn6cqlUwtMbBBZJhyROchi3JMBJHPm7dOWZ3AR6q5SXRCZ95jsPCh3NmEwIywsaCrEOMC0p9kzFkucO/v04YRD6Ps4tO/8Rw/bKMN6e8+d8CDRUdVmrpelyGb8lM17bwqcGtz6GDoJOo5p2CTYBEqhR+XotsP8U3dSPp8bY28xFSrgteEQ3ABiNGu0hV4oAknhgB6+dqKEo9cJ9ChTxcYiMubHsnpjLE4U9RAY=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TCfhne6/fzKNwAfI7XIPP2OrU8rz+GF9DAupxgK5jZLmo8e21VYgY/erpefwoQz0nbkfVu1nzcs4PoEqNRsl8ggJSpmYWZ9gaPW1nTjk689CdrdY8Pe0tfyX0UrzEDGX9Um3azSjAgRnldqOux4Ihs/EChe/wwrpyCncdvsIzLiN1GZC3FV4rck1Fx9uQKbKshKR26mRqUL4cOoFW47hrqkcJuqCfbE0KeesNkaHs3EOgbhLkGChCbLBgzazWfTpqimdSSnj71wzanLseTwZyy7aAAqbr+uVa8kVNi3ZzmDgFenvB/9JKDeMnTdmOsDTqwPjardbs1yp8+P9O7kcQhY/u3r8ac/VAlrQAg7oy0pHYaadIL4abifR65X4GHJUA8L0ROkfy6gVXkvT//rYsj6HdNjXtXOVlWOlB2GF0hLCf75oJ5evOqjJaUmSDA+e
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:27:39.5728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de977f9b-d556-4765-2224-08dec14197c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4921
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 07:27:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19957

Please ignore this patch, had a problem with my email client, apologies 
for the trouble.

Regards,
Moteen

On 03/06/26 12:55, Moteen Shah via lists.yoctoproject.org wrote:
> AM65_CPSW_NUSS and its dependencies changed from built-in (=y) to
> loadable modules (=m) in linux-next. This breaks NFS boot because the
> Ethernet driver is no longer available before the NFS root mount.
>
> Patch 1 adds the CPSW module set to TI_CORE_INITRAMFS_KERNEL_MODULES
> for bsp-next so udev can load them during early boot.
>
> Patch 2 adds a standalone initramfs-module-netsetup recipe that waits
> for the Ethernet interface to appear after udev loads the modules and
> then configures it via DHCP before the nfsrootfs module runs.
>
> Changes in v2:
> - Move netsetup from an initramfs-framework bbappend subpackage to a
>    standalone initramfs-module-netsetup_1.0.bb recipe (Denys, Ryan)
>
> Bootlogs: https://gist.github.com/Jamm02/351d46885e20b6043d464166ee313614
>
> Moteen Shah (2):
>    k3.inc: Add CPSW modules to initramfs for bsp-next NFS boot
>    initramfs: Add initramfs-module-netsetup recipe for DHCP network
>      configuration
>
>   meta-ti-bsp/conf/machine/include/k3.inc       |  6 +++
>   .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
>   .../initramfs-module-netsetup_1.0.bb          | 24 +++++++++
>   .../packagegroup-ti-core-initramfs.bb         |  1 +
>   4 files changed, 85 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19956): https://lists.yoctoproject.org/g/meta-ti/message/19956
> Mute This Topic: https://lists.yoctoproject.org/mt/119625130/9997635
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [m-shah@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

