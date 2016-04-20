Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 856B7E00CE6; Wed, 20 Apr 2016 12:30:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2A1CE007D2
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 12:30:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3KJUYAb004392
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 14:30:34 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KJUYJH007901
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 14:30:34 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Wed, 20 Apr 2016 14:30:33 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [master/fido][PATCH 1/2] ipc-transport: Clean up recipe
Thread-Index: AQHRmzbcOk2fi7mb6U+5AMjx70l9HJ+TPXBA
Date: Wed, 20 Apr 2016 19:30:33 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE13AF528ED@DFLE12.ent.ti.com>
References: <1461177987-495-1-git-send-email-jsobota@ti.com>
	<5717D1B8.9050709@ti.com>
In-Reply-To: <5717D1B8.9050709@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [master/fido][PATCH 1/2] ipc-transport: Clean up recipe
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
X-List-Received-Date: Wed, 20 Apr 2016 19:30:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Stiffler, Jacob=20
Sent: Wednesday, April 20, 2016 3:00 PM
To: Sobota, Justin; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [master/fido][PATCH 1/2] ipc-transport: Clean up rec=
ipe



On 4/20/2016 2:46 PM, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>   recipes-ti/ipc/ipc-transport-qmss.inc |    4 +++-
>   recipes-ti/ipc/ipc-transport-srio.inc |    4 +++-
>   recipes-ti/ipc/ipc-transport.inc      |   14 ++++++++------
>   3 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc=20
> b/recipes-ti/ipc/ipc-transport-qmss.inc
> index a5c8dc4..7539ef5 100644
> --- a/recipes-ti/ipc/ipc-transport-qmss.inc
> +++ b/recipes-ti/ipc/ipc-transport-qmss.inc
> @@ -3,7 +3,9 @@ LICENSE =3D "BSD-3-Clause"
>  =20
>   require ipc-transport.inc
>  =20
> -INC_PR_append =3D ".0"
> +PR =3D "${INC_PR}.1"

PR should be specified in the recipe file.

[JS] I'll revert this change and bump to ".1"=20

> +
> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D27bb0deb260c60120a8d7b91d=
a7c3b02"
>  =20
>   COMPATIBLE_MACHINE =3D "keystone"
>  =20
> diff --git a/recipes-ti/ipc/ipc-transport-srio.inc=20
> b/recipes-ti/ipc/ipc-transport-srio.inc
> index 4b5c305..18b94d1 100644
> --- a/recipes-ti/ipc/ipc-transport-srio.inc
> +++ b/recipes-ti/ipc/ipc-transport-srio.inc
> @@ -3,7 +3,9 @@ LICENSE =3D "BSD-3-Clause"
>  =20
>   require ipc-transport.inc
>  =20
> -INC_PR_append =3D ".0"
> +PR =3D "${INC_PR}.1"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D27bb0deb260c60120a8d7b91d=
a7c3b02"

Why not keep this in the original location? This appears to be duplicated i=
n these intermediate .inc files.

[JS] checksum against COPYING.txt only applies to Linux recipes.  RTOS reci=
pe checksum is calculated against RTOS-specific files.  Two options: In cur=
rent patch, move checksum calculation out of top-level include into individ=
ual Linux/RTOS recipes OR keep checksum against COPYING.txt in top level in=
clude and override it in RTOS recipes.  Which do you prefer?

>  =20
>   COMPATIBLE_MACHINE =3D "k2hk-evm"
>  =20
> diff --git a/recipes-ti/ipc/ipc-transport.inc=20
> b/recipes-ti/ipc/ipc-transport.inc
> index 4ba3670..705dfb4 100644
> --- a/recipes-ti/ipc/ipc-transport.inc
> +++ b/recipes-ti/ipc/ipc-transport.inc
> @@ -1,15 +1,17 @@
> -LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D27bb0deb260c60120a8d7b91d=
a7c3b02"
> +LICENSE =3D "BSD-3-Clause"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

What makes these .inc file machine-specific?

[JS] I'll back this out.  Doesn't make sense being here.

>  =20
>   IPC_TRANSPORT_GIT_URI =3D "git://git.ti.com/keystone-linux/ipc-transpor=
t.git"
> -IPC_TRANSPORT_GIT_BRANCH =3D "master"
>   IPC_TRANSPORT_GIT_PROTOCOL =3D "git"
> +IPC_TRANSPORT_GIT_BRANCH =3D "master"
>  =20
> -# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.01
> +# Below commit ID corresponds to "DEV.IPC-TRANSPORT.02.00.00.01"
>   IPC_TRANSPORT_SRCREV =3D "88ea336c584ccec4b2c281cd7f75df9dff6d4edf"
>  =20
> -BRANCH=3D"${IPC_TRANSPORT_GIT_BRANCH}"
> +BRANCH =3D "${IPC_TRANSPORT_GIT_BRANCH}"
>   SRC_URI =3D "${IPC_TRANSPORT_GIT_URI};protocol=3D${IPC_TRANSPORT_GIT_PR=
OTOCOL};branch=3D${BRANCH}"
> +
>   SRCREV =3D "${IPC_TRANSPORT_SRCREV}"
>   PV =3D "02.00.00.01"
> -
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"


