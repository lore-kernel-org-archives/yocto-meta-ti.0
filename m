Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DB1CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 07:25:49 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14457.1780471546416627255
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 00:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ert1DsCI;
 spf=pass (domain: ti.com, ip: 40.93.198.66, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPNpu3Rfy7gcd2HL268djTXOdD34aCHFM30FINZwV41dFlXKUHRORvO9PSurJFe3rHikRJVH2JniOmPC+ROk3ihVTW0R63qsm6hcc2uMg6tFlz94Mse7v9rd24jdQMXE/UQHx7hf5M21HT7GKlWId4tYfNpigk1RSzdFsZZPF0IDmjVLUJD+LTTyUeGIFduSr2yAlrzz77IUJo0Fd6b/MczZ3WkaI7owFxFjUw1T7xe0Aj+ezU546mQZEkL0jKBesB7NCXiZLTIySRpIzSIBSa2zA21VZ+8ayldDvNvsmH2N6tF9Fy8Y+ckLkCWMWkye+ORFGo3fO8PKJxatfLfrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YaDRtIgMZi4PfGwZ4awLhH/yHdtRIWXvO4YIICkUuY=;
 b=uJs0bpomVUr1G6Gt3W9V7XIkxQgd6nFZsFiPnTPJT6Ze/OADYbhEF0+HGHpvYjpxA+xWC3inNB9XGzkR7ZnfOpH95j4lLg1Qcf0uPYWw+u+w2LAKBYQYoKKVpEwdA6yfKnnOmtg2UvAmGR3w5oPL6GGkRVr2rmL9byEK3/FCgFOFIq6hCZqKnHCn31PsdvnNmH5G43DV+n/nL+t+8VBVFlX4r0d/woVE1hUs585CotuyRVXqjF0gaiICyLxetESdAJb5HVnr1DCrkbbobq+Gjla9r8NOOMV9tJ8D8PrRZi5PIMQP2eLxhZ3ZPlQTUB8SbPpN5ivFs6QNEYzetOo3PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YaDRtIgMZi4PfGwZ4awLhH/yHdtRIWXvO4YIICkUuY=;
 b=ert1DsCIgoFbuP4cZVDM3Kt6sLiRCf5GUdCF8W/qCVpQAEqzYd30iP0yaCBCovrkOfWJMrJsZl0vEc+93SmbEziD1+kkFQgs4Cf7IFJ8c+dk5ZM0krax2uY527ZJGHBiR23/+9bMZLp1ettNTRvewMUw3X1/sRE4DotM4AZTY/Q=
Received: from SJ0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:33b::12)
 by CH3PR10MB7833.namprd10.prod.outlook.com (2603:10b6:610:1ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:25:43 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::19) by SJ0PR05CA0007.outlook.office365.com
 (2603:10b6:a03:33b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 07:25:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 07:25:42 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:25:26 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:25:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 02:25:26 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6537PMiB1260483;
	Wed, 3 Jun 2026 02:25:23 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
Subject: [meta-ti][master/wrynose][PATCH v2 0/2] Fix NFS boot on K3 platforms with bsp-next kernel
Date: Wed, 3 Jun 2026 12:55:19 +0530
Message-ID: <20260603072522.1272337-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|CH3PR10MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c92abee-34c0-4203-6159-08dec1415218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ft50ss7xdu2zPtZWPwPOp2wvNzOazT2oeMgF/pSTz+8C82Z07I08D/0q6fwY7ZdMdy2dAQA7XmPmWL4ztC5q4bQIwO2cLmeLtd0a6JFq6srzpexWiQF/lS9P4MV5F6PBPvIJ0TrfVgqnZgpGwyXUYng/EvWi//hsopWfGGyKSuiucWe73whBuKtIMrEIxJ58iFCGDBSpu/e846t3wSESWrSTH8YkQjxcM52O84SbygUoL8dmEG7UZ389O4Exu8/iZC1mxUiBBIOYDtg+tp9EoPqbc0HNXhbDXoxaSFlzjw/8yDz4FhI4rI1QdRrdQBFr9k9BEuHpntfUUJQJc5knrLGVOY9iCRO86Rs69JuIz4XEgMoF6qqT33epTptobfe3xwTg7kSof2oERb8v3Q1NRoJZofadLMTEeGpplrmxp+m/aPoPRNg/W1tDVeUP1zLWaMOxNv6Y/55XJA6MpBWJZiAbrFFvlNoDYoFqf5/tkCl1bw9A3HtjOJfkRfUEXJJBweVsiE1rpQzhVw4g1G+F912rihOmteyaNlHyyBq28DwLEyi/PozsIXCCOmiT7WdPoXe3vGyb+TaYp7+29qCV//ZGHj+XymF1xz9rt2Beo5It9874lkiKv/UdnXe7yNzwwcD3TPkLniU1Xdw2rjaDGwr2SlRU+G3RmZ/ew93px4SS5SS8UnDikDmjkqPFM1tkUbGb7FgtkkRoA4NpANYnrXyeNy0y2HXPUWVVhtDTdT0=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	B96mgPrtsgzblGxeU/x4Z/be8Gx9yoD5ZSc889q51FzMPtCPWAqIzthhib4Ubwuw1USx+SmJlzEQ0/Ynw6h8ZED6uYj/JPzQ5QGX4mlZogBa1xcILX7FlLhIeHqVTzsvIL/qi/og37E3tGGRHHKNiBV/S1y/NXS2iareR7rLHZNJrHTbjiHccomkchRwGBaem7siqFewB+tky7l3ndTohuAlaaDzFsW5IDRXgFEWnOgpo3j1viadZFHOFy3Aix784NRCAuKk9QuKQ3s0SrM/QnKftw4gY74gHdoiBx1itpd/EdwYUW8pubc97bd21yXqeldpIbH49TzjbqScY7wpCkMicSMeK8O0kR46i58gYZrB9TEVPvB1ajoCn+q+zefwTJAyoaGZy9OpZ4bXvimYQhMiJArUJ3XYtdenIrfOXv9VSkjKti5JCkN6CzyrOL/a
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:25:42.6248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c92abee-34c0-4203-6159-08dec1415218
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7833
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 07:25:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19956

AM65_CPSW_NUSS and its dependencies changed from built-in (=3Dy) to
loadable modules (=3Dm) in linux-next. This breaks NFS boot because the
Ethernet driver is no longer available before the NFS root mount.

Patch 1 adds the CPSW module set to TI_CORE_INITRAMFS_KERNEL_MODULES
for bsp-next so udev can load them during early boot.

Patch 2 adds a standalone initramfs-module-netsetup recipe that waits
for the Ethernet interface to appear after udev loads the modules and
then configures it via DHCP before the nfsrootfs module runs.

Changes in v2:
- Move netsetup from an initramfs-framework bbappend subpackage to a
  standalone initramfs-module-netsetup_1.0.bb recipe (Denys, Ryan)

Bootlogs: https://gist.github.com/Jamm02/351d46885e20b6043d464166ee313614

Moteen Shah (2):
  k3.inc: Add CPSW modules to initramfs for bsp-next NFS boot
  initramfs: Add initramfs-module-netsetup recipe for DHCP network
    configuration

 meta-ti-bsp/conf/machine/include/k3.inc       |  6 +++
 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 24 +++++++++
 .../packagegroup-ti-core-initramfs.bb         |  1 +
 4 files changed, 85 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netse=
tup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netse=
tup_1.0.bb

--=20
2.34.1


