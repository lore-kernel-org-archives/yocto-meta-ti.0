Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99637E00805; Tue, 14 Aug 2018 15:01:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3242E00566
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 15:01:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EM1HLG001142
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 17:01:17 -0500
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EM1HG6010708
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 17:01:17 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 17:01:17 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
	DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
	15.01.1466.003; Tue, 14 Aug 2018 17:01:17 -0500
From: "Saulnier, Nick" <nsaulnier@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti][PATCH v2] pru-icss_git.bb: Add am65x PRU_Halt
Thread-Index: AQHUM+aJBv0lLyGd1EGKbC4LeudtWqS/5y4A///iHXA=
Date: Tue, 14 Aug 2018 22:01:17 +0000
Message-ID: <44459376150d499dbc12c078d6f7ff81@ti.com>
References: <1534261821-11798-1-git-send-email-nsaulnier@ti.com>
	<20180814183532.GE2547@beryl>
In-Reply-To: <20180814183532.GE2547@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.39]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2] pru-icss_git.bb: Add am65x PRU_Halt
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
X-List-Received-Date: Tue, 14 Aug 2018 22:01:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch needs to get into core SDK 2018.3. I want PV to match the Softwa=
re Support Package tag, but there are outstanding issues I will fix in the =
next 2 weeks (unrelated to PRU_Halt). Once those issues are addressed, I'll=
 tag the commit we will use for Proc SDK5.1 and update PV to match.

Thanks,=20
Nick

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, August 14, 2018 1:36 PM
To: Saulnier, Nick
Cc: meta-ti@yoctoproject.org; Stiffler, Jacob
Subject: Re: [meta-ti][PATCH v2] pru-icss_git.bb: Add am65x PRU_Halt

On Tue, Aug 14, 2018 at 10:50:21AM -0500, Nick Saulnier wrote:
> Updated SRCREV to point to an updated version of the PRU Software Support
> Package which includes PRU_Halt and RTU_Halt examples for am65x. PV will
> get updated in the next patch.

Not that it's critical, but I thought you were going to update PV here as=20
well...


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
> examples had not yet been added to the PRU Software Support Package. Thos=
e
> changes were removed in this commit.
>=20
> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
> ---
>  recipes-bsp/pru/pru-icss_git.bb | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>=20
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_g=
it.bb
> index 3c871b70e3f0..e150076ec0a2 100644
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
> @@ -161,9 +168,6 @@ ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] =3D "/lib/firm=
ware/am65x-rtu2_1-fw"
>  # Create the pru-icss-halt firmware alternatives
>  ALTERNATIVE_pru-icss-halt =3D "${PRU_ICSS_ALTERNATIVES}"
> =20
> -# am65xx doesn't have halt FW for now
> -ALTERNATIVE_pru-icss-halt_am65xx-evm =3D ""
> -
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] =3D "/lib/firmware/pru/=
PRU_Halt.out"
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] =3D "/lib/firmware/pru/=
PRU_Halt.out"
> =20
> @@ -182,6 +186,19 @@ ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] =3D =
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
> @@ -220,9 +237,6 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-f=
w] =3D "/lib/firmware/pru/RTU
> =20
>  ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo =3D "100"
> =20
> -# am65xx doesn't have halt FW for now
> -ALLOW_EMPTY_${PN}-halt =3D "1"
> -
>  ALLOW_EMPTY_${PN} =3D "1"
> =20
>  # This installs PRU firmware, so skip "arch" QA check
> --=20
> 1.9.1
>=20

