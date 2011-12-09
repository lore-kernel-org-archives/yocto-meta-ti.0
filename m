Return-Path: <otavio.salvador@gmail.com>
Received: from mail-bw0-f53.google.com (mail-bw0-f53.google.com
	[209.85.214.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C7DAE006B5
	for <meta-ti@lists.yoctoproject.org>;
	Fri,  9 Dec 2011 04:14:22 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by bkat8 with SMTP id t8so3010311bka.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 09 Dec 2011 04:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=fQLWbyI7tKPwZ5Vwl913GeX92GGnh8SFaR828PNho0o=;
	b=ZBJYBWv5n0+sbhuxdV5R4QCxVcLx3wOnqQVmsx/hNrk980CXKMbckHAWiSp5EBRqdo
	FvDuT3A+oba6yYWLSciC+MsoLMfhRG0mco6JjajnSZb9FkYicmaIVaejzAhad1VUemzB
	Kit+0vuKzP6HTmDxNkIZw4RLAylf42Vvxq6bY=
MIME-Version: 1.0
Received: by 10.205.128.3 with SMTP id hc3mr521239bkc.29.1323432858875; Fri,
	09 Dec 2011 04:14:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 04:14:18 -0800 (PST)
In-Reply-To: <1323432702-7423-1-git-send-email-koen@dominion.thruhere.net>
References: <1323432702-7423-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 9 Dec 2011 10:14:18 -0200
X-Google-Sender-Auth: INYf47uemBf0v4nDc8NEhuuuXLk
Message-ID: <CAP9ODKpXCJXmGPp=7KznuRnurZrVg=KT_AA=x_u5rbeL+wb9eg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH v2] beaglebone-getting-started: fix LICENSE, update to latest git
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 12:14:23 -0000
Content-Type: multipart/alternative; boundary=000e0cdfc8366ff74204b3a7b9f6

--000e0cdfc8366ff74204b3a7b9f6
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Fri, Dec 9, 2011 at 10:11, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-misc/payload/beaglebone-getting-started.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-misc/payload/beaglebone-getting-started.bbb/recipes-misc/payload/
> beaglebone-getting-started.bb
> index b2b9308..142da90 100644
> --- a/recipes-misc/payload/beaglebone-getting-started.bb
> +++ b/recipes-misc/payload/beaglebone-getting-started.bb
> @@ -1,13 +1,13 @@
>  DESCRIPTION = "BeagleBone Getting Started Guide"
>
> -PR = "r15"
> +PR = "r16"
>
>  inherit allarch
>
> -LICENSE = "GPLv2+ && MIT && PD && others"
> +LICENSE = "GPLv2+ & MIT & PD & others"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
>
> -SRCREV = "46c58edffaca856fbe5efa8126af7b1e933a1c9b"
> +SRCREV = "a698888220634a1b549bc2f2e6b33aa03709cb19"
>  SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
>
>  S = "${WORKDIR}/git"
> --
> 1.7.2.5
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfc8366ff74204b3a7b9f6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">ot=
avio@ossystems.com.br</a>&gt;<div><br><div class=3D"gmail_quote">On Fri, De=
c 9, 2011 at 10:11, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto:koen@=
dominion.thruhere.net">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">Signed-off-by: Koen Kooi &lt;<a href=3D"mai=
lto:koen@dominion.thruhere.net">koen@dominion.thruhere.net</a>&gt;<br>
---<br>
=A0recipes-misc/payload/<a href=3D"http://beaglebone-getting-started.bb" ta=
rget=3D"_blank">beaglebone-getting-started.bb</a> | =A0 =A06 +++---<br>
=A01 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-misc/payload/<a href=3D"http://beaglebone-getting-star=
ted.bb" target=3D"_blank">beaglebone-getting-started.bb</a> b/recipes-misc/=
payload/<a href=3D"http://beaglebone-getting-started.bb" target=3D"_blank">=
beaglebone-getting-started.bb</a><br>

index b2b9308..142da90 100644<br>
--- a/recipes-misc/payload/<a href=3D"http://beaglebone-getting-started.bb"=
 target=3D"_blank">beaglebone-getting-started.bb</a><br>
+++ b/recipes-misc/payload/<a href=3D"http://beaglebone-getting-started.bb"=
 target=3D"_blank">beaglebone-getting-started.bb</a><br>
@@ -1,13 +1,13 @@<br>
=A0DESCRIPTION =3D &quot;BeagleBone Getting Started Guide&quot;<br>
<br>
-PR =3D &quot;r15&quot;<br>
+PR =3D &quot;r16&quot;<br>
<br>
=A0inherit allarch<br>
<br>
-LICENSE =3D &quot;GPLv2+ &amp;&amp; MIT &amp;&amp; PD &amp;&amp; others&qu=
ot;<br>
+LICENSE =3D &quot;GPLv2+ &amp; MIT &amp; PD &amp; others&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D603591dea023c3c75b48=
e07cb47ce639&quot;<br>
<br>
-SRCREV =3D &quot;46c58edffaca856fbe5efa8126af7b1e933a1c9b&quot;<br>
+SRCREV =3D &quot;a698888220634a1b549bc2f2e6b33aa03709cb19&quot;<br>
=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/jadonk/beaglebone-g=
etting-started.git" target=3D"_blank">github.com/jadonk/beaglebone-getting-=
started.git</a>&quot;<br>
<br>
=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.2.5<br>
<br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--000e0cdfc8366ff74204b3a7b9f6--
