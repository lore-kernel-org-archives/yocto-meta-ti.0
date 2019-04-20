Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05294E00CFD; Sat, 20 Apr 2019 09:46:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE36EE00B5C
	for <meta-ti@yoctoproject.org>; Sat, 20 Apr 2019 09:46:19 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3KGkJZq001611
	for <meta-ti@yoctoproject.org>; Sat, 20 Apr 2019 11:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555778779;
	bh=btjVxCKbNgtB6OK/N8aENVC7aorKZEJum5Sq7+BNULU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=EcZd+/mlr12qKQ0GdTwADsK0davy4OkqGo81z43EOYdWouPewfVe9P42vClUR55cr
	FAMOIINYRXHKT3v9DQePoYIcGqgnRUl7yh4a/YXpQf7Ubjb8UFsed4nnLflP9C5jkh
	+RxAwKEwLLY56fLl3H6HOvWzAQ3tC2ddcY6vlx4o=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3KGkJj0066804
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sat, 20 Apr 2019 11:46:19 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sat, 20 Apr 2019 11:46:18 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1713.004; Sat, 20 Apr 2019 11:46:18 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [master/thud][PATCH] prueth-fw: use icss-emac-lld
	sources
Thread-Index: AQHU9gX84Jq1b3uihUmpTZifM0HZVqZFROgg
Date: Sat, 20 Apr 2019 16:46:18 +0000
Message-ID: <603af2afa1134fce8f922d4af45a0986@ti.com>
References: <1555605736-24776-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1555605736-24776-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.67.208]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "Kramer, Aaron" <a-kramer@ti.com>
Subject: Re: [master/thud][PATCH] prueth-fw: use icss-emac-lld sources
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Apr 2019 16:46:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ERROR: QA Issue: prueth-fw: LIC_FILES_CHKSUM points to an invalid file: /OE=
/arago-thud-next-build/build-CORTEX_1/arago-tmp-external-arm-toolchain/work=
/am57xx_evm-linux-gnueabi/prueth-fw/5.2.7-r0.0/git/ti/drv/icss_emac/firmwar=
e/icss_dualemac/COPYING.txt [license-checksum]

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Stiffler, Jacob
Sent: Thursday, April 18, 2019 12:42 PM
To: meta-ti@yoctoproject.org
Cc: Kramer, Aaron
Subject: [meta-ti] [master/thud][PATCH] prueth-fw: use icss-emac-lld source=
s

* prueth-fw and icss-emac-lld shared the same source repo, so make
  them share the same inc file which specifies the sources.
* Add the FW versions to the icss-emac-lld.inc so that there can be
  a single location for updates.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc |  6 ++++++
 recipes-bsp/prueth-fw/prueth-fw_git.bb      | 17 +++--------------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss=
-emac-lld/icss-emac-lld.inc
index ebe66af..9c93b75 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -16,7 +16,13 @@ BRANCH =3D "${ICSS_EMAC_LLD_GIT_BRANCH}"
 SRC_URI =3D "${ICSS_EMAC_LLD_GIT_URI};destsuffix=3D${ICSS_EMAC_LLD_GIT_DES=
TSUFFIX};protocol=3D${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
=20
 SRCREV =3D "${ICSS_EMAC_LLD_SRCREV}"
+
+# The LLD version
 PV =3D "01.00.00.15A"
+
+# The FW version(s)
+PV_DUALEMAC_FW =3D "5.2.7"
+
 INC_PR =3D "r0"
=20
 S =3D "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw=
/prueth-fw_git.bb
index ddcb9ec..41aedfb 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -4,21 +4,10 @@ LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://src/firmware_version.h;beginline=3D6;endline=
=3D53;md5=3D1f0a640a261059cdcbbcf01e6a739ff3"
=20
 require recipes-ti/includes/ti-paths.inc
+require recipes-bsp/icss-emac-lld/icss-emac-lld.inc
=20
-ICSS_EMAC_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/icss-emac.git"
-ICSS_EMAC_LLD_GIT_PROTOCOL =3D "git"
-ICSS_EMAC_LLD_GIT_BRANCH =3D "master"
-ICSS_EMAC_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/icss_emac"
-
-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.14"
-ICSS_EMAC_LLD_SRCREV =3D "7541d801b2f1be93fd02511cdf2143b0a200cc36"
-
-BRANCH =3D "${ICSS_EMAC_LLD_GIT_BRANCH}"
-SRC_URI =3D "${ICSS_EMAC_LLD_GIT_URI};destsuffix=3D${ICSS_EMAC_LLD_GIT_DES=
TSUFFIX};protocol=3D${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
-
-SRCREV =3D "${ICSS_EMAC_LLD_SRCREV}"
-PV =3D "5.2.0"
-PR =3D "r0"
+PV =3D "${PV_DUALEMAC_FW}"
+PR =3D "${INC_PR}.0"
=20
 S =3D "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}/firmware/icss_dualemac"
=20
--=20
1.9.1

--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

