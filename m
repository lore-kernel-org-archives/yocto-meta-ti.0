Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A29DCE009FD; Thu,  6 Aug 2015 12:06:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A464E00767
	for <meta-ti@yoctoproject.org>; Thu,  6 Aug 2015 12:06:45 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t76J6iFo017657
	for <meta-ti@yoctoproject.org>; Thu, 6 Aug 2015 14:06:45 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76J6g3Q018291
	for <meta-ti@yoctoproject.org>; Fri, 7 Aug 2015 00:36:43 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0224.002; Fri, 7 Aug 2015 00:36:42 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [PATCH 0/2] Update SGX graphics recipes to latest version for
	K4.1
Thread-Index: AQHQ0HmeG7W/X+OX4EG7ZNrP2xoBuZ3+97GAgABdSJA=
Date: Thu, 6 Aug 2015 19:06:41 +0000
Message-ID: <05CF4794C98B244ABDC620C1090376227306E2CF@DBDE04.ent.ti.com>
References: <1438886878-1165-1-git-send-email-anandb@ti.com>
	<20150806190220.GC1040@edge>
In-Reply-To: <20150806190220.GC1040@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 0/2] Update SGX graphics recipes to latest version for K4.1
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
X-List-Received-Date: Thu, 06 Aug 2015 19:06:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Yes, it is based on the same DDK version. We will be moving to DDK 1.14 as =
part of Feb'16 release.

Regards,
Anand


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, August 07, 2015 12:32 AM
To: Balagopalakrishnan, Anand
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/2] Update SGX graphics recipes to latest version for =
K4.1

Thanks, Anand!

I'll give it a try right away!

Meanwhile, a quick question - is it still based on the same versions of DDK=
?=20
I.e. 1.9.0.12 and 1.9.2253347?

--=20
Denys


On Fri, Aug 07, 2015 at 12:17:56AM +0530, Anand Balagopalakrishnan wrote:
> Update SGX UM / KM to latest version for 4.1 kernel for 2015 LTS
>=20
> The changes involved have been tested against 4.1 kernel with GLSDK 7.01 =
Beta /
> 2014 LTS file system. The Yocto recipes have not been verified on 2015 LT=
S.
>=20
> Anand Balagopalakrishnan (2):
>   omapdrm-pvr: recipe update for SGX KM on 4.1 kernel
>   omap5-sgx-ddk-um-linux: update SGX user mode binaries to latest
>     version
>=20
>  .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    4 ++--
>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>=20
> --=20
> 1.7.9.5
>=20

