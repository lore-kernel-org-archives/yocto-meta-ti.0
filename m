Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F2ABE006B3; Tue, 14 Aug 2018 08:31:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D3B1E0049F
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 08:31:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EFVWiw061303
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 10:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534260692;
	bh=soAyxncumLN2X0XpYlGcqe9Hcyyha16gZ0+ccVKMK3A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=IL9CO52RVrlTRppmlZk+GKfzNtPyeMHX+fXV7HBcSJo3gdwLGZgonIO04kuDF6LcQ
	J4uo8QvJc9z9ZadeEjWr9oedB6Is5q+lCTUCFftb3HHo3jpjgnh68vOTpydz11Hl6F
	jpoWitW9lyhRBfpkL/lYrRRVoVWV+I41cJDFGWIE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EFVWp1030635
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 10:31:32 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 10:31:32 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
	DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
	15.01.1466.003; Tue, 14 Aug 2018 10:31:32 -0500
From: "Saulnier, Nick" <nsaulnier@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti][PATCH v1] pru-icss_git.bb: Add am65x PRU_Halt
Thread-Index: AQHUMzymbusNOpCQFkKG6PvYtu7DrKS+w1CAgACdZoA=
Date: Tue, 14 Aug 2018 15:31:32 +0000
Message-ID: <223803125eda4b83aaa855cb01de271f@ti.com>
References: <1534188863-8838-1-git-send-email-nsaulnier@ti.com>
	<20180814010609.GA2547@beryl>
In-Reply-To: <20180814010609.GA2547@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.39]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v1] pru-icss_git.bb: Add am65x PRU_Halt
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
X-List-Received-Date: Tue, 14 Aug 2018 15:31:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No functional changes for the next patch, it will only update SRCREV and PV=
. I will clean out the commented lines and re-submit.

Thanks,=20
Nick

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, August 13, 2018 8:06 PM
To: Saulnier, Nick
Cc: meta-ti@yoctoproject.org; Stiffler, Jacob
Subject: Re: [meta-ti][PATCH v1] pru-icss_git.bb: Add am65x PRU_Halt

On Mon, Aug 13, 2018 at 02:34:23PM -0500, Nick Saulnier wrote:
> Updated SRCREV to point to an updated version of the PRU Software Support
> Package which includes PRU_Halt and RTU_Halt examples for am65x. PV will
> get updated in the next patch.
>=20
> Added PRU_Halt and RTU_Halt to do_install_append_am65xx-evm(). Decided to=
 leave
> the installation of PRU_Halt examples in each processor's do_install_appe=
nd
> function for now since PRU_Halt and RTU_Halt for am65x have different out=
put
> file names than the previous ICSS processors. Those different output name=
s can
> be seen in the lines ALTERNATIVE_TARGET_pru-icss-halt[am65x....].
>=20
> The previous commit made several changes to account for the fact that am6=
5x Halt
> examples had not yet been added to the PRU Software Support Package. I tr=
ied to
> comment out those temporary changes from the previous commit. The comment=
ed
> lines will be removed in a future patch once we verify that I commented t=
he
> correct lines of code.

Thanks, looks good. Do you expect more functional changes in the next patch=
?=20
If not, I'd suggest cleaning commented out lines in v2.


> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
> ---
>  recipes-bsp/pru/pru-icss_git.bb | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
>=20
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_g=
it.bb
> index 3c871b70e3f0..7d23b3d066f8 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -8,10 +8,10 @@ inherit update-alternatives
> =20
>  BRANCH =3D "master"
>  SRC_URI =3D "git://git.ti.com/pru-software-support-package/pru-software-=
support-package.git;protocol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "81b568741b8b98e6f590271a9aea5956d2b2d9ce"
> +SRCREV =3D "1d9249c012005a669a6ffb2f76255d72ed5c0e4c"
> =20
>  PV =3D "5.2.1"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  require recipes-ti/includes/ti-paths.inc
> =20
> @@ -103,6 +103,13 @@ do_install_append_k2g() {
>  }
> =20
>  do_install_append_am65xx-evm() {
> +    for i in 0 1=20
> +    do
> +        install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PR=
U_Halt_${i}.out \
> +                   ${D}/lib/firmware/pru
> +        install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RT=
U_Halt_${i}.out \
> +                   ${D}/lib/firmware/pru
> +    done
>      for i in 0 1 2
>      do
>          for j in 0 1
> @@ -116,7 +123,7 @@ do_install_append_am65xx-evm() {
>      done
>  }
> =20
> -FILES_${PN}-halt =3D "/lib/firmware/pru/PRU_Halt.out"
> +FILES_${PN}-halt =3D "/lib/firmware/pru/PRU_Halt* /lib/firmware/pru/RTU_=
Halt*"
>  FILES_${PN}-rpmsg-echo =3D "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt* =
/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
> =20
>  # Set up names for the firmwares
> @@ -161,8 +168,8 @@ ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] =3D "/lib/firm=
ware/am65x-rtu2_1-fw"
>  # Create the pru-icss-halt firmware alternatives
>  ALTERNATIVE_pru-icss-halt =3D "${PRU_ICSS_ALTERNATIVES}"
> =20
> -# am65xx doesn't have halt FW for now
> -ALTERNATIVE_pru-icss-halt_am65xx-evm =3D ""
> +# since am65xx now has halt, we can comment out the line below right?
> +#ALTERNATIVE_pru-icss-halt_am65xx-evm =3D ""
> =20
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] =3D "/lib/firmware/pru/=
PRU_Halt.out"
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] =3D "/lib/firmware/pru/=
PRU_Halt.out"
> @@ -182,6 +189,19 @@ ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] =3D =
"/lib/firmware/pru/PRU_Halt.ou
>  ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] =3D "/lib/firmware/pru/P=
RU_Halt.out"
>  ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] =3D "/lib/firmware/pru/P=
RU_Halt.out"
> =20
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] =3D "/lib/firmware/pru=
/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] =3D "/lib/firmware/pru=
/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] =3D "/lib/firmware/pru=
/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] =3D "/lib/firmware/pru=
/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] =3D "/lib/firmware/pru=
/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] =3D "/lib/firmware/pru=
/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] =3D "/lib/firmware/pru=
/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] =3D "/lib/firmware/pru=
/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] =3D "/lib/firmware/pru=
/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] =3D "/lib/firmware/pru=
/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] =3D "/lib/firmware/pru=
/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] =3D "/lib/firmware/pru=
/RTU_Halt_1.out"
> +
>  ALTERNATIVE_PRIORITY_pru-icss-halt =3D "50"
> =20
>  # Create the pru-icss-rpmsg-echo firmware alternatives
> @@ -220,8 +240,9 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-f=
w] =3D "/lib/firmware/pru/RTU
> =20
>  ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo =3D "100"
> =20
> -# am65xx doesn't have halt FW for now
> -ALLOW_EMPTY_${PN}-halt =3D "1"
> +# Since am65xx how has halt, we can comment out ALLOW_EMPTY_-halt now ri=
ght?
> +# old comment: am65xx doesn't have halt FW for now
> +#ALLOW_EMPTY_${PN}-halt =3D "1"
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
> =20
> --=20
> 1.9.1
>=20

