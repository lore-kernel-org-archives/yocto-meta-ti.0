Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E137FE00C09; Mon,  8 Jul 2019 11:38:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64679E00BD5
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2019 11:38:18 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68IcHCq033539
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2019 13:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562611098;
	bh=Oszma0btFZepMqhEOT2FgnkVg8wIIfhmRA8hPh/86u4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=q127QASqAJ2OUNQqPL6zgAe+jNxyA9JemxZPMmeQOz0pyIeXtM226EEH0gIM0Jkgu
	AWxEHiD/lynGu37l8kTtUhtKB6ZyMFgPgggo2vf5BAxC33xqHAdgglgIBFtCozQD4p
	qIZI6qkZP5/4y71H4qE0VPVEvfDTeq+JDKrYDMD8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68IcH1D059759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2019 13:38:17 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 8 Jul 2019 13:38:17 -0500
Received: from DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb]) by
	DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb%17]) with mapi id
	15.01.1713.004; Mon, 8 Jul 2019 13:38:17 -0500
From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [thud PATCH v1] packagegroup-arago-tisdk-addons: add jailhouse
	for j7-evm
Thread-Index: AQHVMw+npyAAy85Is0qDvZAjMsadMabBRY6A///M0rA=
Date: Mon, 8 Jul 2019 18:38:17 +0000
Message-ID: <4609398eac7f470ba3e8dc59aa903264@ti.com>
References: <1562317035-13652-1-git-send-email-nikhil.nd@ti.com>
	<20190708164103.GD26050@beryl>
In-Reply-To: <20190708164103.GD26050@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.132.63]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [thud PATCH v1] packagegroup-arago-tisdk-addons: add jailhouse for j7-evm
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
X-List-Received-Date: Mon, 08 Jul 2019 18:38:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> Wrong list - this should be sent to meta-arago.

Resent to the meta-arago list.
Thanks
Nikhil D

On Fri, Jul 05, 2019 at 02:27:15PM +0530, Nikhil Devshatwar wrote:
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb       =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-addons.bb
> index be3ada6..21aa724 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
> @@ -76,7 +76,7 @@ UTILS_append_k3 =3D " mmc-utils \
>  "
> =20
>  UTILS_append_am65xx =3D " ti-ipc-rtos-fw pru-icss"
> -UTILS_append_j7-evm =3D " ipc-lld-fw ti-display-sharing-fw"
> +UTILS_append_j7-evm =3D " ipc-lld-fw ti-display-sharing-fw jailhouse"
> =20
>  UTILS_append_omapl138 =3D " ti-ipc-rtos-fw"
> =20
> --=20
> 1.9.1
>=20

