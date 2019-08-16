Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21198E00E0B; Thu, 15 Aug 2019 18:58:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84162E00DD3
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 18:58:48 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7G1wlCe059556
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 20:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565920727;
	bh=n+mtmeBTsj9QEvZpnoCYZHSgOpxdAbRSvyT6/o/S2As=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=VAxgtGurD2Q1Lfi9giJ7Be5Y0d8yTs8evPO4GrUJnb+IJIIcagoID9rm2oY3VogYk
	8Cw9ALtmzILxiEuTzs6PwT9GEwRSdI8cX91Agj2wBnd1Ti6b3d+4Xu1B3jHKBGTTdI
	/RGzhzABaSo4KJLnBrgNhgE1v8O22sVDRuFChIC8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7G1wllV084118
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 20:58:47 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 15 Aug 2019 20:58:47 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1713.004; Thu, 15 Aug 2019 20:58:47 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-ti] [EXTERNAL] [thud/master][PATCH] sciclient-rtos: Adding
	support to j7-evm
Thread-Index: AQHVU9OQJIr1eCF0ykOVcD2ZJ8NI66b9BGSQ
Date: Fri, 16 Aug 2019 01:58:47 +0000
Message-ID: <c44f5df751694ad9aac20f3170a64b66@ti.com>
References: <1565726493-32218-1-git-send-email-m-radhakrishnan2@ti.com>
	<55ec8d6a-5fed-ec7c-0534-959cc0fc0d90@ti.com>
	<20190816014019.GE2365@beryl>
In-Reply-To: <20190816014019.GE2365@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.118.69]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] [thud/master][PATCH] sciclient-rtos: Adding support to j7-evm
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
X-List-Received-Date: Fri, 16 Aug 2019 01:58:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, August 15, 2019 9:40 PM
To: Stiffler, Jacob
Cc: Radhakrishnan, Mahesh; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [EXTERNAL] [thud/master][PATCH] sciclient-rtos: Addi=
ng support to j7-evm

On Tue, Aug 13, 2019 at 04:17:32PM -0400, Jacob Stiffler wrote:
>=20
> On 8/13/2019 4:01 PM, Mahesh Radhakrishnan wrote:
> >Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> >---
> >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> >diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/s=
ciclient/sciclient-rtos_git.bb
> >index 36de7c4..8599f6a 100644
> >--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> >+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> >@@ -37,8 +37,13 @@ export PDK_SCICLIENT_ROOT_PATH =3D "${SCICLIENT_PACKA=
GE_BASE}/package/all/pdk_/pac
> >  #export DEST_ROOT=3D"${S}"
> >  LIMSOCS_am65xx =3D "am65xx"
> >+LIMSOCS_j7-evm =3D "j721e"
> >+
> >  LIMBOARDS_am65xx =3D "am65xx_evm"
> >+LIMBOARDS_j7-evm =3D "j721e_evm"
>=20
> Can you use the TI_PDK_LIMIT_* vars defined in the machine configuration?

Was this comment addressed?

Yes, this was addressed in v2 patch.

> >  BOARD_PACKAGE_am65xx =3D "am65xx_evm"
> >+BOARD_PACKAGE_j7-evm =3D "j721e_evm"
> >  # HTML doc link params
> >  PDK_COMP_LINK_TEXT =3D "SCICLIENT"
> >@@ -66,7 +71,7 @@ do_compile() {
> >      # make clean LIMIT_SOCS=3D"${LIMSOCS}" LIMIT_BOARDS=3D"${LIMBOARDS=
}"
> >      # Build am65xx libraries
> >-    make lib xdc_meta doxygen LIMIT_SOCS=3D"${LIMSOCS}" LIMIT_BOARDS=3D=
"${LIMBOARDS}"
> >+    make lib xdc_meta doxygen LIMIT_SOCS=3D"${LIMSOCS}" LIMIT_BOARDS=3D=
"${LIMBOARDS}" LIMIT_CORES=3D"${TI_PDK_LIMIT_CORES}"
> >      #archive
> >      tar -cf sciclient.tar --exclude=3D'*.tar' ./*
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

