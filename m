Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5979CD3436
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:05:03 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15877.1778065497144110885
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2026 04:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=tIaTr9ze;
 spf=pass (domain: list.ti.com, ip: 40.93.195.52, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAV9gmnlpgqkA5rPYTgC9D0wuyvzptiwxYw/kx2lSiEQ8sefIeb1+A12lqbJrDKx9IlgBndu+Et21fyg9Hn2cXLjqJe6uPejvSZDRAPASBwfB1DnjPKxEksVebSoEnMYmSJG3ax5uLVV+DlQ/G5A+lnEB7Wx1JQSAONIzVCS92mTVRFMpzuvf/8hX5O+Nlng8vy/Y9+7cU8diBYZY3TmIbi5T31592Nzn9slZRhmccbpZmOXR1miJLx16OEUkrh/AFsKDSTgMaomKy6z8c4CEONafJwK4G+/E3O6IqP4vO4h5UG39et5FFBX1LJw3K5hNn6f6BS5JsLyMNmIg2KdPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TddiMiubWd0MQD/i77EBmvHhgV47jFWvYtqvaz5VssI=;
 b=NrnYKxokjnO97JRiGV2FQMy10AOTdm/7sVnVu2tvpb2ak1tJ7Yt/S5M8hJ5wuZUf/z7eDwtRdYTK36LhMm2w64mTntVsjdqrPXmZF1mPlJuwC3tXuuqOaC6zclowX6HePgM7dZ7QpCbFouWjM7AzS6usfYvyECMUH55IbB7Mee9sXskHYRiDtCCdc5cNG5nbL/gqhZLZnj2+ksizQAX/dnHEgtrRHAC1o1plPzJHhqgTQJOvmyTr56XFTznduKYnwQfQSGK2QAXpQSukHgRrKVYKIMCcZuo7C4lWMp8oct5RQKpUOxX4mFtuWqgs8PrwEqE/Yy5VEJORn4fWnsWPTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TddiMiubWd0MQD/i77EBmvHhgV47jFWvYtqvaz5VssI=;
 b=tIaTr9zeIW/bs5+Qx4GzhNOw8gRj3mFCM0B0pJqCpC+P/XAFz1goNnnqk0MkONHtzTkwRwqPOY2uVwf94WOheOpygy7H3Vp/+XKEoDbCgZEfybzR5BtZ4lChhQ3kgbhydzz/7PYPPaf/tqBAXcNa+0IKgompM9WkgShsijd8BFUrLIFIUYjxuAlFgT0hcTmFA9qzk2tnlj7kO1j5x+7yjynL0A9wtzM/x9PTZTPHluBN6Gm1AG+fDih7CuU/Qi5xR26RVHdNeAGadkmbl7EPYvAeRPVAm6ewig8nsc9Jjmt3QGZxNthk3VNZ5frdY8VrasWEi5Yp+l+dbrERjJJ1cw==
Received: from CYXP220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:ee::9) by
 SN4PR10MB5799.namprd10.prod.outlook.com (2603:10b6:806:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 11:04:54 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:930:ee:cafe::4) by CYXP220CA0005.outlook.office365.com
 (2603:10b6:930:ee::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Wed,
 6 May 2026 11:04:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 11:04:52 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 06:04:51 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 06:04:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 06:04:51 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646B4pHM932982;
	Wed, 6 May 2026 06:04:51 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 2DA712A67; Wed,  6 May 2026 06:04:51 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202605060400
Date: Wed, 6 May 2026 06:04:51 -0500
Message-ID: <20260506110451.3782071-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|SN4PR10MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f78d70f-1081-4055-22aa-08deab5f4c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7UWjq5oFMHbS1taiKH9rVOTlJIY8gsKCoB/ZFU/58W2TSuTdGnZBpE8yOu/2kMW6BDZo184rAhaf/WVcZxMGOdegAN1ShwlVj8vN59bN3rdnuX6PHg1MChfwFCzMoinS+d1d7Ja58fGtVW1MoqUWLGoPuKyAK0I1lhoz7VKojGFV7fn5ksWhUUiInJc5mm4jDPKIun5R6hEdJddSb8D6oz0tZoqFXiAxwXtAFB80ryFOdZafVkj0EPSxGQPI8h2wbCoWb9qEO8nYGQIBHt79BhNWJEU+kFb12va5MGwb3pvAsa4/3UGXq5vF7/xbSkxTeAd5cb41oY3NbfLskwKh/q1LnB8GbsuiGI42Wg6Yyd67HBdcPHc8VufisL8mgBzbEkMLMCcLv7973EAP8XHrux0+Csi2tvav5SCxsNN6D8CAjYoJd6GDbXA1/GhE4FKhnuiviNWQY/XveD5Q8twljoy0pF/f1KNxOYBIMaViP8/OmXK0HoiEU5hp1njV3rpYZtikws66sPEllxk86QZU2pS3ukrFh2or85mbBmoTfBEWl88SIXsVQsu0GD+iP5fV6sdS3ZtL0GwlQNxEFvWui1+WUyPhDLG804S+eXbihSMUd1+7CERqt2Z/c/hm+2iqLo0JIh/PYPUVHLZ/RyjJz0IGBmvwIMm4ut5Ycd1BcJahGdr3Hlg91oItlVGZm8L2skTFOF/dd6Vya0XEkibZfTNI0/Z8R2xx6+2HTfN2ytQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JcEtB1YbsoMFjY8OwsyQ5NOsLwrAz3neXaUS35I9AXh3/lrgzTpeIkSDOdplHJhIvsKpmlUnVB/gO/ssjSpo/zcn3Br9Bq9HDS5IKarzJhhP4czsJ0U2FIR9PTKwlrG2QbyUdrj1X7eMtJMYnxeHEaju8VfQUAdabfWaemR1goH7qfUL+4DFrVm2pMZY/85s5Ng6HTScv/oGGFUVOMFB4x/ajUGaY2tSRxIsDBC4FppPRQj03fPeFy39vw5ZLa2spND7PJGylQKqXjaO4ka6pXklfpDYF/wsSEc1LkOgVzO8uIiz7UM1KOe0vTWH9YgvuXfuqeVz/3bY/cGM59rde0Np+nBWLAUjj32JpJg6oQ4PJv+IiFY3uMKUn9aiMMqEfz18p/ZtFFvxMOZaFtwsmd0phq83Ja9dyDq//btq1yIYskw0/nWFQDOMuYcILD4y
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:04:52.6902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f78d70f-1081-4055-22aa-08deab5f4c8f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5799
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 May 2026 11:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19931

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D4495407cc08e68dd65abaa542e1f13ad2ec90045..0085e69=
eaf041684d5806e4d1fde49c325519a9f
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D6a1c144a4bde8cd26c6cb4ce76e12ac1ca1ce079..44a5a7ecf3eb23614b801d7f5a10f=
2deed4542ce

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 695b8b90..4525f9ea 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "17d2997c0e7d4549720a5d176916f5ea0f63b009"
+SRCREV_tfa:am62lxx =3D "a3151da32d3375b8567c05b2298661e73420aff3"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 16d26a3a..1af23653 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "4495407cc08e68dd65abaa542e1f13ad2ec90045"
-PV =3D "6.18.13+git"
+SRCREV ?=3D "0085e69eaf041684d5806e4d1fde49c325519a9f"
+PV =3D "6.18.15+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/me=
ta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 840e8e2d..a65c2bba 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "6a1c144a4bde8cd26c6cb4ce76e12ac1ca1ce079"
+SRCREV =3D "44a5a7ecf3eb23614b801d7f5a10f2deed4542ce"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


