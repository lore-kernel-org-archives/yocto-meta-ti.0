Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11498E00C12; Sat, 19 Dec 2015 08:12:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DBE6E0088C
	for <meta-ti@yoctoproject.org>; Sat, 19 Dec 2015 08:12:52 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBJGCpdT024191
	for <meta-ti@yoctoproject.org>; Sat, 19 Dec 2015 10:12:51 -0600
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBJGCoZ1027961
	for <meta-ti@yoctoproject.org>; Sat, 19 Dec 2015 10:12:51 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBJGCm03015553
	for <meta-ti@yoctoproject.org>; Sat, 19 Dec 2015 21:42:49 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0224.002; Sat, 19 Dec 2015 21:42:46 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [SGX AM57x/DRA7xx 0/2] Update SGX graphics recipes
	for AM57x/DRA7xx to latest version
Thread-Index: AQHRM/USR4YWjOHPXUO8MxVva7mQj57L4bgAgAamHuA=
Date: Sat, 19 Dec 2015 16:12:46 +0000
Message-ID: <05CF4794C98B244ABDC620C10903762273194435@DBDE04.ent.ti.com>
References: <1449825558-1294-1-git-send-email-anandb@ti.com>
	<20151215160903.GF23133@edge>
In-Reply-To: <20151215160903.GF23133@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [SGX AM57x/DRA7xx 0/2] Update SGX graphics recipes for AM57x/DRA7xx to latest version
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
X-List-Received-Date: Sat, 19 Dec 2015 16:12:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

The updates to UM binaries and KM source have been validated on the 2015 LT=
S file system (tisdk-rootfs-image-dra7xx-evm-20151217001041.rootfs.tar.gz)

Both kmscube and Weston applications are running fine.

Regards,
Anand

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, December 15, 2015 9:39 PM
To: Balagopalakrishnan, Anand
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [SGX AM57x/DRA7xx 0/2] Update SGX graphics recipes f=
or AM57x/DRA7xx to latest version

On Fri, Dec 11, 2015 at 02:49:16PM +0530, Anand Balagopalakrishnan wrote:
> Update SGX UM / KM to latest version for AM57x/DRA7xx
>=20
> The changes involved have been tested against 4.1 kernel (commit -
> 03066ae73fc380e3ea9da8cba63591a135b33b71) with GLSDK 7.02 GA /
> 2014 LTS file system. The Yocto recipes have not been verified on 2015 LT=
S.

Is this for 2015.02? Considering that is hasn't been validated on 2015LTS a=
nd that we are just days away from the release, this seems risky to push at=
 this time...

--
Denys


> Summary of changes
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> UM:
> - Enable screenshot capture in Weston
> - Resolve SGX HW recovery when Wayland OpenGLES clients are abruptly term=
inated
> - Resolve SGX HW recovery with glmark2 benchmark application
> - Resolve rendering issue with half float textures
>=20
> KM:
> - Fix access to freed memory
> - Fix GEM handle memory leak when Wayland client exit and Weston continue=
s to run
>=20
> Anand Balagopalakrishnan (2):
>   omapdrm-pvr: bump SRCREV for AM57x/DRA7xx
>   omap5-sgx-ddk-um-linux: bump SRCREV for AM57x/DRA7xx to the latest
>     DDK UM
>=20
>  .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    2 +-
>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

