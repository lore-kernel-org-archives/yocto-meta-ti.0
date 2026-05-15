Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D68CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 15:33:15 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37599.1778859185355627851
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 May 2026 08:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=VOsj8f9v;
 spf=pass (domain: list.ti.com, ip: 40.93.201.9, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwKCkch6damoIOT2O5MBfYf1Ef+dQKFPYcc+hYRAfEFTngtaJ5WPXQNGgH5doIRtrCUMCgB0xXwrSrdgVT3qWEFJxbywmyzByuSglIZMQsiiYfQMoKky/7Fsz0v4pBBpXpehtaT6WncxO4B7sFZa8F9eyzDYNlozhisicgw0VpbsWuAynt3awDGM9nzYWgmZSiy3e9md3G/AFO2Hi5RBJRbl0iPVwnhnHDqVO149vB4qiL2QKVHJ/OZPGFbD1Rq0iGXo+jx8e3wcfQN6sD/ibwfUA8Rn/yUcgTo2rK+elvnqfi1d6vK5bjZtSyC2g7mak4vOHaAyGiHmLl2We/bNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eip81sl9zQLV6fmin5IWZjZOpAsu69pvMa6E1ea7E4c=;
 b=sqE3Z5f2vPGRKXJbNkh7PRRHNwkbL5s1Q2WarWQQchqokCj+EUsQ3jNZiJ0WECeop6TLVacTYE6ZR2knpG7Lz3dLl17ZXI+QHKB1gIvrlpZyRKVvKekyCXBSzLPXTr5alNQbER7Cypf9u1DDrJMoh+q/2apcPYZbnTRVoPN9NXkkpNC0tG230+11w4P8Bd+nj+WskeWvo4qWbnOyUQG0Z5CNcNLbR9ci9Nfol5wmRyyGtpMFk2lLhunefPpOpZZb0CkgQtTOgKb+EA6dgkDVPlbpebHk0cdjlqgW1QGbyCpGH1nav7VqT4VqWyVByuqgetpJ/8ZQZ9OhDRBr0NntIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eip81sl9zQLV6fmin5IWZjZOpAsu69pvMa6E1ea7E4c=;
 b=VOsj8f9voH8yG/CpJv1DWAQn+gP+KayVY/v0W/2YJiQq2AZ2b4gHTxjsl3038lIq9VioDufS4OfQWh2Dv+C55hIXeveKe6e2atE23mimHUrgNCTUaVcTEUKY+KQvmKYTCGEbnb0ohA+fBY56EUbSH9LC9+RqBSAk9d0/4wH4KokfKY8T8IeE1eqEh7VxVoOorZsRqV7oHhCKLtBded/2XDr2f/aXA4lN7PrK5K5Tu05D1Hs1fFowQIeubSrYHKXMddlR4QWiMsIPqXXKmtH+sGWhBI/xuAoQ6I2SrDvM/PS8zdrkiZsQTAeNAgo7nGdt8Ki0TGaNxYRCRb1sSeHtZQ==
Received: from SJ0PR05CA0135.namprd05.prod.outlook.com (2603:10b6:a03:33d::20)
 by DS7PR10MB5216.namprd10.prod.outlook.com (2603:10b6:5:38e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 15:33:00 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::22) by SJ0PR05CA0135.outlook.office365.com
 (2603:10b6:a03:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 15:33:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 15:32:58 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:32:31 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:32:30 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 10:32:30 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FFWUKB2704757;
	Fri, 15 May 2026 10:32:30 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id CE22E2A61; Fri, 15 May 2026 10:32:30 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202605150747
Date: Fri, 15 May 2026 10:32:30 -0500
Message-ID: <20260515153230.2514091-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|DS7PR10MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: b3488c38-e86c-46c0-35e6-08deb2973e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	37ty5UDIMR9IpWxesm/ydsg1Q3dmo+ONFE+NWhVCqRmoL00s8Sq7aDkxmC75gfiH2rmpI6l/LuzZFJCoo53Dt7xsuw7YuzPRi0BDRS3HDdLk3MPCAs1X0as1ZDVKJDGSbvHtlnaBm/9z7mQySd8Csvx+ZUpGz5cLkj/qv2JRhvtWgZxbput9Svks7Y4JDK56MRkout7mI5iEgRDPRbwUVzOP4ZWBuArGuc13WFv+IVtPYz70UOXQ8mV/bba0tRnimzqIyDlOci8+qRADun911SGDmggp1TSQ/8IxKU5QclljsVjE8upIMu6mCGHP2n1nhdc7qY6PtTr5C3AWOzKQVkfo8nbHp/bvNTGxSRGjo7B3Ws/5crC9TjrvtwxziWtVCNrMzyjv0QcU28emzivXXnav1a3bDjIcHsVOE6XKcL2Kl0Za0FObwl9Qlc33v4rh6o8wEGwYUUxYxsJrYQbTx0cyVZK9d9jNPJrdID4IoKCaUcf3OiHIYn/kKL7/JjS1dc1liPBs141BgegMiF0hksrdM7McVnkZAm5mX0e4lDcqMNXpYltFiPtAIzmw/tZ9OJYRYkm6sCF1Z8FnNTT8eKNbJ1Frj+SWUCl9R+nY7ap+SNDb8IxppW1DZGGBN9Lqg1fPqUGHtBuLg5pUVbYLGxfF8ajYK+qxEjeEzRVsUhxlNNp6gMrQ0IPCI/yit/OuYzwwIQc+c/Dp8VMQKPbevjK1fB/5uPWNdZLgxhHB0uc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	S/Jj0r7inEeuKr33TjbyPSU9GBztNh5+Vxltsjld71GuRmoeRzqRR6KRf6j07qjalNN3Ip4UuhHQYjVCliWrNQzz6tW3fF/sPblIklpzPm9RaqJdxHUfsyaTW1KOzSCdhweLW7FAPs03FqD4p/pGNT13+LOzOVlJg5Tg3pe8zcQqHxhey+WLz4ikgYOPvoyQaaPadP2KjPLb9508JuaCb3wgzyoiQ7H9Cdqt8GPjdO6pzVVBkn+9adAvrxkzzAk6qLL6vK2fX4Ex7biFhQHWp9iFMfTsswjG0iFNLX+tNJBodss1zv6UtKdbFVQ8x7Vw77baRuprweXZdvWtyFGiRlhLvwn5Z9hOiyFiM6VfDbanwcuVjZNVYHpBrMRqyywf/at2rYwGyMonYyFeY6v5l1Phm0yP1TjF4Od00rINfmWBSG9Dx3jar3wM9HnjPdNQ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:32:58.8026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3488c38-e86c-46c0-35e6-08deb2973e5d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5216
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2026 15:33:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19937

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging_6.18: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Dee3048ee0822c35312379b6e24b5c80e9a845110..1f603935204df4b=
34054fa3bac80158e528e2c36
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=3Drange&q=3Dc50875c=
7c4ad112d5e632bea3301e06a0aa8669f..eaa148f9640a047511be89f7652f8b1e93a4249c
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D0085e69eaf041684d5806e4d1fde49c325519a9f..0472fba=
fd7277ece9e1bae4189bc6099e33cdbc4

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb               | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index a6478b0c..a66862be 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "a3151da32d3375b8567c05b2298661e73420aff3"
+SRCREV_tfa:am62lxx =3D "27ec63132041f7b9c6b3747731de4f8c6036a430"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index a7225293..56afc908 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "ee3048ee0822c35312379b6e24b5c80e9a845110"
+SRCREV_uboot =3D "1f603935204df4b34054fa3bac80158e528e2c36"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bs=
p/recipes-devtools/k3conf/k3conf_git.bb
index 3e3205ba..e33a1e91 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV =3D "0.3+git"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "c50875c7c4ad112d5e632bea3301e06a0aa8669f"
+SRCREV =3D "eaa148f9640a047511be89f7652f8b1e93a4249c"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 1af23653..ed87d378 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "0085e69eaf041684d5806e4d1fde49c325519a9f"
+SRCREV ?=3D "0472fbafd7277ece9e1bae4189bc6099e33cdbc4"
 PV =3D "6.18.15+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


