Return-Path: <xulin.sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6EEC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 03:37:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.922.1686022647587875685
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 20:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XfaJ5bf6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5521b70b60=xulin.sun@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3562HlOv001418;
	Mon, 5 Jun 2023 20:37:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Z3ocNwU0kth5Rn0/jzvH1RDOcSMHVdAjMK230d15Pnc=;
 b=XfaJ5bf6ccJgTI/Rdo1/t45Q8zOuRdNThkOsiDtk48mMg+bMnNTwF8mZWucMvkcFxDUO
 6GFCjht4UvlN44WbPXe4KwQ4ZzwmL+EwiyhmaGg8vBwz9iKQywbTVY8SBFyoHj18orVH
 LKruck4vOmqwOiNk4M7iXMmugssFr3gKrlq4ATBfv7CR4oMr1tc+yEQV3LIIdXRTKB8q
 k0Q7JKGKLLpBn0bKyU5jIWmcFdf1ufWdsS4qbGXPNXNCURv8xeVuA6IuvX1sljgQ5FjY
 ZGXQo58rBsAKplTpLwCPYHIrovvlUPvhKxWbYF7JZmNr7guDlHNB5JpApk8tGFep/l/O Vg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r051j9u1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 20:37:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQyACULDbnIGiDx/UQVgcBY9s+SSOe0LCKoTmEn9wEg6kRMvzMDC4EjnyBX0gdnmcPV/CCfdA4zeyf4VjOdMfJ/u0gzNUsi9CNiU8NZIkxN6vQpbaxvYn5vm7AtDd49qJCsNdNLqcFf/yMo7aZ6LjItM8M6lZll+YNyQnHULsksqltwiTuemCH/d+T8PYOHgcSMZjz4CWI5m7O8eFN4zj8pKERTHNb/d8e2BX5fZRaMs5i/xlPpwtwXcoxl14kZ4uSDuUcBrJfGYaR7k6oL4rzqLJoDm2nJdHfh35tvVkahHNOtsQq54Q0kewwMBskkEl0yWRBg/v6SyiD1R97DQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3ocNwU0kth5Rn0/jzvH1RDOcSMHVdAjMK230d15Pnc=;
 b=CM2LNidnL1NkGG5tRv7/nuRjQ5bgLL99VxcGgfTZUQVHdxly8nAxnjTk2dcJPYTRtTTBY7vYb7oeQHkEsqcHLyKMRVGByv2L7ZTd0SUg4PKmFsdw8ZwyqRydcskKiYI4bDfiKhHsKgfaFP4shzpYg3qDVBOq1YnfB6+2FEg14oLAU+hP11V4CgYbf/WHBxU0FIUql/kUDWUHBtdsIZHr0TECKqv8MFvjdpqd2ePkrMiiQMdvD2zn3fIM6dfZEWBZtdZOqULI/cMAir9tJNsPrufuVpbeeEqsQDu4FN39p/LmBURckvXB+8QQtiUSXepqpmOblzVo2niJ+bYsrKHkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5)
 by MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 03:37:23 +0000
Received: from SA2PR11MB5193.namprd11.prod.outlook.com
 ([fe80::92c5:daaf:e6c5:51ba]) by SA2PR11MB5193.namprd11.prod.outlook.com
 ([fe80::92c5:daaf:e6c5:51ba%4]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 03:37:23 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: reatmon@ti.com, denys@konsulko.com
Cc: xulin.sun@windriver.com, meta-ti@lists.yoctoproject.org
Subject: [meta-ti][meta-ti master][PATCH] ti-img-rogue-driver: add KERNEL_CC to make
Date: Tue,  6 Jun 2023 11:37:06 +0800
Message-Id: <20230606033706.32554-1-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:405:1::27) To SA2PR11MB5193.namprd11.prod.outlook.com
 (2603:10b6:806:fa::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5193:EE_|MW4PR11MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: c28a43fd-aafc-43a5-cae2-08db663f56c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xFHtvKBiiK5JEw8VrlQUMBYqTy+bn6tw8bMs9mYyE2dV1WGRxMnsl8hVAqh9TKyxPqAfHR23bp/1rNge4IH5bPaEwK639ybuM2VDzHeZMtu69c0hv3yX3Opyfp3DHmP3YpDS4f6nALmYOcPtNU+1f+Ivy6GyKHhZworkETqbOlOXiyt1sPJL09bIq+kmlrqMji6KF9R2LSoCfgzYl7LoIervriP8OB9OOyyxvgRo/y+dgcH6nB5deP0EbrJLapqNYKbcdK5D4rju7nEdMC4hEU++SOOjIFIWIJ2VGiQ+eCbO26vMHpopRNgKPezP63k6n3tni4EqQtwydlNsaA+X3nzAqURt99xmCjyDiyRks7yZfk0qh9quOpI1ToLHYeS/rfaqCy6K/ZoZ/NrufPwZH384ppn+zl8bgNHCoX9d7bjcna7s0NxDfMw5YUtQDgvWzBbpQxWXFtQaupuK1lMxa9FBexS8d16N8+hEstdiLHkEK0tdemrXYK/OpE8SF87iB8OKXW79v4UGp9NitqvSjbthE1eIYSUDYBUzJvHDnGUKxnzzxVooZ/9B1TtC1vXBoEPicoQFs+8Vlz8BLpUb6zd7/UgujLL3MtHvIMrSQPM0p0C7AoylGRGQQjW9MWW2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5193.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(451199021)(83380400001)(44832011)(478600001)(8936002)(8676002)(5660300002)(316002)(66476007)(66556008)(66946007)(4326008)(38100700002)(38350700002)(41300700001)(86362001)(36756003)(6486002)(52116002)(6666004)(2906002)(6506007)(6512007)(1076003)(26005)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?apV12TN+hKUrL+117sxhxJGhOHV6MR+bwf+O5JuHDbLOEBnBiSKPe/CsAcr7?=
 =?us-ascii?Q?mdIpX7VZxoBZg3Ea6nBOfg+a0fHQ2pcTDwp0LUAZe8JkPEP2fSC9Wvq4F2uR?=
 =?us-ascii?Q?6O+xpaSSs5qn10qvaSPxb3nXS3MamK0pij/3IiiGbgUFGYl7wO25VyH4GsUA?=
 =?us-ascii?Q?ezzHEai2oWSIgFgS5ayjbNVn3Bh+gmmBFftiHXn1p3K6FttE66b8vjOEdaio?=
 =?us-ascii?Q?2hq+0/13cjrVHMuZwhCN7R6JDAbMo3tWnxVM0jKc6iGjzrIWVLmmXdTy0/ow?=
 =?us-ascii?Q?v0bkZTq5DDTgD3jShIqyqLnC+4ZyNk0tJPVLksqEdTpP0QUaxsYh6IR4CTFU?=
 =?us-ascii?Q?g9PVD2kOMCtix+lwDlBO04Ksmn3HZbofuGeydFYS2kI13mKj5zLHUsIYZj61?=
 =?us-ascii?Q?5ArPDscRdqYpcqrgak11h6u5zDDOXiKUGDUksSuk2JZNMbhpESO5RHtp6EuD?=
 =?us-ascii?Q?bkPtdp4IzpkE48Z6a+Nnckc/9hfIHB1sAaD6YzfsyY9t2ckpgXTM6LWtIPgN?=
 =?us-ascii?Q?C2HAiSwNhF5Th1BNQVpm28wmb5SCTPZpl9IUgfr+zMKSV3zoR+E+mU1pt7mC?=
 =?us-ascii?Q?1NR6/fAcsh+/jjI+qPQG9uceIHiOaK610vrOMDGdp2g92R0CLStqBKlTMNRk?=
 =?us-ascii?Q?GyBcufTL7A/Wf/FmR+riM8LpbrFNVxujPnzkOVaazdeJUiT0bKIBkwvoPmhv?=
 =?us-ascii?Q?j76H95LQNJomSs4PcH28sbXqWWHZdwOSEATXfNFsQDiBC+bic5Rf3/NSgALa?=
 =?us-ascii?Q?MLZ3eX19d/KXphWgogr7LTyU/SWbCex+WZkDQs1TlqlEgI0aE0f9jYtgomNr?=
 =?us-ascii?Q?18vqU78g6/Oc3cLkmfQR3RWo7BeR8tMBYPJTemepjzTnKm+XchLbg6QZR+RO?=
 =?us-ascii?Q?9Z05yK/Qjth8dHeMumXaQaM4DkORR3fKUoLxNjneWkv1zc6IzYQobnpOgwMb?=
 =?us-ascii?Q?Fdzg8gdZQmexnI4+eInj2oJ+TpHvGo7rDTdF+K+ZLf25U36wjYEGYyvs+hbR?=
 =?us-ascii?Q?CVP4KzDHUOl7aVaNOSNF1hIwf8eKr5lbZWeIcPLN9iFYqP9N6wZS9uGiN5Cn?=
 =?us-ascii?Q?HzTiOq+q7XpncUxKNzHZDXaa99AcqLswFnWfT588BcHN/6WZhOY7k9GLIQ1i?=
 =?us-ascii?Q?IBNzMoOUEGiLlat6EyUMp06sQ/QejS/qe93C+hIzEFIoNFEE9MwgEA5XR+Pe?=
 =?us-ascii?Q?4yOfJyEYnwcH0Z8ffP9zUsoWdUwIEaLhEH9GiScbVlAjNDdZTSqoboxvbX3G?=
 =?us-ascii?Q?iKezY4LczvUC6TEgi57j4tteQkEoial1Q7nqR5lyvw0X+7lCF6So+4nqhB+a?=
 =?us-ascii?Q?wQhSMCXwO9DnDRFqpSmziHzPOGjC3FXV1ZmZ3vN8BlJgZXnoRlW94DL7WKG6?=
 =?us-ascii?Q?2aDU+aFfbl9gk5GJgW95ixwyN2tmC8k11UEtJuoY/OdeiQMo2ZDOgH5Gamvq?=
 =?us-ascii?Q?DxrD3sOUA4bdDwJMUJrKm1JZrYc+NxEUVnnz6GrishWUL4dCyURwt38ZDtbd?=
 =?us-ascii?Q?RDK78M0Ijo4pJ3XEPRGDoCUQ0GhhwtOOIGV3LgY3CUAPsg+M+Iw77OONGxx2?=
 =?us-ascii?Q?iji6FYuSVPmWfEkn3RqjLfHDq4MMBhgar90n25LjBA/Z4HvEykbFyXXWsY3v?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28a43fd-aafc-43a5-cae2-08db663f56c8
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 03:37:23.0963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IWUofqTdun+FFXFBugE88O5Yxy7vnaAI43GxihYML9uc36WpHNp170ssqTIPj2rVg+TvVyBeYOggbUSYqH8SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
X-Proofpoint-ORIG-GUID: n9nWzspW7lvhzYlWAyOwttm02-vC-tiM
X-Proofpoint-GUID: n9nWzspW7lvhzYlWAyOwttm02-vC-tiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_01,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 03:37:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16672

Bring in KERNEL_CC variable to avoid below building issue:

WARNING: ti-img-rogue-driver-23.1.6404501-b do_package_qa: QA Issue:
File /lib/modules/6.1.31-rt10-yocto-preempt-rt/extra/pvrsrvkm.ko in package
kernel-module-pvrsrvkm-6.1.31-rt10-yocto-preempt-rt contains reference to TMPDIR [buildpaths]

Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
---
 ...0001-kbuild-wrap-cc-in-double-quotes.patch | 47 +++++++++++++++++++
 .../ti-img-rogue-driver_23.1.6404501.bb       |  6 ++-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
new file mode 100644
index 00000000..6faf6fe2
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-kbuild-wrap-cc-in-double-quotes.patch
@@ -0,0 +1,47 @@
+From 48ac628f0c6e679c165f08fec18818f802b535d1 Mon Sep 17 00:00:00 2001
+From: Xulin Sun <xulin.sun@windriver.com>
+Date: Tue, 6 Jun 2023 01:28:31 +0000
+Subject: [PATCH] kbuild: wrap cc in double quotes
+
+Set the CC variable correctly, to avoid below building issue:
+make[1]: aarch64-wrs-linux-aarch64-wrs-linux-gcc: No such file or directory
+
+Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+---
+ build/linux/kbuild/kbuild.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/build/linux/kbuild/kbuild.mk b/build/linux/kbuild/kbuild.mk
+index f65d6a4..2085766 100644
+--- a/build/linux/kbuild/kbuild.mk
++++ b/build/linux/kbuild/kbuild.mk
+@@ -97,7 +97,7 @@ kbuild: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile bridges
+ 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
+ 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
+ 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
+-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
+ 		AR=$(if $(KERNEL_AR),$(KERNEL_AR),$(KERNEL_CROSS_COMPILE)ar) \
+ 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
+ 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
+@@ -133,7 +133,7 @@ kbuild_clean: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile
+ 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
+ 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
+ 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
+-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
+ 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
+ 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
+ 		OBJCOPY=$(if $(KERNEL_OBJCOPY),$(KERNEL_OBJCOPY),$(KERNEL_CROSS_COMPILE)objcopy) \
+@@ -160,7 +160,7 @@ kbuild_modules_install: kbuild_check $(TARGET_PRIMARY_OUT)/kbuild/Makefile
+ 		%-android,%-gnu,$(CROSS_TRIPLE)))- \
+ 		CROSS_COMPILE="$(CCACHE) $(KERNEL_CROSS_COMPILE)" \
+ 		EXTRA_CFLAGS="$(ALL_KBUILD_CFLAGS)" \
+-		CC=$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc) \
++		CC="$(if $(KERNEL_CC),$(KERNEL_CC),$(KERNEL_CROSS_COMPILE)gcc)" \
+ 		LD=$(if $(KERNEL_LD),$(KERNEL_LD),$(KERNEL_CROSS_COMPILE)ld) \
+ 		NM=$(if $(KERNEL_NM),$(KERNEL_NM),$(KERNEL_CROSS_COMPILE)nm) \
+ 		OBJCOPY=$(if $(KERNEL_OBJCOPY),$(KERNEL_OBJCOPY),$(KERNEL_CROSS_COMPILE)objcopy) \
+-- 
+2.35.5
+
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
index 76e3d801..b3fba3c4 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
@@ -20,6 +20,10 @@ BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
+SRC_URI += " \
+	file://0001-kbuild-wrap-cc-in-double-quotes.patch \
+"
+
 S = "${WORKDIR}/git"
 
 SRCREV = "93c66ec66136654849809132b86d3b880ee96ed6"
@@ -31,7 +35,7 @@ TARGET_PRODUCT:am62xx = "am62_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
+EXTRA_OEMAKE += 'KERNEL_CC="${KERNEL_CC}" KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
 
 do_install() {
     make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
-- 
2.40.1


