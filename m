Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB1C0E00A18; Fri,  3 Mar 2017 03:25:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 863 seconds by postgrey-1.32 at yocto-www;
	Fri, 03 Mar 2017 03:25:19 PST
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B40DAE0094C
	for <meta-ti@yoctoproject.org>; Fri,  3 Mar 2017 03:25:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23BAjjQ029202
	for <meta-ti@yoctoproject.org>; Fri, 3 Mar 2017 05:10:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488539445;
	bh=o8nTPNBC99xtVI2PnrkHo2AM7Yyge5QCD65u6JGw64w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=oX9n9ly9GoR+33R7hEPtfBwIqmySEyzBDNQcnvL1hSi/5LtzZbzim483romg9OMPM
	BDEaj+xqnQcCFGk1il3Paw4fAkwUSixdbrCKY0+a89zoxvOUwHOpPtXwXiRFpKeYyx
	DRPxX3nBWXSWOyj5HZOm1Qe/9FI9JieNZCPALEIE=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23BAeck016377
	for <meta-ti@yoctoproject.org>; Fri, 3 Mar 2017 05:10:40 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Fri, 3 Mar 2017 05:10:40 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [morty/master][PATCH] conf/machine: bump Keystone
	max_leb_cnt by 10% to fit debug images
Thread-Index: AQHSk6s1pPTaXcu47kaYaSe70K/4J6GC9bOw
Date: Fri, 3 Mar 2017 11:10:39 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958253B3B2E@DFLE09.ent.ti.com>
References: <1488496648-61231-1-git-send-email-denys@ti.com>
In-Reply-To: <1488496648-61231-1-git-send-email-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [morty/master][PATCH] conf/machine: bump Keystone	max_leb_cnt by 10% to fit debug images
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
X-List-Received-Date: Fri, 03 Mar 2017 11:25:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, March 02, 2017 6:17 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [morty/master][PATCH] conf/machine: bump Keystone
> max_leb_cnt by 10% to fit debug images

If I recall correctly, these sizes are the maximum they can be to fit the U=
BIFS image into the NAND.=20

The tisdk-server-extra-rootfs-image was created to produce images which exc=
eed the limitations of the board.

>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  conf/machine/k2e-evm.conf  | 2 +-
>  conf/machine/k2g-evm.conf  | 2 +-
>  conf/machine/k2hk-evm.conf | 2 +-
>  conf/machine/k2l-evm.conf  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
> index 95b0e42..bb6b5fb 100644
> --- a/conf/machine/k2e-evm.conf
> +++ b/conf/machine/k2e-evm.conf
> @@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS =3D ""
>  # UBI: logical eraseblock size:    126976 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 3856 LEBs
> -MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 4000"
> +MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 4400"
>=20
>  # do ubiattach /dev/ubi_ctrl -m 4
>  # from dmesg:
> diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
> index 458dfe4..997406b 100644
> --- a/conf/machine/k2g-evm.conf
> +++ b/conf/machine/k2g-evm.conf
> @@ -26,7 +26,7 @@ SYSVINIT_ENABLED_GETTYS =3D ""
>  # UBI: logical eraseblock size:    253952 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 1926 LEBs
> -MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 2000"
> +MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 2200"
>=20
>  # do ubiattach /dev/ubi_ctrl -m 4
>  # from dmesg:
> diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
> index 6adb016..88d1608 100644
> --- a/conf/machine/k2hk-evm.conf
> +++ b/conf/machine/k2hk-evm.conf
> @@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS =3D ""
>  # UBI: logical eraseblock size:    126976 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 3856 LEBs
> -MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 4000"
> +MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 4400"
>=20
>  # do ubiattach /dev/ubi_ctrl -m 4
>  # from dmesg:
> diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
> index b4721d0..9b00a20 100644
> --- a/conf/machine/k2l-evm.conf
> +++ b/conf/machine/k2l-evm.conf
> @@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS =3D ""
>  # UBI: logical eraseblock size:    253952 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 1926 LEBs
> -MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 2000"
> +MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 2200"
>=20
>  # do ubiattach /dev/ubi_ctrl -m 4
>  # from dmesg:
> --
> 2.7.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

