Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBBCCE00566; Fri, 15 Aug 2014 10:01:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61F13E0054C
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 10:01:40 -0700 (PDT)
Received: by mail-qg0-f41.google.com with SMTP id q107so2460802qgd.28
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=erHzqMFLHc91LsHjHDMMgNEunHZaipBZbSIegcOkfvE=;
	b=piVDxl4t3z3wokmSOaD3fkY6UeF7wl/EfK7n/NQK3kVyZgxMxV6WKBEsENPa8SigIT
	3iWIwvRY0GtWN7e3QtWvX/yASNtirSzOWlLA1ppXfoGehTX+2aT8B3q21Q+LAkFDCxXq
	QXgBqZQpHwA0VLjZgYved1BEp+lS48zGvfWgAoyOtN5pFpMT5GcG/pemO9hZfORMm/X9
	og4RqSzHNUjQcH03bfSTM/ztAEsVIURUcaD/paSxymzGalhowiCyb14+QcE/IrzXBkfe
	dkNxC8fI3Dp8OGVMewnBK/+lal1RexPRI/Tlsos8Y+hqa86hDG63+FCSI7RIOrUik5wC
	NkxA==
X-Received: by 10.229.182.1 with SMTP id ca1mr29796638qcb.28.1408122100123;
	Fri, 15 Aug 2014 10:01:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Fri, 15 Aug 2014 10:01:19 -0700 (PDT)
In-Reply-To: <1408119254-13052-1-git-send-email-aymeric.dumaz@gmail.com>
References: <1408119254-13052-1-git-send-email-aymeric.dumaz@gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 15 Aug 2014 14:01:19 -0300
Message-ID: <CAMCfZKE8KR2aS-ME1X694wqfzpegPM8JND9rF22ehoknj1+6=w@mail.gmail.com>
To: Aymeric Dumaz <aymeric.dumaz@gmail.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [dora/daisy][PATCH] libgles-omap3-5.01.01.01: add .ver and .list files
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
X-List-Received-Date: Fri, 15 Aug 2014 17:01:45 -0000
Content-Type: multipart/alternative; boundary=001a1133a0da9412660500adf99c

--001a1133a0da9412660500adf99c
Content-Type: text/plain; charset=ISO-8859-1

Aymeric,


On Fri, Aug 15, 2014 at 1:14 PM, Aymeric Dumaz <aymeric.dumaz@gmail.com>
wrote:

> When libraries don't have a SONAME in their section, their name aren't
> added in
> the .list/.ver files generated during do_package.
> Other recipes are able to build against them but are not able to find them
> afterwards, leading to missing dependencies.
>
> This patch add the files that would be created if the SONAME was present.
>
> Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
> ---
>  .../libgles/libgles-omap3-5.01.01.01/libgles-omap3.list          | 9
> +++++++++
>  .../libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver           | 1 +
>  recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb             | 9
> +++++++++
>  3 files changed, 19 insertions(+)
>  create mode 100644
> recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list
>  create mode 100644
> recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver
>
> diff --git
> a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list
> b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list
> new file mode 100644
> index 0000000..7221e9a
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list
> @@ -0,0 +1,9 @@
> +libEGL.so
> +libGLES_CM.so
> +libGLESv2.so
> +libglslcompiler.so
> +libIMGegl.so
> +libpvr2d.so
> +libsrv_init.so
> +libsrv_um.so
> +libusc.so
> diff --git
> a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver
> b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver
> new file mode 100644
> index 0000000..e81ca08
> --- /dev/null
> +++ b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver
> @@ -0,0 +1 @@
> +5.01.01.01
> diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> index 0b1b8ca..26de4a6 100644
> --- a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
> @@ -40,6 +40,8 @@ SRC_URI = "
> http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports
>             file://cputype \
>             file://rc.pvr \
>             file://99-bufferclass.rules  \
> +           file://${PN}.list \
> +           file://${PN}.ver \
>  "
>
>  SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
> @@ -48,3 +50,10 @@ SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
>  S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
>
>  LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_FRONTWSEGL.so.1"
> +
> +# HACK! The libraries don't have a SONAME, so other packages will link to
> them
> +# but Yocto won't be able to find this package as a dependency afterwards.
> +package_do_shlibs_append () {
> +    base_filename = "${WORKDIR}/${PN}"
> +    os.system("cp -f {0}.list {0}.ver
> ${SHLIBSWORKDIR}".format(base_filename))
> +}
>

Just for curiosity.
To have libgles-omap3 installed on the image, with Qt5 stuff, I had to
explicit add it on the IMAGE_INSTALL. This patch should fix it, is it
correct?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a1133a0da9412660500adf99c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Aymeric,</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Fri, Aug 15, 2014 at 1:14 PM, Aymeric Dumaz <span dir=3D"ltr">&lt;<a =
href=3D"mailto:aymeric.dumaz@gmail.com" target=3D"_blank">aymeric.dumaz@gma=
il.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1fn" class=3D"a3s" style=3D"over=
flow:hidden">When libraries don&#39;t have a SONAME in their section, their=
 name aren&#39;t added in<br>


the .list/.ver files generated during do_package.<br>
Other recipes are able to build against them but are not able to find them<=
br>
afterwards, leading to missing dependencies.<br>
<br>
This patch add the files that would be created if the SONAME was present.<b=
r>
<br>
Signed-off-by: Aymeric Dumaz &lt;<a href=3D"mailto:aymeric.dumaz@gmail.com"=
>aymeric.dumaz@gmail.com</a>&gt;<br>
---<br>
=A0.../libgles/libgles-omap3-5.01.01.01/libgles-omap3.list=A0 =A0 =A0 =A0 =
=A0 | 9 +++++++++<br>
=A0.../libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver=A0 =A0 =A0 =A0 =
=A0 =A0| 1 +<br>
=A0recipes-graphics/libgles/<a href=3D"http://libgles-omap3_5.01.01.01.bb" =
target=3D"_blank">libgles-omap3_5.01.01.01.bb</a>=A0 =A0 =A0 =A0 =A0 =A0 =
=A0| 9 +++++++++<br>
=A03 files changed, 19 insertions(+)<br>
=A0create mode 100644 recipes-graphics/libgles/libgles-omap3-5.01.01.01/lib=
gles-omap3.list<br>
=A0create mode 100644 recipes-graphics/libgles/libgles-omap3-5.01.01.01/lib=
gles-omap3.ver<br>
<br>
diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap=
3.list b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.li=
st<br>
new file mode 100644<br>
index 0000000..7221e9a<br>
--- /dev/null<br>
+++ b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list<=
br>
@@ -0,0 +1,9 @@<br>
+libEGL.so<br>
+libGLES_CM.so<br>
+libGLESv2.so<br>
+libglslcompiler.so<br>
+libIMGegl.so<br>
+libpvr2d.so<br>
+libsrv_init.so<br>
+libsrv_um.so<br>
+libusc.so<br>
diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap=
3.ver b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver=
<br>
new file mode 100644<br>
index 0000000..e81ca08<br>
--- /dev/null<br>
+++ b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver<b=
r>
@@ -0,0 +1 @@<br>
+5.01.01.01<br>
diff --git a/recipes-graphics/libgles/<a href=3D"http://libgles-omap3_5.01.=
01.01.bb" target=3D"_blank">libgles-omap3_5.01.01.01.bb</a> b/recipes-graph=
ics/libgles/<a href=3D"http://libgles-omap3_5.01.01.01.bb" target=3D"_blank=
">libgles-omap3_5.01.01.01.bb</a><br>


index 0b1b8ca..26de4a6 100644<br>
--- a/recipes-graphics/libgles/<a href=3D"http://libgles-omap3_5.01.01.01.b=
b" target=3D"_blank">libgles-omap3_5.01.01.01.bb</a><br>
+++ b/recipes-graphics/libgles/<a href=3D"http://libgles-omap3_5.01.01.01.b=
b" target=3D"_blank">libgles-omap3_5.01.01.01.bb</a><br>
@@ -40,6 +40,8 @@ SRC_URI =3D &quot;<a href=3D"http://software-dl.ti.com/ds=
ps/dsps_public_sw/gfxsdk/${SGXPV}/exports" target=3D"_blank">http://softwar=
e-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports</a><br>
=A0 =A0 =A0 =A0 =A0 =A0 file://cputype \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://rc.pvr \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://99-bufferclass.rules=A0 \<br>
+=A0 =A0 =A0 =A0 =A0 =A0file://${PN}.list \<br>
+=A0 =A0 =A0 =A0 =A0 =A0file://${PN}.ver \<br>
=A0&quot;<br>
<br>
=A0SRC_URI[md5sum] :=3D &quot;${MD5SUM_HARDFP}&quot;<br>
@@ -48,3 +50,10 @@ SRC_URI[sha256sum] :=3D &quot;${SHA256SUM_HARDFP}&quot;<=
br>
=A0S =3D &quot;${WORKDIR}/Graphics_SDK_${SGXPV}&quot;<br>
<br>
=A0LIBGLESWINDOWSYSTEM ?=3D &quot;libpvrPVR2D_FRONTWSEGL.so.1&quot;<br>
+<br>
+# HACK! The libraries don&#39;t have a SONAME, so other packages will link=
 to them<br>
+# but Yocto won&#39;t be able to find this package as a dependency afterwa=
rds.<br>
+package_do_shlibs_append () {<br>
+=A0 =A0 base_filename =3D &quot;${WORKDIR}/${PN}&quot;<br>
+=A0 =A0 os.system(&quot;cp -f {0}.list {0}.ver ${SHLIBSWORKDIR}&quot;.form=
at(base_filename))<br>
+}</div></blockquote></div><div class=3D"gmail_extra"><br></div>Just for cu=
riosity.<br>To have libgles-omap3 installed on the image, with Qt5 stuff, I=
 had to explicit add it on the IMAGE_INSTALL. This patch should fix it, is =
it correct?<br>

<br><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></d=
iv>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=
=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_med=
ium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blan=
k">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a1133a0da9412660500adf99c--
