Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74D2AE00786; Wed, 24 Sep 2014 03:27:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.172 listed in list.dnswl.org]
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05634E0034C
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 03:27:03 -0700 (PDT)
Received: by mail-qc0-f172.google.com with SMTP id c9so3132892qcz.17
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Xg+qeJkihkWrzhmAvuSezOMjmErhDa53m3XGLyYk8Hc=;
	b=RHPUSERr5QDKI6GBW3SwhG73xgvnYavBOM/3gepp1oWMqhtvZe2QsPXcTSkWZjCHkW
	lWR/C3WaFdBDYbtCeqpQHX44s1FsgTobZjxC0sNrGHqz932jAkHd+RhC2If8r41njM7E
	WL+B4wvLG7GWOKQwqcFa0k5PzFq3b0h2BHAt0AuMB+bQtutM9T/XcOFtxeyjzIR0kFSn
	2nptAFRzEGQkSvQO72fT+VRs64wKzw/vlBHI4SqcphRqXzntWOIPcQLVxreCxMrpCbHx
	9Sm9E9Vh9zmQuCgdRoJoieICQh0H8kFwrV9eppbrob/vTbFaEN4DW5CZixp0hH9EUS78
	oLNw==
X-Received: by 10.224.55.201 with SMTP id v9mr8100507qag.36.1411554422663;
	Wed, 24 Sep 2014 03:27:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Wed, 24 Sep 2014 03:26:41 -0700 (PDT)
In-Reply-To: <1411405491-30435-1-git-send-email-denis@denix.org>
References: <1411405491-30435-1-git-send-email-denis@denix.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 24 Sep 2014 07:26:41 -0300
Message-ID: <CAMCfZKHU6GkJMrKBUHJbPttyoKvnb0xqDAEHxysi-W-B1U3scQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: update to 3.14.19 with latest fixes
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
X-List-Received-Date: Wed, 24 Sep 2014 10:27:06 -0000
Content-Type: multipart/alternative; boundary=001a11c30c34f1b5330503cd1f07

--001a11c30c34f1b5330503cd1f07
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Denys,

Does TI provides a bug track system for community?


Abra=E7os,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&utm_medium=3De=
-mail&utm_campaign=3DAssinatura%20Email%20Diego>

/*long live rock 'n roll*/

On Mon, Sep 22, 2014 at 2:04 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_3.14.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> index 7667e1a..ae3773d 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> @@ -44,11 +44,11 @@ S =3D "${WORKDIR}/git"
>
>  BRANCH =3D "ti-linux-3.14.y"
>
> -SRCREV =3D "0261be2e3a30f496c2c8642b6709f4fc54e75391"
> -PV =3D "3.14.17"
> +SRCREV =3D "9202c29d25015b6f1ac6c124add4ca1666a679bf"
> +PV =3D "3.14.19"
>
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild
> -MACHINE_KERNEL_PR_append =3D "e+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>  PR =3D "${MACHINE_KERNEL_PR}"
>
>  KERNEL_CONFIG_DIR =3D "${S}/ti_config_fragments"
> --
> 2.0.4
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--001a11c30c34f1b5330503cd1f07
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Denys,<div><br></div><div>Does TI provides a bug track sys=
tem for community?</div><div><br></div></div><div class=3D"gmail_extra"><br=
 clear=3D"all"><div><div dir=3D"ltr"><div>Abra=E7os,</div><div><br></div>--=
<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"ht=
tp://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3D=
e-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">www=
.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div=
>
<br><div class=3D"gmail_quote">On Mon, Sep 22, 2014 at 2:04 PM, Denys Dmytr=
iyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=3D"_=
blank">denis@denix.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.co=
m</a>&gt;<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@=
ti.com</a>&gt;<br>
---<br>
=A0recipes-kernel/linux/<a href=3D"http://linux-ti-staging_3.14.bb" target=
=3D"_blank">linux-ti-staging_3.14.bb</a> | 6 +++---<br>
=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_3.14.b=
b" target=3D"_blank">linux-ti-staging_3.14.bb</a> b/recipes-kernel/linux/<a=
 href=3D"http://linux-ti-staging_3.14.bb" target=3D"_blank">linux-ti-stagin=
g_3.14.bb</a><br>
index 7667e1a..ae3773d 100644<br>
--- a/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_3.14.bb" targ=
et=3D"_blank">linux-ti-staging_3.14.bb</a><br>
+++ b/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_3.14.bb" targ=
et=3D"_blank">linux-ti-staging_3.14.bb</a><br>
@@ -44,11 +44,11 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=A0BRANCH =3D &quot;ti-linux-3.14.y&quot;<br>
<br>
-SRCREV =3D &quot;0261be2e3a30f496c2c8642b6709f4fc54e75391&quot;<br>
-PV =3D &quot;3.14.17&quot;<br>
+SRCREV =3D &quot;9202c29d25015b6f1ac6c124add4ca1666a679bf&quot;<br>
+PV =3D &quot;3.14.19&quot;<br>
<br>
=A0# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild<br>
-MACHINE_KERNEL_PR_append =3D &quot;e+gitr${SRCPV}&quot;<br>
+MACHINE_KERNEL_PR_append =3D &quot;a+gitr${SRCPV}&quot;<br>
=A0PR =3D &quot;${MACHINE_KERNEL_PR}&quot;<br>
<br>
=A0KERNEL_CONFIG_DIR =3D &quot;${S}/ti_config_fragments&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.0.4<br>
<br>
--<br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</font></span></blockquote></div><br></div>

--001a11c30c34f1b5330503cd1f07--
