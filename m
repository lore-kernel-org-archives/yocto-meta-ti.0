Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07AB9E00D54; Tue, 21 May 2019 08:16:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74C7AE00C46
	for <meta-ti@yoctoproject.org>; Tue, 21 May 2019 08:16:29 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4LFGTd3002956
	for <meta-ti@yoctoproject.org>; Tue, 21 May 2019 10:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1558451789;
	bh=QNyD2Q1o6wtFum1H74jVtCnrYXFVNge45fzhOno0u+Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=pVstEfVVxCTMm1HVP8YX1ZHJ1+kYFrLmwxfchAet4Lj70Qwuu3DMXvoqp1JGStmOU
	DaaS6eKSXGK+Uuo+dUxcPQlUB2pUxFgbBZ2Lb7zcEfkTywcMKt2fSV+XD2E7lCfQcZ
	xN3BtwfLCXlcLmHsLW5ScE+1jFawJCJZK08yL4bA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4LFGSl9123875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 21 May 2019 10:16:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 21 May 2019 10:16:28 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1713.004; Tue, 21 May 2019 10:16:28 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Murphy, Dan" <dmurphy@ti.com>
Thread-Topic: [PATCH] u-boot-ti-staging: update to ti2019.01-rc5 tag
Thread-Index: AQHVD9iGUT9HpZ3EtkmhRJ+gpW/9rKZ16fIA///GsPk=
Date: Tue, 21 May 2019 15:16:28 +0000
Message-ID: <4ee65da3-0035-4c22-a1a1-81a069d98f35@email.android.com>
References: <20190521132426.19702-1-dmurphy@ti.com>,
	<b897ff64-f96b-18a1-2dbb-64c121a715a0@ti.com>
In-Reply-To: <b897ff64-f96b-18a1-2dbb-64c121a715a0@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] u-boot-ti-staging: update to ti2019.01-rc5 tag
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
X-List-Received-Date: Tue, 21 May 2019 15:16:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4ee65da300354c22a1a181a069d98f35emailandroidcom_"

--_000_4ee65da300354c22a1a181a069d98f35emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok



On May 21, 2019 08:41, "Murphy, Dan" <dmurphy@ti.com> wrote:
Please do not merge this.

It will change.

Dan

On 5/21/19 8:24 AM, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes-bs=
p/u-boot/u-boot-ti-staging_2019.01.bb
> index ac219376..6ba8e24e 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
> @@ -1,7 +1,7 @@
>  require u-boot-ti.inc
>
> -PR =3D "r10"
> +PR =3D "r11"
>
>  BRANCH =3D "ti-u-boot-2019.01"
>
> -SRCREV =3D "859e3aec28a8f9de80f1abc0de63de50bfe513de"
> +SRCREV =3D "291330731de984d05401cbab3d925818ebf7588b"
>

--_000_4ee65da300354c22a1a181a069d98f35emailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Ok
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On May 21, 2019 08:41, &quot;Murphy, Dan&quot;=
 &lt;dmurphy@ti.com&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Please do not merge this.<br>
<br>
It will change.<br>
<br>
Dan<br>
<br>
On 5/21/19 8:24 AM, Dan Murphy wrote:<br>
&gt; Signed-off-by: Dan Murphy &lt;dmurphy@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb | 4 &#43;&#43;--=
<br>
&gt;&nbsp; 1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes=
-bsp/u-boot/u-boot-ti-staging_2019.01.bb<br>
&gt; index ac219376..6ba8e24e 100644<br>
&gt; --- a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb<br>
&gt; &#43;&#43;&#43; b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb<br>
&gt; @@ -1,7 &#43;1,7 @@<br>
&gt;&nbsp; require u-boot-ti.inc<br>
&gt;&nbsp; <br>
&gt; -PR =3D &quot;r10&quot;<br>
&gt; &#43;PR =3D &quot;r11&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; BRANCH =3D &quot;ti-u-boot-2019.01&quot;<br>
&gt;&nbsp; <br>
&gt; -SRCREV =3D &quot;859e3aec28a8f9de80f1abc0de63de50bfe513de&quot;<br>
&gt; &#43;SRCREV =3D &quot;291330731de984d05401cbab3d925818ebf7588b&quot;<b=
r>
&gt; <br>
</div>
</span></font>
</body>
</html>

--_000_4ee65da300354c22a1a181a069d98f35emailandroidcom_--
