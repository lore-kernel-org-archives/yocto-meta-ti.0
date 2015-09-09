Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCCEFE00C91; Wed,  9 Sep 2015 05:29:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89948E00ACE
	for <meta-ti@yoctoproject.org>; Wed,  9 Sep 2015 05:29:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t89CTdAE023293
	for <meta-ti@yoctoproject.org>; Wed, 9 Sep 2015 07:29:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t89CTd9n010325
	for <meta-ti@yoctoproject.org>; Wed, 9 Sep 2015 07:29:39 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Wed, 9 Sep 2015 07:29:31 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-ti] [master/fido][PATCH] cmem-mod: update for changed
	module	autoload syntax.
Thread-Index: AQHQ6vrG2OSlan8jDEuP4O1M1woWz540IGTn
Date: Wed, 9 Sep 2015 12:29:31 +0000
Message-ID: <7864e398-8e66-4dbf-8ae0-6cb201fe4328@email.android.com>
References: <1441801573-14201-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1441801573-14201-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master/fido][PATCH] cmem-mod: update for changed module	autoload syntax.
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
X-List-Received-Date: Wed, 09 Sep 2015 12:29:47 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7864e3988e664dbf8ae06cb201fe4328emailandroidcom_"

--_000_7864e3988e664dbf8ae06cb201fe4328emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK, it's a global list, don't overwrite it.

On Sep 9, 2015 8:26 AM, "Stiffler, Jacob" <j-stiffler@ti.com> wrote:
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/cmem/cmem-mod_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_g=
it.bb
index 6b2303c..eeabb4e 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Kernel module for contiguous memory alloca=
tion from userspace"
 include cmem.inc

 # This package builds a kernel module, use kernel PR as base and append a =
local
-MACHINE_KERNEL_PR_append =3D "a"
+MACHINE_KERNEL_PR_append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"

 inherit module
@@ -11,4 +11,4 @@ inherit module
 EXTRA_OEMAKE +=3D '-f lu.mak KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}" =
TOOLCHAIN_PREFIX=3D"${TOOLCHAIN_PREFIX}" EXEC_DIR=3D"${D}/lib/modules/${KER=
NEL_VERSION}/extra"'
 MAKE_TARGETS =3D "module"

-module_autoload_cmemk =3D "cmemk"
+KERNEL_MODULE_AUTOLOAD =3D "cmemk"
--
1.9.1

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_7864e3988e664dbf8ae06cb201fe4328emailandroidcom_
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
<p dir=3D"ltr">NAK, it's a global list, don't overwrite it.<br>
</p>
<div class=3D"x_gmail_quote">On Sep 9, 2015 8:26 AM, &quot;Stiffler, Jacob&=
quot; &lt;j-stiffler@ti.com&gt; wrote:<br type=3D"attribution">
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Signed-off-by: Jacob Stiffler &lt;j-stiffler@ti.co=
m&gt;<br>
---<br>
&nbsp;recipes-bsp/cmem/cmem-mod_git.bb | 4 &#43;&#43;--<br>
&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_g=
it.bb<br>
index 6b2303c..eeabb4e 100644<br>
--- a/recipes-bsp/cmem/cmem-mod_git.bb<br>
&#43;&#43;&#43; b/recipes-bsp/cmem/cmem-mod_git.bb<br>
@@ -3,7 &#43;3,7 @@ DESCRIPTION =3D &quot;Kernel module for contiguous memo=
ry allocation from userspace&quot;<br>
&nbsp;include cmem.inc<br>
&nbsp;<br>
&nbsp;# This package builds a kernel module, use kernel PR as base and appe=
nd a local<br>
-MACHINE_KERNEL_PR_append =3D &quot;a&quot;<br>
&#43;MACHINE_KERNEL_PR_append =3D &quot;b&quot;<br>
&nbsp;PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
&nbsp;<br>
&nbsp;inherit module<br>
@@ -11,4 &#43;11,4 @@ inherit module<br>
&nbsp;EXTRA_OEMAKE &#43;=3D '-f lu.mak KERNEL_INSTALL_DIR=3D&quot;${STAGING=
_KERNEL_DIR}&quot; TOOLCHAIN_PREFIX=3D&quot;${TOOLCHAIN_PREFIX}&quot; EXEC_=
DIR=3D&quot;${D}/lib/modules/${KERNEL_VERSION}/extra&quot;'<br>
&nbsp;MAKE_TARGETS =3D &quot;module&quot;<br>
&nbsp;<br>
-module_autoload_cmemk =3D &quot;cmemk&quot;<br>
&#43;KERNEL_MODULE_AUTOLOAD =3D &quot;cmemk&quot;<br>
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

--_000_7864e3988e664dbf8ae06cb201fe4328emailandroidcom_--
