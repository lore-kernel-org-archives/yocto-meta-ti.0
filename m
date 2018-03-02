Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66E30E0106F; Thu,  1 Mar 2018 22:14:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA34EE00DC6
	for <meta-ti@yoctoproject.org>; Thu,  1 Mar 2018 22:14:37 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w226EawO013466
	for <meta-ti@yoctoproject.org>; Fri, 2 Mar 2018 00:14:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519971276;
	bh=ckg+g+2T7MgayaABRfBslKgoRQjeM7wsBgfZ1Q40IeA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Qd3dsjQrS+LEIgcU9RtWXAImnUHxM2MAUpJ6zMfyacazvwihhF0vB04w7DLZlYclE
	QPbX1abGHs+oG2wGWyiMiI7f16lomc19rS64y/1B/SKnS0mj1wsY1qJjFr/3YkiBba
	TopTb4HJ8q6JuVOJK/5l4OZCC8UbV7ifVrW5GiSc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w226EaBI001064
	for <meta-ti@yoctoproject.org>; Fri, 2 Mar 2018 00:14:36 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 2 Mar 2018 00:14:36 -0600
Received: from DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891]) by
	DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891%17]) with mapi id
	15.01.1261.035; Fri, 2 Mar 2018 00:14:36 -0600
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [FOR-KROGOTH 1/1] ti-sgx-ddk-um: wlpvr_ws: Map DBM
	buffers and populate meminfo
Thread-Index: AQHTsXkovbYSs9TZnkKJErdtb/s6X6O8TECAgAAr/nA=
Date: Fri, 2 Mar 2018 06:14:36 +0000
Message-ID: <5ba205ac303b4d3ba6066b9228df7bf7@ti.com>
References: <1519921195-10423-1-git-send-email-anandb@ti.com>
	<20180301213607.GT22424@edge>
In-Reply-To: <20180301213607.GT22424@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.157.96]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [FOR-KROGOTH 1/1] ti-sgx-ddk-um: wlpvr_ws: Map DBM buffers and populate meminfo
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
X-List-Received-Date: Fri, 02 Mar 2018 06:14:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

No. I faced an issue while building CoreSDK for Krogoth due to gforge probl=
em. Irrespective of that, I did find an error with branch name on this patc=
h. Will send a v2 for this patch.

ERROR: hevc-arm-decoder-01.00.00.01-r3 do_fetch: Fetcher failure: Fetch com=
mand failed with exit code 4, output:
Unable to establish SSL connection.

ERROR: hevc-arm-decoder-01.00.00.01-r3 do_fetch: Function failed: Fetcher f=
ailure for URL: 'https://gforge.ti.com/gf/download/frsrelease/1280/7770/REL=
.HEVC.D.ARM.OBJ.01.00.00.01.tar.gz'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /work/anand/coresdk/tisdk/build/arago-=
tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/hevc-arm-dec=
oder/01.00.00.01-r3/temp/log.do_fetch.37493
ERROR: Task 2993 (/work/anand/coresdk/tisdk/sources/meta-arago/meta-arago-e=
xtras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb, =
do_fetch) failed with exit code '1'

Regards,
Anand


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, March 2, 2018 3:06 AM
To: Balagopalakrishnan, Anand
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [FOR-KROGOTH 1/1] ti-sgx-ddk-um: wlpvr_ws: Map DBM b=
uffers and populate meminfo

Have you tested this patch?

On Thu, Mar 01, 2018 at 09:49:55PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb=20
> b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> index 3a9a2b2..3e689cb 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> @@ -8,7 +8,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  BRANCH =3D "ti-img-sgx/${PV}"
> =20
>  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protoc=
ol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "d184140aa5c17e13e1bf21151f1a7bc068bdf8bf"
> +SRCREV =3D "2736a396f9c801fc0818d830f8a3215aeb8b6534"
> =20
>  # There's only hardfp version available  python __anonymous() { @@=20
> -31,7 +31,7 @@ INITSCRIPT_PARAMS =3D "defaults 8"
> =20
>  inherit update-rc.d
> =20
> -PR =3D "r23"
> +PR =3D "r24"
>  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-d=
dk-um-linux"
> =20
>  DEPENDS +=3D "libdrm udev libgbm wayland libffi"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

