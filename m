Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A29B0E0086A; Wed, 24 Sep 2014 07:42:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 630E8E00872
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 07:42:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8OEgGak018293
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 09:42:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8OEgGZp017754
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 09:42:16 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 24 Sep 2014 09:42:16 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [daisy][PATCH] dra7xx: add "mmip" to MACHINE_FEATURES
Thread-Index: AQHP0OEYcIwuQJoYlUqlQUimHB4uwJwQaa2w
Date: Wed, 24 Sep 2014 14:42:15 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140B2C3B@DFLE09.ent.ti.com>
References: <1410784339-25597-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1410784339-25597-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [daisy][PATCH] dra7xx: add "mmip" to MACHINE_FEATURES
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
X-List-Received-Date: Wed, 24 Sep 2014 14:42:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Monday, September 15, 2014 8:32 AM
To: meta-ti@yoctoproject.org
Cc: Stiffler, Jacob
Subject: [daisy][PATCH] dra7xx: add "mmip" to MACHINE_FEATURES

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/machine/include/dra7xx.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.=
inc index 857e1b3..a7c8782 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,4 +1,4 @@
 require conf/machine/include/omap-a15.inc  SOC_FAMILY_append =3D ":dra7xx"
=20
-MACHINE_FEATURES +=3D "pci"
+MACHINE_FEATURES +=3D "pci mmip"
--
1.7.9.5


