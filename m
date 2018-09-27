Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6115DE0090A; Thu, 27 Sep 2018 16:25:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63638E00519
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:25:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RNPqtg001872
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 18:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538090752;
	bh=jkefNtJzIJrC53/7rX/LeVpUrzRaPu+N++dWMlJC+1o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ZfKVsIDJUNGNPAjib/OTY8UThZEhWaS+O8d8RSDKU0Y4NI7xKUjwpNVGR3dJvQ6T5
	vXpLSfvI1jGl72SqI/pUtepM1zWvTb18wZrXIM4BO2WBWc7kG8pO44ZMOXVGSVx/MV
	+kQKUh/6lAsjmmr56e7jlQxBAcavZyjZHE0K+aR4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNPqQ1013596
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 18:25:52 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 18:25:52 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Thu, 27 Sep 2018 18:25:52 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH v2 24/30] sciclient-rtos: SRCREV
	update
Thread-Index: AQHUVqvvVbzA5+ViR0qp90loVd6w5KUExAQw
Date: Thu, 27 Sep 2018 23:25:52 +0000
Message-ID: <38182b79f0de4aa6b7fc5e17685c021c@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-25-git-send-email-m-radhakrishnan2@ti.com>
	<20180927214914.GS8582@beryl>
In-Reply-To: <20180927214914.GS8582@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v2 24/30] sciclient-rtos: SRCREV update
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
X-List-Received-Date: Thu, 27 Sep 2018 23:25:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, September 27, 2018 5:49 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org; Nelson, Sam
Subject: Re: [meta-ti] [rocko/master][PATCH v2 24/30] sciclient-rtos: SRCRE=
V update

On Thu, Sep 27, 2018 at 04:43:23PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/sciclient/sciclient-rtos_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sc=
iclient/sciclient-rtos_git.bb
> index 73f642d..1eee3d6 100644
> --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -12,15 +12,15 @@ SCICLIENT_GIT_URI =3D "git://git.ti.com/keystone-rtos=
/sciclient.git"
>  SCICLIENT_GIT_PROTOCOL =3D "git"
>  SCICLIENT_GIT_BRANCH =3D "master"
> =20
> -# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00A"
> -SCICLIENT_SRCREV =3D "cf151766d4cef7f93b47e4822a1ce6f17dfb9339"
> +# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00"
> +SCICLIENT_SRCREV =3D "b865ba8a56b298048e21a26abb087c34113f5da1"

Do you keep moving the same tag?
There was no tag applied on the sciclient repo yet, until now.
This is the first release of processor sdk with sciclient, hence the 1.0.0.=
0 tag now.(inline with sciclient's package.xdc, and ver.h versions)


Sam,

Will this affect R5 IPC?


>  BRANCH =3D "${SCICLIENT_GIT_BRANCH}"
>  SRC_URI =3D "${SCICLIENT_GIT_URI};protocol=3D${SCICLIENT_GIT_PROTOCOL};b=
ranch=3D${BRANCH}"
> =20
>  SRCREV =3D "${SCICLIENT_SRCREV}"
>  PV =3D "01.00.00.00"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  DEPENDS_append =3D " osal-rtos common-csl-ip-rtos"
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

