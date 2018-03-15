Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DEC8E0084E; Wed, 14 Mar 2018 17:51:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DCFDE0073D
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 17:51:29 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2F0pT5l032561
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 19:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521075089;
	bh=GpW6Jv3rPMyPjAkXDHOf9uWa8EIT+hGyRNMahtUz6c4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ovZY/rcfsfXSx5Z4AziEwjiOjkKu3L+F6aFuEN9Pv9B73sfQRlHLC0UxwX3TyWfEt
	ZFSlOfd1GvUJhhREPIIhYlPkARNF9fSQX5p9EP76YBUYqLaBNK6ho1bje+PMsWB7qa
	bFmOmI37Rvl53BlvmG7RT7KZKL7rYAKqF8Fb2fbE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2F0pTju021819
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 19:51:29 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 14 Mar 2018 19:51:29 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1261.035; Wed, 14 Mar 2018 19:51:29 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH v3] ti-sgx-ddk-km: update SGX
	kernel	driver for k4.14
Thread-Index: AQHTu/cAQ+T5zwehCkKHnreNJ2edJ6PQd5Nz
Date: Thu, 15 Mar 2018 00:51:29 +0000
Message-ID: <4ece286e-ecc2-4ff9-8239-13183b53f1de@email.android.com>
References: <1521074745-42435-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1521074745-42435-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v3] ti-sgx-ddk-km: update SGX kernel	driver for k4.14
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
X-List-Received-Date: Thu, 15 Mar 2018 00:51:31 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4ece286eecc24ff9823913183b53f1deemailandroidcom_"

--_000_4ece286eecc24ff9823913183b53f1deemailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It's already in rocko/master - no rebases



On Mar 14, 2018 17:46, "Ruei, Eric" <e-ruei1@ti.com> wrote:
From: Anand Balagopalakrishnan <anandb@ti.com>

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/re=
cipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index 0303797..55f6b9b 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -20,7 +20,7 @@ RPROVIDES_${PN} =3D "omapdrm-pvr"
 RREPLACES_${PN} =3D "omapdrm-pvr"
 RCONFLICTS_${PN} =3D "omapdrm-pvr"

-BRANCH =3D "ti-img-sgx/${PV}/k4.9"
+BRANCH =3D "ti-img-sgx/${PV}/k4.14"

 SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=3D=
git;branch=3D${BRANCH} \
 file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch \
@@ -28,7 +28,7 @@ file://0001-srvkm-common-devicemem.c-suppress-implicit-fa=
llthrou.patch \

 S =3D "${WORKDIR}/git"

-SRCREV =3D "0086977380d3320d70a3abc78b95fa0641427073"
+SRCREV =3D "b144fa4b97cb69e54cabaad62daffcd4b5497c29"

 TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT_ti33x =3D "ti335x"
--
1.9.1

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_4ece286eecc24ff9823913183b53f1deemailandroidcom_
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
<div dir=3D"auto">It's already in rocko/master - no rebases
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On Mar 14, 2018 17:46, &quot;Ruei, Eric&quot; =
&lt;e-ruei1@ti.com&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">From: Anand Balagopalakrishnan &lt;anandb@ti.com&g=
t;<br>
<br>
Signed-off-by: Anand Balagopalakrishnan &lt;anandb@ti.com&gt;<br>
Signed-off-by: Eric Ruei &lt;e-ruei1@ti.com&gt;<br>
---<br>
&nbsp;recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 4 &#43;&#=
43;--<br>
&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/re=
cipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb<br>
index 0303797..55f6b9b 100644<br>
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb<br>
&#43;&#43;&#43; b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb=
<br>
@@ -20,7 &#43;20,7 @@ RPROVIDES_${PN} =3D &quot;omapdrm-pvr&quot;<br>
&nbsp;RREPLACES_${PN} =3D &quot;omapdrm-pvr&quot;<br>
&nbsp;RCONFLICTS_${PN} =3D &quot;omapdrm-pvr&quot;<br>
&nbsp;<br>
-BRANCH =3D &quot;ti-img-sgx/${PV}/k4.9&quot;<br>
&#43;BRANCH =3D &quot;ti-img-sgx/${PV}/k4.14&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;p=
rotocol=3Dgit;branch=3D${BRANCH} \<br>
&nbsp;<a href=3D"file://0001-srvkm-common-devicemem.c-suppress-implicit-fal=
lthrou.patch">file://0001-srvkm-common-devicemem.c-suppress-implicit-fallth=
rou.patch</a> \<br>
@@ -28,7 &#43;28,7 @@ <a href=3D"file://0001-srvkm-common-devicemem.c-suppr=
ess-implicit-fallthrou.patch">
file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch</a> =
\<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
-SRCREV =3D &quot;0086977380d3320d70a3abc78b95fa0641427073&quot;<br>
&#43;SRCREV =3D &quot;b144fa4b97cb69e54cabaad62daffcd4b5497c29&quot;<br>
&nbsp;<br>
&nbsp;TARGET_PRODUCT_omap-a15 =3D &quot;jacinto6evm&quot;<br>
&nbsp;TARGET_PRODUCT_ti33x =3D &quot;ti335x&quot;<br>
-- <br>
1.9.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_4ece286eecc24ff9823913183b53f1deemailandroidcom_--
