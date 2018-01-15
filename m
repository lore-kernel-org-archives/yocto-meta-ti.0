Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBE82E00DFB; Mon, 15 Jan 2018 11:25:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76FBAE008FB
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 11:25:51 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0FJPoj4018856
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 13:25:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516044350;
	bh=C9L7OBfAXI84rmu/dQCxCczsRf6IHRy5qyF7JYq1UyM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=HDccQBDznDcnRggyPjWYfmoHHkPn92MsEcAv6wGjB5fyvCG5NWiT/5hDm0fhMYGRp
	wP12fFNlsqTHpCPEUvkJHygQ4gBNtbhYFECA2IMa7qtlR/6XELrcGrf1GaVk/HYP3Z
	yMebB4WEKov0i4swjdnrJ8zYcGhNNMcC1A9vC3Ts=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FJPoII001763
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 13:25:50 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 15 Jan 2018 13:25:50 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1261.035; Mon, 15 Jan 2018 13:25:50 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [morty/rocko/master][PATCH] ti-ipc: Update to new
	version 3.47.01.00_eng
Thread-Index: AQHTjibPH5iYm3zfwU+8nYkaHB4/hqN1l1IA//+4w2A=
Date: Mon, 15 Jan 2018 19:25:50 +0000
Message-ID: <3f43d6bda8434c07999758e7878a35be@ti.com>
References: <1516037541-9913-1-git-send-email-sam.nelson@ti.com>
	<20180115173732.GA31494@edge>
In-Reply-To: <20180115173732.GA31494@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.133]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty/rocko/master][PATCH] ti-ipc: Update to new version 3.47.01.00_eng
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
X-List-Received-Date: Mon, 15 Jan 2018 19:25:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,
Not a must for morty.  Probably rocko/master will do.
With regards,
Sam
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, January 15, 2018 12:38 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [morty/rocko/master][PATCH] ti-ipc: Update to new
> version 3.47.01.00_eng
>=20
> Sam,
>=20
> Is it really needed for morty?
>=20
>=20
> On Mon, Jan 15, 2018 at 12:32:21PM -0500, Sam Nelson wrote:
> > Also remove unused IPC_VERSION definition for ti-ipc-examples-linux
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/ipc/ti-ipc-common.inc            |  2 +-
> >  recipes-ti/ipc/ti-ipc-examples-linux_git.bb |  1 -
> >  recipes-ti/ipc/ti-ipc-rtos.inc              | 10 +++++-----
> >  recipes-ti/ipc/ti-ipc.inc                   |  6 +++---
> >  4 files changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/recipes-ti/ipc/ti-ipc-common.inc
> > b/recipes-ti/ipc/ti-ipc-common.inc
> > index 2fb7ffb..0ebe785 100644
> > --- a/recipes-ti/ipc/ti-ipc-common.inc
> > +++ b/recipes-ti/ipc/ti-ipc-common.inc
> > @@ -1,4 +1,4 @@
> > -PV =3D "3.47.00.00"
> > +PV =3D "3.47.01.00"
> >  INC_PR =3D "r0"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> > b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> > index ddbe48f..471d7ff 100644
> > --- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> > +++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> > @@ -27,7 +27,6 @@ do_compile_append() {
> >
> >  do_install_append() {
> >    cd ${S_ipc-examples}/src
> > -  IPC_VERSION=3D`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
> >
> >    if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
> >      # Install directory for linux examples diff --git
> > a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> > index 57cd132..6eee228 100644
> > --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> > +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> > @@ -24,17 +24,17 @@ protocol=3D${TI_IPC_METADATA_GIT_PROTOCOL};\
> >  branch=3D${TI_IPC_METADATA_GIT_BRANCH};\
> >  name=3D${TI_IPC_METADATA_NAME}"
> >
> > -# Corresponds to tag: 3.47.00.00
> > +# Corresponds to tag: 3.47.01.00_eng
> >  SRCREV_ipc-examples =3D "e71b82187a324faa9394b83e39495be38255f05b"
> >
> > -# Corresponds to tag: 3.47.00.00
> > -SRCREV_ipc-metadata =3D "f026a364d0b9c1aba5c695bf0aac0be8ede95f59"
> > +# Corresponds to tag: 3.47.01.00_eng
> > +SRCREV_ipc-metadata =3D "2e02a01c78f2545d84a8e497581db55e606da34c"
> >
> >  S_ipc-examples =3D "${WORKDIR}/git/ipc-examples"
> >  S_ipc-metadata =3D "${WORKDIR}/git/ipc-metadata"
> >
> > -RELEASE_TYPE =3D "GA"
> > -RELEASE_SUFFIX =3D ""
> > +RELEASE_TYPE =3D "ENG"
> > +RELEASE_SUFFIX =3D "_eng"
> >
> >  PR =3D "${INC_PR}.r2"
> >
> > diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> > index 02f3c8d..3e3ff8f 100644
> > --- a/recipes-ti/ipc/ti-ipc.inc
> > +++ b/recipes-ti/ipc/ti-ipc.inc
> > @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D
> > "file://${S}/ipc-linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9
> >
> >  TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
> >  TI_IPC_GIT_PROTOCOL =3D "git"
> > -TI_IPC_GIT_BRANCH =3D "3.47"
> > +TI_IPC_GIT_BRANCH =3D "ipc-next"
> >
> > -#Corresponds to 3.47.00.00
> > -TI_IPC_SRCREV =3D "e576990e3a220ad394b287588c1c7e85e8644d23"
> > +#Corresponds to 3.47.01.00_eng
> > +TI_IPC_SRCREV =3D "6a2595a4148fb12f259efc19164a9d33ad2ed294"
> >
> >  BRANCH =3D "${TI_IPC_GIT_BRANCH}"
> >  SRC_URI =3D
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH};
> name=3Dipcdev"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

