Return-Path: <eyalr@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0487E00D68; Mon,  4 Dec 2017 11:54:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7B05E00D00
	for <meta-ti@yoctoproject.org>; Mon,  4 Dec 2017 11:54:47 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB4JslIr001750
	for <meta-ti@yoctoproject.org>; Mon, 4 Dec 2017 13:54:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512417287;
	bh=LLdt5hfmMdAnFkdnNafqOS2mD/u0idRiILSCWW0FGHk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=l5UxuRWYRSgzBXGS/Nt/8grOgGf+94pE/qvW+R78Xb+89jE1x3BeNqOGr1FdYxR21
	AcAY3g/uaG1wxsS1hdSeB1HM1S449pCAleo0vcL/IeadmSdU1Qfv0qD4VlRQ/GVdcF
	gKswfTG/9qNrRZ5AuvRIypA0MoJpz21w5UcM4z7c=
Received: from DFRE70.ent.ti.com (dfre70.ent.ti.com [10.167.188.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4JskYd008155
	for <meta-ti@yoctoproject.org>; Mon, 4 Dec 2017 13:54:46 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE70.ent.ti.com ([fe80::645e:109b:13d3:dfa7%25]) with mapi id
	14.03.0294.000; Mon, 4 Dec 2017 20:54:45 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [PATCH 1/4] wl18xx-fw: add recipe for version R8.7_SP3
Thread-Index: AdNsIlhTKSD/9EgsSGOv7JMdgVwCmQBDpkUAAAIyd9U=
Date: Mon, 4 Dec 2017 19:54:44 +0000
Message-ID: <hag6ew6a30h2gy5qyw3kmwbv.1512417280049@email.android.com>
References: <8665E2433BC68541A24DFFCA87B70F5B364A8553@DFRE01.ent.ti.com>,
	<20171204195150.GC15340@edge>
In-Reply-To: <20171204195150.GC15340@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/4] wl18xx-fw: add recipe for version R8.7_SP3
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
X-List-Received-Date: Mon, 04 Dec 2017 19:54:49 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_hag6ew6a30h2gy5qyw3kmwbv1512417280049emailandroidcom_"

--_000_hag6ew6a30h2gy5qyw3kmwbv1512417280049emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Yes, of course. Thought you were keeping the history.
Can you take care of it or do you need another patch set?

Best Regards,
Eyal

-------- Original Message --------
From: "Dmytriyenko, Denys" <denys@ti.com>
Date: Mon, Dec 4, 2017, 21:52
To: "Reizer, Eyal" <eyalr@ti.com>
CC: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/4] wl18xx-fw: add recipe for version R8.7_SP3

On Sun, Dec 03, 2017 at 05:34:49AM -0500, Reizer, Eyal wrote:
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb

Thanks! Can we just update from 8.7.1 to 8.7.3 by replacing the recipe,
instead of adding new one?


> diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18x=
x-fw/wl18xx-fw_8.7.3.bb
> new file mode 100644
> index 0000000..a52ec89
> --- /dev/null
> +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "Firmware files for use with TI wl18xx"
> +LICENSE =3D "TI-TSPA"
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D4977a0fe767ee17765ae63c435a32=
a9e"
> +
> +SRC_URI =3D " \
> +     git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=3Dgit;branch=
=3D${BRANCH} \
> +     file://0001-Add-Makefile-to-install-firmware-files.patch \
> +"
> +
> +# Tag: R8.7-SP3 (8.7.3)
> +SRCREV =3D "f659be25473e4bde8dc790bff703ecacde6e21da"
> +BRANCH =3D "master"
> +
> +S =3D "${WORKDIR}/git"
> +
> +CLEANBROKEN =3D "1"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    oe_runmake 'DEST_DIR=3D${D}' install
> +}
> +
> +FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
> --
> 2.7.4
>

--_000_hag6ew6a30h2gy5qyw3kmwbv1512417280049emailandroidcom_
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
<div>Hi Denys,<br>
<br>
Yes, of course. Thought you were keeping the history.<br>
Can you take care of it or do you need another patch set?<br>
<br>
Best Regards,<br>
Eyal<br>
<br>
-------- Original Message --------<br>
From: &quot;Dmytriyenko, Denys&quot; &lt;denys@ti.com&gt;<br>
Date: Mon, Dec 4, 2017, 21:52<br>
To: &quot;Reizer, Eyal&quot; &lt;eyalr@ti.com&gt;<br>
CC: meta-ti@yoctoproject.org<br>
Subject: Re: [PATCH 1/4] wl18xx-fw: add recipe for version R8.7_SP3<br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Sun, Dec 03, 2017 at 05:34:49AM -0500, Reizer, =
Eyal wrote:<br>
&gt; Signed-off-by: Eyal Reizer &lt;eyalr@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 26 &#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 1 file changed, 26 insertions(&#43;)<br>
&gt;&nbsp; create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb<br>
<br>
Thanks! Can we just update from 8.7.1 to 8.7.3 by replacing the recipe, <br=
>
instead of adding new one?<br>
<br>
<br>
&gt; diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl=
18xx-fw/wl18xx-fw_8.7.3.bb<br>
&gt; new file mode 100644<br>
&gt; index 0000000..a52ec89<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb<br>
&gt; @@ -0,0 &#43;1,26 @@<br>
&gt; &#43;DESCRIPTION =3D &quot;Firmware files for use with TI wl18xx&quot;=
<br>
&gt; &#43;LICENSE =3D &quot;TI-TSPA&quot;<br>
&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENCE;md5=3D4977a0=
fe767ee17765ae63c435a32a9e">file://LICENCE;md5=3D4977a0fe767ee17765ae63c435=
a32a9e</a>&quot;<br>
&gt; &#43;<br>
&gt; &#43;SRC_URI =3D &quot; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; git://git.ti.com/wilink8-wlan/wl18xx_fw.=
git;protocol=3Dgit;branch=3D${BRANCH} \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-Add-Makefile-to-i=
nstall-firmware-files.patch">file://0001-Add-Makefile-to-install-firmware-f=
iles.patch</a> \<br>
&gt; &#43;&quot;<br>
&gt; &#43;<br>
&gt; &#43;# Tag: R8.7-SP3 (8.7.3)<br>
&gt; &#43;SRCREV =3D &quot;f659be25473e4bde8dc790bff703ecacde6e21da&quot;<b=
r>
&gt; &#43;BRANCH =3D &quot;master&quot;<br>
&gt; &#43;<br>
&gt; &#43;S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &#43;<br>
&gt; &#43;CLEANBROKEN =3D &quot;1&quot;<br>
&gt; &#43;<br>
&gt; &#43;do_compile() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; :<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;do_install() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; oe_runmake 'DEST_DIR=3D${D}' install<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;FILES_${PN} =3D &quot;/lib/firmware/ti-connectivity/*&quot;<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
</div>
</span></font>
</body>
</html>

--_000_hag6ew6a30h2gy5qyw3kmwbv1512417280049emailandroidcom_--
