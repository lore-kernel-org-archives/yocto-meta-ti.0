Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B69CE00A04; Fri,  8 May 2015 09:25:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA4D1E009F8
	for <meta-ti@yoctoproject.org>; Fri,  8 May 2015 09:25:28 -0700 (PDT)
Received: by pdbqa5 with SMTP id qa5so87540019pdb.1
	for <meta-ti@yoctoproject.org>; Fri, 08 May 2015 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=x2DAiH7JgnIwQHT0GN3o0M7cnAZMiGXs/cyNgk1X8SU=;
	b=AOd46gVAO00ne+Dy4itowvNyTEPaM2/2WlWnSh4rbpynsrF+pfZb+J5XchjAog++8V
	iatB29jLbSv6h55mxwn0qZy0j/qHcvkeRbupHz/Pa2cHHg+vtmVywPvt4DNZrOp/SGIX
	Uon+HJerpQk5+7RchOQcxojrCzfPzPpNSnxOKzhyYp3E4SMohZVeobQ4gfpmZqDTi2ly
	2jVM2K0N4ZQSPemyP2ew1ULGNG4vP9DodINeFrmLtJxvLtojA6NnIGAaG8uwclGeYuuv
	i1VM3QmLrfkICrLHf71brdScuW86OsBOHmSHESxuQ9XCD2vIABaKMOEONuUpVGbBvvj9
	2M4Q==
X-Received: by 10.66.185.168 with SMTP id fd8mr7750825pac.27.1431102264841;
	Fri, 08 May 2015 09:24:24 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id j14sm5653336pbq.29.2015.05.08.09.24.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 May 2015 09:24:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431094924-13197-1-git-send-email-j-stiffler@ti.com>
Date: Fri, 8 May 2015 09:24:23 -0700
Message-Id: <5B49DEEC-24B8-4280-978B-0865B758F174@gmail.com>
References: <1431094924-13197-1-git-send-email-j-stiffler@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
X-Mailer: Apple Mail (2.2098)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-ipc-rtos: Add the TI-RTOS IPC package version 3.35.01.07
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
X-List-Received-Date: Fri, 08 May 2015 16:25:32 -0000
X-Groupsio-MsgNum: 6253
Content-Type: multipart/signed;
	boundary="Apple-Mail=_56BEDE78-6E1B-42C2-B466-057B5B3EC716";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_56BEDE78-6E1B-42C2-B466-057B5B3EC716
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 8, 2015, at 7:22 AM, Jacob Stiffler <j-stiffler@ti.com> wrote:
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> recipes-ti/ipc/ti-ipc-rtos.inc           |   18 ++++++++++++++++++
> recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb |    8 ++++++++
> 2 files changed, 26 insertions(+)
> create mode 100644 recipes-ti/ipc/ti-ipc-rtos.inc
> create mode 100644 recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc =
b/recipes-ti/ipc/ti-ipc-rtos.inc
> new file mode 100644
> index 0000000..dc18bf9
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (for =
Uni- and Multi- Processor Configurations)"
> +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
> +
> +LICENSE =3D "BSD"
> +
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-staging.inc
> +
> +SRC_URI =3D =
"http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${=
PV}/exports/ipc_${PV}.zip;name=3Dipczip"
> +
> +S =3D "${WORKDIR}/ipc_${PV}"
> +
> +do_install() {
> +    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> +    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
> +}
> +
> +INSANE_SKIP_${PN} =3D "installed-vs-shipped=E2=80=9D

same here. Can it be fixed ?

> diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb =
b/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
> new file mode 100644
> index 0000000..4c67c6e
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
> @@ -0,0 +1,8 @@
> +require ti-ipc-rtos.inc
> +
> +PV =3D "3_35_01_07"
> +
> +LIC_FILES_CHKSUM =3D =
"file://${S}/ipc-linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9b710fd7=
c95e545b91cec79255"
> +
> +SRC_URI[ipczip.md5sum] =3D "9e62e35b8c2d44b1ac5f7ad9554b1a34"
> +SRC_URI[ipczip.sha256sum] =3D =
"006ac780ded0a5fa843397bbde0cb597338dc521544121f697c2efdd80f86314"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--Apple-Mail=_56BEDE78-6E1B-42C2-B466-057B5B3EC716
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVM4zcACgkQuwUzVZGdMxT+dgCfSKi76jGXoWgZa0J79MbsL+lw
i5AAnieYuql9FHn0KTBzajhuiYArER4x
=nva6
-----END PGP SIGNATURE-----

--Apple-Mail=_56BEDE78-6E1B-42C2-B466-057B5B3EC716--
